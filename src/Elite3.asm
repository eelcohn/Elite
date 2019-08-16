; -----------------------------------------------------------------------------
; Elite loader
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
.codestart
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
	EUQS "L.T.CODE", &0D
.str_easteregg
	EQUS "Does your mother know you do this?"

	DEC &0D9A
	DEC &0D94
	JSR addr0D89
	INC &0D9A
	INC &0D94
	LDA #&7F
	LDX #&92
	LDY #&0D
	JMP osword
	BRK
	BRK
	...
	BRK
	BRK
	...
	...
	BRK
	ORA (&21,X)
	BRK
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

1D4B  55 25              U%   EOR &25,X
1D4D  22                 "    ...
1D4E  21 22              !"   AND (&22,X)
1D50  21 21              !!   AND (&21,X)
1D52  25 55              %U   AND &55
1D54  A5 A3              ..   LDA &A3
1D56  A1 A3              ..   LDA (&A3,X)
1D58  A7                 .    ...
1D59  A3                 .    ...
1D5A  A5 55              .U   LDA &55
1D5C  A5 A5              ..   LDA &A5
1D5E  A5 A5              ..   LDA &A5
1D60  A5 A5              ..   LDA &A5
1D62  5A                 Z    ...
1D63  55 A5              U.   EOR &A5,X
1D65  A5 A5              ..   LDA &A5
1D67  A5 A5              ..   LDA &A5
1D69  A5 5A              .Z   LDA &5A
1D6B  55 A5              U.   EOR &A5,X
1D6D  A5 A5              ..   LDA &A5
1D6F  A5 A5              ..   LDA &A5
1D71  A5 5A              .Z   LDA &5A
1D73  55 A5              U.   EOR &A5,X
1D75  A5 A5              ..   LDA &A5
1D77  A5 A5              ..   LDA &A5
1D79  A5 5A              .Z   LDA &5A
1D7B  55 33              U3   EOR &33,X
1D7D  01 65              .e   ORA (&65,X)
1D7F  25 25              %%   AND &25
1D81  25 25              %%   AND &25
1D83  55 A5              U.   EOR &A5,X
1D85  A5 A5              ..   LDA &A5
1D87  A5 A5              ..   LDA &A5
1D89  A5 A5              ..   LDA &A5
1D8B  55 A5              U.   EOR &A5,X
1D8D  A5 A5              ..   LDA &A5
1D8F  A5 A5              ..   LDA &A5
1D91  A5 A5              ..   LDA &A5
1D93  55 A5              U.   EOR &A5,X
1D95  A5 A5              ..   LDA &A5
1D97  A5 A5              ..   LDA &A5
1D99  A5 A5              ..   LDA &A5
1D9B  55 A5              U.   EOR &A5,X
1D9D  A5 A5              ..   LDA &A5
1D9F  A5 A5              ..   LDA &A5
1DA1  A5 A5              ..   LDA &A5
1DA3  55 A5              U.   EOR &A5,X
1DA5  A5 A5              ..   LDA &A5
1DA7  A5 A5              ..   LDA &A5
1DA9  A5 A5              ..   LDA &A5
1DAB  55 A5              U.   EOR &A5,X
1DAD  A5 A5              ..   LDA &A5
1DAF  A5 A5              ..   LDA &A5
1DB1  A5 A5              ..   LDA &A5
1DB3  55 A5              U.   EOR &A5,X
1DB5  A5 A5              ..   LDA &A5
1DB7  A5 A5              ..   LDA &A5
1DB9  A5 A5              ..   LDA &A5
1DBB  55 A5              U.   EOR &A5,X
1DBD  A5 A5              ..   LDA &A5
1DBF  A5 A5              ..   LDA &A5
1DC1  A5 A5              ..   LDA &A5
1DC3  55 A5              U.   EOR &A5,X
1DC5  A5 A5              ..   LDA &A5
1DC7  A5 A5              ..   LDA &A5
1DC9  A5 A5              ..   LDA &A5
1DCB  55 A5              U.   EOR &A5,X
1DCD  A5 A5              ..   LDA &A5
1DCF  A5 A5              ..   LDA &A5
1DD1  A5 A5              ..   LDA &A5
1DD3  55 A5              U.   EOR &A5,X
1DD5  A5 A5              ..   LDA &A5
1DD7  A5 A5              ..   LDA &A5
1DD9  A5 A5              ..   LDA &A5
1DDB  55 A5              U.   EOR &A5,X
1DDD  A5 A5              ..   LDA &A5
1DDF  A5 A5              ..   LDA &A5
1DE1  A5 A5              ..   LDA &A5
1DE3  55 A5              U.   EOR &A5,X
1DE5  A5 A5              ..   LDA &A5
1DE7  A5 A5              ..   LDA &A5
1DE9  A5 A5              ..   LDA &A5
1DEB  55 A5              U.   EOR &A5,X
1DED  A5 A5              ..   LDA &A5
1DEF  A5 A5              ..   LDA &A5
1DF1  A5 A5              ..   LDA &A5
1DF3  55 A5              U.   EOR &A5,X
1DF5  A5 A5              ..   LDA &A5
1DF7  A5 A5              ..   LDA &A5
1DF9  A5 A5              ..   LDA &A5
1DFB  55 A5              U.   EOR &A5,X
1DFD  A5 A5              ..   LDA &A5
1DFF  A5 A5              ..   LDA &A5
1E01  A5 A5              ..   LDA &A5
1E03  55 33              U3   EOR &33,X
1E05  01 65              .e   ORA (&65,X)
1E07  65 65              ee   ADC &65
1E09  65 25              e%   ADC &25
1E0B  55 A7              U.   EOR &A7,X
1E0D  A5 A3              ..   LDA &A3
1E0F  A5 A3              ..   LDA &A3
1E11  A5 A3              ..   LDA &A3
1E13  55 33              U3   EOR &33,X
1E15  F7                 .    ...
1E16  D5 95              ..   CMP &95,X
1E18  95 B5              ..   STA &B5,X
1E1A  B5 55              .U   LDA &55,X
1E1C  A5 A5              ..   LDA &A5
1E1E  A5 A5              ..   LDA &A5
1E20  A5 F0              ..   LDA &F0
1E22  5A                 Z    ...
1E23  55 A5              U.   EOR &A5,X
1E25  A5 A5              ..   LDA &A5
1E27  A5 A5              ..   LDA &A5
1E29  F0 5A              .Z   BEQ addr1E85
1E2B  55 A5              U.   EOR &A5,X
1E2D  A5 A5              ..   LDA &A5
1E2F  A5 A5              ..   LDA &A5
1E31  F0 5A              .Z   BEQ addr1E8D
1E33  55 A5              U.   EOR &A5,X
1E35  A5 A5              ..   LDA &A5
1E37  A5 A5              ..   LDA &A5
1E39  F0 5A              .Z   BEQ addr1E95
1E3B  55 A5              U.   EOR &A5,X
1E3D  A3                 .    ...
1E3E  A1 A3              ..   LDA (&A3,X)
1E40  A7                 .    ...
1E41  A3                 .    ...
1E42  A5 55              .U   LDA &55
1E44  B5 BB              ..   LDA &BB,X
1E46  BF                 .    ...
1E47  BB                 .    ...
1E48  BD BD B5           ...  LDA &B5BD,X
1E4B  25 22              %"   AND &22
1E4D  20 20 22             "  JSR &2220
1E50  20 25 25            %%  JSR &2525
1E53  A5 A3              ..   LDA &A3
1E55  A1 A3              ..   LDA (&A3,X)
1E57  A7                 .    ...
1E58  A3                 .    ...
1E59  A5 A5              ..   LDA &A5
1E5B  A5 A5              ..   LDA &A5
1E5D  A5 A5              ..   LDA &A5
1E5F  A5 A5              ..   LDA &A5
1E61  A5 5A              .Z   LDA &5A
1E63  A5 A5              ..   LDA &A5
1E65  A5 A5              ..   LDA &A5
1E67  A5 A5              ..   LDA &A5
1E69  A5 5A              .Z   LDA &5A
1E6B  A5 A5              ..   LDA &A5
1E6D  A5 A5              ..   LDA &A5
1E6F  A5 A5              ..   LDA &A5
1E71  A5 5A              .Z   LDA &5A
1E73  A5 A5              ..   LDA &A5
1E75  A5 A5              ..   LDA &A5
1E77  A5 A5              ..   LDA &A5
1E79  A5 5A              .Z   LDA &5A
1E7B  25 25              %%   AND &25
1E7D  25 25              %%   AND &25
1E7F  25 25              %%   AND &25
1E81  25 25              %%   AND &25
1E83  A5 A5              ..   LDA &A5
.addr1E85
1E85  A5 A5              ..   LDA &A5
1E87  A5 A5              ..   LDA &A5
1E89  A5 A5              ..   LDA &A5
1E8B  A5 A5              ..   LDA &A5
.addr1E8D
1E8D  A5 A5              ..   LDA &A5
1E8F  A5 A5              ..   LDA &A5
1E91  A5 A5              ..   LDA &A5
1E93  A5 A5              ..   LDA &A5
.addr1E95
1E95  A5 A5              ..   LDA &A5
1E97  A5 A5              ..   LDA &A5
1E99  A5 A5              ..   LDA &A5
1E9B  A5 A5              ..   LDA &A5
1E9D  A5 A5              ..   LDA &A5
1E9F  A5 A5              ..   LDA &A5
1EA1  A4 A3              ..   LDY &A3
1EA3  A5 A5              ..   LDA &A5
1EA5  A5 A5              ..   LDA &A5
1EA7  A5 A5              ..   LDA &A5
1EA9  A3                 .    ...
1EAA  A5 A5              ..   LDA &A5
1EAC  A5 A5              ..   LDA &A5
1EAE  A5 A4              ..   LDA &A4
1EB0  A9 A7              ..   LDA #&A7
1EB2  A5 A5              ..   LDA &A5
1EB4  A5 A5              ..   LDA &A5
1EB6  A5 A3              ..   LDA &A3
1EB8  2D A5 A5           -..  AND &A5A5
1EBB  A5 A5              ..   LDA &A5
1EBD  A5 A5              ..   LDA &A5
1EBF  AE A5 A5           ...  LDX &A5A5
1EC2  A5 A5              ..   LDA &A5
1EC4  A5 A5              ..   LDA &A5
1EC6  A5 A2              ..   LDA &A2
1EC8  A5 A7              ..   LDA &A7
1ECA  A5 A5              ..   LDA &A5
1ECC  A5 A5              ..   LDA &A5
1ECE  A5 AF              ..   LDA &AF
1ED0  A5 A5              ..   LDA &A5
1ED2  A5 A5              ..   LDA &A5
1ED4  A5 A5              ..   LDA &A5
1ED6  A5 A8              ..   LDA &A8
1ED8  A5 A5              ..   LDA &A5
1EDA  A5 A5              ..   LDA &A5
1EDC  A5 A5              ..   LDA &A5
1EDE  A5 A1              ..   LDA &A1
1EE0  2F                 /    ...
1EE1  A7                 .    ...
1EE2  A5 A5              ..   LDA &A5
1EE4  A5 A5              ..   LDA &A5
1EE6  A5 A5              ..   LDA &A5
1EE8  A9 A4              ..   LDA #&A4
1EEA  A5 A5              ..   LDA &A5
1EEC  A5 A5              ..   LDA &A5
1EEE  A5 A5              ..   LDA &A5
1EF0  A5 AD              ..   LDA &AD
1EF2  A6 A5              ..   LDX &A5
1EF4  A5 A5              ..   LDA &A5
1EF6  A5 A5              ..   LDA &A5
1EF8  A5 A5              ..   LDA &A5
1EFA  A5 A5              ..   LDA &A5
1EFC  A5 A5              ..   LDA &A5
1EFE  A5 A5              ..   LDA &A5
1F00  A5 A5              ..   LDA &A5
1F02  A5 25              .%   LDA &25
1F04  25 27              %'   AND &27
1F06  25 25              %%   AND &25
1F08  25 25              %%   AND &25
1F0A  65 A5              e.   ADC &A5
1F0C  A5 AC              ..   LDA &AC
1F0E  A5 A5              ..   LDA &A5
1F10  A3                 .    ...
1F11  A5 A3              ..   LDA &A3
1F13  B5 B5              ..   LDA &B5,X
1F15  B1 B5              ..   LDA (&B5),Y
1F17  B5 B5              ..   LDA &B5,X
1F19  B5 B5              ..   LDA &B5,X
1F1B  A5 A5              ..   LDA &A5
1F1D  A5 A5              ..   LDA &A5
1F1F  A5 A5              ..   LDA &A5
1F21  87                 .    ...
1F22  5A                 Z    ...
1F23  A5 A5              ..   LDA &A5
1F25  A5 A5              ..   LDA &A5
1F27  A5 A5              ..   LDA &A5
1F29  0F                 .    ...
1F2A  5A                 Z    ...
1F2B  2D 2D A5           --.  AND &A52D
1F2E  A5 A5              ..   LDA &A5
1F30  2D 0F 5A           -.Z  AND &5A0F
1F33  A5 A5              ..   LDA &A5
1F35  A5 A5              ..   LDA &A5
1F37  A5 A5              ..   LDA &A5
1F39  0F                 .    ...
1F3A  5A                 Z    ...
1F3B  A5 A5              ..   LDA &A5
1F3D  A3                 .    ...
1F3E  A0 A2              ..   LDY #&A2
1F40  A3                 .    ...
1F41  A0 A5              ..   LDY #&A5
1F43  B5 B5              ..   LDA &B5,X
1F45  B1 B1              ..   LDA (&B1),Y
1F47  B1 B1              ..   LDA (&B1),Y
1F49  B3                 .    ...
1F4A  B5 25              .%   LDA &25,X
1F4C  23                 #    ...
1F4D  21 23              !#   AND (&23,X)
1F4F  21 21              !!   AND (&21,X)
1F51  25 25              %%   AND &25
1F53  A5 AF              ..   LDA &AF
1F55  AF                 .    ...
1F56  AF                 .    ...
1F57  AF                 .    ...
1F58  A1 A5              ..   LDA (&A5,X)
1F5A  A5 A5              ..   LDA &A5
1F5C  A5 A5              ..   LDA &A5
1F5E  A5 A5              ..   LDA &A5
1F60  A5 3C              .<   LDA &3C
1F62  5A                 Z    ...
1F63  A5 A5              ..   LDA &A5
1F65  A5 A5              ..   LDA &A5
1F67  A5 A5              ..   LDA &A5
1F69  87                 .    ...
1F6A  5A                 Z    ...
1F6B  A5 A5              ..   LDA &A5
1F6D  A5 A5              ..   LDA &A5
1F6F  A5 A5              ..   LDA &A5
1F71  E1 5A              .Z   SBC (&5A,X)
1F73  A5 A5              ..   LDA &A5
1F75  A5 A5              ..   LDA &A5
1F77  A5 A5              ..   LDA &A5
1F79  3C                 <    ...
1F7A  5A                 Z    ...
1F7B  25 25              %%   AND &25
1F7D  25 25              %%   AND &25
1F7F  25 25              %%   AND &25
1F81  25 25              %%   AND &25
1F83  A5 A5              ..   LDA &A5
1F85  A5 A5              ..   LDA &A5
1F87  A5 A5              ..   LDA &A5
1F89  A4 A7              ..   LDY &A7
1F8B  A5 A5              ..   LDA &A5
1F8D  A5 A6              ..   LDA &A6
1F8F  A1 AD              ..   LDA (&AD,X)
1F91  A5 A5              ..   LDA &A5
1F93  A4 A3              ..   LDY &A3
1F95  AD A7 A5           ...  LDA &A5A7
1F98  A5 A5              ..   LDA &A5
1F9A  A5 A5              ..   LDA &A5
1F9C  A5 A5              ..   LDA &A5
1F9E  AF                 .    ...
1F9F  A5 A5              ..   LDA &A5
1FA1  A5 A5              ..   LDA &A5
1FA3  A5 A5              ..   LDA &A5
1FA5  A5 AF              ..   LDA &AF
1FA7  A4 A5              ..   LDY &A5
1FA9  A7                 .    ...
1FAA  A5 A1              ..   LDA &A1
1FAC  A5 AD              ..   LDA &AD
1FAE  AF                 .    ...
1FAF  A5 A5              ..   LDA &A5
1FB1  A5 A5              ..   LDA &A5
1FB3  87                 .    ...
1FB4  A5 A5              ..   LDA &A5
1FB6  AF                 .    ...
1FB7  A5 A5              ..   LDA &A5
1FB9  A5 A5              ..   LDA &A5
1FBB  A5 A5              ..   LDA &A5
1FBD  A5 2F              ./   LDA &2F
1FBF  A5 A5              ..   LDA &A5
1FC1  87                 .    ...
1FC2  A5 A7              ..   LDA &A7
1FC4  A5 A7              ..   LDA &A7
1FC6  AD A7 A5           ...  LDA &A5A7
1FC9  A7                 .    ...
1FCA  A5 A5              ..   LDA &A5
1FCC  A5 A5              ..   LDA &A5
1FCE  AF                 .    ...
1FCF  A5 A5              ..   LDA &A5
1FD1  87                 .    ...
1FD2  A5 87              ..   LDA &87
1FD4  A5 A5              ..   LDA &A5
1FD6  2F                 /    ...
1FD7  A5 A5              ..   LDA &A5
1FD9  A5 A5              ..   LDA &A5
1FDB  A4 A5              ..   LDY &A5
1FDD  A5 AF              ..   LDA &AF
1FDF  A5 A5              ..   LDA &A5
1FE1  A5 A5              ..   LDA &A5
1FE3  A5 A5              ..   LDA &A5
1FE5  AD A7 A1           ...  LDA &A1A7
1FE8  A5 A7              ..   LDA &A7
1FEA  A5 A5              ..   LDA &A5
1FEC  A5 A5              ..   LDA &A5
1FEE  AF                 .    ...
1FEF  A5 A5              ..   LDA &A5
1FF1  A5 A5              ..   LDA &A5
1FF3  AD A6 A5           ...  LDA &A5A6
1FF6  AF                 .    ...
1FF7  A5 A5              ..   LDA &A5
1FF9  A5 A5              ..   LDA &A5
1FFB  A5 A5              ..   LDA &A5
1FFD  AD A3 A4           ...  LDA &A4A3
2000  A5 A5              ..   LDA &A5
2002  A5 E5              ..   LDA &E5
2004  E5 C5              ..   SBC &C5
2006  85 95              ..   STA &95
2008  BD A1 A7           ...  LDA &A7A1,X
200B  A5 A3              ..   LDA &A3
200D  A5 A3              ..   LDA &A3
200F  A5 55              .U   LDA &55
2011  A5 A5              ..   LDA &A5
2013  95 95              ..   STA &95,X
2015  F7                 .    ...
2016  F7                 .    ...
2017  33                 3    ...
2018  55 B5              U.   EOR &B5,X
201A  B5 A5              ..   LDA &A5,X
201C  A5 A5              ..   LDA &A5
201E  A5 A5              ..   LDA &A5
2020  A5 87              ..   LDA &87
.addr2022
2022  5A                 Z    ...
2023  A5 A5              ..   LDA &A5
2025  A5 A5              ..   LDA &A5
2027  A5 A5              ..   LDA &A5
2029  E1 5A              .Z   SBC (&5A,X)
202B  2D 2D A5           --.  AND &A52D
202E  A5 A5              ..   LDA &A5
2030  2D 3C 5A           -<Z  AND &5A3C
2033  A5 A5              ..   LDA &A5
2035  A5 A5              ..   LDA &A5
2037  A5 A5              ..   LDA &A5
2039  87                 .    ...
203A  5A                 Z    ...
203B  A5 A3              ..   LDA &A3
203D  A0 A0              ..   LDY #&A0
203F  A0 A3              ..   LDY #&A3
2041  A5 A5              ..   LDA &A5
2043  B5 B3              ..   LDA &B3,X
2045  B1 B1              ..   LDA (&B1),Y
2047  B1 B3              ..   LDA (&B3),Y
2049  B5 B5              ..   LDA &B5,X
204B  25 23              %#   AND &23
204D  21 21              !!   AND (&21,X)
204F  21 23              !#   AND (&23,X)
2051  25 25              %%   AND &25
2053  A5 AB              ..   LDA &AB
2055  A1 A1              ..   LDA (&A1,X)
2057  A1 A1              ..   LDA (&A1,X)
2059  A5 A5              ..   LDA &A5
205B  A5 A5              ..   LDA &A5
205D  A5 A5              ..   LDA &A5
205F  A5 A5              ..   LDA &A5
2061  2D 5A A5           -Z.  AND &A55A
2064  A5 A5              ..   LDA &A5
2066  A5 A5              ..   LDA &A5
2068  A5 2D              .-   LDA &2D
206A  5A                 Z    ...
206B  A5 A5              ..   LDA &A5
206D  A5 A5              ..   LDA &A5
206F  A5 A5              ..   LDA &A5
2071  2D 5A A5           -Z.  AND &A55A
2074  A5 A5              ..   LDA &A5
2076  A5 A5              ..   LDA &A5
2078  A5 2D              .-   LDA &2D
207A  5A                 Z    ...
207B  25 25              %%   AND &25
207D  25 25              %%   AND &25
207F  25 25              %%   AND &25
2081  25 25              %%   AND &25
2083  A5 A1              ..   LDA &A1
2085  A1 AD              ..   LDA (&AD,X)
2087  AF                 .    ...
2088  A5 AD              ..   LDA &AD
208A  A5 A5              ..   LDA &A5
208C  A5 A5              ..   LDA &A5
208E  A5 AF              ..   LDA &AF
2090  A5 A5              ..   LDA &A5
2092  A5 A5              ..   LDA &A5
2094  A5 A5              ..   LDA &A5
2096  A5 AF              ..   LDA &AF
2098  A5 A5              ..   LDA &A5
209A  A5 A5              ..   LDA &A5
209C  A5 A5              ..   LDA &A5
209E  A5 AF              ..   LDA &AF
20A0  A5 A7              ..   LDA &A7
20A2  A5 A1              ..   LDA &A1
20A4  A5 AD              ..   LDA &AD
20A6  A5 AF              ..   LDA &AF
20A8  A5 A5              ..   LDA &A5
20AA  A5 A5              ..   LDA &A5
20AC  A5 A5              ..   LDA &A5
20AE  A5 AF              ..   LDA &AF
20B0  A5 A5              ..   LDA &A5
20B2  A5 A5              ..   LDA &A5
20B4  A5 A5              ..   LDA &A5
20B6  A5 AF              ..   LDA &AF
20B8  A5 A5              ..   LDA &A5
20BA  A5 A5              ..   LDA &A5
20BC  A5 A5              ..   LDA &A5
20BE  A5 AF              ..   LDA &AF
20C0  A5 A5              ..   LDA &A5
20C2  A5 A7              ..   LDA &A7
20C4  2D A7 A5           -..  AND &A5A7
20C7  8D D5 A7           ...  STA &A7D5
20CA  A5 A5              ..   LDA &A5
20CC  2D A5 A5           -..  AND &A5A5
20CF  AF                 .    ...
20D0  A5 A5              ..   LDA &A5
20D2  A5 A5              ..   LDA &A5
20D4  A5 A5              ..   LDA &A5
20D6  A5 AF              ..   LDA &AF
20D8  A5 A5              ..   LDA &A5
20DA  A5 A5              ..   LDA &A5
20DC  A5 A5              ..   LDA &A5
20DE  A5 AF              ..   LDA &AF
20E0  A5 A5              ..   LDA &A5
20E2  A5 A4              ..   LDA &A4
20E4  A5 A5              ..   LDA &A5
20E6  A5 AF              ..   LDA &AF
20E8  A5 A5              ..   LDA &A5
20EA  A5 A5              ..   LDA &A5
20EC  A5 AD              ..   LDA &AD
20EE  A5 AF              ..   LDA &AF
20F0  A5 A7              ..   LDA &A7
20F2  A5 A5              ..   LDA &A5
20F4  A5 A5              ..   LDA &A5
20F6  A5 AF              ..   LDA &AF
20F8  A5 A5              ..   LDA &A5
20FA  A5 A5              ..   LDA &A5
20FC  A5 A5              ..   LDA &A5
20FE  A5 AF              ..   LDA &AF
2100  A5 A5              ..   LDA &A5
2102  A5 A7              ..   LDA &A7
2104  A4 A4              ..   LDY &A4
2106  A5 AF              ..   LDA &AF
2108  A5 A5              ..   LDA &A5
210A  A5 A5              ..   LDA &A5
210C  A5 A5              ..   LDA &A5
210E  AD A5 AD           ...  LDA &ADA5
2111  A5 AD              ..   LDA &AD
2113  B5 B5              ..   LDA &B5,X
2115  B5 B5              ..   LDA &B5,X
2117  B5 B5              ..   LDA &B5,X
2119  B5 B5              ..   LDA &B5,X
211B  A5 A5              ..   LDA &A5
211D  A5 A5              ..   LDA &A5
211F  A5 A5              ..   LDA &A5
2121  A5 5A              .Z   LDA &5A
2123  A5 A5              ..   LDA &A5
2125  A5 A5              ..   LDA &A5
2127  A5 A5              ..   LDA &A5
2129  A5 5A              .Z   LDA &5A
212B  A5 A5              ..   LDA &A5
212D  A5 A5              ..   LDA &A5
212F  A5 A5              ..   LDA &A5
2131  A5 5A              .Z   LDA &5A
2133  A5 A5              ..   LDA &A5
2135  A5 A5              ..   LDA &A5
2137  A5 A5              ..   LDA &A5
2139  A5 5A              .Z   LDA &5A
213B  A5 A4              ..   LDA &A4
213D  A6 A4              ..   LDX &A4
213F  A4 A6              ..   LDY &A6
2141  A5 A5              ..   LDA &A5
2143  B5 B5              ..   LDA &B5,X
2145  B5 B5              ..   LDA &B5,X
2147  B5 BD              ..   LDA &BD,X
2149  B5 B5              ..   LDA &B5,X
214B  25 21              %!   AND &21
214D  21 21              !!   AND (&21,X)
214F  21 23              !#   AND (&23,X)
2151  25 25              %%   AND &25
2153  A5 AB              ..   LDA &AB
2155  A1 A1              ..   LDA (&A1,X)
2157  A1 A1              ..   LDA (&A1,X)
2159  A5 A5              ..   LDA &A5
215B  A5 A5              ..   LDA &A5
215D  A5 A5              ..   LDA &A5
215F  A5 A5              ..   LDA &A5
2161  3C                 <    ...
2162  5A                 Z    ...
2163  A5 A5              ..   LDA &A5
2165  A5 A5              ..   LDA &A5
2167  A5 A5              ..   LDA &A5
2169  87                 .    ...
216A  5A                 Z    ...
216B  A5 A5              ..   LDA &A5
216D  A5 A5              ..   LDA &A5
216F  A5 A5              ..   LDA &A5
2171  E1 5A              .Z   SBC (&5A,X)
2173  A5 A5              ..   LDA &A5
2175  A5 A5              ..   LDA &A5
2177  A5 A5              ..   LDA &A5
2179  2D 5A 25           -Z%  AND &255A
217C  25 25              %%   AND &25
217E  25 25              %%   AND &25
2180  25 25              %%   AND &25
2182  25 AD              %.   AND &AD
2184  A1 A1              ..   LDA (&A1,X)
2186  A7                 .    ...
2187  A7                 .    ...
2188  A4 A5              ..   LDY &A5
218A  A5 A5              ..   LDA &A5
218C  A5 A5              ..   LDA &A5
218E  A5 A5              ..   LDA &A5
2190  AD AF A1           ...  LDA &A1AF
2193  A5 A5              ..   LDA &A5
2195  A5 A5              ..   LDA &A5
2197  A4 A5              ..   LDY &A5
2199  AF                 .    ...
219A  A5 A1              ..   LDA &A1
219C  A5 AD              ..   LDA &AD
219E  A5 A5              ..   LDA &A5
21A0  A5 AF              ..   LDA &AF
21A2  A5 A5              ..   LDA &A5
21A4  A5 A5              ..   LDA &A5
21A6  A5 A5              ..   LDA &A5
21A8  A5 AF              ..   LDA &AF
21AA  A5 A5              ..   LDA &A5
21AC  A5 A5              ..   LDA &A5
21AE  A5 A5              ..   LDA &A5
21B0  A5 AF              ..   LDA &AF
21B2  A5 A5              ..   LDA &A5
21B4  A5 A5              ..   LDA &A5
21B6  A5 A5              ..   LDA &A5
21B8  A5 AF              ..   LDA &AF
21BA  A5 A5              ..   LDA &A5
21BC  A5 A5              ..   LDA &A5
21BE  A5 A5              ..   LDA &A5
21C0  A5 AF              ..   LDA &AF
21C2  A5 A7              ..   LDA &A7
21C4  A5 A7              ..   LDA &A7
21C6  A5 A7              ..   LDA &A7
21C8  A5 AF              ..   LDA &AF
21CA  A5 A5              ..   LDA &A5
21CC  A5 A5              ..   LDA &A5
21CE  A5 A5              ..   LDA &A5
21D0  A5 AF              ..   LDA &AF
21D2  A5 A5              ..   LDA &A5
21D4  A5 A5              ..   LDA &A5
21D6  A5 A5              ..   LDA &A5
21D8  A5 AF              ..   LDA &AF
21DA  A5 A5              ..   LDA &A5
21DC  A5 A5              ..   LDA &A5
21DE  A5 A5              ..   LDA &A5
21E0  A5 AF              ..   LDA &AF
21E2  A5 A5              ..   LDA &A5
21E4  A5 A5              ..   LDA &A5
21E6  A5 A5              ..   LDA &A5
21E8  A5 AF              ..   LDA &AF
21EA  A5 A4              ..   LDA &A4
21EC  A5 A5              ..   LDA &A5
21EE  A5 A5              ..   LDA &A5
21F0  A5 AF              ..   LDA &AF
21F2  A5 A5              ..   LDA &A5
21F4  A5 AD              ..   LDA &AD
21F6  A5 A1              ..   LDA &A1
21F8  A5 AF              ..   LDA &AF
21FA  A5 A5              ..   LDA &A5
21FC  A5 A5              ..   LDA &A5
21FE  A5 A5              ..   LDA &A5
2200  A5 AF              ..   LDA &AF
2202  A4 A5              ..   LDY &A5
2204  A4 A4              ..   LDY &A4
2206  A6 A7              ..   LDX &A7
2208  A1 AD              ..   LDA (&AD,X)
220A  A5 AD              ..   LDA &AD
220C  A5 A5              ..   LDA &A5
220E  A5 A5              ..   LDA &A5
2210  A5 A5              ..   LDA &A5
2212  A5 B5              ..   LDA &B5
2214  B5 B5              ..   LDA &B5,X
2216  B5 B5              ..   LDA &B5,X
2218  B5 B5              ..   LDA &B5,X
221A  B5 A5              ..   LDA &A5,X
221C  A5 A5              ..   LDA &A5
221E  A5 A5              ..   LDA &A5
.addr2220
2220  A5 A5              ..   LDA &A5
2222  5A                 Z    ...
2223  A5 A5              ..   LDA &A5
2225  A5 A5              ..   LDA &A5
2227  A5 A5              ..   LDA &A5
2229  A5 5A              .Z   LDA &5A
222B  A5 A5              ..   LDA &A5
222D  A5 A5              ..   LDA &A5
222F  A5 A5              ..   LDA &A5
2231  A5 5A              .Z   LDA &5A
2233  A5 A5              ..   LDA &A5
2235  A5 A5              ..   LDA &A5
2237  A5 A5              ..   LDA &A5
2239  A5 5A              .Z   LDA &5A
223B  A6 A5              ..   LDX &A5
223D  A6 A7              ..   LDX &A7
223F  A6 A5              ..   LDX &A5
2241  A5 A5              ..   LDA &A5
2243  BD BD BD           ...  LDA &BDBD,X
2246  B5 BD              ..   LDA &BD,X
2248  B5 B5              ..   LDA &B5,X
224A  B5 25              .%   LDA &25,X
224C  22                 "    ...
224D  20 22 20            "   JSR &2022
2250  20 25 25            %%  JSR &2525
2253  A5 A1              ..   LDA &A1
2255  A1 A1              ..   LDA (&A1,X)
2257  A1 A3              ..   LDA (&A3,X)
2259  A5 A5              ..   LDA &A5
225B  A5 A5              ..   LDA &A5
225D  A5 A5              ..   LDA &A5
225F  A5 A5              ..   LDA &A5
2261  3C                 <    ...
2262  5A                 Z    ...
2263  A5 A5              ..   LDA &A5
2265  A5 A5              ..   LDA &A5
2267  A5 A5              ..   LDA &A5
2269  B4 5A              .Z   LDY &5A
226B  A5 A5              ..   LDA &A5
226D  A5 A5              ..   LDA &A5
226F  A5 A5              ..   LDA &A5
2271  B4 5A              .Z   LDY &5A
2273  A5 A5              ..   LDA &A5
2275  A5 A5              ..   LDA &A5
2277  A5 A5              ..   LDA &A5
2279  A5 5A              .Z   LDA &5A
227B  25 25              %%   AND &25
227D  25 25              %%   AND &25
227F  25 25              %%   AND &25
2281  25 25              %%   AND &25
2283  A5 A5              ..   LDA &A5
2285  A5 A5              ..   LDA &A5
2287  A5 A5              ..   LDA &A5
2289  A5 A5              ..   LDA &A5
228B  A7                 .    ...
228C  A4 A5              ..   LDY &A5
228E  A5 A5              ..   LDA &A5
2290  A5 A5              ..   LDA &A5
2292  A5 A1              ..   LDA &A1
2294  AD A1 A4           ...  LDA &A4A1
2297  A5 A5              ..   LDA &A5
2299  A5 A5              ..   LDA &A5
229B  A5 A5              ..   LDA &A5
229D  A5 AD              ..   LDA &AD
229F  A3                 .    ...
22A0  A5 A5              ..   LDA &A5
22A2  A5 A5              ..   LDA &A5
22A4  A5 A5              ..   LDA &A5
22A6  A5 A5              ..   LDA &A5
22A8  A9 A4              ..   LDA #&A4
22AA  A5 A5              ..   LDA &A5
22AC  A5 A5              ..   LDA &A5
22AE  A5 A5              ..   LDA &A5
22B0  A5 AF              ..   LDA &AF
22B2  A5 A5              ..   LDA &A5
22B4  A5 A5              ..   LDA &A5
22B6  A5 A5              ..   LDA &A5
22B8  A5 A5              ..   LDA &A5
22BA  A8                 .    TAY
22BB  A5 A5              ..   LDA &A5
22BD  A5 A5              ..   LDA &A5
22BF  A5 A5              ..   LDA &A5
22C1  A5 A3              ..   LDA &A3
22C3  A7                 .    ...
22C4  A5 A7              ..   LDA &A7
22C6  A5 A7              ..   LDA &A7
22C8  A5 A7              ..   LDA &A7
22CA  AE A5 A5           ...  LDX &A5A5
22CD  A5 A5              ..   LDA &A5
22CF  A5 A5              ..   LDA &A5
22D1  A5 A0              ..   LDA &A0
22D3  A5 A5              ..   LDA &A5
22D5  A5 A5              ..   LDA &A5
22D7  A5 A5              ..   LDA &A5
22D9  A5 AF              ..   LDA &AF
22DB  A5 A5              ..   LDA &A5
22DD  A5 A5              ..   LDA &A5
22DF  A5 A5              ..   LDA &A5
22E1  A0 AD              ..   LDY #&AD
22E3  A5 A5              ..   LDA &A5
22E5  A5 A5              ..   LDA &A5
22E7  A5 A6              ..   LDA &A6
22E9  AD A5 A5           ...  LDA &A5A5
22EC  A5 A5              ..   LDA &A5
22EE  A5 A3              ..   LDA &A3
22F0  A5 A5              ..   LDA &A5
22F2  A5 A4              ..   LDA &A4
22F4  A5 A6              ..   LDA &A6
22F6  A9 A5              ..   LDA #&A5
22F8  A5 A5              ..   LDA &A5
22FA  A5 A7              ..   LDA &A7
22FC  AD A5 A5           ...  LDA &A5A5
22FF  A5 A5              ..   LDA &A5
2301  A5 A5              ..   LDA &A5
2303  A5 A5              ..   LDA &A5
2305  A5 A5              ..   LDA &A5
2307  A5 A5              ..   LDA &A5
2309  A5 A5              ..   LDA &A5
230B  A5 A5              ..   LDA &A5
230D  A5 A5              ..   LDA &A5
230F  A5 A5              ..   LDA &A5
2311  A5 A5              ..   LDA &A5
2313  B5 B5              ..   LDA &B5,X
2315  B5 B5              ..   LDA &B5,X
2317  B5 B5              ..   LDA &B5,X
2319  B5 B5              ..   LDA &B5,X
231B  A5 A5              ..   LDA &A5
231D  A5 A5              ..   LDA &A5
231F  A5 A5              ..   LDA &A5
2321  A5 5A              .Z   LDA &5A
2323  A5 A5              ..   LDA &A5
2325  A5 A5              ..   LDA &A5
2327  A5 A5              ..   LDA &A5
2329  A5 5A              .Z   LDA &5A
232B  A5 A5              ..   LDA &A5
232D  A5 A5              ..   LDA &A5
232F  A5 A5              ..   LDA &A5
2331  A5 5A              .Z   LDA &5A
2333  A5 A5              ..   LDA &A5
2335  A5 A5              ..   LDA &A5
2337  A5 A5              ..   LDA &A5
2339  A5 5A              .Z   LDA &5A
233B  A6 A5              ..   LDX &A5
233D  A6 A5              ..   LDX &A5
233F  A6 A5              ..   LDX &A5
2341  A5 A7              ..   LDA &A7
2343  BD BD BD           ...  LDA &BDBD,X
2346  BD BD B5           ...  LDA &B5BD,X
2349  B5 B5              ..   LDA &B5,X
234B  25 25              %%   AND &25
234D  75 22              u"   ADC &22,X
234F  20 25 25            %%  JSR &2525
2352  55 A5              U.   EOR &A5,X
2354  A5 65              .e   LDA &65
2356  89                 .    ...
2357  A9 A5              ..   LDA #&A5
2359  A5 55              .U   LDA &55
235B  A5 A5              ..   LDA &A5
235D  A5 A5              ..   LDA &A5
235F  A5 A5              ..   LDA &A5
2361  A5 55              .U   LDA &55
2363  A5 A5              ..   LDA &A5
2365  A5 A5              ..   LDA &A5
2367  A5 A5              ..   LDA &A5
2369  A5 55              .U   LDA &55
236B  A5 A5              ..   LDA &A5
236D  A5 A5              ..   LDA &A5
236F  A5 A5              ..   LDA &A5
2371  A5 55              .U   LDA &55
2373  A5 A5              ..   LDA &A5
2375  A5 A5              ..   LDA &A5
2377  A5 A5              ..   LDA &A5
2379  A5 55              .U   LDA &55
237B  25 25              %%   AND &25
237D  25 25              %%   AND &25
237F  65 01              e.   ADC &01
2381  33                 3    ...
2382  55 A5              U.   EOR &A5,X
2384  A5 A5              ..   LDA &A5
2386  A5 A5              ..   LDA &A5
2388  A5 A5              ..   LDA &A5
238A  55 A5              U.   EOR &A5,X
238C  A5 A5              ..   LDA &A5
238E  A5 A5              ..   LDA &A5
2390  A5 A5              ..   LDA &A5
2392  55 A5              U.   EOR &A5,X
2394  A5 A5              ..   LDA &A5
2396  A5 A5              ..   LDA &A5
2398  A5 A5              ..   LDA &A5
239A  55 A5              U.   EOR &A5,X
239C  A5 A5              ..   LDA &A5
239E  A5 A5              ..   LDA &A5
23A0  A5 A5              ..   LDA &A5
23A2  55 A5              U.   EOR &A5,X
23A4  A5 A5              ..   LDA &A5
23A6  A5 A5              ..   LDA &A5
23A8  A5 A5              ..   LDA &A5
23AA  55 A5              U.   EOR &A5,X
23AC  A5 A5              ..   LDA &A5
23AE  A5 A5              ..   LDA &A5
23B0  A5 A5              ..   LDA &A5
23B2  55 A5              U.   EOR &A5,X
23B4  96 87              ..   STX &87,Y
23B6  96 87              ..   STX &87,Y
23B8  96 A5              ..   STX &A5,Y
23BA  55 A5              U.   EOR &A5,X
23BC  0F                 .    ...
23BD  87                 .    ...
23BE  87                 .    ...
23BF  87                 .    ...
23C0  1E A5 55           ..U  ASL &55A5,Y
23C3  A5 87              ..   LDA &87
23C5  87                 .    ...
23C6  87                 .    ...
23C7  87                 .    ...
23C8  0F                 .    ...
23C9  A5 55              .U   LDA &55
23CB  A5 4B              .K   LDA &4B
23CD  E1 E1              ..   SBC (&E1,X)
23CF  E1 E1              ..   SBC (&E1,X)
23D1  A5 55              .U   LDA &55
23D3  A5 4B              .K   LDA &4B
23D5  2D 69 2D           -i-  AND &2D69
23D8  4B                 K    ...
23D9  A5 55              .U   LDA &55
23DB  A5 A5              ..   LDA &A5
23DD  A5 A5              ..   LDA &A5
23DF  A5 A5              ..   LDA &A5
23E1  A5 55              .U   LDA &55
23E3  A5 A5              ..   LDA &A5
23E5  A5 A5              ..   LDA &A5
23E7  A5 A5              ..   LDA &A5
23E9  A5 55              .U   LDA &55
23EB  A5 A5              ..   LDA &A5
23ED  A5 A5              ..   LDA &A5
23EF  A5 A5              ..   LDA &A5
23F1  A5 55              .U   LDA &55
23F3  A5 A5              ..   LDA &A5
23F5  A5 A5              ..   LDA &A5
23F7  A5 A5              ..   LDA &A5
23F9  A5 55              .U   LDA &55
23FB  A5 A5              ..   LDA &A5
23FD  A5 A5              ..   LDA &A5
23FF  A5 A5              ..   LDA &A5
2401  A5 55              .U   LDA &55
2403  A5 A5              ..   LDA &A5
2405  A5 A5              ..   LDA &A5
2407  A5 A5              ..   LDA &A5
2409  A5 55              .U   LDA &55
240B  A5 A5              ..   LDA &A5
240D  A5 A5              ..   LDA &A5
240F  A5 A5              ..   LDA &A5
2411  A5 55              .U   LDA &55
2413  B5 B5              ..   LDA &B5,X
2415  B5 B5              ..   LDA &B5,X
2417  95 F7              ..   STA &F7,X
2419  33                 3    ...
241A  55 A5              U.   EOR &A5,X
241C  A5 A5              ..   LDA &A5
241E  A5 A5              ..   LDA &A5
2420  A5 A5              ..   LDA &A5
2422  55 A5              U.   EOR &A5,X
2424  A5 A5              ..   LDA &A5
2426  A5 A5              ..   LDA &A5
2428  A5 A5              ..   LDA &A5
242A  55 A5              U.   EOR &A5,X
242C  A5 A5              ..   LDA &A5
242E  A5 A5              ..   LDA &A5
2430  A5 A5              ..   LDA &A5
2432  55 A5              U.   EOR &A5,X
2434  A5 A5              ..   LDA &A5
2436  A5 A5              ..   LDA &A5
2438  A5 A5              ..   LDA &A5
243A  55 A7              U.   EOR &A7,X
243C  A7                 .    ...
243D  A7                 .    ...
243E  A6 A5              ..   LDX &A5
2440  A5 A5              ..   LDA &A5
2442  55 B5              U.   EOR &B5,X
2444  BD BD BD           ...  LDA &BDBD,X
2447  BD B5 B5           ...  LDA &B5B5,X
244A  55 A5              U.   EOR &A5,X
244C  E5 A3              ..   SBC &A3
244E  DF                 .    ...
244F  7F                     ...
2450  F4                 .    ...
2451  A5 AF              ..   LDA &AF
2453  C3                 .    ...
2454  BD A5 A5           ...  LDA &A5A5,X
2457  81 AB              ..   STA (&AB,X)
2459  A7                 .    ...
245A  89                 .    ...
245B  A5 A5              ..   LDA &A5
245D  A7                 .    ...
245E  A5 A5              ..   LDA &A5
2460  A5 E1              ..   LDA &E1
2462  BA                 .    TSX
2463  B5 97              ..   LDA &97,X
2465  AD AD 81           ...  LDA &81AD
2468  FA                 .    ...
2469  84 F1              ..   STY &F1
246B  AD AD 81           ...  LDA &81AD
246E  BA                 .    TSX
246F  97                 .    ...
2470  D1 AD              ..   CMP (&AD),Y
2472  AD 81 3A           ..:  LDA &3A81
2475  95 D3              ..   STA &D3,X
2477  AD AD 81           ...  LDA &81AD
247A  7A                 z    ...
247B  B5 C0              ..   LDA &C0,X
247D  AD AD 89           ...  LDA &89AD
2480  9A                 .    TXS
2481  D1 2D              .-   CMP (&2D),Y
2483  AD AD 89           ...  LDA &89AD
2486  DA                 .    ...
2487  F1 2D              .-   SBC (&2D),Y
2489  AD AD 89           ...  LDA &89AD
248C  5A                 Z    ...
248D  C0 2D              .-   CPY #&2D
248F  AD AD 89           ...  LDA &89AD
2492  1A                 .    ...
2493  D3                 .    ...
2494  2D A9 A9           -..  AND &A9A9
2497  89                 .    ...
2498  8D D1 2D           ..-  STA &2DD1
249B  A9 A9              ..   LDA #&A9
249D  89                 .    ...
249E  CD F1 2D           ..-  CMP &2DF1
24A1  A9 A9              ..   LDA #&A9
24A3  89                 .    ...
24A4  4D C0 2D           M.-  EOR &2DC0
24A7  A9 A9              ..   LDA #&A9
24A9  89                 .    ...
24AA  0D D3 2D           ..-  ORA &2DD3
24AD  AD AD A9           ...  LDA &A9AD
24B0  0D D3 D2           ...  ORA &D2D3
24B3  AD AD A9           ...  LDA &A9AD
24B6  4D C0 C3           M..  EOR &C3C0
24B9  AD AD A9           ...  LDA &A9AD
24BC  8D D1 D2           ...  STA &D2D1
24BF  AD AD A9           ...  LDA &A9AD
24C2  CD F1 F0           ...  CMP &F0F1
24C5  BA                 .    TSX
24C6  84 A5              ..   STY &A5
24C8  A1 BA              ..   LDA (&BA,X)
24CA  97                 .    ...
24CB  A5 AD              ..   LDA &AD
24CD  BA                 .    TSX
24CE  95 A5              ..   STA &A5,X
24D0  A9 BA              ..   LDA #&BA
24D2  B5 A5              ..   LDA &A5,X
24D4  B5 BA              ..   LDA &BA,X
24D6  81 A1              ..   STA (&A1,X)
24D8  AD BA F4           ...  LDA &F4BA
24DB  A1 B5              ..   LDA (&B5,X)
24DD  BA                 .    TSX
24DE  C5 A9              ..   CMP &A9
24E0  B5 BA              ..   LDA &BA,X
24E2  D6 AD              ..   DEC &AD,X
24E4  A9 BA              ..   LDA #&BA
24E6  D1 AD              ..   CMP (&AD),Y
24E8  B1 BA              ..   LDA (&BA),Y
24EA  F1 A1              ..   SBC (&A1),Y
24EC  BD BA C0           ...  LDA &C0BA,X
24EF  B5 B9              ..   LDA &B9,X
24F1  BA                 .    TSX
24F2  D3                 .    ...
24F3  A9 85              ..   LDA #&85
24F5  BA                 .    TSX
24F6  23                 #    ...
24F7  B9 85 BA           ...  LDA &BA85,Y
24FA  22                 "    ...
24FB  B1 85              ..   LDA (&85),Y
24FD  BA                 .    TSX
24FE  21 B1              !.   AND (&B1,X)
2500  BD BA 20           ..   LDA &20BA,X
2503  BD B9 AD           ...  LDA &ADB9,X
2506  20 BD 8D            ..  JSR &8DBD
2509  AD 22 B1           .".  LDA &B122
250C  81 AD              ..   STA (&AD,X)
250E  22                 "    ...
250F  85 95              ..   STA &95
2511  AD 20 B9           . .  LDA &B920
2514  89                 .    ...
2515  AD D1 81           ...  LDA &81D1
2518  99 AD F1           ...  STA &F1AD,Y
251B  8D E5 AD           ...  STA &ADE5
251E  D3                 .    ...
251F  95 91              ..   STA &91,X
2521  AD C0 89           ...  LDA &89C0
2524  9D 3A E5           .:.  STA &E53A,X
2527  A5 B5              ..   LDA &B5
2529  FA                 .    ...
252A  A5 E5              ..   LDA &E5
252C  B5 BA              ..   LDA &BA,X
252E  E5 A5              ..   SBC &A5
2530  B5 BA              ..   LDA &BA,X
2532  A5 E5              ..   LDA &E5
2534  B5 BA              ..   LDA &BA,X
2536  85 A5              ..   STA &A5
2538  A5 FA              ..   LDA &FA
253A  A5 85              ..   LDA &85
253C  A5 3A              .:   LDA &3A
253E  85 A5              ..   STA &A5
2540  A5 BA              ..   LDA &BA
2542  A5 85              ..   LDA &85
2544  A5 9A              ..   LDA &9A
2546  A5 A5              ..   LDA &A5
2548  15 A5              ..   ORA &A5,X
254A  A5 E9              ..   LDA &E9
254C  97                 .    ...
254D  81 A5              ..   STA (&A5,X)
254F  A6 C5              ..   LDX &C5
2551  CE 0C D2           ...  DEC &D20C
2554  A5 C1              ..   LDA &C1
2556  C9 10              ..   CMP #&10
2558  D4                 .    ...
2559  C8                 .    INY
255A  CB                 .    ...
255B  14                 .    ...
255C  D2                 .    ...
255D  A5 C2              ..   LDA &C2
255F  17                 .    ...
2560  C7                 .    ...
2561  97                 .    ...
2562  85 A5              ..   STA &A5
2564  0A                 .    ASL A
2565  10 C8              ..   BPL &252F
2567  D2                 .    ...
2568  1F                 .    ...
2569  DF                 .    ...
256A  8A                 .    TXA
256B  A5 D5              ..   LDA &D5
256D  DF                 .    ...
256E  D5 1A              ..   CMP &1A,X
2570  CB                 .    ...
2571  A5 D6              ..   LDA &D6
2573  18                 .    CLC
2574  03                 .    ...
2575  A5 84              ..   LDA &84
2577  A6 0D              ..   LDX &0D
2579  D4                 .    ...
257A  CD C3 D2           ...  CMP &D2C3
257D  A6 20              .    LDX &20
257F  D5 A5              ..   CMP &A5,X
2581  0A                 .    ASL A
2582  C2                 .    ...
2583  0E D2 18           ...  ASL &18D2
2586  06 A5              ..   ASL &A5
2588  C7                 .    ...
2589  C1 18              ..   CMP (&18,X)
258B  C5 D3              ..   CMP &D3
258D  CA                 .    DEX
258E  D2                 .    ...
258F  D3                 .    ...
2590  12                 .    ...
2591  CA                 .    DEX
2592  A5 18              ..   LDA &18
2594  C5 CE              ..   CMP &CE
2596  A6 A5              ..   LDX &A5
2598  C7                 .    ...
2599  10 12              ..   BPL &25AD
259B  05 A6              ..   ORA &A6
259D  A5 D6              ..   LDA &D6
259F  C9 1F              ..   CMP #&1F
25A1  A6 A5              ..   LDX &A5
25A3  0D 0A CA           ...  ORA &CA0A
25A6  DF                 .    ...
25A7  A6 A5              ..   LDX &A5
25A9  D3                 .    ...
25AA  C8                 .    INY
25AB  CF                 .    ...
25AC  D2                 .    ...
.addr25AD
25AD  A5 D0              ..   LDA &D0
25AF  CF                 .    ...
25B0  C3                 .    ...
25B1  D1 A6              ..   CMP (&A6),Y
25B3  A5 1C              ..   LDA &1C
25B5  1D 11 D2           ...  ORA &D211,X
25B8  DF                 .    ...
25B9  A5 1D              ..   LDA &1D
25BB  0C                 .    ...
25BC  C5 CE              ..   CMP &CE
25BE  DF                 .    ...
25BF  A5 C0              ..   LDA &C0
25C1  C3                 .    ...
25C2  D3                 .    ...
25C3  C2                 .    ...
25C4  06 A5              ..   ASL &A5
25C6  CB                 .    ...
25C7  D3                 .    ...
25C8  CA                 .    DEX
25C9  11 AB              ..   ORA (&AB),Y
25CB  24 A5              $.   BIT &A5
25CD  0B                 .    ...
25CE  C5 D2              ..   CMP &D2
25D0  17                 .    ...
25D1  1F                 .    ...
25D2  3F                 ?    ...
25D3  A5 7D              .}   LDA &7D
25D5  CB                 .    ...
25D6  D3                 .    ...
25D7  C8                 .    INY
25D8  1B                 .    ...
25D9  D2                 .    ...
25DA  A5 C5              ..   LDA &C5
25DC  19 C0 1E           ...  ORA &1EC0,Y
25DF  16 C7              ..   ASL &C7,X
25E1  C5 DF              ..   CMP &DF
25E3  A5 C2              ..   LDA &C2
25E5  C3                 .    ...
25E6  CB                 .    ...
25E7  C9 C5              ..   CMP #&C5
25E9  12                 .    ...
25EA  C5 DF              ..   CMP &DF
25EC  A5 C5              ..   LDA &C5
25EE  1F                 .    ...
25EF  D6 1F              ..   DEC &1F,X
25F1  17                 .    ...
25F2  C3                 .    ...
25F3  A6 4D              .M   LDX &4D
25F5  17                 .    ...
25F6  C3                 .    ...
25F7  A5 D5              ..   LDA &D5
25F9  CE CF D6           ...  DEC &D6CF
25FC  A5 D6              ..   LDA &D6
25FE  78                 x    SEI
25FF  C2                 .    ...
2600  D3                 .    ...
2601  C5 D2              ..   CMP &D2
2603  A5 A6              ..   LDA &A6
2605  13                 .    ...
2606  D5 16              ..   CMP &16,X
2608  A5 CE              ..   LDA &CE
260A  D3                 .    ...
260B  CB                 .    ...
260C  1D A6 C5           ...  ORA &C5A6,X
260F  C9 CA              ..   CMP #&CA
2611  19 CF 06           ...  ORA &06CF,Y
2614  A5 CE              ..   LDA &CE
2616  DF                 .    ...
2617  D6 16              ..   DEC &16,X
2619  D5 D6              ..   CMP &D6,X
261B  C7                 .    ...
261C  03                 .    ...
261D  A6 A5              ..   LDX &A5
261F  D5 CE              ..   CMP &CE,X
2621  1F                 .    ...
2622  D2                 .    ...
2623  A6 4C              .L   LDX &4C
.addr2625
2625  27                 '    ...
2626  A5 0B              ..   LDA &0B
2628  4D 1D 03           M..  EOR &031D
262B  A5 D6              ..   LDA &D6
262D  C9 D6              ..   CMP #&D6
262F  D3                 .    ...
2630  CA                 .    DEX
2631  17                 .    ...
2632  CF                 .    ...
2633  19 A5 C1           ...  ORA &C1A5,Y
2636  78                 x    SEI
2637  D5 D5              ..   CMP &D5,X
2639  A6 3C              .<   LDX &3C
263B  CF                 .    ...
263C  D0 CF              ..   BNE &260D
263E  D2                 .    ...
263F  DF                 .    ...
2640  A5 C3              ..   LDA &C3
2642  C5 19              ..   CMP &19
2644  C9 CB              ..   CMP #&CB
2646  DF                 .    ...
2647  A5 A6              ..   LDA &A6
2649  CA                 .    DEX
264A  CF                 .    ...
264B  C1 CE              ..   CMP (&CE,X)
264D  D2                 .    ...
264E  A6 DF              ..   LDX &DF
2650  C3                 .    ...
2651  0C                 .    ...
2652  D5 A5              ..   CMP &A5,X
2654  1A                 .    ...
2655  C5 CE              ..   CMP &CE
2657  A8                 .    TAY
2658  07                 .    ...
2659  10 CA              ..   BPL &2625
265B  A5 C5              ..   LDA &C5
265D  C7                 .    ...
265E  D5 CE              ..   CMP &CE,X
2660  A5 A6              ..   LDA &A6
2662  00                 .    BRK
2663  89                 .    ...
2664  CF                 .    ...
2665  19 A5 FC           ...  ORA &FCA5,Y
2668  27                 '    ...
2669  87                 .    ...
266A  A5 D2              ..   LDA &D2
266C  0C                 .    ...
266D  05 D2              ..   ORA &D2
266F  A6 CA              ..   LDX &CA
2671  C9 4D              .M   CMP #&4D
2673  A5 EC              ..   LDA &EC
2675  A6 CC              ..   LDX &CC
2677  C7                 .    ...
2678  CB                 .    ...
2679  CB                 .    ...
267A  1E A5 D4           ...  ASL &D4A5,Y
267D  1D 05 A5           ...  ORA &A505,X
2680  D5 D2              ..   CMP &D2,X
2682  A5 36              .6   LDA &36
2684  A6 C9              ..   LDX &C9
.addr2686
2686  C0 A6              ..   CPY #&A6
2688  A5 D5              ..   LDA &D5
268A  C3                 .    ...
268B  89                 .    ...
268C  A5 A6              ..   LDA &A6
268E  C5 0C              ..   CMP &0C
2690  C1 C9              ..   CMP (&C9,X)
2692  80                 .    ...
2693  A5 C3              ..   LDA &C3
2695  1C                 .    ...
2696  CF                 .    ...
2697  D6 A5              ..   DEC &A5,X
2699  C0 C9              ..   CPY #&C9
269B  C9 C2              ..   CMP #&C2
269D  A5 1A              ..   LDA &1A
269F  DE 11 CA           ...  DEC &CA11,X
26A2  0F                 .    ...
26A3  A5 12              ..   LDA &12
26A5  0B                 .    ...
26A6  C9 C7              ..   CMP #&C7
26A8  C5 11              ..   CMP &11
26AA  10 D5              ..   BPL &2681
26AC  A5 D5              ..   LDA &D5
26AE  13                 .    ...
26AF  10 D5              ..   BPL &2686
26B1  A5 CA              ..   LDA &CA
26B3  CF                 .    ...
26B4  1C                 .    ...
26B5  1F                 .    ...
26B6  A9 D1              ..   LDA #&D1
26B8  0A                 .    ASL A
26B9  0F                 .    ...
26BA  A5 CA              ..   LDA &CA
26BC  D3                 .    ...
26BD  DE D3 18           ...  DEC &18D3,X
26C0  0F                 .    ...
26C1  A5 C8              ..   LDA &C8
26C3  0C                 .    ...
26C4  C5 C9              ..   CMP &C9
26C6  11 C5              ..   ORA (&C5),Y
26C8  D5 A5              ..   CMP &A5,X
26CA  7D D6 D3           }..  ADC &D3D6,X
26CD  D2                 .    ...
26CE  16 D5              ..   ASL &D5,X
26D0  A5 0D              ..   LDA &0D
26D2  C5 CE              ..   CMP &CE
26D4  0A                 .    ASL A
26D5  16 DF              ..   ASL &DF,X
26D7  A5 C7              ..   LDA &C7
26D9  CA                 .    DEX
26DA  CA                 .    DEX
26DB  C9 DF              ..   CMP #&DF
26DD  D5 A5              ..   CMP &A5,X
26DF  C0 CF              ..   CPY #&CF
26E1  08                 .    PHP
26E2  0C                 .    ...
26E3  CB                 .    ...
26E4  D5 A5              ..   CMP &A5,X
26E6  C0 D3              ..   CPY #&D3
26E8  D4                 .    ...
26E9  D5 A5              ..   CMP &A5,X
26EB  CB                 .    ...
26EC  0A                 .    ASL A
26ED  16 06              ..   ASL &06,X
26EF  D5 A5              ..   CMP &A5,X
26F1  C1 C9              ..   CMP (&C9,X)
26F3  CA                 .    DEX
26F4  C2                 .    ...
26F5  A5 D6              ..   LDA &D6
26F7  CA                 .    DEX
26F8  17                 .    ...
26F9  0A                 .    ASL A
26FA  D3                 .    ...
26FB  CB                 .    ...
26FC  A5 05              ..   LDA &05
26FE  CB                 .    ...
26FF  AB                 .    ...
2700  4D 19 0F           M..  EOR &0F19
2703  A5 06              ..   LDA &06
2705  CF                 .    ...
2706  14                 .    ...
2707  A6 F9              ..   LDX &F9
2709  D5 A5              ..   CMP &A5,X
270B  8A                 .    TXA
270C  B7                 .    ...
270D  B6 86              ..   LDX &86,Y
270F  B3                 .    ...
2710  86 A5              ..   STX &A5
2712  A6 C5              ..   LDX &C5
2714  D4                 .    ...
2715  A5 CA              ..   LDA &CA
2717  0C                 .    ...
2718  05 A5              ..   ORA &A5
271A  C0 CF              ..   CPY #&CF
271C  16 03              ..   ASL &03,X
271E  A5 D5              ..   LDA &D5
2720  0D 89 A5           ...  ORA &A589
2723  C1 08              ..   CMP (&08,X)
2725  14                 .    ...
2726  A5 D4              ..   LDA &D4
2728  1E A5 DF           ...  ASL &DFA5,Y
272B  C3                 .    ...
272C  89                 .    ...
272D  C9 D1              ..   CMP #&D1
272F  A5 C4              ..   LDA &C4
2731  CA                 .    DEX
2732  D3                 .    ...
2733  C3                 .    ...
2734  A5 C4              ..   LDA &C4
2736  13                 .    ...
2737  C5 CD              ..   CMP &CD
2739  A5 90              ..   LDA &90
273B  A5 D5              ..   LDA &D5
273D  CA                 .    DEX
273E  CF                 .    ...
273F  CB                 .    ...
2740  DF                 .    ...
2741  A5 C4              ..   LDA &C4
2743  D3                 .    ...
2744  C1 AB              ..   CMP (&AB,X)
2746  C3                 .    ...
2747  DF                 .    ...
2748  1E A5 CE           ...  ASL &CEA5,Y
274B  1F                 .    ...
274C  C8                 .    INY
274D  1E A5 C4           ...  ASL &C4A5,Y
2750  19 DF A5           ...  ORA &A5DF,Y
2753  C0 17              ..   CPY #&17
2755  A5 C0              ..   LDA &C0
2757  D3                 .    ...
2758  D4                 .    ...
2759  D4                 .    ...
275A  DF                 .    ...
275B  A5 78              .x   LDA &78
275D  C2                 .    ...
275E  14                 .    ...
275F  D2                 .    ...
2760  A5 C0              ..   LDA &C0
2762  78                 x    SEI
2763  C1 A5              ..   CMP (&A5,X)
2765  CA                 .    DEX
2766  CF                 .    ...
2767  02                 .    ...
2768  D4                 .    ...
2769  C2                 .    ...
276A  A5 CA              ..   LDA &CA
276C  C9 C4              ..   CMP #&C4
276E  4D 16 A5           M..  EOR &A516
2771  00                 .    BRK
2772  D4                 .    ...
2773  C2                 .    ...
2774  A5 CE              ..   LDA &CE
2776  D3                 .    ...
2777  CB                 .    ...
2778  1D C9 CF           ...  ORA &CFC9,X
277B  C2                 .    ...
277C  A5 C0              ..   LDA &C0
277E  C3                 .    ...
277F  CA                 .    DEX
2780  0A                 .    ASL A
2781  C3                 .    ...
2782  A5 0A              ..   LDA &0A
2784  D5 C3              ..   CMP &C3,X
2786  C5 D2              ..   CMP &D2
2788  A5 2D              .-   LDA &2D
278A  12                 .    ...
278B  0B                 .    ...
278C  0E A5 C5           ...  ASL &C5A5
278F  C9 CB              ..   CMP #&CB
2791  A5 7D              .}   LDA &7D
2793  CB                 .    ...
2794  1D C2 16           ...  ORA &16C2,X
2797  A5 A6              ..   LDA &A6
2799  C2                 .    ...
279A  0F                 .    ...
279B  D2                 .    ...
279C  78                 x    SEI
279D  DF                 .    ...
279E  1E A5 D4           ...  ASL &D4A5,Y
27A1  C9 A5              ..   CMP #&A5
27A3  28                 (    PLP
27A4  A6 A6              ..   LDX &A6
27A6  36 8A              6.   ROL &8A,X
27A8  A6 3C              .<   LDX &3C
27AA  A6 A6              ..   LDX &A6
27AC  A6 28              .(   LDX &28
27AE  A6 20              .    LDX &20
27B0  A6 C0              ..   LDX &C0
27B2  1F                 .    ...
27B3  A6 D5              ..   LDX &D5
27B5  C7                 .    ...
27B6  07                 .    ...
27B7  8A                 .    TXA
27B8  8C A5 C0           ...  STY &C0A5
27BB  D4                 .    ...
27BC  19 D2 A5           ...  ORA &A5D2,Y
27BF  08                 .    PHP
27C0  0C                 .    ...
27C1  A5 07              ..   LDA &07
27C3  C0 D2              ..   CPY #&D2
27C5  A5 18              ..   LDA &18
27C7  C1 CE              ..   CMP (&CE,X)
27C9  D2                 .    ...
27CA  A5 FF              ..   LDA &FF
27CC  CA                 .    DEX
27CD  C9 D1              ..   CMP #&D1
27CF  81 A5              ..   STA (&A5,X)
27D1  E5 97              ..   SBC &97
27D3  7A                 z    ...
27D4  A7                 .    ...
27D5  A5 C3              ..   LDA &C3
27D7  DE D2 12           ...  DEC &12D2,X
27DA  A6 A5              ..   LDX &A5
27DC  D6 D3              ..   DEC &D3,X
27DE  CA                 .    DEX
27DF  D5 C3              ..   CMP &C3,X
27E1  3D A5 15           =..  AND &15A5,X
27E4  C7                 .    ...
27E5  CB                 .    ...
27E6  3D A5 C0           =..  AND &C0A5,X
27E9  D3                 .    ...
27EA  C3                 .    ...
27EB  CA                 .    DEX
27EC  A5 CB              ..   LDA &CB
27EE  1B                 .    ...
27EF  D5 CF              ..   CMP &CF,X
27F1  07                 .    ...
27F2  A5 65              .e   LDA &65
27F4  48                 H    PHA
27F5  A6 C4              ..   LDX &C4
27F7  C7                 .    ...
27F8  DF                 .    ...
27F9  A5 C3              ..   LDA &C3
27FB  A8                 .    TAY
27FC  C5 A8              ..   CMP &A8
27FE  CB                 .    ...
27FF  A8                 .    TAY
2800  23                 #    ...
2801  A5 E0              ..   LDA &E0
2803  E1 D5              ..   SBC (&D5,X)
2805  A5 E0              ..   LDA &E0
2807  EE D5 A5           ...  INC &A5D5
280A  EF                 .    ...
280B  A6 D5              ..   LDX &D5
280D  C5 C9              ..   CMP &C9
280F  C9 D6              ..   CMP #&D6
2811  D5 A5              ..   CMP &A5,X
2813  0F                 .    ...
2814  C5 C7              ..   CMP &C7
2816  D6 C3              ..   DEC &C3,X
2818  A6 D6              ..   LDX &D6
281A  C9 C2              ..   CMP #&C2
281C  A5 FF              ..   LDA &FF
281E  C4 C9              ..   CPY &C9
2820  CB                 .    ...
2821  C4 A5              ..   CPY &A5
2823  FF                 .    ...
2824  28                 (    PLP
2825  A5 C2              ..   LDA &C2
2827  C9 C5              ..   CMP #&C5
2829  CD 0A C1           ...  CMP &C10A
282C  A6 51              .Q   LDX &51
.addr282E
282E  A5 FC              ..   LDA &FC
2830  A6 3B              .;   LDX &3B
2832  A5 CB              ..   LDA &CB
2834  CF                 .    ...
2835  CA                 .    DEX
2836  CF                 .    ...
2837  D2                 .    ...
2838  0C                 .    ...
2839  DF                 .    ...
283A  A6 3D              .=   LDX &3D
283C  A5 CB              ..   LDA &CB
283E  0A                 .    ASL A
283F  0A                 .    ASL A
2840  C1 A6              ..   CMP (&A6,X)
2842  3D A5 43           =.C  AND &43A5,X
2845  BC 86 A5           ...  LDY &A586,X
2848  0A                 .    ASL A
2849  7D 0A C1           }..  ADC &C10A,X
284C  A6 EC              ..   LDX &EC
284E  A5 14              ..   LDA &14
2850  16 C1              ..   ASL &C1,X
2852  DF                 .    ...
2853  A6 A5              ..   LDX &A5
2855  C1 C7              ..   CMP (&C7,X)
2857  13                 .    ...
2858  C5 11              ..   CMP &11
285A  C5 A5              ..   CMP &A5
285C  F5 A6              ..   SBC &A6,X
285E  C9 C8              ..   CMP #&C8
2860  A5 C7              ..   LDA &C7
2862  89                 .    ...
2863  A5 83              ..   LDA &83
2865  07                 .    ...
2866  C1 06              ..   CMP (&06,X)
2868  A6 4D              .M   LDX &4D
286A  17                 .    ...
286B  0E BC A5           ...  ASL &A5BC
286E  7A                 z    ...
286F  A6 82              ..   LDX &82
2871  8A                 .    TXA
.addr2872
2872  8A                 .    TXA
2873  8A                 .    TXA
2874  80                 .    ...
2875  99 A6 23           ..#  STA &23A6,Y
2878  8F                 .    ...
2879  84 8A              ..   STY &8A
287B  3B                 ;    ...
287C  23                 #    ...
287D  8F                 .    ...
287E  85 8A              ..   STA &8A
2880  C5 19              ..   CMP &19
2882  0B                 .    ...
2883  11 19              ..   ORA (&19),Y
2885  8F                 .    ...
2886  A5 CF              ..   LDA &CF
2888  1A                 .    ...
2889  CB                 .    ...
288A  A5 A5              ..   LDA &A5
288C  CA                 .    DEX
288D  CA                 .    DEX
288E  A5 12              ..   LDA &12
2890  11 C8              ..   ORA (&C8),Y
2892  C1 BC              ..   CMP (&BC,X)
2894  A5 A6              ..   LDA &A6
2896  19 A6 A5           ...  ORA &A5A6,Y
2899  8A                 .    TXA
289A  8E 49 CB           .I.  STX &CB49
289D  14                 .    ...
289E  D2                 .    ...
289F  BC 80 A5           ...  LDY &A580,X
28A2  C5 07              ..   CMP &07
28A4  1D A5 C9           ...  ORA &C9A5,X
28A7  C0 C0              ..   CPY #&C0
28A9  14                 .    ...
28AA  C2                 .    ...
28AB  16 A5              ..   ASL &A5,X
28AD  C0 D3              ..   CPY #&D3
28AF  C1 CF              ..   CMP (&CF,X)
28B1  11 10              ..   ORA (&10),Y
28B3  A5 CE              ..   LDA &CE
28B5  0C                 .    ...
28B6  CB                 .    ...
28B7  07                 .    ...
28B8  D5 D5              ..   CMP &D5,X
28BA  A5 CB              ..   LDA &CB
28BC  C9 4D              .M   CMP #&4D
28BE  CA                 .    DEX
28BF  DF                 .    ...
28C0  A6 90              ..   LDX &90
28C2  A5 2A              .*   LDA &2A
28C4  A5 2D              .-   LDA &2D
28C6  A5 C7              ..   LDA &C7
28C8  C4 C9              ..   CPY &C9
28CA  10 A6              ..   BPL &2872
28CC  2D A5 7D           -.}  AND &7DA5
28CF  D6 C3              ..   DEC &C3,X
28D1  D2                 .    ...
28D2  14                 .    ...
28D3  D2                 .    ...
28D4  A5 C2              ..   LDA &C2
28D6  1D 05 78           ..x  ORA &7805,X
.addr28D9
28D9  0E A5 C2           ...  ASL &C2A5
28DC  C3                 .    ...
28DD  C7                 .    ...
28DE  C2                 .    ...
28DF  CA                 .    DEX
28E0  DF                 .    ...
28E1  A5 AB              ..   LDA &AB
28E3  AB                 .    ...
28E4  AB                 .    ...
28E5  AB                 .    ...
28E6  A6 C3              ..   LDX &C3
28E8  A6 CA              ..   LDX &CA
28EA  A6 CF              ..   LDX &CF
28EC  A6 D2              ..   LDX &D2
28EE  A6 C3              ..   LDX &C3
28F0  A6 AB              ..   LDX &AB
.addr28F2
28F2  AB                 .    ...
28F3  AB                 .    ...
28F4  AB                 .    ...
28F5  A5 D6              ..   LDA &D6
28F7  08                 .    PHP
28F8  D5 14              ..   CMP &14,X
28FA  D2                 .    ...
28FB  A5 8E              ..   LDA &8E
28FD  C1 C7              ..   CMP (&C7,X)
28FF  CB                 .    ...
2900  C3                 .    ...
2901  A6 C9              ..   LDX &C9
2903  10 D4              ..   BPL &28D9
2905  A5 A5              ..   LDA &A5
2907  A5 A5              ..   LDA &A5
2909  A5 A5              ..   LDA &A5
290B  A5 BC              ..   LDA &BC
290D  97                 .    ...
290E  EF                 .    ...
290F  C7                 .    ...
2910  DC                 .    ...
2911  2B                 +    ...
2912  07                 .    ...
2913  10 63              .c   BPL &2978
2915  70 47              pG   BVS &295E
2917  48                 H    PHA
2918  50 5E              P^   BVC &2978
291A  5A                 Z    ...
291B  5A                 Z    ...
291C  5A                 Z    ...
291D  5E 50 48           ^PH  LSR &4850,Y
2920  47                 G    ...
2921  70 63              pc   BVS &2986
2923  10 07              ..   BPL &292C
2925  2B                 +    ...
2926  DC                 .    ...
2927  C7                 .    ...
2928  EF                 .    ...
2929  97                 .    ...
292A  BC A5 A4           ...  LDY &A4A5,X
292D  A6 A1              ..   LDX &A1
292F  A0 A3              ..   LDY #&A3
2931  AD AC AF           ...  LDA &AFAC
2934  AE A9 A8           ...  LDX &A8A9
2937  AA                 .    TAX
2938  B5 B4              ..   LDA &B4,X
293A  B7                 .    ...
293B  B6 B1              ..   LDX &B1,Y
293D  B0 B3              ..   BCS &28F2
293F  B2                 .    ...
2940  BD BC BC           ...  LDA &BCBC,X
2943  BF                 .    ...
2944  BE B9 B8           ...  LDX &B8B9,Y
2947  B8                 .    CLV
2948  BB                 .    ...
2949  BA                 .    TSX
294A  BA                 .    TSX
294B  EA                 .    NOP
294C  EA                 .    NOP
294D  EA                 .    NOP
294E  EA                 .    NOP
294F  EA                 .    NOP
2950  EA                 .    NOP
2951  EA                 .    NOP
2952  EA                 .    NOP
2953  EA                 .    NOP
2954  EA                 .    NOP
2955  EA                 .    NOP
2956  EA                 .    NOP
2957  EA                 .    NOP
2958  EA                 .    NOP
2959  EA                 .    NOP
295A  EA                 .    NOP
295B  EA                 .    NOP
295C  EA                 .    NOP
295D  A9 DB              ..   LDA #&DB
295F  85 9F              ..   STA &9F
2961  60                 `    RTS
2962  71 61              qa   ADC (&61),Y
2964  31 21              1!   AND (&21),Y
2966  50 40              P@   BVC &29A8
2968  10 00              ..   BPL &296A
.addr296A
296A  D3                 .    ...
296B  C3                 .    ...
296C  93                 .    ...
296D  83                 .    ...
296E  44                 D    ...
296F  54                 T    ...
2970  14                 .    ...
2971  04                 .    ...
2972  55 45              UE   EOR &45,X
2974  15 05              ..   ORA &05,X
2976  75 65              ue   ADC &65,X
.addr2978
2978  35 25              5%   AND &25,X
297A  D2                 .    ...
297B  C2                 .    ...
297C  92                 .    ...
297D  82                 .    ...
297E  0C                 .    ...
297F  BB                 .    ...
2980  20 2E 28            .(  JSR &282E
2983  E1 5B              .[   SBC (&5B,X)
2985  0C                 .    ...
.addr2986
2986  9C                 .    ...
2987  28                 (    PLP
2988  E0 5B              .[   CPX #&5B
298A  08                 .    PHP
298B  ED A6 75           ..u  SBC &75A6
298E  E7                 .    ...
298F  0C                 .    ...
2990  AD 28 85           .(.  LDA &8528
2993  5B                 [    ...
2994  1C                 .    ...
2995  B5 B4              ..   LDA &B4,X
2997  28                 (    PLP
2998  84 5B              .[   STY &5B
299A  2D B5 52           -.R  AND &52B5
299D  08                 .    PHP
299E  E3                 .    ...
299F  A6 55              .U   LDX &55
29A1  A6 6B              .k   LDX &6B
29A3  E3                 .    ...
29A4  A6 CD              ..   LDX &CD
29A6  0D 08 E4           ...  ORA &E408
29A9  5B                 [    ...
29AA  00                 .    BRK
29AB  59 E5 3D           Y.=  EOR &3DE5,Y
29AE  ED 05 AE           ...  SBC &AE05
29B1  0C                 .    ...
29B2  A7                 .    ...
29B3  89                 .    ...
29B4  E8                 .    INX
29B5  5B                 [    ...
29B6  75 63              uc   ADC &63,X
29B8  F5 B7              ..   SBC &B7,X
29BA  AF                 .    ...
29BB  28                 (    PLP
29BC  85 5B              .[   STA &5B
29BE  08                 .    PHP
29BF  23                 #    ...
29C0  A6 75              .u   LDX &75
29C2  AB                 .    ...
29C3  1C                 .    ...
29C4  A5 B4              ..   LDA &B4
29C6  28                 (    PLP
29C7  84 5B              .[   STY &5B
29C9  2D B5 52           -.R  AND &52B5
29CC  CD 0D C9           ...  CMP &C90D
29CF  5B                 [    ...
29D0  DA                 .    ...
29D1  05 A2              ..   ORA &A2
29D3  1C                 .    ...
29D4  AD B4 28           ..(  LDA &28B4
29D7  84 5B              .[   STY &5B
29D9  2D B5 52           -.R  AND &52B5
29DC  95 4B              .K   STA &4B,X
29DE  9F                 .    ...
29DF  95 8B              ..   STA &8B,X
29E1  E0 8B              ..   CPX #&8B
29E3  EF                 .    ...
29E4  E4 E8              ..   CPX &E8
29E6  E0 F6              ..   CPX #&F6
29E8  EA                 .    NOP
29E9  EB                 .    ...
29EA  A8                 .    TAY
29EB  A5 B1              ..   LDA &B1
29ED  08                 .    PHP
29EE  EF                 .    ...
29EF  FF                 .    ...
29F0  ED A7 F6           ...  SBC &F6A7
29F3  12                 .    ...
29F4  A5 A5              ..   LDA &A5
29F6  A6 4D              .M   LDX &4D
29F8  E3                 .    ...
29F9  A5 A5              ..   LDA &A5
29FB  AA                 .    TAX
29FC  A5 A5              ..   LDA &A5
29FE  A5 A5              ..   LDA &A5
2A00  A5 B3              ..   LDA &B3
2A02  A5 A5              ..   LDA &A5
2A04  A5 A5              ..   LDA &A5
2A06  A5 A5              ..   LDA &A5
2A08  A5 A5              ..   LDA &A5
2A0A  A5 A5              ..   LDA &A5
2A0C  A5 A5              ..   LDA &A5
2A0E  A5 A5              ..   LDA &A5
2A10  A5 A5              ..   LDA &A5
2A12  A5 A5              ..   LDA &A5
2A14  A5 A5              ..   LDA &A5
2A16  A5 A5              ..   LDA &A5
2A18  A5 A5              ..   LDA &A5
2A1A  A5 A5              ..   LDA &A5
2A1C  A5 A5              ..   LDA &A5
2A1E  A6 A5              ..   LDX &A5
2A20  B5 AA              ..   LDA &AA,X
2A22  B4 A5              ..   LDY &A5
2A24  A6 B9              ..   LDX &B9
2A26  AB                 .    ...
2A27  A5 A5              ..   LDA &A5
2A29  AF                 .    ...
2A2A  A5 B4              ..   LDA &B4
2A2C  9F                 .    ...
2A2D  A2 AC              ..   LDX #&AC
2A2F  AD A5 A5           ...  LDA &A5A5
2A32  A5 A5              ..   LDA &A5
2A34  25 0F              %.   AND &0F
2A36  A6 05              ..   LDX &05
2A38  A5 0C              ..   LDA &0C
2A3A  A8                 .    TAY
2A3B  85 4B              .K   STA &4B
2A3D  5A                 Z    ...
2A3E  6D 14 58           m.X  ADC &5814
2A41  75 5D              u]   ADC &5D,X
2A43  55 5B              U[   EOR &5B,X
2A45  C1 FA              ..   CMP (&FA,X)
2A47  C4 D1              ..   CPY &D1
2A49  D1 D7              ..   CMP (&D7),Y
2A4B  CC C7 D0           ...  CPY &D0C7
2A4E  D1 C0              ..   CMP (&C0),Y
2A50  D6 A5              ..   DEC &A5,X
2A52  61 81              a.   ADC (&81,X)
2A54  CF                 .    ...
2A55  E6 C2              ..   INC &C2
2A57  C0 D1              ..   CPY #&D1
2A59  D7                 .    ...
2A5A  C1 CC              ..   CMP (&CC,X)
2A5C  D6 C6              ..   DEC &C6,X
2A5E  A5 13              ..   LDA &13
2A60  99 63 A5           .c.  STA &A563,Y
2A63  A5 A5              ..   LDA &A5
2A65  A5 A5              ..   LDA &A5
2A67  A5 A2              ..   LDA &A2
2A69  9A                 .    TXS
2A6A  A5 A5              ..   LDA &A5
2A6C  A5 A6              ..   LDA &A6
2A6E  BA                 .    TSX
2A6F  5A                 Z    ...
2A70  5A                 Z    ...
2A71  5A                 Z    ...
2A72  A5 AA              ..   LDA &AA
2A74  DA                 .    ...
2A75  5A                 Z    ...
2A76  5A                 Z    ...
2A77  5A                 Z    ...
2A78  5A                 Z    ...
2A79  5A                 Z    ...
2A7A  A5 5A              .Z   LDA &5A
2A7C  5A                 Z    ...
2A7D  5A                 Z    ...
2A7E  5A                 Z    ...
2A7F  45 25              E%   EOR &25
2A81  5A                 Z    ...
2A82  A5 5A              .Z   LDA &5A
2A84  45 A5              E.   EOR &A5
2A86  5A                 Z    ...
2A87  A5 A5              ..   LDA &A5
2A89  5A                 Z    ...
2A8A  A5 5A              .Z   LDA &5A
2A8C  A5 A5              ..   LDA &A5
2A8E  5B                 [    ...
2A8F  A5 A5              ..   LDA &A5
2A91  5B                 [    ...
2A92  A5 5A              .Z   LDA &5A
2A94  A5 A5              ..   LDA &A5
2A96  A5 A5              ..   LDA &A5
2A98  A6 AA              ..   LDX &AA
2A9A  A5 44              .D   LDA &44
2A9C  A2 AA              ..   LDX #&AA
2A9E  9A                 .    TXS
2A9F  5A                 Z    ...
2AA0  5A                 Z    ...
2AA1  5A                 Z    ...
2AA2  A5 5A              .Z   LDA &5A
2AA4  5A                 Z    ...
2AA5  5A                 Z    ...
2AA6  5A                 Z    ...
2AA7  5A                 Z    ...
2AA8  5A                 Z    ...
2AA9  5A                 Z    ...
2AAA  A5 5A              .Z   LDA &5A
2AAC  5B                 [    ...
2AAD  59 55 45           YUE  EOR &4555,Y
2AB0  65 5A              eZ   ADC &5A
2AB2  A5 A5              ..   LDA &A5
2AB4  A5 A5              ..   LDA &A5
2AB6  A5 A5              ..   LDA &A5
2AB8  A5 5A              .Z   LDA &5A
2ABA  A5 A5              ..   LDA &A5
2ABC  A5 A5              ..   LDA &A5
2ABE  A5 A5              ..   LDA &A5
2AC0  A5 5A              .Z   LDA &5A
2AC2  A5 A5              ..   LDA &A5
2AC4  A5 A5              ..   LDA &A5
2AC6  A5 A5              ..   LDA &A5
2AC8  A5 26              .&   LDA &26
2ACA  A5 9A              ..   LDA &9A
2ACC  A5 A5              ..   LDA &A5
2ACE  A5 A5              ..   LDA &A5
2AD0  A5 5A              .Z   LDA &5A
2AD2  A5 5A              .Z   LDA &5A
2AD4  AA                 .    TAX
2AD5  AA                 .    TAX
2AD6  AA                 .    TAX
2AD7  AA                 .    TAX
2AD8  BA                 .    TSX
2AD9  5A                 Z    ...
2ADA  A5 5A              .Z   LDA &5A
2ADC  5A                 Z    ...
2ADD  5A                 Z    ...
2ADE  5A                 Z    ...
2ADF  5A                 Z    ...
2AE0  5A                 Z    ...
2AE1  5A                 Z    ...
2AE2  A5 5A              .Z   LDA &5A
2AE4  59 59 59           YYY  EOR &5959,Y
2AE7  59 5B 5A           Y[Z  EOR &5A5B,Y
2AEA  A5 5A              .Z   LDA &5A
2AEC  A5 A5              ..   LDA &A5
2AEE  A5 A5              ..   LDA &A5
2AF0  A5 5A              .Z   LDA &5A
2AF2  A5 22              ."   LDA &22
2AF4  A5 A5              ..   LDA &A5
2AF6  A5 A5              ..   LDA &A5
2AF8  A5 45              .E   LDA &45
2AFA  A5 5A              .Z   LDA &5A
2AFC  A5 A5              ..   LDA &A5
2AFE  A5 A5              ..   LDA &A5
2B00  A5 A5              ..   LDA &A5
2B02  A5 5A              .Z   LDA &5A
2B04  DA                 .    ...
2B05  DA                 .    ...
2B06  9A                 .    TXS
2B07  BA                 .    TSX
2B08  AA                 .    TAX
2B09  A2 A5              ..   LDX #&A5
2B0B  5A                 Z    ...
2B0C  5A                 Z    ...
2B0D  5A                 Z    ...
2B0E  5A                 Z    ...
2B0F  5A                 Z    ...
2B10  5A                 Z    ...
2B11  5A                 Z    ...
2B12  A5 5A              .Z   LDA &5A
2B14  65 45              eE   ADC &45
2B16  5D 59 5B           ]Y[  EOR &5B59,X
2B19  5A                 Z    ...
2B1A  A5 45              .E   LDA &45
2B1C  A5 A5              ..   LDA &A5
2B1E  A5 A5              ..   LDA &A5
2B20  A5 25              .%   LDA &25
2B22  A5 5A              .Z   LDA &5A
2B24  9A                 .    TXS
2B25  BA                 .    TSX
2B26  A2 A4              ..   LDX #&A4
2B28  A5 A5              ..   LDA &A5
2B2A  A5 5A              .Z   LDA &5A
2B2C  5A                 Z    ...
2B2D  5A                 Z    ...
2B2E  5A                 Z    ...
2B2F  5A                 Z    ...
2B30  DA                 .    ...
2B31  BA                 .    TSX
2B32  A5 5A              .Z   LDA &5A
2B34  45 5D              E]   EOR &5D
2B36  5A                 Z    ...
2B37  5A                 Z    ...
2B38  5A                 Z    ...
2B39  5A                 Z    ...
2B3A  A5 5A              .Z   LDA &5A
2B3C  A5 A5              ..   LDA &A5
2B3E  5A                 Z    ...
2B3F  65 55              eU   ADC &55
2B41  5A                 Z    ...
2B42  A5 59              .Y   LDA &59
2B44  A5 A5              ..   LDA &A5
2B46  5A                 Z    ...
2B47  A5 A5              ..   LDA &A5
2B49  5A                 Z    ...
2B4A  A5 A5              ..   LDA &A5
2B4C  A5 A5              ..   LDA &A5
2B4E  25 A5              %.   AND &A5
2B50  A5 5A              .Z   LDA &5A
2B52  A5 A5              ..   LDA &A5
2B54  A5 A5              ..   LDA &A5
2B56  A5 A5              ..   LDA &A5
2B58  A5 5B              .[   LDA &5B
2B5A  A5 A5              ..   LDA &A5
2B5C  A5 A5              ..   LDA &A5
2B5E  A5 A5              ..   LDA &A5
2B60  A5 A5              ..   LDA &A5
2B62  A5 A5              ..   LDA &A5
2B64  A5 A5              ..   LDA &A5
2B66  A5 A5              ..   LDA &A5
2B68  A5 A5              ..   LDA &A5
2B6A  A5 A5              ..   LDA &A5
2B6C  A5 A5              ..   LDA &A5
2B6E  A5 A5              ..   LDA &A5
2B70  A5 A5              ..   LDA &A5
2B72  A5 A5              ..   LDA &A5
2B74  A5 A5              ..   LDA &A5
2B76  A5 A5              ..   LDA &A5
2B78  A5 A5              ..   LDA &A5
2B7A  A5 A5              ..   LDA &A5
2B7C  A5 A5              ..   LDA &A5
2B7E  A5 A5              ..   LDA &A5
2B80  A5 A5              ..   LDA &A5
2B82  A5 A5              ..   LDA &A5
2B84  A5 A5              ..   LDA &A5
2B86  A5 A5              ..   LDA &A5
2B88  A5 A5              ..   LDA &A5
2B8A  A5 A5              ..   LDA &A5
2B8C  A5 A5              ..   LDA &A5
2B8E  A5 A5              ..   LDA &A5
2B90  A5 A2              ..   LDA &A2
2B92  A5 A5              ..   LDA &A5
2B94  A5 A5              ..   LDA &A5
2B96  A6 BA              ..   LDX &BA
2B98  5D 66 A5           ]f.  EOR &A566,X
2B9B  A5 AA              ..   LDA &AA
2B9D  D9 5A AA           .Z.  CMP &AA5A,Y
2BA0  D9 55 A5           .U.  CMP &A555,Y
2BA3  9A                 .    TXS
2BA4  2A                 *    ROL A
2BA5  D9 54 2A           .T*  CMP &2A54,Y
2BA8  9A                 .    TXS
2BA9  9A                 .    TXS
2BAA  A5 65              .e   LDA &65
2BAC  2A                 *    ROL A
2BAD  D9 55 65           .Ue  CMP &6555,Y
2BB0  BA                 .    TSX
2BB1  55 A5              U.   EOR &A5,X
2BB3  5A                 Z    ...
2BB4  3A                 :    ...
2BB5  A5 A5              ..   LDA &A5
2BB7  A6 2A              .*   LDX &2A
2BB9  A2 A5              ..   LDX #&A5
2BBB  A4 BA              ..   LDY &BA
2BBD  D9 5D 44           .]D  CMP &445D,Y
2BC0  62                 b    ...
2BC1  5B                 [    ...
2BC2  A5 5B              .[   LDA &5B
2BC4  BA                 .    TSX
2BC5  D9 5D 54           .]T  CMP &545D,Y
2BC8  46 A2              F.   LSR &A2
2BCA  A5 BA              ..   LDA &BA
2BCC  9B                 .    ...
2BCD  D9 5A 5E           .Z^  CMP &5E5A,Y
2BD0  55 44              UD   EOR &44,X
2BD2  A5 59              .Y   LDA &59
2BD4  9B                 .    ...
2BD5  D9 55 45           .UE  CMP &4555,Y
2BD8  5D 5D A5           ]].  EOR &A55D,X
2BDB  9B                 .    ...
2BDC  9B                 .    ...
2BDD  DA                 .    ...
2BDE  DA                 .    ...
2BDF  D9 D9 59           ..Y  CMP &59D9,Y
2BE2  A5 D9              ..   LDA &D9
2BE4  D9 1B 5B           ..[  CMP &5B1B,Y
2BE7  5B                 [    ...
2BE8  9B                 .    ...
2BE9  9A                 .    TXS
2BEA  A5 9A              ..   LDA &9A
2BEC  D9 9B AA           ...  CMP &AA9B,Y
2BEF  A5 BA              ..   LDA &BA
2BF1  A6 A5              ..   LDX &A5
2BF3  45 D9              E.   EOR &D9
2BF5  A5 5D              .]   LDA &5D
2BF7  BA                 .    TSX
2BF8  AA                 .    TAX
2BF9  5A                 Z    ...
2BFA  A5 DA              ..   LDA &DA
2BFC  5D 9B BA           ]..  EOR &BA9B,X
2BFF  2A                 *    ROL A
2C00  62                 b    ...
2C01  A5 A5              ..   LDA &A5
2C03  26 5D              &]   ROL &5D
2C05  9B                 .    ...
2C06  BA                 .    TSX
2C07  22                 "    ...
2C08  46 DA              F.   LSR &DA
2C0A  A5 5A              .Z   LDA &5A
2C0C  5D 9B AA           ]..  EOR &AA9B,X
2C0F  62                 b    ...
2C10  54                 T    ...
2C11  45 A5              E.   EOR &A5
2C13  6A                 j    ROR A
2C14  A5 A5              ..   LDA &A5
2C16  5B                 [    ...
2C17  45 5D              E]   EOR &5D
2C19  DB                 .    ...
2C1A  A5 5A              .Z   LDA &5A
2C1C  BA                 .    TSX
2C1D  A6 A5              ..   LDX &A5
2C1F  A5 A5              ..   LDA &A5
2C21  A5 A5              ..   LDA &A5
2C23  A5 A5              ..   LDA &A5
2C25  45 D9              E.   EOR &D9
2C27  BA                 .    TSX
2C28  A6 A5              ..   LDX &A5
2C2A  A5 A5              ..   LDA &A5
2C2C  A5 A5              ..   LDA &A5
2C2E  A5 25              .%   LDA &25
2C30  55 DB              U.   EOR &DB,X
2C32  A5 A5              ..   LDA &A5
2C34  A5 A5              ..   LDA &A5
2C36  A5 A5              ..   LDA &A5
2C38  A5 A5              ..   LDA &A5
2C3A  A5 A5              ..   LDA &A5
2C3C  A5 A5              ..   LDA &A5
2C3E  A5 A5              ..   LDA &A5
2C40  A5 A5              ..   LDA &A5
2C42  A5 A5              ..   LDA &A5
2C44  A5 A5              ..   LDA &A5
2C46  A5 A5              ..   LDA &A5
2C48  A5 A5              ..   LDA &A5
2C4A  A5 A5              ..   LDA &A5
2C4C  A5 A5              ..   LDA &A5
2C4E  A5 A5              ..   LDA &A5
2C50  A5 A5              ..   LDA &A5
2C52  A5 A5              ..   LDA &A5
2C54  A5 A5              ..   LDA &A5
2C56  A5 A5              ..   LDA &A5
2C58  A5 A5              ..   LDA &A5
2C5A  A5 A5              ..   LDA &A5
2C5C  A5 A5              ..   LDA &A5
2C5E  A5 A5              ..   LDA &A5
2C60  A5 A5              ..   LDA &A5
2C62  A5 A5              ..   LDA &A5
2C64  A5 A5              ..   LDA &A5
2C66  A5 A5              ..   LDA &A5
2C68  A5 A5              ..   LDA &A5
2C6A  A5 A5              ..   LDA &A5
2C6C  A5 A5              ..   LDA &A5
2C6E  A5 A5              ..   LDA &A5
2C70  A5 A5              ..   LDA &A5
2C72  A5 A5              ..   LDA &A5
2C74  A5 A5              ..   LDA &A5
2C76  A5 A5              ..   LDA &A5
2C78  A5 A5              ..   LDA &A5
2C7A  A5 A5              ..   LDA &A5
2C7C  A5 A5              ..   LDA &A5
2C7E  A5 A5              ..   LDA &A5
2C80  A5 A5              ..   LDA &A5
2C82  A5 A5              ..   LDA &A5
2C84  A5 A5              ..   LDA &A5
2C86  A5 A4              ..   LDA &A4
2C88  A6 A2              ..   LDX &A2
2C8A  A5 A5              ..   LDA &A5
2C8C  A4 AB              ..   LDY &AB
2C8E  9D 45 66           .Ef  STA &6645,X
2C91  22                 "    ...
2C92  A5 9D              ..   LDA &9D
2C94  66 AB              f.   ROR &AB
2C96  9D 45 39           .E9  STA &3945,X
2C99  44                 D    ...
2C9A  A5 D9              ..   LDA &D9
2C9C  1D A5 A6           ...  ORA &A6A5,X
2C9F  A2 9D              ..   LDX #&9D
2CA1  65 A5              e.   ADC &A5
2CA3  D5 D5              ..   CMP &D5,X
2CA5  45 65              Ee   EOR &65
2CA7  A5 A5              ..   LDA &A5
2CA9  A5 A5              ..   LDA &A5
2CAB  A5 A5              ..   LDA &A5
2CAD  A4 A6              ..   LDY &A6
2CAF  AA                 .    TAX
2CB0  B9 9C A5           ...  LDA &A59C,Y
2CB3  9A                 .    TXS
2CB4  42                 B    ...
2CB5  7B                 {    ...
2CB6  58                 X    CLI
2CB7  D6 42              .B   DEC &42,X
2CB9  62                 b    ...
2CBA  A5 A5              ..   LDA &A5
2CBC  A5 DB              ..   LDA &DB
2CBE  6B                 k    ...
2CBF  24 9C              $.   BIT &9C
2CC1  44                 D    ...
2CC2  A5 A5              ..   LDA &A5
2CC4  A5 9A              ..   LDA &9A
2CC6  42                 B    ...
2CC7  4B                 K    ...
2CC8  7B                 {    ...
2CC9  5D A5 A5           ]..  EOR &A5A5,X
2CCC  A5 9A              ..   LDA &9A
2CCE  DA                 .    ...
2CCF  D5 55              .U   CMP &55,X
2CD1  45 A5              E.   EOR &A5
2CD3  A5 A5              ..   LDA &A5
2CD5  3A                 :    ...
2CD6  38                 8    SEC
2CD7  98                 .    TYA
2CD8  98                 .    TYA
2CD9  9C                 .    ...
2CDA  A5 A5              ..   LDA &A5
2CDC  A5 62              .b   LDA &62
2CDE  4B                 K    ...
2CDF  42                 B    ...
2CE0  65 6A              ej   ADC &6A
2CE2  A5 A5              ..   LDA &A5
2CE4  A5 56              .V   LDA &56
2CE6  A2 42              .B   LDX #&42
2CE8  D6 44              .D   DEC &44,X
2CEA  A5 A5              ..   LDA &A5
2CEC  A4 54              .T   LDY &54
2CEE  1C                 .    ...
2CEF  19 19 5D           ..]  ORA &5D19,Y
2CF2  A5 54              .T   LDA &54
2CF4  65 44              eD   ADC &44
2CF6  5D 55 D5           ]U.  EOR &D555,X
2CF9  DD A5 65           ..e  CMP &65A5,X
2CFC  45 59              EY   EOR &59
2CFE  D5 9D              ..   CMP &9D,X
2D00  99 AA A5           ...  STA &A5AA,Y
2D03  A5 A5              ..   LDA &A5
2D05  A5 A5              ..   LDA &A5
2D07  A5 A5              ..   LDA &A5
2D09  25 A5              %.   AND &A5
2D0B  D5 D9              ..   CMP &D9,X
2D0D  AB                 .    ...
2D0E  A2 A6              ..   LDX #&A6
2D10  A4 A6              ..   LDY &A6
2D12  A5 D9              ..   LDA &D9
2D14  D2                 .    ...
2D15  98                 .    TYA
2D16  A2 25              .%   LDX #&25
2D18  45 59              EY   EOR &59
2D1A  A5 DB              ..   LDA &DB
2D1C  1E 7B 56           .{V  ASL &567B,Y
2D1F  9C                 .    ...
2D20  99 D9 A5           ...  STA &A5D9,Y
2D23  AB                 .    ...
2D24  22                 "    ...
2D25  46 56              FV   LSR &56
2D27  7B                 {    ...
2D28  52                 R    ...
2D29  BA                 .    TSX
2D2A  A5 A5              ..   LDA &A5
2D2C  25 45              %E   AND &45
2D2E  5D 5A 26           ]Z&  EOR &265A,X
2D31  25 A5              %.   AND &A5
2D33  A5 A5              ..   LDA &A5
2D35  A5 A5              ..   LDA &A5
2D37  A5 25              .%   LDA &25
2D39  45 A5              E.   EOR &A5
2D3B  A5 A5              ..   LDA &A5
2D3D  A5 A5              ..   LDA &A5
2D3F  A5 A5              ..   LDA &A5
2D41  A5 A5              ..   LDA &A5
2D43  A5 A5              ..   LDA &A5
2D45  A5 A5              ..   LDA &A5
2D47  A5 A5              ..   LDA &A5
2D49  A5 A5              ..   LDA &A5
2D4B  A5 A5              ..   LDA &A5
2D4D  A5 A5              ..   LDA &A5
2D4F  A5 A5              ..   LDA &A5
2D51  A5 A5              ..   LDA &A5
2D53  A5 A5              ..   LDA &A5
2D55  A5 A5              ..   LDA &A5
2D57  A5 A5              ..   LDA &A5
2D59  A5 A5              ..   LDA &A5
2D5B  A5 A5              ..   LDA &A5
2D5D  A5 A5              ..   LDA &A5
2D5F  A5 A5              ..   LDA &A5
2D61  A5 55              .U   LDA &55
2D63  A5 A5              ..   LDA &A5
2D65  A5 A5              ..   LDA &A5
2D67  A5 A5              ..   LDA &A5
2D69  A5 55              .U   LDA &55
2D6B  A5 A5              ..   LDA &A5
2D6D  A5 A5              ..   LDA &A5
2D6F  A5 A5              ..   LDA &A5
2D71  A5 55              .U   LDA &55
2D73  A5 A5              ..   LDA &A5
2D75  A5 A5              ..   LDA &A5
2D77  A5 A5              ..   LDA &A5
2D79  A5 55              .U   LDA &55
2D7B  25 25              %%   AND &25
2D7D  25 25              %%   AND &25
2D7F  65 01              e.   ADC &01
2D81  33                 3    ...
2D82  55 A5              U.   EOR &A5,X
2D84  A5 A5              ..   LDA &A5
2D86  A5 A5              ..   LDA &A5
2D88  A5 A5              ..   LDA &A5
2D8A  55 A5              U.   EOR &A5,X
2D8C  A5 A5              ..   LDA &A5
2D8E  A5 A5              ..   LDA &A5
2D90  A5 A5              ..   LDA &A5
2D92  55 A5              U.   EOR &A5,X
2D94  A5 A5              ..   LDA &A5
2D96  A5 A5              ..   LDA &A5
2D98  A5 A5              ..   LDA &A5
2D9A  55 A5              U.   EOR &A5,X
2D9C  A5 A5              ..   LDA &A5
2D9E  A5 A5              ..   LDA &A5
2DA0  A5 A5              ..   LDA &A5
2DA2  55 A5              U.   EOR &A5,X
2DA4  A5 A5              ..   LDA &A5
2DA6  A5 A5              ..   LDA &A5
2DA8  A5 A5              ..   LDA &A5
2DAA  55 A5              U.   EOR &A5,X
2DAC  A5 A5              ..   LDA &A5
2DAE  A5 A5              ..   LDA &A5
2DB0  A5 A5              ..   LDA &A5
2DB2  55 A5              U.   EOR &A5,X
2DB4  96 87              ..   STX &87,Y
2DB6  96 87              ..   STX &87,Y
2DB8  96 A5              ..   STX &A5,Y
2DBA  55 A5              U.   EOR &A5,X
2DBC  0F                 .    ...
2DBD  87                 .    ...
2DBE  87                 .    ...
2DBF  87                 .    ...
2DC0  1E A5 55           ..U  ASL &55A5,Y
2DC3  A5 87              ..   LDA &87
2DC5  87                 .    ...
2DC6  87                 .    ...
2DC7  87                 .    ...
2DC8  0F                 .    ...
2DC9  A5 55              .U   LDA &55
2DCB  A5 4B              .K   LDA &4B
2DCD  E1 E1              ..   SBC (&E1,X)
2DCF  E1 E1              ..   SBC (&E1,X)
2DD1  A5 55              .U   LDA &55
2DD3  A5 4B              .K   LDA &4B
2DD5  2D 69 2D           -i-  AND &2D69
2DD8  4B                 K    ...
2DD9  A5 55              .U   LDA &55
2DDB  A5 A5              ..   LDA &A5
2DDD  A5 A5              ..   LDA &A5
2DDF  A5 A5              ..   LDA &A5
2DE1  A5 55              .U   LDA &55
2DE3  A5 A5              ..   LDA &A5
2DE5  A5 A5              ..   LDA &A5
2DE7  A5 A5              ..   LDA &A5
2DE9  A5 55              .U   LDA &55
2DEB  A5 A5              ..   LDA &A5
2DED  A5 A5              ..   LDA &A5
2DEF  A5 A5              ..   LDA &A5
2DF1  A5 55              .U   LDA &55
2DF3  A5 A5              ..   LDA &A5
2DF5  A5 A5              ..   LDA &A5
2DF7  A5 A5              ..   LDA &A5
2DF9  A5 55              .U   LDA &55
2DFB  A5 A5              ..   LDA &A5
2DFD  A5 A5              ..   LDA &A5
2DFF  A5 00              ..   LDA &00
.end

SAVE "$.Elite3", start, end, startcode
