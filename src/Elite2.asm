; ------------------------------------------------------------------------------
; $.Elite2
; ------------------------------------------------------------------------------

machinetype = &70

bytev  = &020A

osnewl = &FFE7
oswrch = &FFEE
osbyte = &FFF4
oscli  = &FFF7

ORG &1900

; ------------------------------------------------------------------------------
; Start of code
; ------------------------------------------------------------------------------
.start
	BIT bytev+1                  ; OSBYTE indirect vector MSB
.osbyte_lockloop
	BPL osbyte_lockloop
	LDA #&00
	LDX #&01
	JSR osbyte                   ; *FX 0, 1
	LDY #&00
	SEI
	CPX #&01
	BEQ os120                    ; Jump on OS1.20
.os100loop
	LDA &D941,Y
	STA &0200,Y                  ; Re-initialize the vector table
	INY
	CPY #&36
	BNE os100loop
	BEQ start2
.os120
	LDA &FFB7                    ; Default vector table LSB
	STA &01
	LDA &FFB8                    ; Default vector table MSB
	STA &02
.os120loop
	LDA (&01),Y
	STA &0200,Y                  ; Re-initialize the vector table
	INY
	CPY &FFB6                    ; Length of default vector table
	BNE os120loop
.start2
	CLI
	LDX #&E0
	LDY #&19
	JSR oscli                    ; *Disc
	LDA #&C9
	LDX #&01
	LDY #&00
	JSR osbyte                   ; *FX 201, 1, 0: Disable keyboard
	LDA #&C8
	LDX #&00
	LDY #&00
	JSR osbyte                   ; *FX 200, 0, 0: Normal ESCAPE and BREAK effect
	LDA #&77
	JSR osbyte                   ; *FX 77: Close any *SPOOL or *EXEC files
	LDY #&00
.initscreen
	LDA vdutable,Y               ; MODE7:VDU 23,
	JSR oswrch
	INY
	CPY #&0C
	BNE initscreen
	LDA #&00                     ; Check amount of available RAM
	STA &3FFF
	LDA #&40
	STA &7FFF
	EOR &3FFF
	CLC
	ADC #&40
	PHA
	TAX                          ; X=&40 for 16K, &80 for 32K
	LDA #&FE
	LDY #&00
	JSR osbyte                   ; *FX 254, x, 0 (Write available RAM)
	PLA
	AND memcheck_flag
.memcheck_lockloop
	BEQ memcheck_lockloop        ; Loop indefenitely if there's not enough memory available
	JSR loadscreen
	LDA #&AC
	LDX #&00
	LDY #&FF
	JSR osbyte                   ; Read address of keyboard translation table
	STX &04
	STY &05
	LDA #&EA
	LDX #&00
	LDY #&FF
	JSR osbyte                   ; Read TUBE presence flag
	CPX #&FF
.tube_lockloop
	BEQ tube_lockloop
	LDY #&00
.move_nextstage
	LDA nextstage_src,Y
	STA nextstage,Y
	INY
	CPY #&53
	BNE move_nextstage
	JMP nextstage

.vdutable
	EQUB &16, &07                 ; MODE 7
	EQUB &17, &00, &0A, &20, &00, &00, &00, &00, &00, &00 ; Cursor off
.str_disk
	EQUS "Disc", &0D
.str_build
	EQUS "Build ", TIME$("%F"), &EA

.memcheck_flag
	EQUB &80                 ; Memory flag: memory size must be 32K (&80) for this version of Elite

; ------------------------------------------------------------------------------
; Print the load screen
; ------------------------------------------------------------------------------
.loadscreen
	LDX #&00
	STX machinetype                  ; &00: Machine type is BBC
	LDY #&FF
	LDA #&81
	JSR osbyte                       ; Read machine type
	CPX #&01                         ; Is it an Acorn Electron?
	BNE loadscreen2                  ; No? Then jump
	DEC machinetype                  ; &FF: Machine type is Electron
	LDA #character_map MOD 256
	STA &70
	LDA #character_map DIV 256
	STA &71
	LDY #&00
.redefine_chars
	LDX #&07
	LDA #&17                         ; VDU 23, 224, 
	JSR oswrch                       ; Redefine character
	TYA
	LSR A
	LSR A
	LSR A
	ORA #224
	JSR oswrch
.redefine_chars2
	LDA (&71),Y
	JSR oswrch
	INY
	DEX
	BPL redefine_chars2
	CPY #&E0
	BNE redefine_chars
.loadscreen2
	JSR printchars

	EQUB &16, &07                    ; MODE 7
	EQUB &17, &00, &0A, &20, &00, &00, &00, &00, &00, &00   ; Cursor off
	NOP

	LDA #&91                         ; Teletext graphics coulor red
	STA &76
	JSR print_logos                  ; Print Acornsoft logo's
	BIT machinetype 
	BMI elite_elk
	JSR printchars

	EQUB &1C, &0D, &0D, &19, &0A     ; Text window 0D, 0D, 19, 0A
	EQUB &0C                         ; Clear screen
	EQUB &0A                         ; Linefeed
	EQUB &87                         ; Text colour is white
	EQUB &8D                         ; Double height
	EQUS "E L I T E"
	EQUB &8C                         ; Normal height
	EQUB &92                         ; Teletext graphics color green
	EQUB &87                         ; Text colour is white
	EQUB &8D                         ; Double height
	EQUS "E L I T E"
	NOP

	RTS

.elite_elk
	JSR printchars

	EQUB &1C, &0D, &0C, &19, &0A     ; Text window 0D, 0C, 19, 0A
	EQUB &0C                         ; Clear screen
	EQUB &1A                         ; Restore default window
	EQUB &1F, &0F, &0B               ; Move text cursor to 15, 12
	EQUS "E L I T E"
	NOP
	RTS

; ------------------------------------------------------------------------------
; Print the quadruple Acornsoft logo screen
; ------------------------------------------------------------------------------
.print_logos
	LDA #acornsoft_logo MOD 256
	STA &70
	LDA #acornsoft_logo DIV 256
	STA &71
	JSR print_logos1
	JSR osnewl
	JSR osnewl
.print_logos1
	JSR print_logos2
	JSR osnewl
.print_logos2
	LDY #&1C               ; 255 - 228 (5 lines of 40 characters)
.addr0174
	LDX #&26               ; 38 characters to print per line
	BIT machinetype 
	BMI &1D67              ; Skip teletext characters when machinetype is Electron
	LDA &76                ; Teletext graphics colour
	JSR oswrch
	LDA #&9A               ; Separated graphics
	JSR oswrch
	CLC
	BCC &1D6C              ; Skip next instructions when machinetype is BBC
.addr0187
	LDA #&20
	JSR oswrch
.addr018C
	LDA (&71),Y
	BIT machinetype 
	BMI addr019B           ; Skip when machinetype is Electron
	STY &73
	TAY
	LDA (&71),Y
	LDY &73
	BNE addr019D           ; Skip next instruction when machinetype is BBC
.addr019B
	ORA #&E0               ; Use characters 224-255 for Electron
.addr019D
	JSR oswrch
	INY
	CPY #&FF
	BEQ print_logos_exit
	DEX
	BNE &1D6C
	BIT machinetype 
	BPL &1D91
	LDA #&20
	JSR oswrch
.addr01b1
	CLC
	BCC &1D54              ; Always jump back to loop
.print_logos_exit
	INC &76                ; Increase teletext graphics colour
	RTS

; ------------------------------------------------------------------------------
; Print characters
; ------------------------------------------------------------------------------
.printchars
	PLA
	STA &74
	PLA
	STA &75
.printchars1
	INC &74
	BNE &1DA3
	INC &75
.printchars2
	LDY #&00
	LDA (&74),Y
	CMP #&EA
	BEQ &1DB1
	JSR oswrch
	CLC
	BCC &1D9D
.printchars3
	JMP (&0074)

; ------------------------------------------------------------------------------
; Acornsoft logo in teletext graphics
; ------------------------------------------------------------------------------
.acornsoft_logo
	EQUB &91, &9A, &A0, &A0, &A0, &FC, &B4, &E0, &FC, &FC, &B0, &A0, &F8, &FC, &F4, &A0, &FC, &FC, &FC, &B0, &E8, &F4, &A0, &E8, &B4, &F8, &FC, &FC, &B0, &A0, &FE, &FF, &B4, &A0, &FC, &FC, &FC, &FC, &FC, &FC,
	EQUB &91, 9A, A0, A0, FA, FF, B5, FF, A7, AB, FF, EA, BF, A3, EF, B5, FF, A3, EB, B5, EA, FF, B4, EA, B5, FF, B1, AB, A5, EA, FF, FF, FF, A0, FF, A3, A3, A3, FF, A3, 91, 9A, A0, E8, BF, EB, B5, FF, A0, A0 A0 EA B5 A0 EA B5          
 6C60  FF FC FE A5 EA BF FF FA          
 6C68  B5 AB FF FD B0 FF FF FF          
 6C70  FF B5 FF FF FF A0 FF A0          
 
 6C78  91 9A E0 FF FD FE B5 FF
 6C80  B0 E0 FC EA F5 A0 FA B5
 6C88  FF AB FD A0 EA B5 EB FF
 6C90  B5 F0 A0 EB FF F3 F3 F3
 6C98  F3 B1 FF A0 A0 A0 FF A0
 
 6CA0  91 9A FE B7 A0 EA B5 AB
 6CA8  FF FF A7 A2 EF FF BF A1
 6CB0  FF A0 EB F5 EA B5 A0 EF
 6CB8  B5 EF FF FF A5 EF FF FF
 6CC0  FF A5 FF A0 A0 A0 FF A0
 
 6CC8  91 9A A0 A0 A0 A0 A0 A0
 6CD0  A0 A0 A0 A0 A0 A0 A0 A0
 6CD8  A0 A0 A0 A0 A0 A0 A0 A0
 6CE0  A0 A0 A0 A0 A0 A0 A2 A3
 6CE8  A0 A0 A0 A0 A0 A0 A0 20
 6CF0  92 9A A0 A0 A0 FC B4 E0
 6CF8  FC FC B0 A0 F8 FC F4 A0

; ------------------------------------------------------------------------------
; Character definitions for Acornsoft logo for Electron
; ------------------------------------------------------------------------------
.character_map

; ------------------------------------------------------------------------------
; Next stage loader ($.Elite3)
; ------------------------------------------------------------------------------

.nextstage_src

ORG &0400

.nextstage
	LDX #str_load_elite3 MOD 256 ; *Load Elite3
	LDY #str_load_elite3 DIV 256
	JSR oscli
	LDX disk_flag                ; Drive number? (= 2 for double sided 40 track disk?)
	BEQ nextstage2
	LDX #str_drive2 MOD 256
	LDY #str_drive2 DIV 256
	JSR oscli                    ; *Drive 2
	LDX #&02
.nextstage2
	STX &76
	LDA #&15
	LDX #&00
	JSR osbyte                   ; Flush keyboard buffer
	LDA #&C9
	LDX #&01
	LDY #&01
	JSR osbyte                   ; Disable keyboard
	JMP &197B

.str_load_elite3
	EQUS "Load Elite3", &0D
.str_drive2
	EQUS "Drive 2", &0D
.disk_flag
	EQUB &00                 ; Disc flag: &00=80 tracks single sided, other=40 tracks double sided

.end

SAVE "$.Elite2", start, end
