; -----------------------------------------------------------------------------
; Elite - Docked code
; written by David Braben and Ian Bell (c) Acornsoft 1984
; Filename       : T.Code
; Load address   : 000011E3
; Exec address   : 000011E3
; Length         : 00004E1D
; -----------------------------------------------------------------------------

screen                   = &07                    ; Pointer to screen memory
screen_lo                = &07                    ; Pointer to screen memory LSB
screen_hi                = &08                    ; Pointer to screen memory MSB

crtc_register            = &FE00
crtc_data                = &FE01
systemvia_irb            = &FE40
systemvia_ier            = &FE4E

osfile                   = &FFDD
oswrch                   = &FFEE
osword                   = &FFF1
osbyte                   = &FFF4
oscli                    = &FFF7



ORG &11E3

.start
.startcode
	JMP &121B
.coldstart
	JMP &11FB
.wrchv
	JMP &1D56

.addr11EC
	EQUW &114B

.brkv
	JMP addr11D5

.addr11EF
	EQUW &11D5

.addr11F1
	LDX #&00
	LDY #&00
	JSR &8888
	JMP &129D
.addr11FB
	JSR &1201
	JMP &3875

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.decscramble
	LDY #&00
	STY screen_lo
	LDX #&13
.descramble1
	STX screen_hi
	TYA
	EOR (screen),Y
	EOR #&33
	STA (screen),Y
	DEY
	BNE &1207
	INX
	CPX #&60
	BNE descramble1
	JMP &12A6

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr121B
	JSR descramble
	JSR &3697
	JSR &215B
	JSR &1FBD
	LDY #&2C
	JSR &259C
	LDA &0358
	AND #&03
	BNE &1241
	LDA &03A0
	BEQ &129A
	LDA &0367
	LSR A
	BNE &129A
	JMP &2478
.addr1241
	CMP #&03
	BNE &1248
	JMP &2464
.addr1248
	LDA &0358
	AND #&0F
	CMP #&02
.addr124F
	BNE &1262
	LDA &03A0
	CMP #&05
	BCC &129A
	LDA &0367
	CMP #&02
	BNE &129A
	JMP &2432
.addr1262
	CMP #&06
	BNE &127E
	LDA &0367
	CMP #&02
	BNE &129A
	LDA &0359
	CMP #&D7
	BNE &129A
	LDA &035A
	CMP #&54
	BNE &129A
	JMP &2442
.addr127E
	CMP #&0A
	BNE &129A
	LDA &0367
	CMP #&02
	BNE &129A
	LDA &0359
	CMP #&3F
	BNE &129A
	LDA &035A
	CMP #&48
	BNE &129A
	JMP &2450
.addr129A
	JMP &38B0
.addr129D
	JSR descramble
	JSR &3697
	JMP &3882
.addr12A6
	LDA #&6D
	STA &11EF
	LDA #&38
	STA &11F0
	RTS
	LDA #&D9
	BIT &DCA9
	CLC
	ADC &0367
	BNE &12CE
.addr12BC
	PHA
	TAX
	TYA
	PHA
	LDA &22
	PHA
	LDA &23
	PHA
	LDA #&6B
	STA &22
	LDA #&53
	BNE &12DE
.addr12CE
	PHA
	TAX
	TYA
	PHA
	LDA &22
	PHA
	LDA &23
	PHA
	LDA #&1B
	STA &22
	LDA #&48
.addr12DE
	STA &23
	LDY #&00
.addr12E2
	LDA (&22),Y
	EOR #&57
	BNE &12EB
	DEX
	BEQ &12F2
.addr12EB
	INY
	BNE &12E2
	INC &23
	BNE &12E2
.addr12F2
	INY
	BNE &12F7
	INC &23
.addr12F7
	LDA (&22),Y
	EOR #&57
	BEQ &1303
	JSR &130D
	JMP &12F2
.addr1303
	PLA
	STA &23
	PLA
	STA &22
	PLA
	TAY
	PLA
	RTS
.addr130D
	CMP #&20
	BCC &1359
	BIT &1C85
	BPL &1326
	TAX
	TYA
	PHA
	LDA &22
	PHA
	LDA &23
	PHA
	TXA
	JSR &31AC
	JMP &1376
.addr1326
	CMP #&5B
	BCC &1342
	CMP #&81
	BCC &137F
	CMP #&D7
	BCC &12CE
	SBC #&D7
	ASL A
	PHA
	TAX
	LDA &1487,X
	JSR &1342
	PLA
	TAX
	LDA &1488,X
.addr1342
	CMP #&41
	BCC &1356
	BIT &1C88
	BMI &1350
	BIT &1C84
	BMI &1353
.addr1350
	ORA &1C83
.addr1353
	AND &1C89
.addr1356
	JMP &1C8F
.addr1359
	TAX
	TYA
	PHA
	LDA &22
	PHA
	LDA &23
	PHA
	TXA
	ASL A
	TAX
	LDA &1445,X
	STA &1374
	LDA &1446,X
	STA &1375
	TXA
	LSR A
	JSR &1C8F
.addr1376
	PLA
	STA &23
	PLA
	STA &22
	PLA
	TAY
	RTS
.addr137F
	STA &07
	TYA
	PHA
	LDA &22
	PHA
	LDA &23
	PHA
	JSR &3736
	TAX
	LDA #&00
	CPX #&33
	ADC #&00
	CPX #&66
	ADC #&00
	CPX #&99
	ADC #&00
	CPX #&CC
	LDX &07
	ADC &5565,X
	JSR &12CE
	JMP &1376
	LDA #&00
	BIT &20A9
	STA &1C83
	LDA #&00
	STA &1C88
	RTS
	LDA #&06
	STA &2C
	LDA #&FF
	STA &1C84
	RTS
	LDA #&01
	STA &2C
	JMP &2537
.addr13C7
	LDA #&80
	STA &1C88
	LDA #&20
	STA &1C83
	RTS
	LDA #&80
	STA &72
	LDA #&FF
	BIT &00A9
	STA &1C85
	RTS
.addr13DF
	LDA #&80
	BIT &00A9
	STA &1C86
	ASL A
	STA &1C87
	RTS
	LDA &72
	AND #&BF
	STA &72
	LDA #&03
	JSR &31AC
	LDX &1C87
	LDA &0E00,X
	JSR &142F
	BCC &1405
	DEC &1C87
.addr1405
	LDA #&99
	JMP &12CE
	JSR &1429
	JSR &3736
	AND #&03
	TAY
.addr1413
	JSR &3736
	AND #&3E
	TAX
	LDA &1489,X
	JSR &1342
.addr141F
	LDA &148A,X
	JSR &1342
	DEY
	BPL &1413
	RTS
.addr1429
	LDA #&DF
	STA &1C89
	RTS
.addr142F
	ORA #&20
	CMP #&61
	BEQ &1446
	CMP #&65
	BEQ &1446
	CMP #&69
	BEQ &1446
	CMP #&6F
	BEQ &1446
	CMP #&75
	BEQ &1446
	CLC
.addr1446
	RTS

.addr1447
	EQUW addr13A8                   ; &01 - Leave docked tokens Upper case
	EQUW addr13AB                   ; &02 - Prepare to lower case but flag not set yet
	EQUW addr13AC                   ; &03 - Planet name
	EQUW addr13AC                   ; &04 - Commander name
	EQUW addr13D9                   ; &05 - Back to Docked tokens
	EQUW addr13D2                   ; &06 - switch back to flight tokens
	EQUW addr1C8F                   ; &07 - Bell
	EQUW addr13B6                   ; &08 - Indent, set flag to use Upper mask
	EQUW addr13C0                   ; &09 - Start new text box
	EQUW addr1C8F                   ; &0A - down to next row
	EQUW addr18F5                   ; &0B - draw horizontal line at Y = #19
	EQUW addr1C8F                   ; &0C - start next row
	EQUW addr13C7                   ; &0D - all Docked tokens Lower case
	EQUW addr13DF                   ; &0E - Store Acc in flushed buffer
	EQUW addr13E2                   ; &0F - Clear buffer, print to screen from now on
	EQUW addr1C8D                   ; &10 - DTW7 into TT26 print character
	EQUW addr13EC                   ; &11 - Current planet name-ian current planet-ian = small token 17
	EQUW addr140A                   ; &12 - Random name 8 chars
	EQUW addr1429                   ; &13 - Upper case for one letter
	EQUW addr1C8F                   ; &14 - Print character
	EQUW addr25A3                   ; &15 - Clear bottom screen lines
	EQUW addr24D7                   ; &16 - wait for key press
	EQUW addr24ED                   ; &17 - set YC = #10 docked tokens lower case
	EQUW addr250E                   ; &18 - wait for key presses
	EQUW addr24CD                   ; &19 - Briefing Start (incoming message etc.)
	EQUW addr39CC                   ; &1A - Receive string, update Y flag
	EQUW addr12B1                   ; &1B - add galaxy to token #&D9 Curruthers
	EQUW addr12B4                   ; &1C - add galaxy to token #&DC was last seen at Reesdice/jumped to this galaxy
	EQUW addr24F0                   ; &1D - set YC = #6 Docked tokens lower case
	EQUW addr1C8F                   ; &1E - Print character
	EQUW addr1C8F                   ; &1F - Print character
	EQUW addr1C8F                   ; &20 - Print space

	EQUW addr0A0C                   ; 

	EQUS "ABOUSEITILETSTONLONUTHNO" ; 12 digrams for docked random names
	EQUS "ALLEXEGEZACEBISOUSESARMAINDIREA?ERATENBERALAVETIEDORQUANTEISRION" ; 32 diagrams

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr14E1
	LDA &65
	AND #&20
	BNE &14F2
	LDA &8A
	EOR &84
	AND #&0F
	BNE &14F2
	JSR &3E06
.addr14F2
	LDY #&09
	JSR &1619
	LDY #&0F
	JSR &1619
	LDY #&15
	JSR &1619
	LDA &64
	AND #&80
	STA &9A
	LDA &64
	AND #&7F
	BEQ &152A
	CMP #&7F
	SBC #&00
	ORA &9A
	STA &64
	LDX #&0F
	LDY #&09
	JSR &1680
	LDX #&11
	LDY #&0B
	JSR &1680
	LDX #&13
	LDY #&0D
	JSR &1680
.addr152A
	LDA &63
	AND #&80
	STA &9A
	LDA &63
	AND #&7F
	BEQ &1553
	CMP #&7F
	SBC #&00
	ORA &9A
	STA &63
	LDX #&0F
	LDY #&15
	JSR &1680
	LDX #&11
	LDY #&17
	JSR &1680
	LDX #&13
	LDY #&19
	JSR &1680
.addr1553
	LDA &65
	AND #&20
	BNE &155F
	LDA &65
	ORA #&10
	STA &65
.addr155F
	LDA &65
	AND #&EF
	STA &65
	RTS
	AND #&80
	ASL A
	STA &83
	LDA #&00
	ROR A
	STA &D1
	LSR &83
	EOR &48,X
	BMI &158B
	LDA &82
	ADC &46,X
	STA &46,X
	LDA &83
	ADC &47,X
	STA &47,X
	LDA &48,X
	ADC #&00
	ORA &D1
	STA &48,X
	RTS
.addr158B
	LDA &46,X
	SEC
	SBC &82
	STA &46,X
	LDA &47,X
	SBC &83
	STA &47,X
	LDA &48,X
	AND #&7F
	SBC #&00
	ORA #&80
	EOR &D1
	STA &48,X
	BCS &15BC
	LDA #&01
	SBC &46,X
	STA &46,X
	LDA #&00
	SBC &47,X
	STA &47,X
	LDA #&00
	SBC &48,X
	AND #&7F
	ORA &D1
	STA &48,X
.addr15BC
	RTS
	LDA &43
	STA &83
	AND #&80
	STA &D1
	EOR &48,X
	BMI &15E1
	LDA &41
	CLC
	ADC &46,X
	STA &41
	LDA &42
	ADC &47,X
	STA &42
	LDA &43
	ADC &48,X
	AND #&7F
	ORA &D1
	STA &43
	RTS
.addr15E1
	LDA &83
	AND #&7F
	STA &83
	LDA &46,X
	SEC
	SBC &41
	STA &41
	LDA &47,X
	SBC &42
	STA &42
	LDA &48,X
	AND #&7F
	SBC &83
	ORA #&80
	EOR &D1
	STA &43
	BCS &1618
	LDA #&01
	SBC &41
	STA &41
	LDA #&00
	SBC &42
	STA &42
	LDA #&00
	SBC &43
	AND #&7F
	ORA &D1
	STA &43
.addr1618
	RTS
.addr1619
	LDA &8D
	STA &81
	LDX &48,Y
	STX &82
	LDX &49,Y
	STX &83
	LDX &46,Y
	STX &1B
	LDA &0047,Y
	EOR #&80
	JSR &22AD
	STA &0049,Y
	STX &48,Y
	STX &1B
	LDX &46,Y
	STX &82
	LDX &47,Y
	STX &83
	LDA &0049,Y
	JSR &22AD
	STA &0047,Y
	STX &46,Y
	STX &1B
	LDA &2A
	STA &81
	LDX &48,Y
	STX &82
	LDX &49,Y
	STX &83
	LDX &4A,Y
	STX &1B
	LDA &004B,Y
	EOR #&80
	JSR &22AD
	STA &0049,Y
	STX &48,Y
	STX &1B
	LDX &4A,Y
	STX &82
	LDX &4B,Y
	STX &83
	LDA &0049,Y
	JSR &22AD
	STA &004B,Y
	STX &4A,Y
	RTS
.addr1680
	LDA &47,X
	AND #&7F
	LSR A
	STA &D1
	LDA &46,X
	SEC
	SBC &D1
	STA &82
	LDA &47,X
	SBC #&00
	STA &83
	LDA &0046,Y
	STA &1B
	LDA &0047,Y
	AND #&80
	STA &D1
	LDA &0047,Y
	AND #&7F
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	ORA &D1
	EOR &9A
	STX &81
	JSR &22B0
	STA &41
	STX &40
	LDX &81
	LDA &0047,Y
	AND #&7F
	LSR A
	STA &D1
	LDA &0046,Y
	SEC
	SBC &D1
	STA &82
	LDA &0047,Y
	SBC #&00
	STA &83
	LDA &46,X
	STA &1B
	LDA &47,X
	AND #&80
	STA &D1
	LDA &47,X
	AND #&7F
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	ORA &D1
	EOR #&80
	EOR &9A
	STX &81
	JSR &22B0
	STA &0047,Y
	STX &46,Y
	LDX &81
	LDA &40
	STA &46,X
	LDA &41
	STA &47,X
	RTS
	TAY
	EOR &48,X
	BMI &1720
	LDA &1C
	CLC
	ADC &46,X
	STA &1C
	LDA &1D
	ADC &47,X
	STA &1D
	TYA
	RTS
.addr1720
	LDA &46,X
	SEC
	SBC &1C
	STA &1C
	LDA &47,X
	SBC &1D
	STA &1D
	BCC &1733
	TYA
	EOR #&80
	RTS
.addr1733
	LDA #&01
	SBC &1C
	STA &1C
	LDA #&00
	SBC &1D
	STA &1D
	TYA
	RTS

.addr1741
	EQUW &0900
	EQUW &0925
	EQUW &094A
	EQUW &096F
	EQUW &0994
	EQUW &09B9
	EQUW &09DE
	EQUW &0A03
	EQUW &0A28
	EQUW &0A4D
	EQUW &0A72
	EQUW &0A97
	EQUW &0ABC
.addr175B
	EQUB &80, &40, &20, &10, &08, &04, &02, &01
.addr1763
	EQUB &C0, &60, &30, &18, &0C, &06, &03, &03
.addr176B
	EQUB &88, &44, &22, &11

.addr176F
	STY &85
	LDA #&80
	STA &83
	ASL A
	STA &90
	LDA &36
	SBC &34
	BCS &1783
	EOR #&FF
	ADC #&01
	SEC
.addr1783
	STA &1B
	LDA &37
	SBC &35
	BCS &178F
	EOR #&FF
	ADC #&01
.addr178F
	STA &81
	CMP &1B
	BCC &1798
	JMP &1842
.addr1798
	LDX &34
	CPX &36
	BCC &17AF
	DEC &90
	LDA &36
	STA &34
	STX &36
	TAX
	LDA &37
	LDY &35
	STA &35
	STY &37
.addr17AF
	LDA &35
	LSR A
	LSR A
	LSR A
	ORA #&60
	STA &08
	LDA &35
	AND #&07
	TAY
	TXA
	AND #&F8
	STA &07
	TXA
	AND #&07
	TAX
	LDA &175B,X
	STA &82
	LDA &81
	LDX #&FE
	STX &81
.addr17D1
	ASL A
	BCS &17D8
	CMP &1B
	BCC &17DB
.addr17D8
	SBC &1B
	SEC
.addr17DB
	ROL &81
	BCS &17D1
	LDX &1B
	INX
	LDA &37
	SBC &35
	BCS &1814
	LDA &90
	BNE &17F3
	DEX
.addr17ED
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr17F3
	LSR &82
	BCC &17FF
	ROR &82
	LDA &07
	ADC #&08
	STA &07
.addr17FF
	LDA &83
	ADC &81
	STA &83
	BCC &180E
	DEY
	BPL &180E
	DEC &08
	LDY #&07
.addr180E
	DEX
	BNE &17ED
	LDY &85
	RTS
.addr1814
	LDA &90
	BEQ &181F
	DEX
.addr1819
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr181F
	LSR &82
	BCC &182B
	ROR &82
	LDA &07
	ADC #&08
	STA &07
.addr182B
	LDA &83
	ADC &81
	STA &83
	BCC &183C
.addr1833
	INY
	CPY #&08
	BNE &183C
	INC &08
	LDY #&00
.addr183C
	DEX
	BNE &1819
	LDY &85
	RTS
.addr1842
	LDY &35
	TYA
	LDX &34
	CPY &37
	BCS &185B
	DEC &90
	LDA &36
	STA &34
	STX &36
	TAX
	LDA &37
	STA &35
	STY &37
	TAY
.addr185B
	LSR A
	LSR A
	LSR A
	ORA #&60
	STA &08
	TXA
	AND #&F8
	STA &07
	TXA
	AND #&07
	TAX
	LDA &175B,X
	STA &82
	LDA &35
	AND #&07
	TAY
	LDA &1B
	LDX #&01
	STX &1B
.addr187B
	ASL A
	BCS &1882
	CMP &81
	BCC &1885
.addr1882
	SBC &81
	SEC
.addr1885
	ROL &1B
	BCC &187B
	LDX &81
	INX
	LDA &36
	SBC &34
	BCC &18BF
	CLC
	LDA &90
	BEQ &189E
	DEX
.addr1898
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr189E
	DEY
	BPL &18A5
	DEC &08
	LDY #&07
.addr18A5
	LDA &83
	ADC &1B
	STA &83
	BCC &18B9
	LSR &82
	BCC &18B9
	ROR &82
	LDA &07
	ADC #&08
	STA &07
.addr18B9
	DEX
	BNE &1898
	LDY &85
	RTS
.addr18BF
	LDA &90
	BEQ &18CA
	DEX
.addr18C4
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr18CA
	DEY
	BPL &18D1
	DEC &08
	LDY #&07
.addr18D1
	LDA &83
	ADC &1B
	STA &83
	BCC &18E6
	ASL &82
	BCC &18E6
	ROL &82
	LDA &07
	SBC #&07
	STA &07
	CLC
.addr18E6
	DEX
	BNE &18C4
	LDY &85
.addr18EB
	RTS
.addr18EC
	LDA #&0F
	TAX
	JMP osbyte
.addr18F2
	JSR &31AC
.addr18F5
	LDA #&13
	BNE &18FD
.addr18F9
	LDA #&17
	INC &2D
.addr18FD
	STA &35
	LDX #&02
	STX &34
	LDX #&FE
	STX &36
	BNE &1913
.addr1909
	JSR &3586
	STY &35
	LDA #&00
.addr1910
	STA &0E00,Y
.addr1913
	STY &85
	LDX &34
	CPX &36
	BEQ &18EB
	BCC &1924
	LDA &36
	STA &34
	STX &36
	TAX
.addr1924
	DEC &36
	LDA &35
	LSR A
	LSR A
	LSR A
	ORA #&60
	STA &08
	LDA &35
	AND #&07
	STA &07
	TXA
	AND #&F8
	TAY
	TXA
	AND #&F8
	STA &D1
	LDA &36
	AND #&F8
	SEC
	SBC &D1
	BEQ &197E
	LSR A
	LSR A
	LSR A
	STA &82
	LDA &34
	AND #&07
	TAX
	LDA &19A0,X
	EOR (&07),Y
	STA (&07),Y
	TYA
	ADC #&08
	TAY
	LDX &82
	DEX
	BEQ &196F
	CLC
.addr1962
	LDA #&FF
	EOR (&07),Y
	STA (&07),Y
	TYA
	ADC #&08
	TAY
	DEX
	BNE &1962
.addr196F
	LDA &36
	AND #&07
	TAX
	LDA &1999,X
	EOR (&07),Y
	STA (&07),Y
	LDY &85
	RTS
.addr197E
	LDA &34
	AND #&07
	TAX
	LDA &19A0,X
	STA &D1
	LDA &36
	AND #&07
	TAX
	LDA &1999,X
	AND &D1
	EOR (&07),Y
	STA (&07),Y
.addr1996
	LDY &85
	RTS

.addr1999
	EQUB &80, &C0, &E0, &F0, &F8, &FC, &FE
.addr19A0
	EQUB &FF, &7F, &3F, &1F, &0F, &07, &03, &01

.addr19A8
	LDA &175B,X
	EOR (&07),Y
	STA (&07),Y
	LDY &06
	RTS
	JSR &22B0
	STA &27
	TXA
	STA &0F95,Y
.addr19BB
	LDA &34
	BPL &19C4
	EOR #&7F
	CLC
	ADC #&01
.addr19C4
	EOR #&80
	TAX
	LDA &35
	AND #&7F
	CMP #&60
	BCS &1A15
	LDA &35
	BPL &19D7
	EOR #&7F
	ADC #&01
.addr19D7
	STA &D1
	LDA #&61
	SBC &D1
.addr19DD
	STY &06
	TAY
	LSR A
	LSR A
	LSR A
	ORA #&60
	STA &08
	TXA
	AND #&F8
	STA &07
	TYA
	AND #&07
	TAY
	TXA
	AND #&07
	TAX
	LDA &88
	CMP #&90
	BCS &19A8
	LDA &1763,X
	EOR (&07),Y
	STA (&07),Y
	LDA &88
	CMP #&50
	BCS &1A13
	DEY
	BPL &1A0C
	LDY #&01
.addr1A0C
	LDA &1763,X
	EOR (&07),Y
	STA (&07),Y
.addr1A13
	LDY &06
.addr1A15
	RTS
.addr1A16
	TXA
	ADC &E0
	STA &78
	LDA &E1
	ADC &D1
	STA &79
	LDA &92
	BEQ &1A37
	INC &92
.addr1A27
	LDY &6B
	LDA #&FF
	CMP &0F0D,Y
	BEQ &1A98
	STA &0F0E,Y
	INC &6B
	BNE &1A98
.addr1A37
	LDA &72
	STA &34
	LDA &73
	STA &35
	LDA &74
	STA &36
	LDA &75
	STA &37
	LDA &76
	STA &38
	LDA &77
	STA &39
	LDA &78
	STA &3A
	LDA &79
	STA &3B
	JSR &4594
	BCS &1A27
	LDA &90
	BEQ &1A70
	LDA &34
	LDY &36
	STA &36
	STY &34
	LDA &35
	LDY &37
	STA &37
	STY &35
.addr1A70
	LDY &6B
	LDA &0F0D,Y
	CMP #&FF
	BNE &1A84
	LDA &34
	STA &0EC0,Y
	LDA &35
	STA &0F0E,Y
	INY
.addr1A84
	LDA &36
	STA &0EC0,Y
	LDA &37
	STA &0F0E,Y
	INY
	STY &6B
	JSR &176F
	LDA &89
	BNE &1A27
.addr1A98
	LDA &76
	STA &72
	LDA &77
	STA &73
	LDA &78
	STA &74
	LDA &79
	STA &75
	LDA &93
	CLC
.addr1AAB
	ADC &95
	STA &93
	RTS
	LDY &03C3
.addr1AB3
	LDX &0F82,Y
	LDA &0F5C,Y
	STA &35
	STA &0F82,Y
	TXA
	STA &34
	STA &0F5C,Y
	LDA &0FA8,Y
	STA &88
	JSR &19BB
	DEY
	BNE &1AB3
	RTS

.tbl_equipment_prices                   ; Equipment prices
	EQUW     1                      ; PRXS(0) used for 2*fuel_needed, max 140
	EQUW   300                      ; Missile                     30.0 Cr
	EQUW  4000                      ; Large Cargo Bay            400.0 Cr
	EQUW  6000                      ; E.C.M. System (item 4)     600.0 Cr
	EQUW  4000                      ; Extra Pulse Lasers         400.0 Cr
	EQUW 10000                      ; Extra Beam Lasers         1000.0 Cr
	EQUW  5250                      ; Fuel Scoops  (item 7)      525.0 Cr
	EQUW 10000                      ; Escape Pod                1000.0 Cr
	EQUW  9000                      ; Energy Bomb                900.0 Cr
	EQUW 15000                      ; Energy Unit               1500.0 Cr
	EQUW 10000                      ; Docking Computer          1000.0 Cr
	EQUW 50000                      ; Galactic Hyperspace       5000.0 Cr
	EQUW 60000                      ; Military Laser (item 13)  6000.0 Cr
	EQUW  8000                      ; Mining Laster (item 14)    800.0 Cr

.addr1AEC
	LDX #&09
	CMP #&19
	BCS &1B3F
	DEX
	CMP #&0A
	BCS &1B3F
	DEX
	CMP #&02
	BCS &1B3F
	DEX
	BNE &1B3F
.addr1AFF
	LDA #&08
	JSR &2537
	JSR &2C33
.addr1B07
	LDA #&07
	STA &2C
	LDA #&7E
.addr1B0D
	JSR &18F2
	LDA #&CD
	JSR &12CE
	JSR &2683
	LDA #&7D
	JSR &2690
	LDA #&13
	LDY &038C
	BEQ &1B28
	CPY #&32
	ADC #&01
.addr1B28
	JSR &31A1
	LDA #&10
	JSR &2690
	LDA &03A0
	BNE &1AEC
	TAX
	LDA &039F
	LSR A
	LSR A
.addr1B3B
	INX
	LSR A
	BNE &1B3B
.addr1B3F
	TXA
	CLC
	ADC #&15
	JSR &31A1
	LDA #&12
	JSR &1BB4
	LDA &036E
	CMP #&1A
	BCC &1B57
	LDA #&6B
	JSR &1BB4
.addr1B57
	LDA &0381
	BEQ &1B61
	LDA #&6F
	JSR &1BB4
.addr1B61
	LDA &0380
	BEQ &1B6B
	LDA #&6C
	JSR &1BB4
.addr1B6B
	LDA #&71
	STA &96
.addr1B6F
	TAY
	LDX &0311,Y
	BEQ &1B78
	JSR &1BB4
.addr1B78
	INC &96
	LDA &96
	CMP #&75
	BCC &1B6F
	LDX #&00
.addr1B82
	STX &93
	LDY &0368,X
	BEQ &1BAC
	TXA
	CLC
	ADC #&60
	JSR &2690
	LDA #&67
	LDX &93
	LDY &0368,X
	CPY #&8F
	BNE &1B9D
	LDA #&68
.addr1B9D
	CPY #&97
	BNE &1BA3
	LDA #&75
.addr1BA3
	CPY #&32
	BNE &1BA9
	LDA #&76
.addr1BA9
	JSR &1BB4
.addr1BAC
	LDX &93
	INX
	CPX #&04
	BCC &1B82
	RTS
.addr1BB4
	JSR &31A1
	LDX #&06
	STX &2C
	RTS

.addr1BBC
	EQUB &48, &76, &E8, &00

.addr1BC0
	LDA #&03
.addr1BC2
	LDY #&00
.addr1BC4
	STA &80
	LDA #&00
	STA &40
	STA &41
	STY &42
	STX &43
.addr1BD0
	LDX #&0B
	STX &D1
	PHP
	BCC &1BDB
	DEC &D1
	DEC &80
.addr1BDB
	LDA #&0B
	SEC
	STA &86
	SBC &80
	STA &80
	INC &80
	LDY #&00
	STY &83
	JMP &1C2C
.addr1BED
	ASL &43
	ROL &42
	ROL &41
	ROL &40
	ROL &83
	LDX #&03
.addr1BF9
	LDA &40,X
	STA &34,X
	DEX
	BPL &1BF9
	LDA &83
	STA &38
.addr1C04
	ASL &43
	ROL &42
	ROL &41
	ROL &40
	ROL &83
	ASL &43
	ROL &42
	ROL &41
	ROL &40
	ROL &83
	CLC
	LDX #&03
.addr1C1B
	LDA &40,X
	ADC &34,X
	STA &40,X
	DEX
	BPL &1C1B
	LDA &38
	ADC &83
	STA &83
	LDY #&00
.addr1C2C
	LDX #&03
	SEC
.addr1C2F
	LDA &40,X
	SBC &1BBC,X
	STA &34,X
	DEX
	BPL &1C2F
	LDA &83
	SBC #&17
	STA &38
	BCC &1C52
	LDX #&03
.addr1C43
	LDA &34,X
	STA &40,X
	DEX
	BPL &1C43
	LDA &38
	STA &83
	INY
	JMP &1C2C
.addr1C52
	TYA
	BNE &1C61
	LDA &D1
	BEQ &1C61
	DEC &80
	BPL &1C6B
	LDA #&20
	BNE &1C68
.addr1C61
	LDY #&00
	STY &D1
	CLC
	ADC #&30
.addr1C68
	JSR &1C8F
.addr1C6B
	DEC &D1
	BPL &1C71
	INC &D1
.addr1C71
	DEC &86
	BMI &1C82
	BNE &1C7F
	PLP
	BCC &1C7F
	LDA #&2E
	JSR &1C8F
.addr1C7F
	JMP &1BED
.addr1C82
	RTS

.addr1C83
	EQUB &20
	EQUB &FF
	EQUB &00
	EQUB &00
	EQUB &00
	EQUB &00
	EQUB &FF

.addr1C8A
	LDA #&0C
	BIT &41A9
.addr1C8F
	STX &07
	LDX #&FF
	STX &1C89
	CMP #&2E
	BEQ &1CAB
	CMP #&3A
	BEQ &1CAB
	CMP #&0A
	BEQ &1CAB
	CMP #&0C
	BEQ &1CAB
	CMP #&20
	BEQ &1CAB
	INX
.addr1CAB
	STX &1C84
	LDX &07
	BIT &1C86
	BMI &1CB8
	JMP &1D56
.addr1CB8
	CMP #&0C
	BEQ &1CC9
	LDX &1C87
	STA &0E01,X
	LDX &07
	INC &1C87
	CLC
	RTS
.addr1CC9
	TXA
	PHA
	TYA
	PHA
.addr1CCD
	LDX &1C87
	BEQ &1D4A
	CPX #&1F
	BCC &1D47
	LSR &08
.addr1CD8
	LDA &08
	BMI &1CE0
	LDA #&40
	STA &08
.addr1CE0
	LDY #&1D
.addr1CE2
	LDA &0E1F
	CMP #&20
	BEQ &1D16
.addr1CE9
	DEY
	BMI &1CD8
	BEQ &1CD8
	LDA &0E01,Y
	CMP #&20
	BNE &1CE9
	ASL &08
	BMI &1CE9
	STY &07
	LDY &1C87
.addr1CFE
	LDA &0E01,Y
	STA &0E02,Y
	DEY
	CPY &07
	BCS &1CFE
	INC &1C87
.addr1D0C
	CMP &0E01,Y
	BNE &1CE2
	DEY
	BPL &1D0C
	BMI &1CD8
.addr1D16
	LDX #&1E
	JSR &1D3A
	LDA #&0C
	JSR &1D56
	LDA &1C87
	SBC #&1E
	STA &1C87
	TAX
	BEQ &1D4A
	LDY #&00
	INX
.addr1D2E
	LDA &0E20,Y
	STA &0E01,Y
	INY
	DEX
	BNE &1D2E
	BEQ &1CCD
.addr1D3A
	LDY #&00
.addr1D3C
	LDA &0E01,Y
	JSR &1D56
	INY
	DEX
	BNE &1D3C
	RTS
.addr1D47
	JSR &1D3A
.addr1D4A
	STX &1C87
	PLA
	TAY
	PLA
	TAX
	LDA #&0C
	BIT &07A9
.addr1D56
	STA &D2
	STY &034F
	STX &034E
.addr1D5E
	LDY &72
	INY
	BEQ &1DD5
	TAY
	BEQ &1DD5
	BMI &1DD5
	CMP #&07
	BEQ &1DDF
	CMP #&20
	BCS &1D80
	CMP #&0A
	BEQ &1D7C
	LDX #&01
	STX &2C
	CMP #&0D
	BEQ &1DD5
.addr1D7C
	INC &2D
	BNE &1DD5
.addr1D80
	LDX #&BF
	ASL A
	ASL A
	BCC &1D88
	LDX #&C1
.addr1D88
	ASL A
	BCC &1D8C
	INX
.addr1D8C
	STA &1C
	STX &1D
	LDA &2C
	LDX &03CF
	BEQ &1D9F
	CPY #&20
	BNE &1D9F
	CMP #&11
	BEQ &1DD5
.addr1D9F
	ASL A
	ASL A
	ASL A
	STA &07
	LDA &2D
	CPY #&7F
	BNE &1DB6
	DEC &2C
	ADC #&5E
	TAX
	LDY #&F8
	JSR &3A03
	BEQ &1DD5
.addr1DB6
	INC &2C
	CMP #&18
	BCC &1DC6
	PHA
	JSR &2539
	PLA
	LDA &D2
	JMP &1D5E
.addr1DC6
	ORA #&60
.addr1DC8
	STA &08
	LDY #&07
.addr1DCC
	LDA (&1C),Y
	ORA (&07),Y
	STA (&07),Y
	DEY
	BPL &1DCC
.addr1DD5
	LDY &034F
	LDX &034E
	LDA &D2
	CLC
.addr1DDE
	RTS
.addr1DDF
	JSR &3C43
	JMP &1DD5
.addr1DE5
	LDA #&D0
	STA &07
	LDA #&78
	STA &08
	JSR &1EA6
	STX &41
	STA &40
	LDA #&0E
	STA &06
	LDA &7D
	JSR &1EB9
	LDA #&00
	STA &82
	STA &1B
	LDA #&08
	STA &83
	LDA &31
	LSR A
	LSR A
	ORA &32
	EOR #&80
	JSR &22B0
	JSR &1F0D
	LDA &2A
	LDX &2B
	BEQ &1E1D
	SBC #&01
.addr1E1D
	JSR &22B0
	JSR &1F0D
	LDA &8A
	AND #&03
	BNE &1DDE
	LDY #&00
	JSR &1EA6
	STX &40
	STA &41
	LDX #&03
	STX &06
.addr1E36
	STY &3A
	DEX
	BPL &1E36
	LDX #&03
	LDA &03A7
	LSR A
	LSR A
	STA &81
.addr1E44
	SEC
	SBC #&10
	BCC &1E56
	STA &81
	LDA #&10
	STA &3A,X
	LDA &81
	DEX
	BPL &1E44
	BMI &1E5A
.addr1E56
	LDA &81
	STA &3A,X
.addr1E5A
	LDA &003A,Y
	STY &1B
	JSR &1EBA
	LDY &1B
	INY
	CPY #&04
	BNE &1E5A
	LDA #&78
	STA &08
	LDA #&10
	STA &07
	LDA &03A5
	JSR &1EB6
	LDA &03A6
	JSR &1EB6
	LDA &0365
	JSR &1EB8
	JSR &1EA6
	STX &41
	STA &40
	LDX #&0B
	STX &06
	LDA &0342
	JSR &1EB6
	LDA &0347
	JSR &1EB6
	LDA #&F0
	STA &06
	STA &41
	LDA &0FD1
	JMP &1EB6
.addr1EA6
	LDX #&F0
	LDA &8A
	AND #&08
	AND &03CA
	BEQ &1EB3
	TXA
	BIT &0FA9
	RTS
.addr1EB6
	LSR A
	LSR A
.addr1EB8
	LSR A
.addr1EB9
	LSR A
.addr1EBA
	STA &81
	LDX #&FF
	STX &82
	CMP &06
	BCS &1EC8
	LDA &41
	BNE &1ECA
.addr1EC8
	LDA &40
.addr1ECA
	STA &91
	LDY #&02
	LDX #&03
.addr1ED0
	LDA &81
	CMP #&04
	BCC &1EF0
	SBC #&04
	STA &81
	LDA &82
.addr1EDC
	AND &91
	STA (&07),Y
	INY
	STA (&07),Y
	INY
	STA (&07),Y
	TYA
	CLC
	ADC #&06
	TAY
	DEX
	BMI &1F0A
	BPL &1ED0
.addr1EF0
	EOR #&03
	STA &81
	LDA &82
.addr1EF6
	ASL A
	AND #&EF
	DEC &81
	BPL &1EF6
	PHA
	LDA #&00
	STA &82
	LDA #&63
	STA &81
	PLA
	JMP &1EDC
.addr1F0A
	INC &08
	RTS
.addr1F0D
	LDY #&01
	STA &81
.addr1F11
	SEC
	LDA &81
	SBC #&04
	BCS &1F26
	LDA #&FF
	LDX &81
	STA &81
	LDA &176B,X
	AND #&F0
	JMP &1F2A
.addr1F26
	STA &81
	LDA #&00
.addr1F2A
	STA (&07),Y
	INY
	STA (&07),Y
	INY
.addr1F30
	STA (&07),Y
	INY
	STA (&07),Y
	TYA
	CLC
	ADC #&05
	TAY
	CPY #&1E
	BCC &1F11
	INC &08
	RTS
.addr1F41
	LDA #&0E
	JSR &12CE
	JSR &2B23
	JSR &2C28
	LDA #&00
	STA &97
.addr1F50
	JSR &13DF
	JSR &3119
	LDX &1C87
	LDA &4B,X
	CMP #&0D
	BNE &1F6C
.addr1F5F
	DEX
	LDA &4B,X
	ORA #&20
	CMP &0E01,X
	BEQ &1F5F
	TXA
	BMI &1F83
.addr1F6C
	JSR &2631
	INC &97
	BNE &1F50
	JSR &2C33
	JSR &2B23
	LDA #&28
	JSR &3C6C
	LDA #&D7
	JMP &12CE
.addr1F83
	LDA &6F
	STA &03C1
	LDA &6D
	STA &03C2
	JSR &2C33
	JSR &2B23
	JSR &13E2
	JMP &3845

.addr1F99
	EQUB &02                        ; &02 = Shuttle
	EQUW &3B54
	EQUB &03                        ; &03 = Transporter
	EQUW &B082
	EQUB &00
	EQUW &0000
	EQUB &01                        ; &01 = Cargo
	EQUW &1150
	EQUB &01                        ; &01 = Cargo
	EQUW &28D1
	EQUB &01                        ; &01 = Cargo
	EQUW &0640
	EQUB &03                        ; &03 = Transporter
	EQUW &9060
	EQUB &04                        ; &04 = Cobra Mk3
	EQUW &D110
	EQUB &00
	EQUW &0000
	EQUB &06                        ; &06 = Viper
	EQUW &F851
	EQUB &07                        ; &07 = Krait
	EQUW &7560
	EQUB &00
	EQUW &0000

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr1FBD
	JSR &2118
	LDA #&00
	JSR &2537
	JSR &3736
	BPL &1FF3
	AND #&03
	STA &D1
	ASL A
	ASL A
	ASL A
	ADC &D1
	TAX
	LDY #&03
	STY &94
.addr1FD8
	LDY #&02
.addr1FDA
	LDA &1F99,X
	STA &0034,Y
	INX
	DEY
	BPL &1FDA
	TXA
	PHA
	JSR &2079
	PLA
	TAX
	DEC &94
	BNE &1FD8
	LDY #&80
	BNE &2007
.addr1FF3
	LSR A
	STA &35
	JSR &3736
	STA &34
	JSR &3736
	AND #&07
	STA &36
	JSR &2079
	LDY #&00
.addr2007
	STY &85
	JSR &2118
	LDX #&02
.addr200E
	STX &84
	LDA #&82
	LDX &84
	STX &81
	JSR &2316
	LDA &1B
	CLC
	ADC #&60
	LSR A
.addr201F
	LSR A
	LSR A
	ORA #&60
	STA &08
	LDA &1B
	AND #&07
	STA &07
	LDY #&00
	JSR &20E8
	LDA #&04
	LDY #&F8
	JSR &2101
	LDY &85
	BEQ &2045
	JSR &20E8
	LDY #&80
	LDA #&40
	JSR &2101
.addr2045
	LDX &84
	INX
	CPX #&0D
	BCC &200E
	LDA #&10
.addr204E
	LDX #&60
	STX &08
	STA &84
	AND #&F8
	STA &07
	LDX #&80
	LDY #&01
.addr205C
	TXA
	AND (&07),Y
	BNE &2071
	TXA
	ORA (&07),Y
	STA (&07),Y
	INY
	CPY #&08
	BNE &205C
	INC &08
	LDY #&00
	BEQ &205C
.addr2071
	LDA &84
	CLC
	ADC #&10
	BNE &204E
	RTS
.addr2079
	JSR &36D8
	LDA &34
	STA &4C
	LSR A
	ROR &48
	LDA &35
	STA &46
	LSR A
	LDA #&01
	ADC #&00
	STA &4D
	LDA #&80
	STA &4B
	STA &9A
	LDA #&0B
	STA &68
	JSR &3736
	STA &84
.addr209D
	LDX #&15
	LDY #&09
	JSR &1680
	LDX #&17
	LDY #&0B
	JSR &1680
	LDX #&19
	LDY #&0D
	JSR &1680
	DEC &84
	BNE &209D
	LDY &36
	BEQ &2138
	LDX #&04
.addr20BC
	INX
	INX
	LDA &55FE,X
	STA &1E
	LDA &55FF,X
	STA &1F
	BEQ &20BC
	DEY
	BNE &20BC
	LDY #&01
	LDA (&1E),Y
	STA &81
	INY
	LDA (&1E),Y
	STA &82
	JSR &3F3E
	LDA #&64
	SBC &81
	LSR A
	STA &49
	JSR &3E06
	JMP &400F
.addr20E8
	LDA #&20
.addr20EA
	TAX
	AND (&07),Y
	BNE &2100
	TXA
	ORA (&07),Y
	STA (&07),Y
	TXA
	LSR A
	BCC &20EA
	TYA
	ADC #&07
	TAY
	LDA #&80
	BCC &20EA
.addr2100
	RTS
.addr2101
	TAX
	AND (&07),Y
	BNE &2100
	TXA
	ORA (&07),Y
	STA (&07),Y
	TXA
	ASL A
	BCC &2101
	TYA
	SBC #&08
	TAY
	LDA #&01
	BCS &2101
	RTS
.addr2118
	LDA &17EF
	EOR #&40
	STA &17EF
	LDA &181B
	EOR #&40
	STA &181B
	LDA &189A
	EOR #&40
	STA &189A
	LDA &18C6
	EOR #&40
	STA &18C6
.addr2138
	RTS
	LDA #&38
	JSR &3C6C
	LDA #&01
	STA &0348
	LDA #&04
	JSR &2153
	DEC &0348
	RTS
	LDA #&30
	JSR &3C6C
	LDA #&08
.addr2153
	STA &95
	JSR &2539
	JSR &215B
.addr215B
	LDX #&80
	STX &D2
	LDX #&60
	STX &E0
	LDX #&00
	STX &96
	STX &D3
	STX &E1
.addr216B
	JSR &2177
	INC &96
	LDX &96
	CPX #&08
	BNE &216B
	RTS
.addr2177
	LDA &96
	AND #&07
	CLC
	ADC #&08
	STA &40
.addr2180
	LDA #&01
	STA &6B
	JSR &3500
	ASL &40
	BCS &2191
	LDA &40
	CMP #&A0
	BCC &2180
.addr2191
	RTS

.addr2192
	EQUB &8C, &E7, &8D, &ED, &8A, &E6, &C1, &C8
	EQUB &C8, &8B, &E0, &8A, &E6, &D6, &C5, &C6
	EQUB &C1, &CA, &95, &9D, &9C, &97

.addr21A8
	STA &40
	STA &41
	STA &42
	STA &43
	CLC
	RTS

.addr21B2
	LDX &24
	STX &82
	LDX &25
	STX &83
	LDX &31
	STX &1B

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr21BE
	AND #&7F
.addr21C0
	STA &1B
	TAX
	BNE &21D7
.addr21C5
	CLC
	STX &1B
	TXA
	RTS
	LDA &0F82,Y
	STA &35
	AND #&7F
	STA &1B
.addr21D3
	LDX &81
	BEQ &21C5
.addr21D7
	DEX
	STX &D1
	LDA #&00
	LDX #&08
	LSR &1B
.addr21E0
	BCC &21E4
	ADC &D1
.addr21E4
	ROR A
	ROR &1B
	DEX
	BNE &21E0
	RTS
	STA &1C
	STA &1B
	RTS
.addr21F0
	AND #&1F
	TAX
	LDA &07C0,X
	STA &81
	LDA &40
.addr21FA
	EOR #&FF
	SEC
	ROR A
	STA &1B
	LDA #&00
.addr2202
	BCS &220C
	ADC &81
	ROR A
	LSR &1B
	BNE &2202
	RTS
.addr220C
	LSR A
	LSR &1B
	BNE &2202
	RTS
	LDX &81
	BEQ &21C5
	DEX
	STX &D1
	LDA #&00
	LDX #&08
	LSR &1B
.addr221F
	BCC &2223
	ADC &D1
.addr2223
	ROR A
	ROR &1B
	DEX
	BNE &221F
	RTS
	STX &81
	EOR #&FF
	LSR A
	STA &1C
	LDA #&00
	LDX #&10
	ROR &1B
.addr2237
	BCS &2244
	ADC &81
	ROR A
	ROR &1C
	ROR &1B
	DEX
	BNE &2237
	RTS
.addr2244
	LSR A
	ROR &1C
	ROR &1B
	DEX
	BNE &2237
	RTS
	LDX &31
	STX &1B
	LDX &25
	STX &83
	LDX &24
	STX &82
.addr2259
	TAX
	AND #&7F
	LSR A
	STA &1B
	TXA
	EOR &81
	AND #&80
	STA &D1
	LDA &81
	AND #&7F
	BEQ &2284
	TAX
	DEX
	STX &06
	LDA #&00
	LDX #&07
.addr2274
	BCC &2278
	ADC &06
.addr2278
	ROR A
	ROR &1B
	DEX
	BNE &2274
	LSR A
	ROR &1B
	ORA &D1
	RTS
.addr2284
	STA &1B
	RTS
.addr2287
	JSR &2259
	STA &83
	LDA &1B
	STA &82
	RTS
	LDX &46,Y
	STX &81
	LDA &34
	JSR &2287
	LDX &48,Y
	STX &81
	LDA &35
	JSR &22AD
	STA &83
	STX &82
	LDX &4A,Y
	STX &81
	LDA &36
.addr22AD
	JSR &2259
.addr22B0
	STA &06
	AND #&80
	STA &D1
	EOR &83
	BMI &22C7
	LDA &82
	CLC
	ADC &1B
	TAX
	LDA &83
	ADC &06
	ORA &D1
	RTS
.addr22C7
	LDA &83
	AND #&7F
	STA &80
	LDA &1B
	SEC
	SBC &82
	TAX
	LDA &06
	AND #&7F
	SBC &80
	BCS &22E9
	STA &80
	TXA
	EOR #&FF
	ADC #&01
	TAX
	LDA #&00
	SBC &80
	ORA #&80
.addr22E9
	EOR &D1
	RTS
.addr22EC
	STX &81
	EOR #&80
	JSR &22AD
	TAX
	AND #&80
	STA &D1
	TXA
	AND #&7F
	LDX #&FE
	STX &06
.addr22FF
	ASL A
	CMP #&60
	BCC &2306
	SBC #&60
.addr2306
	ROL &06
	BCS &22FF
	LDA &06
	ORA &D1
	RTS
	LDA &0FA8,Y
	STA &81
	LDA &7D
.addr2316
	LDX #&08
	ASL A
	STA &1B
	LDA #&00
.addr231D
	ROL A
	BCS &2324
	CMP &81
	BCC &2327
.addr2324
	SBC &81
	SEC
.addr2327
	ROL &1B
	DEX
	BNE &231D
	JMP &3F79
	STA &1D
	LDA &4C
	STA &81
	LDA &4D
	STA &82
	LDA &4E
	STA &83
	LDA &1B
	ORA #&01
	STA &1B
	LDA &1D
	EOR &83
	AND #&80
	STA &D1
	LDY #&00
	LDA &1D
	AND #&7F
.addr2351
	CMP #&40
	BCS &235D
	ASL &1B
	ROL &1C
	ROL A
	INY
	BNE &2351
.addr235D
	STA &1D
	LDA &83
	AND #&7F
	BMI &236D
.addr2365
	DEY
	ASL &81
	ROL &82
	ROL A
	BPL &2365
.addr236D
	STA &81
	LDA #&FE
	STA &82
	LDA &1D
	JSR &3F7D
	LDA #&00
	STA &41
	STA &42
	STA &43
	TYA
	BPL &23A1
	LDA &82
.addr2385
	ASL A
	ROL &41
	ROL &42
	ROL &43
	INY
	BNE &2385
	STA &40
	LDA &43
	ORA &D1
	STA &43
	RTS
.addr2398
	LDA &82
	STA &40
	LDA &D1
	STA &43
	RTS
.addr23A1
	BEQ &2398
	LDA &82
.addr23A5
	LSR A
	DEY
	BNE &23A5
	STA &40
	LDA &D1
	STA &43
	RTS
	LDA &03C7
	BNE &23C1
	TXA
	BPL &23BB
	DEX
	BMI &23C1
.addr23BB
	INX
	BNE &23C1
	DEX
	BEQ &23BB
.addr23C1
	RTS
	STA &D1
	TXA
	CLC
	ADC &D1
	TAX
	BCC &23CD
	LDX #&FF
.addr23CD
	BPL &23DF
.addr23CF
	LDA &D1
	RTS
	STA &D1
	TXA
	SEC
	SBC &D1
	TAX
	BCS &23DD
	LDX #&01
.addr23DD
	BPL &23CF
.addr23DF
	LDA &03C8
	BNE &23CF
	LDX #&80
	BMI &23CF
.addr23E8
	LDA &03BF
	ORA &03C0
	BNE &2424
	LDY #&19
.addr23F2
	LDA &5338,Y
	CMP &88
	BNE &2421
	LDA &5351,Y
	AND #&7F
	CMP &0367
	BNE &2421
	LDA &5351,Y
	BMI &2414
	LDA &0358
	LSR A
	BCC &2424
	JSR &13DF
	LDA #&01
	BIT &B0A9
	JSR &130D
	TYA
	JSR &12BC
	LDA #&B1
	BNE &242F
.addr2421
	DEY
	BNE &23F2
.addr2424
	LDX #&03
.addr2426
	LDA &6E,X
	STA &00,X
	DEX
	BPL &2426
	LDA #&05
.addr242F
	JMP &12CE
.addr2432
	LDA &0358
	ORA #&04
	STA &0358
	LDA #&0B
.addr243C
	JSR &12CE
	JMP &38B0
.addr2442
	LDA &0358
	AND #&F0
	ORA #&0A
	STA &0358
	LDA #&DE
	BNE &243C
.addr2450
	LDA &0358
	ORA #&04
	STA &0358
	LDA #&02
	STA &0383
	INC &03A0
	LDA #&DF
	BNE &243C
.addr2464
	LSR &0358
	ASL &0358
	INC &03A0
	LDX #&50
	LDY #&C3
	JSR &2ECE
	LDA #&0F
.addr2476
	BNE &243C
.addr2478
	LSR &0358
	SEC
	ROL &0358
	JSR &24CD
	JSR &36D8
	LDA #&1F
	STA &8C
	JSR &32FB
	LDA #&01
	STA &2C
	STA &4D
	JSR &2537
	LDA #&40
	STA &8A
.addr2499
	LDX #&7F
	STX &63
	STX &64
	JSR &400F
	JSR addr14E1
	DEC &8A
	BNE &2499
.addr24A9
	LSR &46
	INC &4C
	BEQ &24C7
	INC &4C
	BEQ &24C7
	LDX &49
	INX
	CPX #&70
	BCC &24BC
	LDX #&70
.addr24BC
	STX &49
	JSR &400F
	JSR addr14E1
	JMP &24A9
.addr24C7
	INC &4D
	LDA #&0A
	BNE &2476
.addr24CD
	LDA #&D8
	JSR &12CE
	LDY #&64
	JMP &259C
.addr24D7
	JSR &24F7
	BNE &24D7
.addr24DC
	JSR &24F7
	BEQ &24DC
	LDA #&00
	STA &65
	LDA #&01
	JSR &2537
	JSR &400F
	LDA #&0A
	BIT &06A9
	STA &2D
	JMP &13C7
.addr24F7
	LDA #&70
	STA &49
	LDA #&00
	STA &46
	STA &4C
	LDA #&02
	STA &4D
	JSR &400F
	JSR addr14E1
	JMP &3C20
.addr250E
	JSR &3C20
	BNE &250E
	JSR &3C20
	BEQ &250E
	RTS
	LDY &0345
	LDA &0368,Y
	BEQ &254E
	LDA #&80
	STA &73
	LDA #&48
	STA &74
	LDA #&14
	STA &75
	JSR &285D
	LDA #&0A
	STA &75
	JMP &285D
.addr2537
	STA &87
.addr2539
	JSR &13AB
	LDA #&80
	STA &72
	STA &1C84
	ASL A
	STA &0346
	STA &034A
	STA &034B
	LDX #&60
.addr254F
	JSR &39FF
	INX
	CPX #&78
	BNE &254F
	LDY #&01
	STY &2D
	LDA &87
	BNE &2573
	LDY #&0B
	STY &2C
	LDA &0345
	ORA #&60
	JSR &31AC
	JSR &2E05
	LDA #&AF
	JSR &31AC
.addr2573
	LDX #&00
	STX &34
	STX &35
	STX &72
	DEX
	STX &36
	JSR &1913
	LDA #&02
	STA &34
	STA &36
	JSR &258A
.addr258A
	JSR &258D
.addr258D
	LDA #&00
	STA &35
	LDA #&BF
	STA &37
	DEC &34
	DEC &36
	JMP &176F
.addr259C
	JSR &260B
	DEY
	BNE &259C
	RTS
.addr25A3
	LDA #&FF
	STA &1C84
	LDA #&14
	STA &2D
	JSR &2683
	LDA #&75
	STA &08
	LDA #&07
	STA &07
	LDA #&00
	JSR &25C6
	INC &08
	JSR &25C6
	INC &08
	INY
	STY &2C
.addr25C6
	LDY #&E9
.addr25C8
	STA (&07),Y
	DEY
	BNE &25C8
	RTS
	JSR &25D3
	DEC &35
.addr25D3
	LDA &35
	TAY
	LSR A
	LSR A
	LSR A
	ORA #&60
	STA &08
	LDA &34
	AND #&F8
	STA &07
	TYA
	AND #&07
	TAY
	LDA &34
	AND #&06
	LSR A
	TAX
	LDA &176B,X
	AND &91
	EOR (&07),Y
	STA (&07),Y
	LDA &176C,X
	BPL &2604
	LDA &07
	ADC #&08
	STA &07
	LDA &176C,X
.addr2604
	AND &91
	EOR (&07),Y
	STA (&07),Y
	RTS
.addr260B
	LDA #&00
	STA &8B
.addr260F
	LDA &8B
	BEQ &260F
	RTS
.addr2614
	PHA
	LDX #&0C
	CPX &03AD
	BCC &2627
.addr261C
	ADC &036F,X
	DEX
	BPL &261C
	CMP &036E
	PLA
	RTS
.addr2627
	LDY &03AD
	ADC &036F,Y
	CMP #&C8
	PLA
	RTS
.addr2631
	JSR &2634
.addr2634
	JSR &2637
.addr2637
	LDA &6C
	CLC
	ADC &6E
	TAX
	LDA &6D
	ADC &6F
	TAY
	LDA &6E
	STA &6C
	LDA &6F
	STA &6D
	LDA &71
	STA &6F
	LDA &70
	STA &6E
	CLC
	TXA
	ADC &6E
	STA &70
	TYA
	ADC &6F
	STA &71
	RTS
.addr265E
	LDA &03BF
	ORA &03C0
	BNE &2669
	INC &2D
	RTS
.addr2669
	LDA #&BF
	JSR &31A7
	LDX &03BF
	LDY &03C0
	SEC
	JSR &2D7D
	LDA #&C3
.addr267A
	JSR &31AC
.addr267D
	INC &2D
.addr267F
	LDA #&80
	STA &72
.addr2683
	LDA #&0C
	JMP &31AC
.addr2688
	LDA #&AD
	JSR &31AC
	JMP &26C7
.addr2690
	JSR &31AC
	JMP &2E05
.addr2696
	LDA #&01
	JSR &2537
	LDA #&09
	STA &2C
	LDA #&A3
	JSR &18F2
	JSR &267D
	JSR &265E
	LDA #&C2
	JSR &31A7
	LDA &03B8
	CLC
	ADC #&01
	LSR A
	CMP #&02
	BEQ &2688
	LDA &03B8
	BCC &26C2
	SBC #&05
	CLC
.addr26C2
	ADC #&AA
	JSR &31AC
.addr26C7
	LDA &03B8
	LSR A
	LSR A
	CLC
	ADC #&A8
	JSR &267A
	LDA #&A2
	JSR &31A7
	LDA &03B9
	CLC
	ADC #&B1
	JSR &267A
	LDA #&C4
	JSR &31A7
	LDX &03BA
	INX
	CLC
	JSR &1BC0
	JSR &267D
	LDA #&C0
	JSR &31A7
	SEC
	LDX &03BB
	JSR &1BC0
	LDA #&C6
	JSR &267A
	LDA #&28
	JSR &31AC
	LDA &70
	BMI &2712
	LDA #&BC
	JSR &31AC
	JMP &274E
.addr2712
	LDA &71
	LSR A
	LSR A
	PHA
	AND #&07
	CMP #&03
	BCS &2722
	ADC #&E3
	JSR &2690
.addr2722
	PLA
	LSR A
	LSR A
	LSR A
	CMP #&06
	BCS &272F
	ADC #&E6
	JSR &2690
.addr272F
	LDA &6F
	EOR &6D
	AND #&07
	STA &73
	CMP #&06
	BCS &2740
	ADC #&EC
	JSR &2690
.addr2740
	LDA &71
	AND #&03
	CLC
	ADC &73
	AND #&07
	ADC #&F2
	JSR &31AC
.addr274E
	LDA #&53
	JSR &31AC
	LDA #&29
	JSR &267A
	LDA #&C1
	JSR &31A7
	LDX &03BD
	LDY &03BE
	JSR &2D7C
	JSR &2E05
	LDA #&00
	STA &72
	LDA #&4D
	JSR &31AC
	LDA #&E2
	JSR &267A
	LDA #&FA
	JSR &31A7
	LDA &71
	LDX &6F
	AND #&0F
	CLC
	ADC #&0B
	TAY
	JSR &2D7D
	JSR &2E05
	LDA #&6B
	JSR &1C8F
	LDA #&6D
	JSR &1C8F
	JSR &267D
	JMP &23E8
	LDX &88
	RTS
.addr279F
	LDA &6D
	AND #&07
	STA &03B8
	LDA &6E
	LSR A
	LSR A
	LSR A
	AND #&07
	STA &03B9
	LSR A
	BNE &27BB
	LDA &03B8
	ORA #&02
	STA &03B8
.addr27BB
	LDA &03B8
	EOR #&07
	CLC
	STA &03BA
	LDA &6F
	AND #&03
	ADC &03BA
	STA &03BA
	LDA &03B9
	LSR A
	ADC &03BA
	STA &03BA
	ASL A
	ASL A
	ADC &03B8
	ADC &03B9
	ADC #&01
	STA &03BB
	LDA &03B8
	EOR #&07
	ADC #&03
	STA &1B
	LDA &03B9
	ADC #&04
	STA &81
	JSR &21D3
	LDA &03BB
	STA &81
	JSR &21D3
	ASL &1B
	ROL A
	ASL &1B
	ROL A
	ASL &1B
	ROL A
	STA &03BE
	LDA &1B
	STA &03BD
	RTS
.addr2812
	LDA #&40
	JSR &2537
	LDA #&07
	STA &2C
	JSR &2C28
	LDA #&C7
	JSR &31AC
	JSR &18F9
	LDA #&98
	JSR &18FD
	JSR &28C8
	LDX #&00
.addr2830
	STX &84
	LDX &6F
	LDY &70
	TYA
	ORA #&50
	STA &88
	LDA &6D
	LSR A
	CLC
	ADC #&18
	STA &35
	JSR &19DD
	JSR &2631
	LDX &84
	INX
	BNE &2830
	LDA &03C1
	STA &73
	LDA &03C2
	LSR A
	STA &74
	LDA #&04
	STA &75
.addr285D
	LDA #&18
	LDX &87
	BPL &2865
	LDA #&00
.addr2865
	STA &78
	LDA &73
	SEC
	SBC &75
	BCS &2870
	LDA #&00
.addr2870
	STA &34
	LDA &73
	CLC
	ADC &75
	BCC &287B
	LDA #&FF
.addr287B
	STA &36
	LDA &74
	CLC
	ADC &78
	STA &35
	JSR &1913
	LDA &74
	SEC
	SBC &75
	BCS &2890
	LDA #&00
.addr2890
	CLC
	ADC &78
	STA &35
	LDA &74
	CLC
	ADC &75
	ADC &78
	CMP #&98
	BCC &28A6
	LDX &87
	BMI &28A6
	LDA #&97
.addr28A6
	STA &37
	LDA &73
	STA &34
	STA &36
	JMP &176F
.addr28B1
	LDA #&68
	STA &73
	LDA #&5A
	STA &74
	LDA #&10
	STA &75
	JSR &285D
	LDA &0365
	STA &40
	JMP &28EC
.addr28C8
	LDA &87
	BMI &28B1
	LDA &0365
	LSR A
	LSR A
	STA &40
	LDA &0359
	STA &73
	LDA &035A
	LSR A
	STA &74
	LDA #&07
	STA &75
	JSR &285D
	LDA &74
	CLC
	ADC #&18
	STA &74
.addr28EC
	LDA &73
	STA &D2
	LDA &74
	STA &E0
	LDX #&00
	STX &E1
	STX &D3
	INX
	STX &6B
	LDX #&02
	STX &95
	JMP &3500
.addr2904
	LDA #&02
	JSR &2537
	JSR &2E1B
	LDA #&80
	STA &72
	JSR &18EC
	LDA #&00
	STA &03AD
.addr2918
	JSR &2D8C
	LDA &03AB
	BNE &292F
	JMP &2991
.addr2923
	LDY #&B0
.addr2925
	JSR &2E05
	TYA
	JSR &2D84
	JSR &306E
.addr292F
	JSR &25A3
	LDA #&CC
	JSR &31AC
	LDA &03AD
	CLC
	ADC #&D0
	JSR &31AC
	LDA #&2F
	JSR &31AC
	JSR &2DF8
	LDA #&3F
	JSR &31AC
	JSR &2683
	LDX #&00
	STX &82
	LDX #&0C
	STX &06
	JSR &29AF
	BCS &2923
	STA &1B
	JSR &2614
	LDY #&CE
	BCS &2925
	LDA &03AA
	STA &81
	JSR &2EEF
	JSR &2EA7
	LDY #&C5
	BCC &2925
	LDY &03AD
	LDA &82
	PHA
	CLC
	ADC &036F,Y
	STA &036F,Y
	LDA &038D,Y
	SEC
	SBC &82
	STA &038D,Y
	PLA
	BEQ &2991
	JSR &3066
.addr2991
	LDA &03AD
	CLC
	ADC #&05
	STA &2D
	LDA #&00
	STA &2C
	INC &03AD
	LDA &03AD
	CMP #&11
	BCS &29AA
	JMP &2918
.addr29AA
	LDA #&77
	JMP &37A3
.addr29AF
	LDX #&00
	STX &82
	LDX #&0C
	STX &06
.addr29B7
	JSR &3D5F
	LDX &82
	BNE &29C6
	CMP #&79
	BEQ &29F7
	CMP #&6E
	BEQ &2A00
.addr29C6
	STA &81
	SEC
	SBC #&30
	BCC &29F4
	CMP #&0A
	BCS &29AA
	STA &83
	LDA &82
	CMP #&1A
	BCS &29F4
	ASL A
	STA &D1
	ASL A
	ASL A
	ADC &D1
	ADC &83
	STA &82
	CMP &03AB
	BEQ &29EB
	BCS &29F4
.addr29EB
	LDA &81
	JSR &1C8F
	DEC &06
	BNE &29B7
.addr29F4
	LDA &82
	RTS
.addr29F7
	JSR &1C8F
	LDA &03AB
	STA &82
	RTS
.addr2A00
	JSR &1C8F
	LDA #&00
	STA &82
	RTS
.addr2A08
	JSR &2683
	LDA #&B0
	JSR &2D84
	JSR &306E
	LDY &03AD
	JMP &2A37
.addr2A19
	LDA #&04
	JSR &2537
	LDA #&0A
	STA &2C
	JSR &18EC
	LDA #&CD
	JSR &31AC
	LDA #&CE
	JSR &18F2
	JSR &2683
.addr2A32
	LDY #&00
.addr2A34
	STY &03AD
.addr2A37
	LDX &036F,Y
	BEQ &2AA3
	TYA
	ASL A
	ASL A
	TAY
	LDA &3DA7,Y
	STA &74
	TXA
	PHA
	JSR &267F
	CLC
	LDA &03AD
	ADC #&D0
	JSR &31AC
	LDA #&0E
	STA &2C
	PLA
	TAX
	STA &03AB
	CLC
	JSR &1BC0
	JSR &2DF8
	LDA &87
	CMP #&04
	BNE &2AA3
	LDA #&CD
	JSR &31AC
	LDA #&CE
	JSR &12CE
	JSR &29AF
	BEQ &2AA3
	BCS &2A08
	LDA &03AD
	LDX #&FF
	STX &72
	JSR &2D8C
	LDY &03AD
	LDA &036F,Y
	SEC
	SBC &82
	STA &036F,Y
	LDA &82
	STA &1B
	LDA &03AA
	STA &81
	JSR &2EEF
	JSR &2ECE
	LDA #&00
	STA &72
.addr2AA3
	LDY &03AD
	INY
	CPY #&11
	BCC &2A34
	LDA &87
	CMP #&04
	BNE &2AB7
	JSR &306E
	JMP &29AA
.addr2AB7
	RTS
.addr2AB8
	LDA #&08
	JSR &2537
	LDA #&0B
	STA &2C
	LDA #&A4
	JSR &267A
	JSR &18F5
	JSR &3178
	LDA &036E
	CMP #&1A
	BCC &2AD8
	LDA #&6B
	JSR &31AC
.addr2AD8
	JMP &2A32
	JSR &31AC
	LDA #&CE
	JSR &12CE
	JSR &3D5F
	ORA #&20
	CMP #&79
	BEQ &2AF1
	LDA #&6E
	JMP &1C8F
.addr2AF1
	JSR &1C8F
	SEC
	RTS
.addr2AF6
	TXA
	PHA
	DEY
	TYA
	EOR #&FF
	PHA
	JSR &260B
	JSR &2B23
	PLA
	STA &76
	LDA &03C2
	JSR &2B39
	LDA &77
	STA &03C2
	STA &74
	PLA
	STA &76
	LDA &03C1
	JSR &2B39
	LDA &77
	STA &03C1
	STA &73
.addr2B23
	LDA &87
	BMI &2B4A
	LDA &03C1
	STA &73
	LDA &03C2
	LSR A
	STA &74
	LDA #&04
	STA &75
	JMP &285D
.addr2B39
	STA &77
	CLC
	ADC &76
	LDX &76
	BMI &2B45
	BCC &2B47
	RTS
.addr2B45
	BCC &2B49
.addr2B47
	STA &77
.addr2B49
	RTS
.addr2B4A
	LDA &03C1
	SEC
	SBC &0359
	CMP #&26
	BCC &2B59
	CMP #&E6
	BCC &2B49
.addr2B59
	ASL A
	ASL A
	CLC
	ADC #&68
	STA &73
	LDA &03C2
	SEC
	SBC &035A
	CMP #&26
	BCC &2B6F
	CMP #&DC
	BCC &2B49
.addr2B6F
	ASL A
	CLC
	ADC #&5A
	STA &74
	LDA #&08
	STA &75
	JMP &285D
.addr2B7C
	LDA #&80
	JSR &2537
	LDA #&07
	STA &2C
	LDA #&BE
	JSR &18F2
	JSR &28C8
	JSR &2B23
	JSR &2C28
	LDA #&00
	STA &97
	LDX #&18
.addr2B99
	STA &46,X
	DEX
	BPL &2B99
.addr2B9E
	LDA &6F
	SEC
	SBC &0359
	BCS &2BAA
	EOR #&FF
	ADC #&01
.addr2BAA
	CMP #&14
	BCS &2C1E
	LDA &6D
	SEC
	SBC &035A
	BCS &2BBA
	EOR #&FF
	ADC #&01
.addr2BBA
	CMP #&26
	BCS &2C1E
	LDA &6F
	SEC
	SBC &0359
	ASL A
	ASL A
	ADC #&68
	STA &3A
	LSR A
	LSR A
	LSR A
	STA &2C
	INC &2C
	LDA &6D
	SEC
	SBC &035A
	ASL A
	ADC #&5A
	STA &E0
	LSR A
	LSR A
	LSR A
	TAY
	LDX &46,Y
	BEQ &2BEF
	INY
	LDX &46,Y
	BEQ &2BEF
	DEY
	DEY
	LDX &46,Y
	BNE &2C01
.addr2BEF
	STY &2D
	CPY #&03
	BCC &2C1E
	LDA #&FF
	STA &0046,Y
	LDA #&80
	STA &72
	JSR &3119
.addr2C01
	LDA #&00
	STA &D3
	STA &E1
	STA &41
	LDA &3A
	STA &D2
	LDA &71
	AND #&01
	ADC #&02
	STA &40
	JSR &32B0
	JSR &33CB
	JSR &32B0
.addr2C1E
	JSR &2631
	INC &97
	BEQ &2C32
	JMP &2B9E
.addr2C28
	LDX #&05
.addr2C2A
	LDA &035B,X
	STA &6C,X
	DEX
	BPL &2C2A
.addr2C32
	RTS
.addr2C33
	JSR &2C28
	LDY #&7F
	STY &D1
	LDA #&00
	STA &80
.addr2C3E
	LDA &6F
	SEC
	SBC &03C1
	BCS &2C4A
	EOR #&FF
	ADC #&01
.addr2C4A
	LSR A
	STA &83
	LDA &6D
	SEC
	SBC &03C2
	BCS &2C59
	EOR #&FF
	ADC #&01
.addr2C59
	LSR A
	CLC
	ADC &83
	CMP &D1
	BCS &2C70
	STA &D1
	LDX #&05
.addr2C65
	LDA &6C,X
	STA &73,X
	DEX
	BPL &2C65
	LDA &80
	STA &88
.addr2C70
	JSR &2631
	INC &80
	BNE &2C3E
	LDX #&05
.addr2C79
	LDA &73,X
	STA &6C,X
	DEX
	BPL &2C79
	LDA &6D
	STA &03C2
	LDA &6F
	STA &03C1
	SEC
	SBC &0359
	BCS &2C94
	EOR #&FF
	ADC #&01
.addr2C94
	JSR &21C0
	STA &41
	LDA &1B
	STA &40
	LDA &03C2
	SEC
	SBC &035A
	BCS &2CAA
	EOR #&FF
	ADC #&01
.addr2CAA
	LSR A
	JSR &21C0
	PHA
	LDA &1B
	CLC
	ADC &40
	STA &81
	PLA
	ADC &41
	STA &82
	JSR &3F3E
	LDA &81
	ASL A
	LDX #&00
	STX &03C0
	ROL &03C0
	ASL A
	ROL &03C0
	STA &03BF
	JMP &279F
	LDA &2F
	ORA &8E
	BNE &2D4E
	JSR &3C91
	BMI &2D27
	LDA &87
	BEQ &2D21
	AND #&C0
	BEQ &2D4E
	JSR &30D8
.addr2CE9
	LDA &03BF
	ORA &03C0
	BEQ &2D4E
	LDA #&07
	STA &2C
	LDA #&16
	STA &2D
	LDA #&00
	STA &72
	LDA #&BD
	JSR &31AC
	LDA &03C0
	BNE &2D82
	LDA &0365
	CMP &03BF
	BCC &2D82
	LDA #&2D
	JSR &31AC
	JSR &3119
.addr2D17
	LDA #&0F
	STA &2F
	STA &2E
	TAX
	JMP &2D75
.addr2D21
	JSR &2C33
	JMP &2CE9
.addr2D27
	LDX &0385
	BEQ &2D74
	INX
	STX &0385
	STX &038C
	JSR &2D17
	LDX #&05
	INC &0367
	LDA &0367
	AND #&07
	STA &0367
.addr2D43
	LDA &035B,X
	ASL A
	ROL &035B,X
	DEX
	BPL &2D43
	LDA #&60
	STA &03C1
	STA &03C2
	JSR &2E92
	JSR &2C33
	LDX #&00
	STX &03BF
	STX &03C0
	LDA #&74
	JSR &3D82
.addr2D68
	LDA &03C1
	STA &0359
	LDA &03C2
	STA &035A
.addr2D74
	RTS
.addr2D75
	LDY #&01
	STY &2C
	STY &2D
	DEY
.addr2D7C
	CLC
.addr2D7D
	LDA #&05
	JMP &1BC4
.addr2D82
	LDA #&CA
.addr2D84
	JSR &31AC
	LDA #&3F
	JMP &31AC
.addr2D8C
	PHA
	STA &77
	ASL A
	ASL A
	STA &73
	LDA #&01
	STA &2C
	PLA
	ADC #&D0
	JSR &31AC
	LDA #&0E
	STA &2C
	LDX &73
	LDA &3DA7,X
	STA &74
	LDA &039E
	AND &3DA9,X
	CLC
	ADC &3DA6,X
	STA &03AA
	JSR &2DF8
	JSR &2E51
	LDA &74
	BMI &2DC7
	LDA &03AA
	ADC &76
	JMP &2DCD
.addr2DC7
	LDA &03AA
	SEC
	SBC &76
.addr2DCD
	STA &03AA
	STA &1B
	LDA #&00
	JSR &2EF2
	SEC
	JSR &2D7D
	LDY &77
	LDA #&05
	LDX &038D,Y
	STX &03AB
	CLC
	BEQ &2DEE
	JSR &1BC2
	JMP &2DF8
.addr2DEE
	LDA &2C
	ADC #&04
	STA &2C
	LDA #&2D
	BNE &2E07
.addr2DF8
	LDA &74
	AND #&60
	BEQ &2E0A
	CMP #&20
	BEQ &2E11
	JSR &2E16
.addr2E05
	LDA #&20
.addr2E07
	JMP &31AC
.addr2E0A
	LDA #&74
	JSR &1C8F
	BCC &2E05
.addr2E11
	LDA #&6B
	JSR &1C8F
.addr2E16
	LDA #&67
	JMP &1C8F
.addr2E1B
	LDA #&11
	STA &2C
	LDA #&FF
	BNE &2E07
.addr2E23
	LDA #&10
	JSR &2537
	LDA #&05
	STA &2C
	LDA #&A7
	JSR &18F2
	LDA #&03
	STA &2D
	JSR &2E1B
	LDA #&00
	STA &03AD
.addr2E3D
	LDX #&80
	STX &72
	JSR &2D8C
	INC &2D
	INC &03AD
	LDA &03AD
	CMP #&11
	BCC &2E3D
	RTS
.addr2E51
	LDA &74
	AND #&1F
	LDY &03AC
	STA &75
	CLC
	LDA #&00
	STA &039D
.addr2E60
	DEY
	BMI &2E68
	ADC &75
	JMP &2E60
.addr2E68
	STA &76
	RTS
.addr2E6B
	JSR &2C33
	JSR &2D68
	LDX #&05
.addr2E73
	LDA &6C,X
	STA &03B2,X
	DEX
	BPL &2E73
	INX
	STX &0349
	LDA &03B8
	STA &03AC
	LDA &03BA
	STA &03AF
	LDA &03B9
	STA &03AE
	RTS
.addr2E92
	LDX #&3F
.addr2E94
	LDA &14A1,X
	STA &0880,X
	DEX
	BPL &2E94
	JSR &0D7A
	LDX #&2EFC MOD 256
	LDY #&2EFC DIV 256
	JMP oscli
.addr2EA7
	STX &06
	LDA &0364
	SEC
	SBC &06
	STA &0364
	STY &06
	LDA &0363
	SBC &06
	STA &0363
	LDA &0362
	SBC #&00
	STA &0362
	LDA &0361
	SBC #&00
	STA &0361
	BCS &2EEE
.addr2ECE
	TXA
	CLC
	ADC &0364
	STA &0364
	TYA
	ADC &0363
	STA &0363
	LDA &0362
	ADC #&00
	STA &0362
	LDA &0361
	ADC #&00
	STA &0361
	CLC
.addr2EEE
	RTS
.addr2EEF
	JSR &21D3
.addr2EF2
	ASL &1B
	ROL A
	ASL &1B
	ROL A
	TAY
	LDX &1B
	RTS

.str_run_d_code
	EQUS "R.D.CODE", &0D

.addr2F05
	JMP &38B0
.addr2F08
	LDA #&20
	JSR &2537
	JSR &18EC
	LDA #&0C
	STA &2C
	LDA #&CF
	JSR &2690
	LDA #&B9
	JSR &18F2
	LDA #&80
	STA &72
	INC &2D
	LDA &03AF
	CLC
	ADC #&03
	CMP #&0C
	BCC &2F30
	LDA #&0E
.addr2F30
	STA &81
	STA &03AB
	INC &81
	LDA #&46
	SEC
	SBC &0365
	ASL A
	STA &1AD0
	LDX #&01
.addr2F43
	STX &89
	JSR &2683
	LDX &89
	CLC
	JSR &1BC0
	JSR &2E05
	LDA &89
	CLC
	ADC #&68
	JSR &31AC
	LDA &89
	JSR &3086
	SEC
	LDA #&19
	STA &2C
	LDA #&06
	JSR &1BC4
	LDX &89
	INX
	CPX &81
	BCC &2F43
	JSR &25A3
	LDA #&7F
	JSR &2D84
	JSR &29AF
	BEQ &2F05
	BCS &2F05
	SBC #&00
	LDX #&02
	STX &2C
	INC &2D
	PHA
	JSR &3076
	PLA
	BNE &2F92
	LDX #&46
	STX &0365
.addr2F92
	CMP #&01
	BNE &2FA6
	LDX &038B
	INX
	LDY #&7C
	CPX #&05
	BCS &2FE8
	STX &038B
	JSR &36ED
.addr2FA6
	LDY #&6B
	CMP #&02
	BNE &2FB6
	LDX #&25
	CPX &036E
	BEQ &2FE8
	STX &036E
.addr2FB6
	CMP #&03
	BNE &2FC3
	INY
	LDX &0380
	BNE &2FE8
	DEC &0380
.addr2FC3
	CMP #&04
	BNE &2FD1
	JSR &3093
	LDA #&0F
	JSR &30E9
	LDA #&04
.addr2FD1
	CMP #&05
	BNE &2FDD
	JSR &3093
	LDA #&8F
	JSR &30E9
.addr2FDD
	LDY #&6F
	CMP #&06
	BNE &3003
	LDX &0381
	BEQ &3000
.addr2FE8
	STY &40
	JSR &3089
	JSR &2ECE
	LDA &40
	JSR &2690
	LDA #&1F
	JSR &31AC
.addr2FFA
	JSR &306E
	JMP &38B0
.addr3000
	DEC &0381
.addr3003
	INY
	CMP #&07
	BNE &3010
	LDX &0386
	BNE &2FE8
	DEC &0386
.addr3010
	INY
	CMP #&08
	BNE &301F
	LDX &0382
	BNE &2FE8
	LDX #&7F
	STX &0382
.addr301F
	INY
	CMP #&09
	BNE &302C
	LDX &0383
	BNE &2FE8
	INC &0383
.addr302C
	INY
	CMP #&0A
	BNE &3039
	LDX &0384
	BNE &2FE8
	DEC &0384
.addr3039
	INY
	CMP #&0B
	BNE &3046
	LDX &0385
	BNE &2FE8
	DEC &0385
.addr3046
	INY
	CMP #&0C
	BNE &3053
	JSR &3093
	LDA #&97
	JSR &30E9
.addr3053
	INY
	CMP #&0D
	BNE &3060
	JSR &3093
	LDA #&32
	JSR &30E9
.addr3060
	JSR &3066
	JMP &2F08
.addr3066
	JSR &2E05
	LDA #&77
	JSR &2690
.addr306E
	JSR &3C43
	LDY #&32
	JMP &259C
.addr3076
	JSR &3089
	JSR &2EA7
	BCS &3092
	LDA #&C5
	JSR &2D84
	JMP &2FFA
.addr3086
	SEC
	SBC #&01
.addr3089
	ASL A
	TAY
	LDX &1AD0,Y
	LDA &1AD1,Y
	TAY
.addr3092
	RTS
.addr3093
	LDA &03AF
	CMP #&08
	BCC &309F
	LDA #&20
	JSR &2537
.addr309F
	LDY #&10
	STY &2D
.addr30A3
	LDX #&0C
	STX &2C
	TYA
	CLC
	ADC #&20
	JSR &2690
	LDA &2D
	CLC
	ADC #&50
	JSR &31AC
	INC &2D
	LDY &2D
	CPY #&14
	BCC &30A3
	JSR &25A3
.addr30C1
	LDA #&AF
	JSR &2D84
	JSR &3D5F
	SEC
	SBC #&30
	CMP #&04
	BCC &30D6
	JSR &25A3
	JMP &30C1
.addr30D6
	TAX
	RTS
.addr30D8
	JSR &2B23
	JSR &2C33
	JSR &2B23
	JMP &25A3
.addr30E4
	LDY #&BB
	JMP &2FE8
.addr30E9
	STA &06
	LDA &0368,X
	BEQ &3113
	CMP &06
	BEQ &30E4
	LDY #&04
	CMP #&0F
	BEQ &3108
	LDY #&05
	CMP #&8F
	BEQ &3108
	LDY #&0C
	CMP #&97
	BEQ &3108
	LDY #&0D
.addr3108
	STX &88
	TYA
	JSR &3089
	JSR &2ECE
	LDX &88
.addr3113
	LDA &06
	STA &0368,X
	RTS
.addr3119
	LDX #&05
.addr311B
	LDA &6C,X
	STA &73,X
	DEX
	BPL &311B
	LDY #&03
	BIT &6C
	BVS &3129
	DEY
.addr3129
	STY &D1
.addr312B
	LDA &71
	AND #&1F
	BEQ &3136
	ORA #&80
	JSR &31AC
.addr3136
	JSR &2637
	DEC &D1
	BPL &312B
	LDX #&05
.addr313F
	LDA &73,X
	STA &6C,X
	DEX
	BPL &313F
	RTS
.addr3147
	JSR &1429
	LDY #&00
.addr314C
	LDA &1181,Y
	CMP #&0D
	BEQ &3159
	JSR &1C8F
	INY
	BNE &314C
.addr3159
	RTS
.addr315A
	JSR &3160
	JSR &3119
.addr3160
	LDX #&05
.addr3162
	LDA &6C,X
	LDY &03B2,X
	STA &03B2,X
	STY &6C
	DEX
	BPL &3162
	RTS
.addr3170
	CLC
	LDX &0367
	INX
	JMP &1BC0
.addr3178
	LDA #&69
	JSR &31A7
	LDX &0365
	SEC
	JSR &1BC0
	LDA #&C3
	JSR &31A1
	LDA #&77
	BNE &31AC
.addr318D
	LDX #&03
.addr318F
	LDA &0361,X
	STA &40,X
	DEX
	BPL &318F
	LDA #&09
	STA &80
	SEC
	JSR &1BD0
	LDA #&E2
.addr31A1
	JSR &31AC
	JMP &2683
.addr31A7
	JSR &31AC
.addr31AA
	LDA #&3A
.addr31AC
	TAX
	BEQ &318D
	BMI &3225
	DEX
	BEQ &3170
	DEX
	BEQ &315A
	DEX
	BNE &31BD
	JMP &3119
.addr31BD
	DEX
	BEQ &3147
	DEX
	BEQ &3178
	DEX
	BNE &31CB
	LDA #&80
	STA &72
	RTS
.addr31CB
	DEX
	DEX
	BNE &31D2
	STX &72
	RTS
.addr31D2
	DEX
	BEQ &320D
	CMP #&60
	BCS &323F
	CMP #&0E
	BCC &31E1
	CMP #&20
	BCC &3209
.addr31E1
	LDX &72
	BEQ &3222
	BMI &31F8
	BIT &72
	BVS &321B
.addr31EB
	CMP #&41
	BCC &31F5
	CMP #&5B
	BCS &31F5
	ADC #&20
.addr31F5
	JMP &1C8F
.addr31F8
	BIT &72
	BVS &3213
	CMP #&41
	BCC &3222
	PHA
	TXA
	ORA #&40
	STA &72
	PLA
	BNE &31F5
.addr3209
	ADC #&72
	BNE &323F
.addr320D
	LDA #&15
	STA &2C
	BNE &31AA
.addr3213
	CPX #&FF
	BEQ &327A
	CMP #&41
	BCS &31EB
.addr321B
	PHA
	TXA
	AND #&BF
	STA &72
	PLA
.addr3222
	JMP &1C8F
.addr3225
	CMP #&A0
	BCS &323D
	AND #&7F
	ASL A
	TAY
	LDA &14A1,Y
	JSR &31AC
	LDA &14A2,Y
	CMP #&3F
	BEQ &327A
	JMP &31AC
.addr323D
	SBC #&A0
.addr323F
	TAX
	LDA #&00
	STA &22
	LDA #&04
	STA &23
	LDY #&00
	TXA
	BEQ &3260
.addr324D
	LDA (&22),Y
	BEQ &3258
	INY
	BNE &324D
	INC &23
	BNE &324D
.addr3258
	INY
	BNE &325D
	INC &23
.addr325D
	DEX
	BNE &324D
.addr3260
	TYA
	PHA
	LDA &23
	PHA
	LDA (&22),Y
	EOR #&23
	JSR &31AC
	PLA
	STA &23
	PLA
	TAY
	INY
	BNE &3276
	INC &23
.addr3276
	LDA (&22),Y
	BNE &3260
.addr327A
	RTS
	LDA &65
	ORA #&A0
	STA &65
	RTS
.addr3282
	RTS
.addr3283
	LDX #&00
.addr3285
	LDA &0311,X
	BEQ &32A8
	BMI &32A5
	JSR &32ED
	LDY #&1F
.addr3291
	LDA (&20),Y
	STA &0046,Y
	DEY
	BPL &3291
	STX &84
	LDX &84
	LDY #&1F
	LDA (&20),Y
	AND #&A7
	STA (&20),Y
.addr32A5
	INX
	BNE &3285
.addr32A8
	LDX #&FF
	STX &0EC0
	STX &0F0E
.addr32B0
	LDY #&BF
	LDA #&00
.addr32B4
	STA &0E00,Y
	DEY
	BNE &32B4
	DEY
	STY &0E00
	RTS
	LDA #&06
	SEI
	STA crtc_register
	STX crtc_data
	CLI
	RTS
.addr32CA
	DEX
	RTS
	INX
	BEQ &32CA
	DEC &03A7
	PHP
	BNE &32D8
	INC &03A7
.addr32D8
	PLP
	RTS
.addr32DA
	LDA &0901,X
	STA &D2,X
	LDA &0902,X
	TAY
	AND #&7F
	STA &D3,X
	TYA
	AND #&80
	STA &D4,X
	RTS
.addr32ED
	TXA
	ASL A
	TAY
	LDA &1741,Y
	STA &20
	LDA &1742,Y
	STA &21
	RTS
.addr32FB
	STA &D1
	LDX #&00
.addr32FF
	LDA &0311,X
	BEQ &330B
	INX
	CPX #&0C
	BCC &32FF
	CLC
.addr330A
	RTS
.addr330B
	JSR &32ED
	LDA &D1
	BMI &3362
	ASL A
	TAY
	LDA &55FE,Y
	STA &1E
	LDA &55FF,Y
	STA &1F
	CPY #&04
	BEQ &3352
	LDY #&05
	LDA (&1E),Y
	STA &06
	LDA &03B0
	SEC
	SBC &06
	STA &67
	LDA &03B1
	SBC #&00
	STA &68
	LDA &67
	SBC &20
	TAY
	LDA &68
	SBC &21
	BCC &330A
	BNE &3348
	CPY #&25
	BCC &330A
.addr3348
	LDA &67
	STA &03B0
	LDA &68
	STA &03B1
.addr3352
	LDY #&0E
	LDA (&1E),Y
	STA &69
	LDY #&13
	LDA (&1E),Y
	AND #&07
	STA &65
	LDA &D1
.addr3362
	STA &0311,X
	TAX
	BMI &336B
	INC &031E,X
.addr336B
	LDY #&24
.addr336D
	LDA &0046,Y
	STA (&20),Y
	DEY
	BPL &336D
	SEC
	RTS
	LDA &46,X
	EOR #&80
	STA &46,X
	INX
	INX
	RTS
	LDX #&FF
	STX &45
	LDX &038B
	JSR &33A7
	STY &0344
	RTS
	LDA #&C0
	LDX #font_spacestation MOD 256
	LDY #font_spacestation DIV 256
	STA &07
	STX &1C
	STY &1D
	LDA #&7D
	JMP &1DC8

.font_spacestation
	EQUB &E0, &E0, &80, &E0, &E0, &20, &E0, &E0

.addr33A7
	TXA
	ASL A
	ASL A
	ASL A
	STA &D1
	LDA #&31
	SBC &D1
	STA &07
	LDA #&7E
	STA &08
	TYA
	LDY #&05
.addr33BA
	STA (&07),Y
	DEY
	BNE &33BA
	RTS
.addr33C0
	TXA
	EOR #&FF
	CLC
	ADC #&01
	TAX
.addr33C7
	LDA #&FF
	BNE &340E
.addr33CB
	LDA #&01
	STA &0E00
	JSR &35B7
	LDA #&00
	LDX &40
	CPX #&60
	ROL A
	CPX #&28
	ROL A
	CPX #&10
	ROL A
	STA &93
	LDA #&BF
	LDX &1D
	BNE &33F2
	CMP &1C
	BCC &33F2
	LDA &1C
	BNE &33F2
	LDA #&01
.addr33F2
	STA &8F
	LDA #&BF
	SEC
	SBC &E0
	TAX
	LDA #&00
	SBC &E1
	BMI &33C0
	BNE &340A
	INX
	DEX
	BEQ &33C7
	CPX &40
	BCC &340E
.addr340A
	LDX &40
	LDA #&00
.addr340E
	STX &22
	STA &23
	LDA &40
	JSR &21C0
	STA &9C
	LDA &1B
	STA &9B
	LDY #&BF
	LDA &28
	STA &26
	LDA &29
	STA &27
.addr3427
	CPY &8F
	BEQ &3436
	LDA &0E00,Y
	BEQ &3433
	JSR &1909
.addr3433
	DEY
	BNE &3427
.addr3436
	LDA &22
	JSR &21C0
	STA &D1
	LDA &9B
	SEC
	SBC &1B
	STA &81
	LDA &9C
	SBC &D1
	STA &82
	STY &35
	JSR &3F3E
	LDY &35
	JSR &3736
	AND &93
	CLC
	ADC &81
	BCC &345D
	LDA #&FF
.addr345D
	LDX &0E00,Y
	STA &0E00,Y
	BEQ &34AF
	LDA &28
	STA &26
	LDA &29
	STA &27
	TXA
	JSR &3586
	LDA &34
	STA &24
	LDA &36
	STA &25
	LDA &D2
	STA &26
	LDA &D3
	STA &27
	LDA &0E00,Y
	JSR &3586
	BCS &3494
	LDA &36
	LDX &24
	STX &36
	STA &24
	JSR &1913
.addr3494
	LDA &24
	STA &34
	LDA &25
	STA &36
.addr349C
	JSR &1913
.addr349F
	DEY
	BEQ &34E1
	LDA &23
	BNE &34C3
	DEC &22
	BNE &3436
	DEC &23
.addr34AC
	JMP &3436
.addr34AF
	LDX &D2
	STX &26
	LDX &D3
	STX &27
	JSR &3586
	BCC &349C
	LDA #&00
	STA &0E00,Y
	BEQ &349F
.addr34C3
	LDX &22
	INX
	STX &22
	CPX &40
	BCC &34AC
	BEQ &34AC
	LDA &28
	STA &26
	LDA &29
	STA &27
.addr34D6
	LDA &0E00,Y
	BEQ &34DE
	JSR &1909
.addr34DE
	DEY
	BNE &34D6
.addr34E1
	CLC
	LDA &D2
	STA &28
	LDA &D3
	STA &29
	RTS
	LDA #&00
	STA &0EC0
	LDX &40
	LDA #&08
	CPX #&08
	BCC &34FE
	LSR A
	CPX #&3C
	BCC &34FE
	LSR A
.addr34FE
	STA &95
.addr3500
	LDX #&FF
	STX &92
	INX
	STX &93
.addr3507
	LDA &93
	JSR &21F0
	LDX #&00
	STX &D1
	LDX &93
	CPX #&21
	BCC &3523
	EOR #&FF
	ADC #&00
	TAX
	LDA #&FF
	ADC #&00
	STA &D1
	TXA
	CLC
.addr3523
	ADC &D2
	STA &76
	LDA &D3
	ADC &D1
	STA &77
	LDA &93
	CLC
	ADC #&10
	JSR &21F0
	TAX
	LDA #&00
	STA &D1
	LDA &93
	ADC #&0F
	AND #&3F
	CMP #&21
	BCC &3551
	TXA
	EOR #&FF
	ADC #&00
	TAX
	LDA #&FF
	ADC #&00
	STA &D1
	CLC
.addr3551
	JSR &1A16
	CMP #&41
	BCS &355B
	JMP &3507
.addr355B
	CLC
	RTS

	LDA #&01
	STA &6B
	LDA #&FF
	STA &0EC0
	RTS
	LDA &0E00
	BMI &35AE
	LDA &28
	STA &26
	LDA &29
	STA &27
	LDY #&BF
.addr3576
	LDA &0E00,Y
	BEQ &357E
	JSR &1909
.addr357E
	DEY
	BNE &3576
.addr3581
	DEY
	STY &0E00
	RTS
.addr3586
	STA &D1
	CLC
	ADC &26
	STA &36
	LDA &27
	ADC #&00
	BMI &35B0
	BEQ &3599
	LDA #&FE
	STA &36
.addr3599
	LDA &26
	SEC
	SBC &D1
	STA &34
	LDA &27
	SBC #&00
	BNE &35A8
	CLC
	RTS
.addr35A8
	BPL &35B0
	LDA #&02
	STA &34
.addr35AE
	CLC
	RTS
.addr35B0
	LDA #&00
	STA &0E00,Y
.addr35B5
	SEC
	RTS
.addr35B7
	LDA &D2
	CLC
	ADC &40
	LDA &D3
	ADC #&00
	BMI &35B5
	LDA &D2
	SEC
	SBC &40
	LDA &D3
	SBC #&00
	BMI &35CF
	BNE &35B5
.addr35CF
	LDA &E0
	CLC
	ADC &40
	STA &1C
	LDA &E1
	ADC #&00
	BMI &35B5
	STA &1D
	LDA &E0
	SEC
	SBC &40
	TAX
	LDA &E1
	SBC #&00
	BMI &35AE
	BNE &35B5
	CPX #&BF
	RTS
.addr35EF
	JSR &3CF0
	LDA &03CD
	BEQ &361C
	LDA &034C
	EOR #&FF
	JSR &3604
	TYA
	TAX
	LDA &034D
.addr3604
	TAY
	LDA #&00
	CPY #&10
	SBC #&00
	CPY #&40
	SBC #&00
	CPY #&C0
	ADC #&00
	CPY #&E0
	ADC #&00
	TAY
	LDA &0300
	RTS
.addr361C
	LDA &0300
	LDX #&00
	LDY #&00
	CMP #&19
	BNE &3628
	DEX
.addr3628
	CMP #&79
	BNE &362D
	INX
.addr362D
	CMP #&39
	BNE &3632
	INY
.addr3632
	CMP #&29
	BNE &3637
	DEY
.addr3637
	STX &D1
	LDX #&00
	JSR &3C93
	BPL &3648
	ASL &D1
	ASL &D1
	TYA
	ASL A
	ASL A
	TAY
.addr3648
	LDX &D1
	LDA &0300
	RTS
.addr364E
	LDX #&01
.addr3650
	LDA &0359,X
	STA &03C1,X
	DEX
	BPL &3650
.addr3659
	RTS

.tbl_sounddata
	EQUD &10000112                  ; Laser you fired  Flush2 uses Envelope #1 Acc= 0
	EQUD &082C0212                  ; Laset hit you    Flush2 uses Envelope #2 Acc= 4
	EQUD &18F00311                  ; Death_initial    Flush1 uses Envelope #3 Acc= 8
	EQUD &1A07F110                  ; Death_later or   Kill Flush07            Acc=12
	EQUD &01BCF103                  ; Beep, high short NoFlush3                Acc=16
	EQUD &080CF413                  ; Beep, low long   Flush3                  Acc=20
	EQUD &0C06F110                  ; Missile/Launch   Flush06                 Acc=24
	EQUD &10600210                  ; Hyperspace       Flush0 uses Envelope #2 Acc=28
	EQUD &FFC20413                  ; ECM_ON           Flush3 uses Envelope #4 Acc=32
	EQUD &00000013                  ; ECM_OFF                                  Acc=36

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr3682
	JSR &39EE
	LDX #&06
.addr3687
	STA &2A,X
	DEX
	BPL &3687
	TXA
	STA &8E
	LDX #&02
.addr3691
	STA &03A5,X
	DEX
	BPL &3691
.addr3697
	LDA #&12
	STA &03C3
	LDX #&FF
	STX &0EC0
	STX &0F0E
	STX &45
	LDA #&80
	STA &034D
	STA &32
	STA &7B
	ASL A
	STA &33
	STA &7C
	STA &8A
	LDA #&03
	STA &7D
	STA &8D
	STA &31
	LDA &30
	BEQ &36C5
	JSR &3C2F
.addr36C5
	JSR &3283
	JSR &39EE
	LDA #&FF
	STA &03B0
	LDA #&0C
	STA &03B1
	JSR &1DE5
.addr36D8
	LDY #&24
	LDA #&00
.addr36DC
	STA &0046,Y
	DEY
	BPL &36DC
	LDA #&60
	STA &58
	STA &5C
	ORA #&80
	STA &54
	RTS
.addr36ED
	LDX #&04
.addr36EF
	CPX &038B
	BEQ &36FD
	LDY #&00
	JSR &33A7
	DEX
	BNE &36EF
	RTS
.addr36FD
	LDY #&EE
	JSR &33A7
	DEX
	BNE &36FD
	RTS
.addr3706
	LDA &03A4
	JSR &3D82
	LDA #&00
	STA &034A
	JMP &3754
	JSR &36D8
	JSR &3736
	STA &06
	AND #&80
	STA &48
	TXA
	AND #&80
	STA &4B
	LDA #&19
	STA &47
	STA &4A
	STA &4D
	TXA
	CMP #&F5
	ROL A
	ORA #&C0
	STA &66
	CLC
.addr3736
	LDA &00
	ROL A
	TAX
	ADC &02
	STA &00
	STX &02
	LDA &01
	TAX
	ADC &03
	STA &01
	STX &03
	RTS
.addr374A
	DEC &034A
	BEQ &3706
	BPL &3754
	INC &034A
.addr3754
	DEC &8A
	BEQ &375B
.addr3758
	JMP &3789
.addr375B
	LDA &0341
	BNE &3758
	JSR &3736
	CMP #&23
	BCS &3789
	LDA &0325
	CMP #&03
	BCS &3789
	JSR &36D8
	LDA #&26
	STA &4D
	JSR &3736
	STA &46
	STX &49
	AND #&80
	STA &48
	TXA
	AND #&80
	STA &4B
	ROL &47
	ROL &47
.addr3789
	LDX #&FF
	TXS
	LDX &0347
	BEQ &3794
	DEC &0347
.addr3794
	JSR &1DE5
	LDA &87
	BEQ &37A0
	LDY #&02
	JSR &259C
.addr37A0
	JSR &35EF
.addr37A3
	JSR &37AD
	LDA &8E
	BNE &3789
	JMP &374A
.addr37AD
	CMP #&76
	BNE &37B4
	JMP &1AFF
.addr37B4
	CMP #&14
	BNE &37BB
	JMP &2812
.addr37BB
	CMP #&74
	BNE &37C2
	JMP &2B7C
.addr37C2
	CMP #&75
	BNE &37CC
	JSR &2C33
	JMP &2696
.addr37CC
	CMP #&77
	BNE &37D3
	JMP &2AB8
.addr37D3
	CMP #&16
	BNE &37DA
	JMP &2E23
.addr37DA
	CMP #&20
	BNE &37E1
	JMP &2E92
.addr37E1
	CMP #&73
	BNE &37E8
	JMP &2F08
.addr37E8
	CMP #&71
	BNE &37EF
	JMP &2904
.addr37EF
	CMP #&47
	BNE &37FE
	JSR &3A86
	BCC &37FB
	JMP &389D
.addr37FB
	JMP &38B0
.addr37FE
	CMP #&72
	BNE &3805
	JMP &2A19
.addr3805
	CMP #&54
	BNE &3815
	JSR &25A3
	LDA #&0F
	STA &2C
	LDA #&CD
	JMP &12CE
.addr3815
	CMP #&32
	BEQ &3845
	CMP #&43
	BNE &3826
	LDA &87
	AND #&C0
	BEQ &3844
	JMP &1F41
.addr3826
	STA &06
	LDA &87
	AND #&C0
	BEQ &3844
	LDA &2F
	BNE &3844
	LDA &06
	CMP #&36
	BNE &3841
	JSR &2B23
	JSR &364E
	JSR &2B23
.addr3841
	JSR &2AF6
.addr3844
	RTS
.addr3845
	LDA &87
	AND #&C0
	BEQ &3844
	JSR &30D8
	STA &72
	JSR &3119
	LDA #&80
	STA &72
	LDA #&01
	STA &2C
	INC &2D
	JMP &265E
	LDA &0372
	CLC
	ADC &0375
	ASL A
	ADC &0379
	RTS
	BRK
	DEC &386C
	BNE &3885
	JSR &3697
.addr3875
	JSR &12A6
	LDX #&0A
	LDA #&00
.addr387C
	STA &03C5,X
	DEX
	BPL &387C
.addr3882
	LDX #&FF
	TXS
.addr3885
	LDX #&03
	STX &2C
	JSR &3B84
	LDX #&0B
	LDA #&06
	JSR &38E1
	CMP #&44
	BNE &389D
	JSR &38B9
	JSR &3A86
.addr389D
	JSR &38B9
	JSR &36ED
	LDA #&07
	LDX #&13
	JSR &38E1
	JSR &364E
	JSR &2E6B
.addr38B0
	LDA #&FF
	STA &8E
	LDA #&76
	JMP &37A3
.addr38B9
	LDX #&53
.addr38BB
	LDA &1180,X
	STA &034F,X
	DEX
	BNE &38BB
	STX &87
.addr38C6
	JSR &3984
	CMP &11D4
	BNE &38C6
	EOR #&A9
	TAX
	LDA &0366
	CPX &11D3
	BEQ &38DB
	ORA #&80
.addr38DB
	ORA #&04
	STA &0366
	RTS
.addr38E1
	PHA
	STX &8C
	JSR &3682
	LDA #&01
	JSR &2537
	DEC &87
	LDA #&60
	STA &54
	LDA &9F
	CMP #&DB
	BEQ &3902
	LDA #&10
	STA &36B8
	LDA #&FE
	STA &36B9
.addr3902
	STA &4D
	LDX #&7F
	STX &63
	STX &64
	INX
	STX &72
	LDA &8C
	JSR &32FB
	LDY #&06
	STY &2C
	LDA #&1E
	JSR &31A1
	LDY #&06
	STY &2C
	INC &2D
	LDA &03C9
	BEQ &392B
	LDA #&0D
	JSR &12CE
.addr392B
	LDA &386C
	BEQ &3945
	INC &386C
	LDA #&07
	STA &2C
	LDA #&0A
	STA &2D
	LDY #&00
.addr393D
	JSR oswrch
	INY
	LDA (&FD),Y
	BNE &393D
.addr3945
	JSR &25A3
	STY &7D
	STY &03CD
	PLA
	JSR &12CE
	LDA #&0C
	LDX #&07
	STX &2C
	JSR &12CE
.addr395A
	LDA &4D
	CMP #&01
	BEQ &3962
	DEC &4D
.addr3962
	JSR addr14E1
	LDA #&80
	STA &4C
	ASL A
	STA &46
	STA &49
	JSR &400F
	DEC &8A
	LDA systemvia_irb
	AND #&10
	BEQ &3980
	JSR &3C20
	BEQ &395A
	RTS
.addr3980
	DEC &03CD
	RTS
.addr3984
	LDX #&49
	CLC
	TXA
.addr3988
	ADC &1188,X
	EOR &1189,X
	DEX
	BNE &3988
	RTS
.addr3992
	LDX #&07
.addr3994
	LDA &4B,X
	STA &1181,X
	DEX
	BPL &3994
.addr399C
	LDX #&07
.addr399E
	LDA &1181,X
	STA &4B,X
	DEX
	BPL &399E
	RTS
.addr39A7
	LDY #&08
	JSR &259C
.addr39AC
	LDX #&04
.addr39AE
	LDA &117C,X
	STA &46,X
	DEX
	BPL &39AE
	LDA #&07
	STA &39EB
	LDA #&08
	JSR &12CE
	JSR &39CC
	LDA #&09
	STA &39EB
	TYA
	BEQ &399C
	RTS
.addr39CC
	LDA #%10000001
	STA systemvia_ier
	JSR &18EC
	LDX #osword00_ctrlblock MOD 256
	LDY #osword00_ctrlblock DIV 256
	LDA #&00
	JSR osword
	BCC &39E1
	LDY #&00
.addr39E1
	LDA #%00000001
	STA systemvia_ier
	JMP &1C8A

.osword00_ctrlblock
	EQUW &004B                      ; inkw+5
	EQUB &09                        ; Max length
	EQUB &21                        ; Min ASCII value
	EQUB &7B                        ; Max ASCII value

.addr39EE
	LDX #&3A
	LDA #&00
.addr39F2
	STA &0311,X
	DEX
	BPL &39F2
	RTS
.addr39F9
	LDX #&0C
	JSR &39FF
	DEX
.addr39FF
	LDY #&00
	STY &07
.addr3A03
	LDA #&00
	STX &08
.addr3A07
	STA (&07),Y
	INY
	BNE &3A07
	RTS

.str_cat_0
	EQUS".0", &0D

.str_delete
	EQUS "DE.:0.E.1234567", &0D

.addr3A20
	JSR &3B2F
	BCS &3A42
	STA &3A0E
	STA &1C8E
	LDA #&04
	JSR &12CE
	LDA #&01
	STA &03CF
	STA &2C
	LDX #str_cat_0 MOD 256
	LDY #str_cat_0 DIV 256
	JSR oscli
	DEC &03CF
	CLC
.addr3A42
	RTS
.addr3A43
	JSR &3A20
	BCS &3A86
	LDA &3A0E
	STA &3A14                       ; Drive number
	LDA #&09
	JSR &12CE
	JSR &39CC
	TYA
	BEQ &3A86
	LDX #&09
.addr3A5B
	LDA &4A,X
	STA &3A15,X                     ; Filename
	DEX
	BNE &3A5B
	LDX #str_delete MOD 256
	LDY #str_delete DIV 256
	JSR oscli
	JMP &3A86
	BRK
	LDX &3A6D
	TXS
	LDY #&00
	LDA #&07
.addr3A76
	JSR oswrch
	INY
	LDA (&FD),Y
	BNE &3A76
	BEQ &3A83
.addr3A80
	JSR &3A20
.addr3A83
	JSR &3D61
.addr3A86
	JSR &39F9
	TSX
	STX &3A6D
	LDA #&6E
	STA &11EF
	LDA #&3A
	STA &11F0
	LDA #&01
	JSR &12CE
	JSR &3D61
	CMP #&31
	BCC &3B14
	CMP #&34
	BEQ &3A43
	BCS &3B14
	CMP #&32
	BCS &3AB9
	JSR &39A7
	JSR &3B48
	JSR &3992
	SEC
	BCS &3B15
.addr3AB9
	BNE &3A80
	JSR &39A7
	JSR &3992
	LSR &03A1
	LDA #&03
	JSR &12CE
	LDX #&4B
.addr3ACB
	LDA &0358,X
	STA &0B00,X
	STA &1189,X
	DEX
	BPL &3ACB
	JSR &3984
	STA &11D4
	PHA
	ORA #&80
	STA &40
	EOR &0366
	STA &42
	EOR &0363
	STA &41
	EOR #&5A
	EOR &03A0
	STA &43
	CLC
	JSR &1BD0
	JSR &2683
	PLA
	STA &0B4B
	EOR #&A9
	STA &11D3
	STA &0B4A
	LDY #&0B
	STY &0C0B
	INY
	STY &0C0F
	LDA #&00
	JSR &3B18
.addr3B14
	CLC
.addr3B15
	JMP &12A6
.addr3B18
	PHA
	JSR &3B2F
	STA &47
	PLA
	BCS &3B2E
	LDX #&46
	STX &0C00
	LDX #&00
	LDY #&0C
	JSR osfile
	CLC
.addr3B2E
	RTS
.addr3B2F
	LDA #&02
	JSR &12CE
	JSR &3D61
	ORA #&10
	JSR &1D56
	PHA
	JSR &1C8A
	PLA
	CMP #&30
	BCC &3B6A
	CMP #&34
	RTS
.addr3B48
	JSR &39F9
	LDY #&0B
	STY &0C03
	INC &0C0B
	LDA #&FF
	JSR &3B18
	BCS &3B6A
	LDA &0B00
	BMI err_illegal_elite_file
	LDX #&4B
.addr3B61
	LDA &0B00,X
	STA &1189,X
	DEX
	BPL &3B61
.addr3B6A
	SEC
	RTS

.err_illegal_elite_file
	BRK
	EQUS "Illegal ELITE II file", &00
	
.addr3B84
	LDY #&00
	LDA #&C8
	JMP osbyte
	JSR &39AC
	RTS
	LDX #&00
	JSR &32DA
	LDX #&03
	JSR &32DA
	LDX #&06
	JSR &32DA
	LDA &D2
	ORA &D5
	ORA &D8
	ORA #&01
	STA &DB
	LDA &D3
	ORA &D6
	ORA &D9
.addr3BAE
	ASL &DB
	ROL A
	BCS &3BC1
	ASL &D2
	ROL &D3
	ASL &D5
	ROL &D6
	ASL &D8
	ROL &D9
	BCC &3BAE
.addr3BC1
	LDA &D3
	LSR A
	ORA &D4
	STA &34
	LDA &D6
	LSR A
	ORA &D7
	STA &35
	LDA &D9
	LSR A
	ORA &DA
	STA &36
.addr3BD6
	LDA &34
	JSR &21BE
	STA &82
	LDA &1B
	STA &81
	LDA &35
	JSR &21BE
	STA &D1
	LDA &1B
	ADC &81
	STA &81
	LDA &D1
	ADC &82
	STA &82
	LDA &36
	JSR &21BE
	STA &D1
	LDA &1B
	ADC &81
	STA &81
	LDA &D1
	ADC &82
	STA &82
	JSR &3F3E
	LDA &34
	JSR &3E8C
	STA &34
	LDA &35
	JSR &3E8C
	STA &35
	LDA &36
	JSR &3E8C
	STA &36
.addr3C1F
	RTS
.addr3C20
	LDX #&10
.addr3C22
	JSR &3C93
	BMI &3C2B
	INX
	BPL &3C22
	TXA
.addr3C2B
	EOR #&80
	TAX
	RTS
.addr3C2F
	LDA #&00
	STA &30
	STA &0340
	LDA #&48
	BNE &3C6C
	LDA #&10
	JSR &3C6C
	LDA #&18
	BNE &3C6C
.addr3C43
	LDA #&20
	BNE &3C6C
	INC &039F
	BNE &3C54
	INC &03A0
	LDA #&65
	JSR &3D82
.addr3C54
	LDX #&07
	STX &D1
	LDA #&18
	JSR &3C7D
	LDA &4D
	LSR A
	LSR A
	AND &D1
	ORA #&F1
	STA &0B
	JSR &3C6F
	LDA #&10
.addr3C6C
	JSR &3C7D
.addr3C6F
	LDX &03C6
	BNE &3C1F
	LDX #&09
	LDY #&00
	LDA #&07
	JMP osword
.addr3C7D
	LSR A
	ADC #&03
	TAY
	LDX #&07
.addr3C83
	LDA #&00
	STA &09,X
	DEX
	LDA &365A,Y
	STA &09,X
	DEY
	DEX
	BPL &3C83
.addr3C91
	LDX #&01
.addr3C93
	LDA #&03
	SEI
	STA systemvia_irb
	LDA #&7F
	STA systemvia_ddra
	STX systemvia_ora_nh
	LDX systemvia_ira_nh
	LDA #&0B
	STA systemvia_orb
	CLI
	TXA
	RTS
.addr3CAC
	LDA #&80
	JSR osbyte
	TYA
	EOR &03CC
	RTS
.addr3CB6
	STY &D1
	CPX &D1
	BNE &3CCC
	LDA &0387,X
	EOR #&FF
	STA &0387,X
	JSR &1D54
	JSR &259C
	LDY &D1
.addr3CCC
	RTS
	LDA systemvia_irb
	TAX
	AND #&10
	EOR #&10
	STA &0307
	LDX #&01
	JSR &3CAC
	ORA #&01
	STA &034C
	LDX #&02
	JSR &3CAC
	EOR &03CB
	STA &034D
	JMP &3D0A
.addr3CF0
	LDA &03CD
	BEQ &3D5A
	LDX #&01
	JSR &3CAC
	ORA #&01
	STA &034C
	LDX #&02
	JSR &3CAC
	EOR &03CB
	STA &034D
.addr3D0A
	JSR &3C20
	STX &0300
	CPX #&69
	BNE &3D51
.addr3D14
	JSR &260B
	JSR &3C20
	CPX #&51
	BNE &3D23
	LDA #&00
	STA &03C6
.addr3D23
	LDY #&40
.addr3D25
	JSR &3CB6
	INY
	CPY #&47
	BNE &3D25
	CPX #&10
	BNE &3D34
	STX &03C6
.addr3D34
	CPX #&70
	BNE &3D3B
	JMP &3885
.addr3D3B
	CPX #&64
	BNE &3D4D
	LDA &03CE
	EOR #&FF
	STA &03CE
	STA &03CD
	STA &03CC
.addr3D4D
	CPX #&59
	BNE &3D14
.addr3D51
	LDA &87
	BNE &3D76
	LDY #&10
	LDA #&FF
	RTS
.addr3D5A
	STA &03CE
.addr3D5D
	BEQ &3D0A
.addr3D5F
	STY &85
.addr3D61
	LDY #&02
	JSR &259C
	JSR &3C20
	BNE &3D61
.addr3D6B
	JSR &3C20
	BEQ &3D6B
	TAY
	LDA (&04),Y
	LDY &85
	TAX
.addr3D76
	RTS
.addr3D77
	STX &034A
	PHA
	LDA &03A4
	JSR &3D99
	PLA
.addr3D82
	LDX #&00
	STX &72
	LDY #&09
	STY &2C
	LDY #&16
	STY &2D
	CPX &034A
	BNE &3D77
	STY &034A
	STA &03A4
.addr3D99
	JSR &31AC
	LSR &034B
	BEQ &3D76
	LDA #&FD
	JMP &31AC

.tbl_market_prices                      ; Market prices: base_price, gradient sign+5bits, base_quantity, mask, units 2bits 
	EQUD &01068213                  ; Food         13 82 06 01
	EQUD &030A8114                  ; Textiles     14 81 0A 03
	EQUD &07028341                  ; Radioactives 41 83 02 07 
	EQUD &1FE28528                  ; Slaves       28 85 E2 1F
	EQUD &0FFB8553                  ; Liquor/Wines 53 85 FB 0F
	EQUD &033608C4                  ; Luxuries     C4 08 36 03
	EQUD &78081DEB                  ; Narcotics    EB 1D 08 78
	EQUD &03380E9A                  ; Computers    9A 0E 38 03
	EQUD &07280675                  ; Machinery    75 06 28 07
	EQUD &1F11014E                  ; Alloys       4E 01 11 1F
	EQUD &071D0D7C                  ; Firearms     7C 0D 1D 07
	EQUD &3FDC89B0                  ; Furs         B0 89 DC 3F
	EQUD &03358120                  ; Minerals     20 81 35 03
	EQUD &0742A161                  ; Gold         61 A1 42 07
	EQUD &1F37A2AB                  ; Platinum     AB A2 37 1F
	EQUD &0FFAC12D                  ; Gem-Stones   2D C1 FA 0F
	EQUD &07C00F35                  ; Alien Items  35 0F C0 07

.addr3DEA
	TYA
	LDY #&02
	JSR &3EB9
	STA &5A
	JMP &3E32
.addr3DF5
	TAX
	LDA &35
	AND #&60
	BEQ &3DEA
	LDA #&02
	JSR &3EB9
	STA &58
	JMP &3E32
.addr3E06
	LDA &50
	STA &34
	LDA &52
	STA &35
	LDA &54
	STA &36
	JSR &3BD6
	LDA &34
	STA &50
	LDA &35
	STA &52
	LDA &36
	STA &54
	LDY #&04
	LDA &34
	AND #&60
	BEQ &3DF5
	LDX #&02
	LDA #&00
	JSR &3EB9
	STA &56
.addr3E32
	LDA &56
	STA &34
	LDA &58
	STA &35
	LDA &5A
	STA &36
	JSR &3BD6
	LDA &34
	STA &56
	LDA &35
	STA &58
	LDA &36
	STA &5A
	LDA &52
	STA &81
	LDA &5A
	JSR &2287
	LDX &54
	LDA &58
	JSR &22EC
	EOR #&80
	STA &5C
	LDA &56
	JSR &2287
	LDX &50
	LDA &5A
	JSR &22EC
	EOR #&80
	STA &5E
	LDA &58
	JSR &2287
	LDX &52
	LDA &56
	JSR &22EC
	EOR #&80
	STA &60
	LDA #&00
	LDX #&0E
.addr3E85
	STA &4F,X
	DEX
	DEX
	BPL &3E85
	RTS
.addr3E8C
	TAY
	AND #&7F
	CMP &81
	BCS &3EB3
	LDX #&FE
	STX &D1
.addr3E97
	ASL A
	CMP &81
	BCC &3E9E
	SBC &81
.addr3E9E
	ROL &D1
	BCS &3E97
	LDA &D1
	LSR A
	LSR A
	STA &D1
	LSR A
	ADC &D1
	STA &D1
	TYA
	AND #&80
	ORA &D1
	RTS
.addr3EB3
	TYA
	AND #&80
	ORA #&60
	RTS
.addr3EB9
	STA &1D
	LDA &50,X
	STA &81
	LDA &56,X
	JSR &2287
	LDX &50,Y
	STX &81
	LDA &0056,Y
	JSR &22AD
	STX &1B
	LDY &1D
	LDX &50,Y
	STX &81
	EOR #&80
	STA &1C
	EOR &81
	AND #&80
	STA &D1
	LDA #&00
	LDX #&10
	ASL &1B
	ROL &1C
	ASL &81
	LSR &81
.addr3EEC
	ROL A
	CMP &81
	BCC &3EF3
	SBC &81
.addr3EF3
	ROL &1B
	ROL &1C
	DEX
	BNE &3EEC
	LDA &1B
	ORA &D1
	RTS
.addr3EFF
	JSR &4059
	LDA #&60
	CMP #&BE
	BCS &3F23
	LDY #&02
	JSR &3F2A
	LDY #&06
	LDA #&60
	ADC #&01
	JSR &3F2A
	LDA #&08
	ORA &65
	STA &65
	LDA #&08
	JMP &46EF
.addr3F21
	PLA
	PLA
.addr3F23
	LDA #&F7
	AND &65
	STA &65
	RTS
.addr3F2A
	STA (&67),Y
	INY
	INY
	STA (&67),Y
	LDA #&80
	DEY
	STA (&67),Y
	ADC #&03
	BCS &3F21
	DEY
	DEY
	STA (&67),Y
	RTS
.addr3F3E
	LDY &82
	LDA &81
	STA &83
	LDX #&00
	STX &81
	LDA #&08
	STA &D1
.addr3F4C
	CPX &81
	BCC &3F5E
	BNE &3F56
	CPY #&40
	BCC &3F5E
.addr3F56
	TYA
	SBC #&40
	TAY
	TXA
	SBC &81
	TAX
.addr3F5E
	ROL &81
	ASL &83
	TYA
	ROL A
	TAY
	TXA
	ROL A
	TAX
	ASL &83
	TYA
	ROL A
	TAY
	TXA
	ROL A
	TAX
	DEC &D1
	BNE &3F4C
	RTS
.addr3F75
	CMP &81
	BCS &3F93
.addr3F79
	LDX #&FE
	STX &82
.addr3F7D
	ASL A
	BCS &3F8B
	CMP &81
	BCC &3F86
	SBC &81
.addr3F86
	ROL &82
	BCS &3F7D
	RTS
.addr3F8B
	SBC &81
	SEC
	ROL &82
	BCS &3F7D
	RTS
.addr3F93
	LDA #&FF
	STA &82
	RTS
.addr3F98
	EOR &83
	BMI &3FA2
	LDA &81
	CLC
	ADC &82
	RTS
.addr3FA2
	LDA &82
	SEC
	SBC &81
	BCC &3FAB
	CLC
	RTS
.addr3FAB
	PHA
	LDA &83
	EOR #&80
	STA &83
	PLA
	EOR #&FF
	ADC #&01
	RTS
.addr3FB8
	LDX #&00
	LDY #&00
.addr3FBC
	LDA &34
	STA &81
	LDA &09,X
	JSR &21FA
	STA &D1
	LDA &35
	EOR &0A,X
	STA &83
	LDA &36
	STA &81
	LDA &0B,X
	JSR &21FA
	STA &81
	LDA &D1
	STA &82
	LDA &37
	EOR &0C,X
	JSR &3F98
	STA &D1
	LDA &38
	STA &81
	LDA &0D,X
	JSR &21FA
	STA &81
	LDA &D1
	STA &82
	LDA &39
	EOR &0E,X
	JSR &3F98
	STA &003A,Y
	LDA &83
	STA &003B,Y
	INY
	INY
	TXA
	CLC
	ADC #&06
	TAX
	CMP #&11
	BCC &3FBC
	RTS
.addr400F
	LDA #&1F
	STA &96
	LDA #&20
	BIT &65
	BNE &4046
	BPL &4046
	ORA &65
.addr401D
	AND #&3F
	STA &65
	LDA #&00
	LDY #&1C
	STA (&20),Y
	LDY #&1E
	STA (&20),Y
	JSR &4059
	LDY #&01
	LDA #&12
	STA (&67),Y
	LDY #&07
	LDA (&1E),Y
	LDY #&02
	STA (&67),Y
.addr403C
	INY
	JSR &3736
	STA (&67),Y
	CPY #&06
	BNE &403C
.addr4046
	LDA &4E
	BPL &4067
.addr404A
	LDA &65
	AND #&20
	BEQ &4059
	LDA &65
	AND #&F7
	STA &65
	JMP &3282
.addr4059
	LDA #&08
	BIT &65
	BEQ &4066
	EOR &65
	STA &65
	JMP &46F3
.addr4066
	RTS
.addr4067
	LDA &4D
	CMP #&C0
	BCS &404A
	LDA &46
	CMP &4C
	LDA &47
	SBC &4D
	BCS &404A
	LDA &49
	CMP &4C
	LDA &4A
	SBC &4D
	BCS &404A
	LDY #&06
	LDA (&1E),Y
	TAX
	LDA #&FF
	STA &0100,X
	STA &0101,X
	LDA &4C
	STA &D1
	LDA &4D
	LSR A
	ROR &D1
	LSR A
	ROR &D1
	LSR A
	ROR &D1
	LSR A
	BNE &40AA
	LDA &D1
	ROR A
	LSR A
	LSR A
	LSR A
	STA &96
	BPL &40BB
.addr40AA
	LDY #&0D
	LDA (&1E),Y
	CMP &4D
	BCS &40BB
	LDA #&20
	AND &65
	BNE &40BB
	JMP &3EFF
.addr40BB
	LDX #&05
.addr40BD
	LDA &5B,X
	STA &09,X
	LDA &55,X
	STA &0F,X
	LDA &4F,X
	STA &15,X
	DEX
	BPL &40BD
	LDA #&C5
	STA &81
	LDY #&10
.addr40D2
	LDA &0009,Y
	ASL A
	LDA &000A,Y
	ROL A
	JSR &3F75
	LDX &82
	STX &09,Y
	DEY
	DEY
	BPL &40D2
	LDX #&08
.addr40E7
	LDA &46,X
	STA &72,X
	DEX
	BPL &40E7
	LDA #&FF
	STA &E1
	LDY #&0C
	LDA &65
	AND #&20
	BEQ &410C
	LDA (&1E),Y
	LSR A
	LSR A
	TAX
	LDA #&FF
.addr4101
	STA &D2,X
	DEX
	BPL &4101
	INX
	STX &96
.addr4109
	JMP &427F
.addr410C
	LDA (&1E),Y
	BEQ &4109
	STA &97
	LDY #&12
	LDA (&1E),Y
	TAX
	LDA &79
	TAY
	BEQ &412B
.addr411C
	INX
	LSR &76
	ROR &75
	LSR &73
	ROR &72
	LSR A
	ROR &78
	TAY
	BNE &411C
.addr412B
	STX &86
	LDA &7A
	STA &39
	LDA &72
	STA &34
	LDA &74
	STA &35
	LDA &75
	STA &36
	LDA &77
	STA &37
	LDA &78
	STA &38
	JSR &3FB8
	LDA &3A
	STA &72
	LDA &3B
	STA &74
	LDA &3C
	STA &75
	LDA &3D
	STA &77
	LDA &3E
	STA &78
	LDA &3F
	STA &7A
	LDY #&04
	LDA (&1E),Y
	CLC
	ADC &1E
	STA &22
	LDY #&11
	LDA (&1E),Y
	ADC &1F
	STA &23
	LDY #&00
.addr4173
	LDA (&22),Y
	STA &3B
	AND #&1F
	CMP &96
	BCS &418C
	TYA
	LSR A
	LSR A
	TAX
	LDA #&FF
	STA &D2,X
	TYA
	ADC #&04
	TAY
	JMP &4278
.addr418C
	LDA &3B
	ASL A
	STA &3D
	ASL A
	STA &3F
	INY
	LDA (&22),Y
	STA &3A
	INY
	LDA (&22),Y
	STA &3C
	INY
	LDA (&22),Y
	STA &3E
	LDX &86
	CPX #&04
	BCC &41CC
	LDA &72
	STA &34
	LDA &74
	STA &35
	LDA &75
	STA &36
	LDA &77
	STA &37
	LDA &78
	STA &38
	LDA &7A
	STA &39
	JMP &422A
.addr41C4
	LSR &72
	LSR &78
	LSR &75
	LDX #&01
.addr41CC
	LDA &3A
	STA &34
	LDA &3C
	STA &36
	LDA &3E
	DEX
	BMI &41E1
.addr41D9
	LSR &34
	LSR &36
	LSR A
	DEX
	BPL &41D9
.addr41E1
	STA &82
	LDA &3F
	STA &83
	LDA &78
	STA &81
	LDA &7A
	JSR &3F98
	BCS &41C4
	STA &38
	LDA &83
	STA &39
	LDA &34
	STA &82
	LDA &3B
	STA &83
	LDA &72
	STA &81
	LDA &74
	JSR &3F98
	BCS &41C4
	STA &34
	LDA &83
	STA &35
	LDA &36
	STA &82
	LDA &3D
	STA &83
	LDA &75
	STA &81
	LDA &77
	JSR &3F98
	BCS &41C4
	STA &36
	LDA &83
	STA &37
.addr422A
	LDA &3A
	STA &81
	LDA &34
	JSR &21FA
	STA &D1
	LDA &3B
	EOR &35
	STA &83
	LDA &3C
	STA &81
	LDA &36
	JSR &21FA
	STA &81
	LDA &D1
	STA &82
	LDA &3D
	EOR &37
	JSR &3F98
	STA &D1
	LDA &3E
	STA &81
	LDA &38
	JSR &21FA
	STA &81
	LDA &D1
	STA &82
	LDA &39
	EOR &3F
	JSR &3F98
	PHA
	TYA
	LSR A
	LSR A
	TAX
	PLA
	BIT &83
	BMI &4275
	LDA #&00
.addr4275
	STA &D2,X
	INY
.addr4278
	CPY &97
	BCS &427F
	JMP &4173
.addr427F
	LDY &0B
	LDX &0C
	LDA &0F
	STA &0B
	LDA &10
	STA &0C
	STY &0F
	STX &10
	LDY &0D
	LDX &0E
	LDA &15
	STA &0D
	LDA &16
	STA &0E
	STY &15
	STX &16
	LDY &13
	LDX &14
	LDA &17
	STA &13
	LDA &18
	STA &14
	STY &17
	STX &18
	LDY #&08
	LDA (&1E),Y
	STA &97
	LDA &1E
	CLC
	ADC #&14
	STA &22
	LDA &1F
	ADC #&00
	STA &23
	LDY #&00
	STY &93
.addr42C6
	STY &86
	LDA (&22),Y
	STA &34
	INY
	LDA (&22),Y
	STA &36
	INY
	LDA (&22),Y
	STA &38
	INY
	LDA (&22),Y
	STA &D1
	AND #&1F
	CMP &96
	BCC &430F
	INY
	LDA (&22),Y
	STA &1B
	AND #&0F
	TAX
	LDA &D2,X
	BNE &4312
	LDA &1B
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	LDA &D2,X
	BNE &4312
	INY
	LDA (&22),Y
	STA &1B
	AND #&0F
	TAX
	LDA &D2,X
	BNE &4312
	LDA &1B
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	LDA &D2,X
	BNE &4312
.addr430F
	JMP &4487
.addr4312
	LDA &D1
	STA &35
	ASL A
	STA &37
	ASL A
	STA &39
	JSR &3FB8
	LDA &48
	STA &36
	EOR &3B
	BMI &4337
	CLC
	LDA &3A
	ADC &46
	STA &34
	LDA &47
	ADC #&00
	STA &35
	JMP &435A
.addr4337
	LDA &46
	SEC
	SBC &3A
	STA &34
	LDA &47
	SBC #&00
	STA &35
	BCS &435A
	EOR #&FF
	STA &35
	LDA #&01
	SBC &34
	STA &34
	BCC &4354
	INC &35
.addr4354
	LDA &36
	EOR #&80
	STA &36
.addr435A
	LDA &4B
	STA &39
	EOR &3D
	BMI &4372
	CLC
	LDA &3C
	ADC &49
	STA &37
	LDA &4A
	ADC #&00
	STA &38
	JMP &4397
.addr4372
	LDA &49
	SEC
	SBC &3C
	STA &37
	LDA &4A
	SBC #&00
	STA &38
	BCS &4397
	EOR #&FF
	STA &38
	LDA &37
	EOR #&FF
	ADC #&01
	STA &37
	LDA &39
	EOR #&80
	STA &39
	BCC &4397
	INC &38
.addr4397
	LDA &3F
	BMI &43E5
	LDA &3E
	CLC
	ADC &4C
	STA &D1
	LDA &4D
	ADC #&00
	STA &80
	JMP &4404
.addr43AB
	LDX &81
	BEQ &43CB
	LDX #&00
.addr43B1
	LSR A
	INX
	CMP &81
	BCS &43B1
	STX &83
	JSR &3F75
	LDX &83
	LDA &82
.addr43C0
	ASL A
	ROL &80
	BMI &43CB
	DEX
	BNE &43C0
	STA &82
	RTS
.addr43CB
	LDA #&32
	STA &82
	STA &80
	RTS
.addr43D2
	LDA #&80
	SEC
	SBC &82
	STA &0100,X
	INX
	LDA #&00
	SBC &80
	STA &0100,X
	JMP &4444
.addr43E5
	LDA &4C
	SEC
	SBC &3E
	STA &D1
	LDA &4D
	SBC #&00
	STA &80
	BCC &43FC
	BNE &4404
	LDA &D1
	CMP #&04
	BCS &4404
.addr43FC
	LDA #&00
	STA &80
	LDA #&04
	STA &D1
.addr4404
	LDA &80
	ORA &35
	ORA &38
	BEQ &441B
	LSR &35
	ROR &34
	LSR &38
	ROR &37
	LSR &80
	ROR &D1
	JMP &4404
.addr441B
	LDA &D1
	STA &81
	LDA &34
	CMP &81
	BCC &442B
	JSR &43AB
	JMP &442E
.addr442B
	JSR &3F75
.addr442E
	LDX &93
	LDA &36
	BMI &43D2
	LDA &82
	CLC
	ADC #&80
	STA &0100,X
	INX
	LDA &80
	ADC #&00
	STA &0100,X
.addr4444
	TXA
	PHA
	LDA #&00
	STA &80
	LDA &D1
	STA &81
	LDA &37
	CMP &81
	BCC &446D
	JSR &43AB
	JMP &4470
.addr445A
	LDA #&60
	CLC
	ADC &82
	STA &0100,X
	INX
	LDA #&00
	ADC &80
	STA &0100,X
	JMP &4487
.addr446D
	JSR &3F75
.addr4470
	PLA
	TAX
	INX
	LDA &39
	BMI &445A
	LDA #&60
	SEC
	SBC &82
	STA &0100,X
	INX
	LDA #&00
	SBC &80
	STA &0100,X
.addr4487
	CLC
	LDA &93
	ADC #&04
	STA &93
	LDA &86
	ADC #&06
	TAY
	BCS &449C
	CMP &97
	BCS &449C
	JMP &42C6
.addr449C
	LDA &65
	AND #&20
	BEQ &44AB
	LDA &65
	ORA #&08
	STA &65
	JMP &3282
.addr44AB
	LDA #&08
	BIT &65
	BEQ &44B6
	JSR &46F3
	LDA #&08
.addr44B6
	ORA &65
	STA &65
	LDY #&09
	LDA (&1E),Y
	STA &97
	LDY #&00
	STY &80
	STY &86
	INC &80
	BIT &65
	BVC &4520
	LDA &65
	AND #&BF
	STA &65
	LDY #&06
	LDA (&1E),Y
	TAY
	LDX &0100,Y
	STX &34
	INX
	BEQ &4520
	LDX &0101,Y
	STX &35
	INX
	BEQ &4520
	LDX &0102,Y
	STX &36
	LDX &0103,Y
	STX &37
	LDA #&00
	STA &38
	STA &39
	STA &3B
	LDA &4C
	STA &3A
	LDA &48
	BPL &4503
	DEC &38
.addr4503
	JSR &4594
	BCS &4520
	LDY &80
	LDA &34
	STA (&67),Y
	INY
	LDA &35
	STA (&67),Y
	INY
	LDA &36
	STA (&67),Y
	INY
	LDA &37
	STA (&67),Y
	INY
	STY &80
.addr4520
	LDY #&03
	CLC
	LDA (&1E),Y
	ADC &1E
	STA &22
	LDY #&10
	LDA (&1E),Y
	ADC &1F
	STA &23
	LDY #&05
	LDA (&1E),Y
	STA &06
	LDY &86
.addr4539
	LDA (&22),Y
	CMP &96
	BCC &4557
	INY
	LDA (&22),Y
	INY
	STA &1B
	AND #&0F
	TAX
	LDA &D2,X
	BNE &455A
.addr454C
	LDA &1B
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	LDA &D2,X
	BNE &455A
.addr4557
	JMP &46D6
.addr455A
	LDA (&22),Y
	TAX
	INY
	LDA (&22),Y
	STA &81
	LDA &0101,X
	STA &35
	LDA &0100,X
	STA &34
	LDA &0102,X
	STA &36
	LDA &0103,X
	STA &37
	LDX &81
	LDA &0100,X
	STA &38
	LDA &0103,X
	STA &3B
	LDA &0102,X
	STA &3A
	LDA &0101,X
	STA &39
	JSR &459A
	BCS &4557
	JMP &46BA
.addr4594
	LDA #&00
	STA &90
	LDA &39
.addr459A
	LDX #&BF
	ORA &3B
	BNE &45A6
	CPX &3A
	BCC &45A6
	LDX #&00
.addr45A6
	STX &89
	LDA &35
	ORA &37
	BNE &45CA
	LDA #&BF
	CMP &36
	BCC &45CA
	LDA &89
	BNE &45C8
.addr45B8
	LDA &36
	STA &35
	LDA &38
	STA &36
	LDA &3A
	STA &37
	CLC
	RTS
.addr45C6
	SEC
	RTS
.addr45C8
	LSR &89
.addr45CA
	LDA &89
	BPL &45FD
	LDA &35
	AND &39
	BMI &45C6
	LDA &37
	AND &3B
	BMI &45C6
	LDX &35
	DEX
	TXA
	LDX &39
	DEX
	STX &3C
	ORA &3C
	BPL &45C6
	LDA &36
	CMP #&C0
	LDA &37
	SBC #&00
	STA &3C
	LDA &3A
	CMP #&C0
	LDA &3B
	SBC #&00
	ORA &3C
	BPL &45C6
.addr45FD
	TYA
	PHA
	LDA &38
	SEC
	SBC &34
	STA &3C
	LDA &39
	SBC &35
	STA &3D
	LDA &3A
	SEC
	SBC &36
	STA &3E
	LDA &3B
	SBC &37
	STA &3F
	EOR &3D
	STA &83
	LDA &3F
	BPL &462E
	LDA #&00
	SEC
	SBC &3E
	STA &3E
	LDA #&00
	SBC &3F
	STA &3F
.addr462E
	LDA &3D
	BPL &463D
	SEC
	LDA #&00
	SBC &3C
	STA &3C
	LDA #&00
	SBC &3D
.addr463D
	TAX
	BNE &4644
	LDX &3F
	BEQ &464E
.addr4644
	LSR A
	ROR &3C
	LSR &3F
	ROR &3E
	JMP &463D
.addr464E
	STX &D1
	LDA &3C
	CMP &3E
	BCC &4660
	STA &81
	LDA &3E
	JSR &3F75
	JMP &466B
.addr4660
	LDA &3E
	STA &81
	LDA &3C
	JSR &3F75
	DEC &D1
.addr466B
	LDA &82
	STA &3C
	LDA &83
	STA &3D
	LDA &89
	BEQ &4679
	BPL &468C
.addr4679
	JSR &471A
	LDA &89
	BPL &46B1
	LDA &35
	ORA &37
	BNE &46B6
	LDA &36
	CMP #&C0
	BCS &46B6
.addr468C
	LDX &34
	LDA &38
	STA &34
	STX &38
	LDA &39
	LDX &35
	STX &39
	STA &35
	LDX &36
	LDA &3A
	STA &36
	STX &3A
	LDA &3B
	LDX &37
	STX &3B
	STA &37
	JSR &471A
	DEC &90
.addr46B1
	PLA
	TAY
	JMP &45B8
.addr46B6
	PLA
	TAY
	SEC
	RTS
.addr46BA
	LDY &80
	LDA &34
	STA (&67),Y
	INY
	LDA &35
	STA (&67),Y
	INY
	LDA &36
	STA (&67),Y
	INY
	LDA &37
	STA (&67),Y
	INY
	STY &80
	CPY &06
	BCS &46ED
.addr46D6
	INC &86
	LDY &86
	CPY &97
	BCS &46ED
	LDY #&00
	LDA &22
	ADC #&04
	STA &22
	BCC &46EA
	INC &23
.addr46EA
	JMP &4539
.addr46ED
	LDA &80
.addr46EF
	LDY #&00
	STA (&67),Y
.addr46F3
	LDY #&00
	LDA (&67),Y
	STA &97
	CMP #&04
	BCC &4719
	INY
.addr46FE
	LDA (&67),Y
	STA &34
	INY
	LDA (&67),Y
	STA &35
	INY
	LDA (&67),Y
	STA &36
	INY
	LDA (&67),Y
	STA &37
	JSR &176F
	INY
	CPY &97
	BCC &46FE
.addr4719
	RTS
.addr471A
	LDA &35
	BPL &4735
	STA &83
	JSR &4794
	TXA
	CLC
	ADC &36
	STA &36
	TYA
	ADC &37
	STA &37
	LDA #&00
	STA &34
	STA &35
	TAX
.addr4735
	BEQ &4750
	STA &83
	DEC &83
	JSR &4794
	TXA
	CLC
	ADC &36
	STA &36
	TYA
	ADC &37
	STA &37
	LDX #&FF
	STX &34
	INX
	STX &35
.addr4750
	LDA &37
	BPL &476E
	STA &83
	LDA &36
	STA &82
	JSR &47C3
	TXA
	CLC
	ADC &34
	STA &34
	TYA
	ADC &35
	STA &35
	LDA #&00
	STA &36
	STA &37
.addr476E
	LDA &36
	SEC
	SBC #&C0
	STA &82
	LDA &37
	SBC #&00
	STA &83
	BCC &4793
	JSR &47C3
	TXA
	CLC
	ADC &34
	STA &34
	TYA
	ADC &35
	STA &35
	LDA #&BF
	STA &36
	LDA #&00
	STA &37
.addr4793
	RTS
.addr4794
	LDA &34
	STA &82
	JSR &47FF
	PHA
	LDX &D1
	BNE &47CB
.addr47A0
	LDA #&00
	TAX
	TAY
	LSR &83
	ROR &82
	ASL &81
	BCC &47B5
.addr47AC
	TXA
	CLC
	ADC &82
	TAX
	TYA
	ADC &83
	TAY
.addr47B5
	LSR &83
	ROR &82
	ASL &81
	BCS &47AC
	BNE &47B5
	PLA
	BPL &47F2
	RTS
.addr47C3
	JSR &47FF
	PHA
	LDX &D1
	BNE &47A0
.addr47CB
	LDA #&FF
	TAY
	ASL A
	TAX
.addr47D0
	ASL &82
	ROL &83
	LDA &83
	BCS &47DC
	CMP &81
	BCC &47E7
.addr47DC
	SBC &81
	STA &83
	LDA &82
	SBC #&00
	STA &82
	SEC
.addr47E7
	TXA
	ROL A
	TAX
	TYA
	ROL A
	TAY
	BCS &47D0
	PLA
	BMI &47FE
.addr47F2
	TXA
	EOR #&FF
	ADC #&01
	TAX
	TYA
	EOR #&FF
	ADC #&00
	TAY
.addr47FE
	RTS
.addr47FF
	LDX &3C
	STX &81
	LDA &83
	BPL &4818
	LDA #&00
	SEC
	SBC &82
	STA &82
	LDA &83
	PHA
	EOR #&FF
	ADC #&00
	STA &83
	PLA
.addr4818
	EOR &3D
	RTS

; -----------------------------------------------------------------------------
; Tokens
; -----------------------------------------------------------------------------
MAPCHAR &20, &20 EOR &57
MAPCHAR &21, &21 EOR &57
MAPCHAR &22, &22 EOR &57
MAPCHAR &23, &23 EOR &57
MAPCHAR &24, &24 EOR &57
MAPCHAR &25, &25 EOR &57
MAPCHAR &26, &26 EOR &57
MAPCHAR &27, &27 EOR &57
MAPCHAR &28, &28 EOR &57
MAPCHAR &29, &29 EOR &57
MAPCHAR &2A, &2A EOR &57
MAPCHAR &2B, &2B EOR &57
MAPCHAR &2C, &2C EOR &57
MAPCHAR &2D, &2D EOR &57
MAPCHAR &2E, &2E EOR &57
MAPCHAR &2F, &2F EOR &57
MAPCHAR &30, &30 EOR &57
MAPCHAR &31, &31 EOR &57
MAPCHAR &32, &32 EOR &57
MAPCHAR &33, &33 EOR &57
MAPCHAR &34, &34 EOR &57
MAPCHAR &35, &35 EOR &57
MAPCHAR &36, &36 EOR &57
MAPCHAR &37, &37 EOR &57
MAPCHAR &38, &38 EOR &57
MAPCHAR &39, &39 EOR &57
MAPCHAR &3A, &3A EOR &57
MAPCHAR &3B, &3B EOR &57
MAPCHAR &3C, &3C EOR &57
MAPCHAR &3D, &3D EOR &57
MAPCHAR &3E, &3E EOR &57
MAPCHAR &3F, &3F EOR &57
MAPCHAR &40, &40 EOR &57
MAPCHAR &41, &41 EOR &57
MAPCHAR &42, &42 EOR &57
MAPCHAR &43, &43 EOR &57
MAPCHAR &44, &44 EOR &57
MAPCHAR &45, &45 EOR &57
MAPCHAR &46, &46 EOR &57
MAPCHAR &47, &47 EOR &57
MAPCHAR &48, &48 EOR &57
MAPCHAR &49, &49 EOR &57
MAPCHAR &4A, &4A EOR &57
MAPCHAR &4B, &4B EOR &57
MAPCHAR &4C, &4C EOR &57
MAPCHAR &4D, &4D EOR &57
MAPCHAR &4E, &4E EOR &57
MAPCHAR &4F, &4F EOR &57
MAPCHAR &50, &50 EOR &57
MAPCHAR &51, &51 EOR &57
MAPCHAR &52, &52 EOR &57
MAPCHAR &53, &53 EOR &57
MAPCHAR &54, &54 EOR &57
MAPCHAR &55, &55 EOR &57
MAPCHAR &56, &56 EOR &57
MAPCHAR &57, &57 EOR &57
MAPCHAR &58, &58 EOR &57
MAPCHAR &59, &59 EOR &57
MAPCHAR &5A, &5A EOR &57
MAPCHAR &5B, &5B EOR &57
MAPCHAR &5C, &5C EOR &57
MAPCHAR &5D, &5D EOR &57
MAPCHAR &5E, &5E EOR &57
MAPCHAR &5F, &5F EOR &57
MAPCHAR &60, &60 EOR &57
MAPCHAR &61, &61 EOR &57
MAPCHAR &62, &62 EOR &57
MAPCHAR &63, &63 EOR &57
MAPCHAR &64, &64 EOR &57
MAPCHAR &65, &65 EOR &57
MAPCHAR &66, &66 EOR &57
MAPCHAR &67, &67 EOR &57
MAPCHAR &68, &68 EOR &57
MAPCHAR &69, &69 EOR &57
MAPCHAR &6A, &6A EOR &57
MAPCHAR &6B, &6B EOR &57
MAPCHAR &6C, &6C EOR &57
MAPCHAR &6D, &6D EOR &57
MAPCHAR &6E, &6E EOR &57
MAPCHAR &6F, &6F EOR &57
MAPCHAR &70, &70 EOR &57
MAPCHAR &71, &71 EOR &57
MAPCHAR &72, &72 EOR &57
MAPCHAR &73, &73 EOR &57
MAPCHAR &74, &74 EOR &57
MAPCHAR &75, &75 EOR &57
MAPCHAR &76, &76 EOR &57
MAPCHAR &77, &77 EOR &57
MAPCHAR &78, &78 EOR &57
MAPCHAR &79, &79 EOR &57
MAPCHAR &7A, &7A EOR &57
MAPCHAR &7B, &7B EOR &57
MAPCHAR &7C, &7C EOR &57
MAPCHAR &7D, &7D EOR &57
MAPCHAR &7E, &7E EOR &57

.tokens
INCBIN "data/T.Code-tokens.bin"

.addr55C0                               ; Table used for 5 choices
	EQUB &10, &15, &1A, &1F, &9B, &A0, &2E, &A5   ; build offsets in steps in 5, called with indices &5B...&62 (tokens above 'Z')
	EQUB &24, &29, &3D, &33, &38, &AA, &42, &47   ; build offsets in steps in 5, called with indices &63...&6A (tokens above 'Z')
	EQUB &4C, &51, &56, &8C, &60, &65, &87, &82   ; build offsets in steps in 5, called with indices &6B...&72 (tokens above 'Z')
	EQUB &5B, &6A, &B4, &B9, &BE, &E1, &E6, &EB   ; build offsets in steps in 5, called with indices &73...&7A (tokens above 'Z')
	EQUB &F0, &F5, &FA, &73, &78, &7D   ; build offsets in steps in 5, called with indices &7B...&80 (tokens above 'Z')

.addr55E6
	EQUS "END-END-END"

.addr5561
	EQUB &8E, &13, &1C, &00
	EQUB &00, &73, &56, &52
	EQUB &49, &53, &00
	EQUB &8E, &13, &34, &B3


.addr5600
	EQUW &7F00                      ; Ship type 01: 
	EQUW &0000                      ; Ship type 02: Space station
	EQUW &0000                      ; Ship type 03: Esacape pod
	EQUW &0000                      ; Ship type 04: 
	EQUW ship_cargo_cannister       ; Ship type 05: Cargo cannister
	EQUW &0000                      ; Ship type 06: 
	EQUW &0000                      ; Ship type 07: Asteroid
	EQUW &0000                      ; Ship type 08: 
	EQUW ship_shuttle               ; Ship type 09: Shuttle
	EQUW ship_transporter           ; Ship type 10: Transporter
	EQUW ship_cobra_mk3             ; Ship type 11: Cobra Mk3
	EQUW ship_python                ; Ship type 12: Python
	EQUW &0000                      ; Ship type 13: 
	EQUW &0000                      ; Ship type 14: 
	EQUW &0000                      ; Ship type 15: 
	EQUW ship_viper                 ; Ship type 16: Viper
	EQUW &0000                      ; Ship type 17: 
	EQUW &0000                      ; Ship type 18: 
	EQUW ship_krait                 ; Ship type 19: Krait
	EQUW &0000                      ; Ship type 20: Adder
	EQUW &0000                      ; Ship type 21: 
	EQUW &0000                      ; Ship type 22: 
	EQUW &0000                      ; Ship type 23: 
	EQUW &0000                      ; Ship type 24: 
	EQUW &0000                      ; Ship type 25: Asp Mk2
	EQUW &0000                      ; Ship type 26: Fer de Lance
	EQUW &0000                      ; Ship type 27: 
	EQUW &0000                      ; Ship type 28: 
	EQUW &0000                      ; Ship type 29: Thargoid
	EQUW &0000                      ; Ship type 30: Thargon
	EQUW ship_constrictor           ; Ship type 31: Constrictor

.addr563E                               ; Hull NEWB bits are escpod, cop, inno, ?, pirate, angry, hunter, trader
	EQUB %00000000                  ; Ship type 01: 
	EQUB %00000000                  ; Ship type 02: Space station
	EQUB %00000000                  ; Ship type 03: Escape pod
	EQUB %00000000                  ; Ship type 04: 
	EQUB %00000000                  ; Ship type 05: Cargo cannister
	EQUB %00000000                  ; Ship type 06: 
	EQUB %00000000                  ; Ship type 07: Asteroid
	EQUB %00000000                  ; Ship type 08: 
	EQUB %00100001                  ; Ship type 09: Shuttle
	EQUB %01100001                  ; Ship type 10: Transporter
	EQUB %10100000                  ; Ship type 11: Cobra Mk3
	EQUB %10100000                  ; Ship type 12: Python
	EQUB %00000000                  ; Ship type 13: 
	EQUB %00000000                  ; Ship type 14: 
	EQUB %00000000                  ; Ship type 15: 
	EQUB %11000010                  ; Ship type 16: Viper
	EQUB %00000000                  ; Ship type 17: 
	EQUB %00000000                  ; Ship type 18: 
	EQUB %10001100                  ; Ship type 19: Krait
	EQUB %00000000                  ; Ship type 20: Adder
	EQUB %00000000                  ; Ship type 21: 
	EQUB %00000000                  ; Ship type 22: 
	EQUB %00000000                  ; Ship type 23: 
	EQUB %00000000                  ; Ship type 24: 
	EQUB %00000000                  ; Ship type 25: Asp Mk2
	EQUB %00000000                  ; Ship type 26: Fer de Lance
	EQUB %00000000                  ; Ship type 27: 
	EQUB %00000000                  ; Ship type 28: 
	EQUB %00000000                  ; Ship type 29: Thargoid
	EQUB %00000000                  ; Ship type 30: Thargon
	EQUB %10001100                  ; Ship type 31: Constrictor

.ship_cargo_cannister
INCLUDE "ships/cargo_cannister.asm"

.ship_shuttle
INCLUDE "ships/shuttle.asm"

.ship_transporter
INCLUDE "ships/transporter.asm"

.ship_cobra_mk3
INCLUDE "ship/cobra_mk3.asm"

.ship_python
INCLUDE "ships/python.asm"

.ship_viper
INCLUDE "ships/viper.asm"

.ship_krait
INCLUDE "ships/krait.asm"

.ship_constrictor
INCLUDE "ships/constrictor.asm"

.addr5F55
	FOR n, *, (&5600 - *)
		EQUB &00
	NEXT

.end

SAVE "bin/T.Code", start, end, startcode, start
