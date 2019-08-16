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

.img_scanner
	INCBIN "data/scanner.bin"

.bin_0400code
	INCBIN "data/Elite3-0400code.bin"

.bin_unknown
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
2A60  99 63              .c.  EQUB &99, &63

.img_logo_elite
	INCBIN "data/elite.img

.img_logo_acornsoft
	INCBIN "data/acornsoft.img"

.img_logo_copyright
	INCBIN "data/copyright.img

2D62  A5                 .    EQUB &A5
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
