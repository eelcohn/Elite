; -----------------------------------------------------------------------------
; Elite - Third stage loader
; written by David Braben and Ian Bell (c) Acornsoft 1984
; Filename       : $.Elite3
; Load address   : 00001900
; Exec address   : 0000197B
; Length         : 00001500
; -----------------------------------------------------------------------------

brkv           = &0202
irq1v          = &0204
wrchv          = &020E
netv           = &0224
indv           = &0232

systemvia_t1lc = &FE44
systemvia_t1ch = &FE45
systemvia_ier  = &FE4E
uservia_ier    = &FE6E

oswrch         = &FFEE
osword         = &FFF1
osbyte         = &FFF4
oscli          = &FFF7

ORG &1900

.start
.vdutbl
	; MODE 4
	EQUB &16, &04

	; Define text window
	EQUB &1C, &02, &11, &0F, &10

	; VDU 23, 00, 06, 1F, 00, 00, 00, 00, 00, 00
	; R6845 register 6 (Vertical displayed characters) = &1F (31)
	EQUB &17, &00, &06, &1F, &00, &00, &00, &00, &00, &00

	; VDU 23, 00, 0C, 0C, 00, 00, 00, 00, 00, 00
	; R6845 register 12 (Screen start address) = &0C
	EQUB &17, &00, &0C, &0C, &00, &00, &00, &00, &00, &00

	; VDU 23, 00, 0D, 00, 00, 00, 00, 00, 00, 00
	; R6845 register 13 (Screen start address) = &00
	EQUB &17, &00, &0D, &00, &00, &00, &00, &00, &00, &00

	; VDU23, 00, 01, 20, 00, 00, 00, 00, 00, 00
	; R6845 register 1 (Characters per line) = &20 (32)
	EQUB &17, &00, &01, &20, &00, &00, &00, &00, &00, &00

	; VDU 23, 00, 02, 2D, 00, 00, 00, 00, 00, 00
	; R6845 register 2 (Horizontal sync position) = &2D (45)
	EQUB &17, &00, &02, &2D, &00, &00, &00, &00, &00, &00

	; VDU 23, 00, 0A, 20, 00, 00, 00, 00, 00, 00
	; R6845 register 10 (Cursor start/blink/type) = &20 (32)
	EQUB &17, &00, &0A, &20, &00, &00, &00, &00, &00, &00

.envelope1
	EQUB &01, &01, &00, &6F, &F8, &04, &01, &08, &08, &FE, &00, &FF, &7E, &2C

.envelope2
	EQUB &02, &01, &0E, &EE, &FF, &2C, &20, &32, &06, &01, &00, &FE, &78, &7E

.envelope3
	EQUB &03, &01, &01, &FF, &FD, &11, &20, &80, &01, &00, &00, &FF, &01, &01

.envelope4
	EQUB &04, &01, &04, &F8, &2C, &04, &06, &08, &16, &00, &00, &81, &7E, &00

; -----------------------------------------------------------------------------
; Start of code
; -----------------------------------------------------------------------------
.startcode
	JSR addr1B72
	LDA #&90
	LDX #&FF
	JSR addr1D26                    ; *FX 144, 255, 0 (Vertical screen shift = 255, interlace = on)
	LDA #&00
	STA &70
	LDA #&19
	STA &71
	LDY #&00
.addr198F
	LDA (&70),Y
	JSR oswrch
	INY
	CPY #&43
	BNE addr198F
	JSR addr1B89                    ; Print star field and ELITE text
	LDA #&10
	LDX #&03
	JSR osbyte                      ; *FX 16, 3 (Select 3 ADC channels to be sampled)
	LDA #&60
	STA indv                        ; Set INDV to RTS
	LDA #indv MOD 256
	STA netv+1
	LDA #indv DIV 256
	STA netv                        ; Set NETV to &0232
	LDA #&BE
	LDX #&08
	JSR addr1D26                    ; *FX 190, 8, 0 (Read ADC conversion type, 12 or 8 bits)
	LDA #&C8
	LDX #&03
	JSR addr1D26                    ; *FX 200, 3, 0 (Read/write ESCAPE, BREAK effect)
	LDA #&0D
	LDX #&00
	JSR addr1D26                    ; *FX 13, 0, 0 (Disable output buffer empty event)
	LDA #&E1
	LDX #&80
	JSR addr1D26                    ; *FX 225, 128, 0 (Read/write function key status (soft keys or codes))
	LDA #&DB
	STA &9F
	NOP
	NOP
	NOP
	LDA #&0D
	LDX #&02
	JSR addr1D26                    ; *FX 13, 2, 0 (Disable character entering buffer event)
	LDA #&04
	LDX #&01
	JSR addr1D26                    ; *FX 4, 1, 0 (Disable cursor editing; cursor keys will return &87-&8B)
	LDA #&09
	LDX #&00
	JSR addr1D26                    ; *FX 9, 0, 0 (Set duration of the mark state of flashing colours to 0: infinite)
	JSR addr1CE2
	LDA #&00
	STA &70
	LDA #&11
	STA &71
	LDA #&62
	STA &72
	LDA #&29
	STA &73
	JSR addr1D2C                    ; Move &0100 bytes from &2962 to &1100
	LDA #&00
	STA &70
	LDA #&78
	STA &71
	LDA #&4B
	STA &72
	LDA #&1D
	STA &73
	LDX #&08
	JSR addr1D39                    ; Move &0800 bytes from &1D4B to &7800
	SEI
	LDA systemvia_t1lc              ; System VIA T1 Low-Order Counter
	STA &01                         ; Initial value for the random number generator
	LDA #&39                        ; Disable T2, CB1, CB2, CA2
	STA systemvia_ier               ; System VIA Interrupt Enable Register
	LDA #&7F                        ; Disable all interrupts
	STA uservia_ier                 ; User VIA Interrupt Enable Register
	LDA irq1v
	STA &7FFE
	LDA irq1v+1
	STA &7FFF                       ; Save original IRQ1V
	LDA #&4B
	STA irq1v
	LDA #&11
	STA irq1v+1                     ; Set IRQ1V to &114B
	LDA #&39
	STA systenvia_t1hc              ; System VIA T1 High-Order Counter
	CLI
	LDA #&00
	STA &70
	LDA #&61
	STA &71
	LDA #&62
	STA &72
	LDA #&2B
	STA &73
	JSR addr1D2C                    ; Move the ACORNSOFT text from &2B62 to &6100
	LDA #&63
	STA &71
	LDA #&62
	STA &72
	LDA #&2A
	STA &73
	JSR addr1D2C                    ; Move the ELITE text from &2A62 to &6300
	LDA #&76
	STA &71
	LDA #&62
	STA &72
	LDA #&2C
	STA &73
	JSR addr1D2C                    ; Move the (c) ACORNSOFT 1984 text from &2C62 to &7600
	LDA #&00
	STA &70
	LDA #&04
	STA &71
	LDA #&4B
	STA &72
	LDA #&25
	STA &73
	LDX #&04
	JSR addr1D39                    ; Move &0400 bytes from &254B to &0400
	LDX #&23
.addr1A89
	LDA &1B4F,X
	STA &0D7A,X
	DEX
	BPL &1A89
	LDA &76                         ; Drive number (0=80 tracks single sided; 2=40 tracks double sided)
	STA &0D92
	LDX #&43
	LDY #&19
	LDA #&08
	JSR osword                      ; ENVELOPE
	LDX #&51
	LDY #&19
	LDA #&08
	JSR osword                      ; ENVELOPE
	LDX #&5F
	LDY #&19
	LDA #&08
	JSR osword                      ; ENVELOPE
	LDX #&6D
	LDY #&19
	LDA #&08
	JSR osword                      ; ENVELOPE
	LDX #&44
	LDY #&1D
	JSR oscli                       ; *DIR E
	LDA #&00
	STA &70
	LDA #&0B
	STA &71
	LDA #&ED
	STA &72
	LDA #&1A
	STA &73
	LDY #&00
.addr1AD4
	LDA (&72),Y                     ; Move &4F bytes from &1AED to &0B00
	STA (&70),Y
	INY
	CPY #&4F
	BNE addr1AD4
	JMP &0B00
	CLC
	LDY #&00
.addr1AE3
	ADC &1B89,Y
	EOR &197B,Y
	DEY
	BNE addr1AE3
	RTS

.stageloader                            ; Relocated to &0B00
	LDX #&37
	LDY #&0B
	JSR oscli                       ; *L.T.CODE
	LDA #&EE
	STA brkv
	LDA #&11
	STA brkv+1                      ; Set BRKV to &11EE
	LDA #&E9
	STA wrchv
	LDA #&11
	STA wrchv+1                     ; Set WRCHV to &11E9
	SEC
	LDY #&00
	STY &70
	LDX #&11
	TXA
.addr1B10
	STX &71
	ADC (&70),Y                     ; Calculate CRC for T.CODE
	DEY
	BNE addr1B10
	INX
	CPX #&54
	BCC &1B10
	LDA #&00
	NOP
.crc_invalid_lockloop
	BNE crc_invalid_lockloop        ; Loop indefenitely if CRC for T.CODE is invalid
	JMP &11E6                       ; Start the docked code

.str_load_t_code
	EQUS "L.T.CODE", &0D
.str_easteregg
	EQUS "Does your mother know you do this?"

.addr0D7A
	DEC &0D9A                       ; Sector
	DEC &0D94                       ; Address MSB
	JSR addr0D89
	INC &0D9A                       ; Sector
	INC &0D94                       ; Address MSB
.addr0D89
	LDA #&7F
	LDX #&92
	LDY #&0D
	JMP osword

.osword7Fblock
	EQUB &00                        ; Drive
	EQUW &00000F00                  ; Address
	EQUB &03                        ; Number of parameters
	EQUB &53                        ; Command &53: Read data
	EQUB &00                        ; Track
	EQUB &01                        ; Sector
	EQUB &21                        ; 256 bytes per sector, 1 sector in total
	EQUB &00                        ; Result

.addr1B72
	LDA #&09
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	STA &1C87
	ORA #&00
	BPL &1B85
	LSR &78
	JMP &1CCF
	EQUB &AC

; -----------------------------------------------------------------------------
; Print star field and ELITE text
; -----------------------------------------------------------------------------
.addr1B89
	LDA systemvia_t1lc
	STA addr1C86
	JSR addr1C6A
	JSR addr1C89
	STA &71
	LDA &72
	STA &70
	NOP
	NOP
	NOP
	NOP
	NOP
	JSR addr1C6A
	STA &74
	JSR addr1C89
	TAX
	LDA &72
	ADC &70
	STA &70
	TXA
	ADC &71
	BCS &1BD3
	STA &71
	LDA #&01
	SBC &70
	STA &70
	LDA #&40
	SBC &71
	STA &71
	BCC &1BD3
	JSR addr1CEF
	LDA &70
	LSR A
	TAX
	LDA &74
	CMP #&80
	ROR A
	JSR addr1CA6
.addr1BD3
	DEC &1CDC
	BNE addr1B89
	DEC &1CDD
	BNE addr1B89
.addr1BDD
	JSR addr1C6A
	TAX
	JSR addr1C89
	STA &71
	JSR addr1C6A
	STA &74
	JSR addr1C89
	ADC &71
	CMP #&11
	BCC &1BF9
	LDA &74
	JSR addr1CA6
.addr1BF9
	DEC &1CDE
	BNE addr1BDD
	DEC &1CDF
	BNE addr1BDD
.addr1C03
	JSR addr1C6A
	STA &70
	JSR addr1C89
	STA &71
	NOP
	NOP
	NOP
	NOP
	NOP
	JSR addr1C6A
	STA &74
	JSR addr1C89
	STA &75
	ADC &71
	STA &71
	LDA &70
	CMP #&80
	ROR A
	CMP #&80
	ROR A
	ADC &74
	TAX
	JSR addr1C89
	TAY
	ADC &71
	BCS &1C4B
	CMP #&50
	BCS &1C4B
	CMP #&20
	BCC &1C4B
	TYA
	ADC &75
	CMP #&10
	BCS &1C46
	LDA &70
	BPL &1C4B
.addr1C46
	LDA &74
	JSR addr1CA6
.addr1C4B
	DEC addr1CE0
	BNE addr1C03
	DEC addr1CE0+1
	BNE addr1C03
	LDA #&00                        ; Done generating starfield, now on to the ELITE text
	STA &70
	LDA #&63
	STA &71
	LDA #&62
	STA &72
	LDA #&2A
	STA &73
	LDX #&08
	JSR addr1D2C                    ; Move the ELITE logo from &2A62 to &6300
.addr1C6A
	LDA &1C86
	TAX
	ADC &1C88
	STA &1C86
	STX &1C88
	LDA &1C85
	TAX
	ADC &1C87
	STA &1C85
	STX &1C87
	RTS

.addr1C85
	EQUB &49, &53, &78, &34

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr1C89
	BPL &1C90
	EOR #&FF
	CLC
	ADC #&01
.addr1C90
	STA &73
	STA &72
	LDA #&00
	LDY #&08
	LSR &72
.addr1C9A
	BCC &1C9F
	CLC
	ADC &73
.addr1C9F
	ROR A
	ROR &72
	DEY
	BNE addr1C9A
	RTS

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr1CA6
	TAY
	EOR #&80
	LSR A
	LSR A
	LSR A
	LSR &79
	ORA #&60
	STA &71
	TXA
	EOR #&80
	AND #&F8
	STA &70
	TYA
	AND #&07
	TAY
	TXA
	AND #&07
	TAX
	LDA addr1CC7,X
	STA (&70),Y
.addr1CC6
	RTS

.addr1CC7
	EQUB &80, &40, &20, &10, &08, &04, &02, &01

.addr1CCF
	LDA &1C87
	EOR &78
	ASL A
	CMP #&93
	ROR A
	STA &78
	BCC addr1CC6

.addr1CDC
	EQUW &0300
.addr1CDE
	EQUW &01DD
.addr1CE0
	EQUW &0333

.addr1CE2
	LDA &78
	AND &79
	LDA #&0C
	ASL A
	STA &78
	RTS
.addr1CEC
	JMP addr1CEC
.addr1CEF
	LDY &71
	LDA &70
	STA &73
	LDX #&00
	STX &70
	LDA #&08
	STA &72
.addr1CFD
	CPX &70
	BCC &1D0F
	BNE addr1D07
	CPY #&40
	BCC &1D0F
.addr1D07
	TYA
	SBC #&40
	TAY
	TXA
	SBC &70
	TAX
.addr1D0F
	ROL &70
	ASL &73
	TYA
	ROL A
	TAY
	TXA
	ROL A
	TAX
	ASL &73
	TYA
	ROL A
	TAY
	TXA
	ROL A
	TAX
	DEC &72
	BNE addr1CFD
	RTS

; -----------------------------------------------------------------------------
; *FX A, X, &00
; -----------------------------------------------------------------------------
.addr1D26
	LDY #&00
	JMP osbyte

	EQUB &0E

; -----------------------------------------------------------------------------
; Decode and move 256 bytes from (&70) to (&72)
; -----------------------------------------------------------------------------
.addr1D2C
	LDY #&00
.addr1D2E
	LDA (&72),Y
	EOR #&A5
	STA (&70),Y
	DEY
	BNE addr1D2E
	RTS
	ASL &2C20
	ORA &71E6,X
	INC &73
	DEX
	BNE addr1D39
	RTS

.str_dir_e
	EQUS "*DIR E", &0D

.img_scanner
	INCBIN "data/scanner.bin"

.bin_0400code
	INCBIN "data/Elite3-0400code.bin"

.bin_unknown1
	INCBIN "data/Elite3-unknown1"

.img_logo_elite
	INCBIN "data/elite.img

.img_logo_acornsoft
	INCBIN "data/acornsoft.img"

.img_logo_copyright
	INCBIN "data/copyright.img

.bin_unknown2
	INCBIN "data/Elite3-unknown2.img"

.end

SAVE "$.Elite3", start, end, startcode
