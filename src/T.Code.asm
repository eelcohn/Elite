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
	LDX #&9F
	LDY #&33
	STA &07
	STX &1C
	STY &1D
	LDA #&7D
	JMP &1DC8
	CPX #&E0
	...
	CPX #&E0
	JSR &E0E0
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
	...
	BCS &3A42
	STA &3A0E
	STA &1C8E
	LDA #&04
	JSR &12CE
	LDA #&01
	STA &03CF
	STA &2C
	LDX #str_cat_0
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
.tokens
	EQUB &57                        ; Descramble byte: all tokens below are descrambled with &57

MAPCHAR &01, &56
	
481B  57                 W    ...
481C  5E 5C 56           ^\V  LSR &565C,Y
481F  5F                 _    ...
4820  77                 w    ...
4821  A6 04              ..   LDX &04
4823  1C                 .    ...
4824  77                 w    ...
4825  16 14              ..   ASL &14,X
4827  BE 04 04           ...  LDX &0404,Y
482A  77                 w    ...
482B  1A                 .    ...
482C  12                 .    ...
482D  B6 80              ..   LDX &80,Y
482F  5D 55 66           ]Uf  EOR &6655,X
4832  79 77 C2           yw.  ADC &C277,Y
4835  80                 .    ...
4836  65 79              ey   ADC &79
4838  77                 w    ...
4839  04                 .    ...
483A  16 AD              ..   ASL &AD,X
483C  77                 w    ...
483D  CD 77 53           .wS  CMP &5377
4840  80                 .    ...
4841  64                 d    ...
4842  79 77 14           yw.  ADC &1477,Y
4845  A2 16              ..   LDX #&16
4847  B7                 .    ...
4848  10 02              ..   BPL &484C
484A  12                 .    ...
484B  80                 .    ...
484C  63                 c    ...
484D  79 77 13           yw.  ADC &1377,Y
4850  12                 .    ...
4851  1B                 .    ...
4852  8A                 .    TXA
4853  12                 .    ...
4854  87                 .    ...
4855  11 1E              ..   ORA (&1E),Y
4857  B2                 .    ...
4858  80                 .    ...
4859  62                 b    ...
485A  79 77 12           yw.  ADC &1277,Y
485D  0F                 .    ...
485E  8C 80 57           ..W  STY &5780
4861  5B                 [    ...
4862  00                 .    BRK
4863  1F                 .    ...
4864  1E 14 1F           ...  ASL &1F14,Y
4867  77                 w    ...
4868  C0 68              .h   CPY #&68
486A  57                 W    ...
486B  14                 .    ...
486C  18                 .    CLC
486D  1A                 .    ...
486E  07                 .    ...
486F  12                 .    ...
4870  AC AC 88           ...  LDY &88AC
4873  77                 w    ...
4874  B6 1A              ..   LDX &1A,Y
4876  15 A3              ..   ORA &A3,X
4878  6D 57 C1           mW.  ADC &C157
487B  C0 77              .w   CPY #&77
487D  47                 G    ...
487E  CF                 .    ...
487F  80                 .    ...
4880  57                 W    ...
4881  E7                 .    ...
4882  3A                 :    ...
4883  9D 39 E6           .9.  STA &E639,X
4886  57                 W    ...
4887  77                 w    ...
4888  77                 w    ...
4889  C2                 .    ...
488A  77                 w    ...
488B  56 7F              V   LSR &7F,X
488D  0E 78 19           .x.  ASL &1978
4890  7E 68 55           ~hU  ROR &5568,X
4893  5B                 [    ...
4894  5B                 [    ...
4895  57                 W    ...
4896  07                 .    ...
4897  A5 04              ..   LDA &04
4899  04                 .    ...
489A  77                 w    ...
489B  04                 .    ...
489C  07                 .    ...
489D  16 BE              ..   ASL &BE,X
489F  77                 w    ...
48A0  AA                 .    TAX
48A1  77                 w    ...
48A2  11 1E              ..   ORA (&1E),Y
48A4  A5 7B              .{   LDA &7B
48A6  CD 79 5B           .y[  CMP &5B79
48A9  5B                 [    ...
48AA  57                 W    ...
48AB  CD 70 04           .p.  CMP &0470
48AE  9F                 .    ...
48AF  57                 W    ...
48B0  42                 B    ...
48B1  11 1E              ..   ORA (&1E),Y
48B3  B2                 .    ...
48B4  9E                 .    ...
48B5  13                 .    ...
48B6  12                 .    ...
48B7  1B                 .    ...
48B8  8A                 .    TXA
48B9  12                 .    ...
48BA  68                 h    PLA
48BB  57                 W    ...
48BC  40                 @    RTI
48BD  59 55 10           YU.  EOR &1055,Y
48C0  A5 8A              ..   LDA &8A
48C2  A7                 .    ...
48C3  10 04              ..   BPL &48C9
48C5  82                 .    ...
48C6  E5 44              .D   SBC &44
48C8  1E 77 A0           .w.  ASL &A077,Y
48CB  10 87              ..   BPL &4854
48CD  1A                 .    ...
48CE  18                 .    CLC
48CF  1A                 .    ...
48D0  A1 03              ..   LDA (&03,X)
48D2  77                 w    ...
48D3  18                 .    CLC
48D4  11 77              .w   ORA (&77),Y
48D6  E4 05              ..   CPX &05
48D8  77                 w    ...
48D9  01 B3              ..   ORA (&B3,X)
48DB  02                 .    ...
48DC  8F                 .    ...
48DD  B2                 .    ...
48DE  77                 w    ...
48DF  AC 1A 12           ...  LDY &121A
48E2  9B                 .    ...
48E3  00                 .    BRK
48E4  12                 .    ...
48E5  77                 w    ...
48E6  00                 .    BRK
48E7  8E 1B 13           ...  STX &131B
48EA  77                 w    ...
48EB  1B                 .    ...
48EC  1E 1C 12           ...  ASL &121C,Y
48EF  77                 w    ...
48F0  E4 9E              ..   CPX &9E
48F2  13                 .    ...
48F3  18                 .    CLC
48F4  87                 .    ...
48F5  1B                 .    ...
48F6  8C 03 B2           ...  STY &B203
48F9  77                 w    ...
48FA  1D 18 15           ...  ORA &1518,X
48FD  77                 w    ...
48FE  11 AA              ..   ORA (&AA),Y
4900  77                 w    ...
4901  BB                 .    ...
4902  9B                 .    ...
4903  C4 98              ..   CPY &98
4905  77                 w    ...
4906  E4 77              .w   CPX &77
4908  8D 12 77           ..w  STA &7712
490B  1F                 .    ...
490C  12                 .    ...
490D  A5 9D              ..   LDA &9D
490F  16 85              ..   ASL &85,X
4911  1A                 .    ...
4912  18                 .    CLC
4913  13                 .    ...
4914  12                 .    ...
4915  1B                 .    ...
4916  7B                 {    ...
4917  77                 w    ...
4918  C4 44              .D   CPY &44
491A  14                 .    ...
491B  88                 .    DEY
491C  89                 .    ...
491D  05 1E              ..   ORA &1E
491F  14                 .    ...
4920  03                 .    ...
4921  AA                 .    TAX
4922  7B                 {    ...
4923  77                 w    ...
4924  12                 .    ...
4925  A9 1E              ..   LDA #&1E
4927  07                 .    ...
4928  93                 .    ...
4929  00                 .    BRK
492A  1E B5 87           ...  ASL &87B5,Y
492D  03                 .    ...
492E  18                 .    CLC
492F  07                 .    ...
4930  77                 w    ...
4931  8D 14 05           ...  STA &0514
4934  8A                 .    TXA
4935  85 04              ..   STA &04
4937  1F                 .    ...
4938  1E 12 1B           ...  ASL &1B12,Y
493B  13                 .    ...
493C  77                 w    ...
493D  10 A1              ..   BPL &48E0
493F  A3                 .    ...
4940  A2 AA              ..   LDX #&AA
4942  9B                 .    ...
4943  02                 .    ...
4944  19 11 AA           ...  ORA &AA11,Y
4947  03                 .    ...
4948  02                 .    ...
4949  19 A2 12           ...  ORA &12A2,Y
494C  1B                 .    ...
494D  0E 77 8C           .w.  ASL &8C77
4950  70 04              p.   BVS &4956
4952  77                 w    ...
4953  A0 A1              ..   LDY #&A1
4955  77                 w    ...
4956  89                 .    ...
4957  18                 .    CLC
4958  1B                 .    ...
4959  A1 9B              ..   LDA (&9B,X)
495B  41 8C              A.   EOR (&8C,X)
495D  77                 w    ...
495E  00                 .    BRK
495F  A1 03              ..   LDA (&03,X)
4961  77                 w    ...
4962  1A                 .    ...
4963  1E 04 04           ...  ASL &0404,Y
4966  94 11              ..   STY &11
4968  05 18              ..   ORA &18
496A  1A                 .    ...
496B  77                 w    ...
496C  8E 05 77           ..w  STX &7705
496F  98                 .    TYA
4970  77                 w    ...
4971  0E B9 13           ...  ASL &13B9
4974  77                 w    ...
4975  88                 .    DEY
4976  77                 w    ...
4977  44                 D    ...
4978  B1 A3              ..   LDA (&A3),Y
497A  77                 w    ...
497B  11 1E              ..   ORA (&1E),Y
497D  AD 77 1A           .w.  LDA &1A77
4980  88                 .    DEY
4981  B5 04              ..   LDA &04,X
4983  77                 w    ...
4984  16 10              ..   ASL &10,X
4986  18                 .    CLC
4987  E5 4B              .K   SBC &4B
4989  9B                 .    ...
498A  E4 05              ..   CPX &05
498C  77                 w    ...
498D  1A                 .    ...
498E  1E 04 04           ...  ASL &0404,Y
4991  1E 88 7B           ..{  ASL &7B88,Y
4994  77                 w    ...
4995  04                 .    ...
4996  1F                 .    ...
4997  8E 1B 13           ...  STX &131B
499A  77                 w    ...
499B  E4 77              .w   CPX &77
499D  13                 .    ...
499E  12                 .    ...
499F  14                 .    ...
49A0  1E 13 12           ...  ASL &1213,Y
49A3  9E                 .    ...
49A4  16 14              ..   ASL &14,X
49A6  BE 07 03           ...  LDX &0307,Y
49A9  77                 w    ...
49AA  8C 7B 77           .{w  STY &777B
49AD  1E 04 9E           ...  ASL &9E04,Y
49B0  8D 12 1C           ...  STA &1C12
49B3  E5 13              ..   SBC &13
49B5  BA                 .    TSX
49B6  03                 .    ...
49B7  05 18              ..   ORA &18
49B9  0E 77 C3           .w.  ASL &C377
49BC  98                 .    TYA
49BD  9B                 .    ...
49BE  E4 77              .w   CPX &77
49C0  16 A5              ..   ASL &A5,X
49C2  77                 w    ...
49C3  14                 .    ...
49C4  16 02              ..   ASL &02,X
49C6  AC 88 93           ...  LDY &9388
49C9  B5 A2              ..   LDA &A2,X
49CB  77                 w    ...
49CC  88                 .    DEY
49CD  1B                 .    ...
49CE  0E 77 51           .wQ  ASL &5177
49D1  22                 "    ...
49D2  52                 R    ...
49D3  04                 .    ...
49D4  77                 w    ...
49D5  00                 .    BRK
49D6  8B                 .    ...
49D7  1B                 .    ...
49D8  77                 w    ...
49D9  07                 .    ...
49DA  A1 8A              ..   LDA (&8A,X)
49DC  AF                 .    ...
49DD  03                 .    ...
49DE  12                 .    ...
49DF  77                 w    ...
49E0  C4 19              ..   CPY &19
49E2  12                 .    ...
49E3  00                 .    BRK
49E4  77                 w    ...
49E5  04                 .    ...
49E6  1F                 .    ...
49E7  1E 12 1B           ...  ASL &1B12,Y
49EA  13                 .    ...
49EB  04                 .    ...
49EC  E5 B5              ..   SBC &B5
49EE  A2 77              .w   LDX #&77
49F0  C4 44              .D   CPY &44
49F2  14                 .    ...
49F3  88                 .    DEY
49F4  89                 .    ...
49F5  05 1E              ..   ORA &1E
49F7  14                 .    ...
49F8  03                 .    ...
49F9  AA                 .    TAX
49FA  9D 11 8C           ...  STA &8C11,X
49FD  03                 .    ...
49FE  93                 .    ...
49FF  00                 .    BRK
4A00  1E B5 77           ..w  ASL &77B5,Y
4A03  A8                 .    TAY
4A04  77                 w    ...
4A05  51 3B              Q;   EOR (&3B),Y
4A07  52                 R    ...
4A08  E6 55              .U   INC &55
4A0A  5F                 _    ...
4A0B  10 18              ..   BPL &4A25
4A0D  18                 .    CLC
4A0E  13                 .    ...
4A0F  77                 w    ...
4A10  1B                 .    ...
4A11  02                 .    ...
4A12  14                 .    ...
4A13  1C                 .    ...
4A14  7B                 {    ...
4A15  77                 w    ...
4A16  CD 83 41           ..A  CMP &4183
4A19  57                 W    ...
4A1A  4E 5E 40           N^@  LSR &405E
4A1D  59 55 77           YUw  EOR &7755,Y
4A20  77                 w    ...
4A21  A2 03              ..   LDX #&03
4A23  A1 AC              ..   LDA (&AC,X)
4A25  88                 .    DEY
4A26  82                 .    ...
4A27  79 77 44           ywD  ADC &4477,Y
4A2A  00                 .    BRK
4A2B  12                 .    ...
4A2C  77                 w    ...
4A2D  1F                 .    ...
4A2E  16 AD              ..   ASL &AD,X
4A30  77                 w    ...
4A31  19 12 93           ...  ORA &9312,Y
4A34  18                 .    CLC
4A35  11 77              .w   ORA (&77),Y
4A37  E4 05              ..   CPX &05
4A39  77                 w    ...
4A3A  8D 05 01           ...  STA &0105
4A3D  1E 14 BA           ...  ASL &BA14,Y
4A40  77                 w    ...
4A41  16 10              ..   ASL &10,X
4A43  16 A7              ..   ASL &A7,X
4A45  9B                 .    ...
4A46  1E 11 77           ..w  ASL &7711,Y
4A49  E4 77              .w   CPX &77
4A4B  00                 .    BRK
4A4C  8E 1B 13           ...  STX &131B
4A4F  77                 w    ...
4A50  A0 77              .w   LDY #&77
4A52  BC 77 10           .w.  LDY &1077,X
4A55  18                 .    CLC
4A56  18                 .    CLC
4A57  13                 .    ...
4A58  77                 w    ...
4A59  16 04              ..   ASL &04,X
4A5B  9E                 .    ...
4A5C  10 18              ..   BPL &4A76
4A5E  9E                 .    ...
4A5F  44                 D    ...
4A60  BE A3 A6           ...  LDX &A6A3,Y
4A63  77                 w    ...
4A64  E4 77              .w   CPX &77
4A66  00                 .    BRK
4A67  8B                 .    ...
4A68  1B                 .    ...
4A69  77                 w    ...
4A6A  A0 77              .w   LDY #&77
4A6C  15 05              ..   ORA &05,X
4A6E  1E 12 11           ...  ASL &1112,Y
4A71  AB                 .    ...
4A72  9B                 .    ...
4A73  1E 11 77           ..w  ASL &7711,Y
4A76  04                 .    ...
4A77  02                 .    ...
4A78  14                 .    ...
4A79  BE 04 04           ...  LDX &0404,Y
4A7C  11 02              ..   ORA (&02),Y
4A7E  1B                 .    ...
4A7F  7B                 {    ...
4A80  77                 w    ...
4A81  E4 77              .w   CPX &77
4A83  00                 .    BRK
4A84  8B                 .    ...
4A85  1B                 .    ...
4A86  77                 w    ...
4A87  A0 77              .w   LDY #&77
4A89  00                 .    BRK
4A8A  12                 .    ...
4A8B  1B                 .    ...
4A8C  1B                 .    ...
4A8D  77                 w    ...
4A8E  A5 00              ..   LDA &00
4A90  B9 13 AB           ...  LDA &AB13,Y
4A93  83                 .    ...
4A94  4F                 O    ...
4A95  57                 W    ...
4A96  7F                     ...
4A97  44                 D    ...
4A98  14                 .    ...
4A99  7E 77 16           ~w.  ROR &1677,X
4A9C  14                 .    ...
4A9D  AA                 .    TAX
4A9E  19 BC 11           ...  ORA &11BC,Y
4AA1  03                 .    ...
4AA2  77                 w    ...
4AA3  66 6E              fn   ROR &6E
4AA5  6F                 o    ...
4AA6  63                 c    ...
4AA7  57                 W    ...
4AA8  15 0E              ..   ORA &0E,X
4AAA  77                 w    ...
4AAB  13                 .    ...
4AAC  79 15 AF           y..  ADC &AF15,Y
4AAF  A0 19              ..   LDY #&19
4AB1  77                 w    ...
4AB2  71 77              qw   ADC (&77),Y
4AB4  1E 79 A0           .y.  ASL &A079,Y
4AB7  1B                 .    ...
4AB8  1B                 .    ...
4AB9  57                 W    ...
4ABA  42                 B    ...
4ABB  C6 9F              ..   DEC &9F
4ABD  4D 57 4E           MWN  EOR &4E57
4AC0  5E 40 59           ^@Y  LSR &5940,Y
4AC3  55 77              Uw   EOR &77,X
4AC5  77                 w    ...
4AC6  14                 .    ...
4AC7  88                 .    DEY
4AC8  10 AF              ..   BPL &4A79
4ACA  03                 .    ...
4ACB  02                 .    ...
4ACC  AE AC 88           ...  LDX &88AC
4ACF  04                 .    ...
4AD0  77                 w    ...
4AD1  CD 76 5B           .v[  CMP &5B76
4AD4  5B                 [    ...
4AD5  B5 A3              ..   LDA &A3,X
4AD7  12                 .    ...
4AD8  5A                 Z    ...
4AD9  77                 w    ...
4ADA  00                 .    BRK
4ADB  8B                 .    ...
4ADC  1B                 .    ...
4ADD  77                 w    ...
4ADE  B3                 .    ...
4ADF  00                 .    BRK
4AE0  16 0E              ..   ASL &0E,X
4AE2  04                 .    ...
4AE3  77                 w    ...
4AE4  A0 87              ..   LDY #&87
4AE6  07                 .    ...
4AE7  AE BE 77           ..w  LDX &77BE
4AEA  11 AA              ..   ORA (&AA),Y
4AEC  77                 w    ...
4AED  E4 77              .w   CPX &77
4AEF  A7                 .    ...
4AF0  84 9B              ..   STY &9B
4AF2  A8                 .    TAY
4AF3  13                 .    ...
4AF4  77                 w    ...
4AF5  B8                 .    CLV
4AF6  0E A0 77           ..w  ASL &77A0
4AF9  BC 88 A3           ...  LDY &A388,X
4AFC  77                 w    ...
4AFD  B5 A8              ..   LDA &A8,X
4AFF  77                 w    ...
4B00  E4 77              .w   CPX &77
4B02  B5 A7              ..   LDA &A7,X
4B04  1C                 .    ...
4B05  79 79 83           yy.  ADC &8379,Y
4B08  4F                 O    ...
4B09  57                 W    ...
4B0A  11 8F              ..   ORA (&8F),Y
4B0C  B2                 .    ...
4B0D  13                 .    ...
4B0E  57                 W    ...
4B0F  B4 03              ..   LDY &03
4B11  8F                 .    ...
4B12  B2                 .    ...
4B13  57                 W    ...
4B14  00                 .    BRK
4B15  12                 .    ...
4B16  1B                 .    ...
4B17  1B                 .    ...
4B18  77                 w    ...
4B19  1C                 .    ...
4B1A  B4 00              ..   LDY &00
4B1C  19 57 11           .W.  ORA &1157,Y
4B1F  16 1A              ..   ASL &1A,X
4B21  18                 .    CLC
4B22  BB                 .    ...
4B23  57                 W    ...
4B24  B4 03              ..   LDY &03
4B26  AB                 .    ...
4B27  57                 W    ...
4B28  AD 05 0E           ...  LDA &0E05
4B2B  57                 W    ...
4B2C  1A                 .    ...
4B2D  8B                 .    ...
4B2E  13                 .    ...
4B2F  1B                 .    ...
4B30  0E 57 1A           .W.  ASL &1A57
4B33  18                 .    CLC
4B34  89                 .    ...
4B35  57                 W    ...
4B36  A5 16              ..   LDA &16
4B38  04                 .    ...
4B39  88                 .    DEY
4B3A  8F                 .    ...
4B3B  1B                 .    ...
4B3C  0E 57 57           .WW  ASL &5757
4B3F  F2                 .    ...
4B40  57                 W    ...
4B41  25 57              %W   AND &57
4B43  10 A5              ..   BPL &4AEA
4B45  A2 57              .W   LDX #&57
4B47  01 16              ..   ORA (&16,X)
4B49  89                 .    ...
4B4A  57                 W    ...
4B4B  07                 .    ...
4B4C  A7                 .    ...
4B4D  1C                 .    ...
4B4E  57                 W    ...
4B4F  55 20              U    EOR &20,X
4B51  77                 w    ...
4B52  21 5A              !Z   AND (&5A,X)
4B54  77                 w    ...
4B55  EE 16 AC           ...  INC &AC16
4B58  88                 .    DEY
4B59  04                 .    ...
4B5A  57                 W    ...
4B5B  CB                 .    ...
4B5C  04                 .    ...
4B5D  57                 W    ...
4B5E  22                 "    ...
4B5F  57                 W    ...
4B60  D7                 .    ...
4B61  77                 w    ...
4B62  11 AA              ..   ORA (&AA),Y
4B64  BA                 .    TSX
4B65  03                 .    ...
4B66  04                 .    ...
4B67  57                 W    ...
4B68  18                 .    CLC
4B69  BE A8 04           ...  LDX &04A8,Y
4B6C  57                 W    ...
4B6D  04                 .    ...
4B6E  1F                 .    ...
4B6F  0E 19 BA           ...  ASL &BA19
4B72  04                 .    ...
4B73  57                 W    ...
4B74  04                 .    ...
4B75  8B                 .    ...
4B76  1B                 .    ...
4B77  A7                 .    ...
4B78  BA                 .    TSX
4B79  04                 .    ...
4B7A  57                 W    ...
4B7B  B8                 .    CLV
4B7C  03                 .    ...
4B7D  94 03              ..   STY &03
4B7F  AF                 .    ...
4B80  A6 AC              ..   LDX &AC
4B82  88                 .    DEY
4B83  04                 .    ...
4B84  57                 W    ...
4B85  B7                 .    ...
4B86  A2 1F              ..   LDX #&1F
4B88  94 18              ..   STY &18
4B8A  11 77              .w   ORA (&77),Y
4B8C  33                 3    ...
4B8D  57                 W    ...
4B8E  B7                 .    ...
4B8F  AD 77 11           .w.  LDA &1177
4B92  AA                 .    TAX
4B93  77                 w    ...
4B94  33                 3    ...
4B95  57                 W    ...
4B96  11 18              ..   ORA (&18),Y
4B98  18                 .    CLC
4B99  13                 .    ...
4B9A  77                 w    ...
4B9B  15 B2              ..   ORA &B2,X
4B9D  19 13 A3           ...  ORA &A313,Y
4BA0  04                 .    ...
4BA1  57                 W    ...
4BA2  03                 .    ...
4BA3  8E 05 1E           ...  STX &1E05
4BA6  89                 .    ...
4BA7  04                 .    ...
4BA8  57                 W    ...
4BA9  07                 .    ...
4BAA  18                 .    CLC
4BAB  8A                 .    TXA
4BAC  05 0E              ..   ORA &0E
4BAE  57                 W    ...
4BAF  A6 04              ..   LDX &04
4BB1  14                 .    ...
4BB2  18                 .    CLC
4BB3  04                 .    ...
4BB4  57                 W    ...
4BB5  3B                 ;    ...
4BB6  57                 W    ...
4BB7  00                 .    BRK
4BB8  B3                 .    ...
4BB9  1C                 .    ...
4BBA  94 C9              ..   STY &C9
4BBC  57                 W    ...
4BBD  14                 .    ...
4BBE  AF                 .    ...
4BBF  15 57              .W   ORA &57,X
4BC1  15 A2              ..   ORA &A2,X
4BC3  57                 W    ...
4BC4  B7                 .    ...
4BC5  15 89              ..   ORA &89,X
4BC7  57                 W    ...
4BC8  45 57              EW   EOR &57
4BCA  A0 04              ..   LDY #&04
4BCC  8A                 .    TXA
4BCD  57                 W    ...
4BCE  07                 .    ...
4BCF  AE 10 02           ...  LDX &0210
4BD2  AB                 .    ...
4BD3  57                 W    ...
4BD4  AF                 .    ...
4BD5  01 16              ..   ORA (&16,X)
4BD7  10 AB              ..   BPL &4B84
4BD9  57                 W    ...
4BDA  14                 .    ...
4BDB  02                 .    ...
4BDC  05 04              ..   ORA &04
4BDE  AB                 .    ...
4BDF  57                 W    ...
4BE0  04                 .    ...
4BE1  14                 .    ...
4BE2  8E 05 10           ...  STX &1005
4BE5  AB                 .    ...
4BE6  57                 W    ...
4BE7  26 77              &w   ROL &77
4BE9  14                 .    ...
4BEA  1E 01 8B           ...  ASL &8B01,Y
4BED  77                 w    ...
4BEE  00                 .    BRK
4BEF  B9 57 3F           .W?  LDA &3F57,Y
4BF2  77                 w    ...
4BF3  08                 .    PHP
4BF4  77                 w    ...
4BF5  37                 7    ...
4BF6  04                 .    ...
4BF7  57                 W    ...
4BF8  16 77              .w   ASL &77,X
4BFA  3F                 ?    ...
4BFB  77                 w    ...
4BFC  A6 8D              ..   LDX &8D
4BFE  16 8D              ..   ASL &8D,X
.addr4C00
4C00  57                 W    ...
4C01  26 77              &w   ROL &77
4C03  12                 .    ...
.addr4C04
4C04  B9 B5 A9           ...  LDA &A9B5,Y
4C07  16 1C              ..   ASL &1C,X
4C09  BA                 .    TSX
4C0A  57                 W    ...
4C0B  26 77              &w   ROL &77
4C0D  BC AE 05           ...  LDY &05AE,X
4C10  77                 w    ...
4C11  16 14              ..   ASL &14,X
4C13  AC 01 8C           ...  LDY &8C01
4C16  0E 57 F8           .W.  ASL &F857
4C19  0A                 .    ASL A
4C1A  77                 w    ...
4C1B  09 57              .W   ORA #&57
4C1D  C4 46              .F   CPY &46
4C1F  77                 w    ...
4C20  08                 .    PHP
4C21  77                 w    ...
4C22  37                 7    ...
4C23  57                 W    ...
4C24  F8                 .    SED
4C25  96 04              ..   STX &04,Y
4C27  70 77              pw   BVS &4CA0
4C29  35 77              5w   AND &77,X
4C2B  34                 4    ...
4C2C  57                 W    ...
4C2D  55 2D              U-   EOR &2D,X
4C2F  5A                 Z    ...
4C30  57                 W    ...
4C31  F8                 .    SED
4C32  3C                 <    ...
4C33  77                 w    ...
4C34  3B                 ;    ...
4C35  57                 W    ...
4C36  1D 02 1E           ...  ORA &1E02,X
4C39  BE 57 15           .W.  LDX &1557,Y
4C3C  AF                 .    ...
4C3D  19 13 0E           ...  ORA &0E13,Y
4C40  57                 W    ...
4C41  00                 .    BRK
4C42  A2 A3              ..   LDX #&A3
4C44  57                 W    ...
.addr4C45
4C45  15 A5              ..   ORA &A5,X
4C47  00                 .    BRK
4C48  57                 W    ...
4C49  10 B9              ..   BPL &4C04
4C4B  10 B2              ..   BPL &4BFF
4C4D  77                 w    ...
4C4E  15 AE              ..   ORA &AE,X
4C50  89                 .    ...
4C51  A3                 .    ...
4C52  04                 .    ...
4C53  57                 W    ...
4C54  45 57              EW   EOR &57
4C56  46 77              Fw   LSR &77
4C58  37                 7    ...
4C59  57                 W    ...
4C5A  46 77              Fw   LSR &77
4C5C  45 57              EW   EOR &57
4C5E  46 77              Fw   LSR &77
4C60  3F                 ?    ...
4C61  57                 W    ...
4C62  3F                 ?    ...
4C63  77                 w    ...
4C64  45 57              EW   EOR &57
4C66  11 8F              ..   ORA (&8F),Y
4C68  02                 .    ...
4C69  B7                 .    ...
4C6A  BB                 .    ...
4C6B  57                 W    ...
4C6C  12                 .    ...
4C6D  0F                 .    ...
4C6E  18                 .    CLC
4C6F  AC 14 57           ..W  LDY &5714
4C72  1F                 .    ...
4C73  18                 .    CLC
4C74  18                 .    CLC
4C75  07                 .    ...
4C76  0E 57 02           .W.  ASL &0257
4C79  B6 04              ..   LDX &04,Y
4C7B  02                 .    ...
4C7C  B3                 .    ...
4C7D  57                 W    ...
4C7E  12                 .    ...
4C7F  0F                 .    ...
4C80  14                 .    ...
4C81  8C A7 10           ...  STY &10A7
4C84  57                 W    ...
4C85  14                 .    ...
4C86  02                 .    ...
4C87  1E 04 A7           ...  ASL &A704,Y
4C8A  12                 .    ...
4C8B  57                 W    ...
4C8C  19 1E 10           ...  ORA &101E,Y
4C8F  1F                 .    ...
4C90  03                 .    ...
4C91  77                 w    ...
4C92  1B                 .    ...
4C93  1E 11 12           ...  ASL &1211,Y
4C96  57                 W    ...
4C97  14                 .    ...
4C98  16 04              ..   ASL &04,X
4C9A  1E B4 04           ...  ASL &04B4,Y
4C9D  57                 W    ...
4C9E  04                 .    ...
4C9F  8C 77 14           .w.  STY &1477
4CA2  18                 .    CLC
4CA3  1A                 .    ...
4CA4  04                 .    ...
4CA5  57                 W    ...
4CA6  55 2D              U-   EOR &2D,X
4CA8  5A                 Z    ...
4CA9  57                 W    ...
4CAA  54                 T    ...
4CAB  57                 W    ...
4CAC  C4 C6              ..   CPY &C6
4CAE  77                 w    ...
4CAF  54                 T    ...
4CB0  57                 W    ...
4CB1  C4 C5              ..   CPY &C5
4CB3  77                 w    ...
4CB4  54                 T    ...
4CB5  57                 W    ...
4CB6  C3                 .    ...
4CB7  C6 57              .W   DEC &57
4CB9  C3                 .    ...
4CBA  C5 57              .W   CMP &57
4CBC  04                 .    ...
4CBD  88                 .    DEY
4CBE  77                 w    ...
4CBF  18                 .    CLC
4CC0  11 87              ..   ORA (&87),Y
4CC2  15 8C              ..   ORA &8C,X
4CC4  14                 .    ...
4CC5  1F                 .    ...
4CC6  57                 W    ...
4CC7  04                 .    ...
4CC8  14                 .    ...
4CC9  8E 19 13           ...  STX &1319
4CCC  A5 1B              ..   LDA &1B
4CCE  57                 W    ...
4CCF  15 AE              ..   ORA &AE,X
4CD1  14                 .    ...
4CD2  1C                 .    ...
4CD3  10 02              ..   BPL &4CD7
4CD5  B9 13 57           ..W  LDA &5713,Y
4CD8  05 18              ..   ORA &18
4CDA  10 02              ..   BPL &4CDE
4CDC  12                 .    ...
4CDD  57                 W    ...
.addr4CDE
4CDE  00                 .    BRK
4CDF  1F                 .    ...
4CE0  AA                 .    TAX
4CE1  BA                 .    TSX
4CE2  88                 .    DEY
4CE3  77                 w    ...
4CE4  A0 8A              ..   LDY #&8A
4CE6  B2                 .    ...
4CE7  77                 w    ...
4CE8  1F                 .    ...
4CE9  12                 .    ...
4CEA  16 13              ..   ASL &13,X
4CEC  91 11              ..   STA (&11),Y
4CEE  AE 07 77           ..w  LDX &7707
4CF1  12                 .    ...
4CF2  B9 70 13           .p.  LDA &1370,Y
4CF5  77                 w    ...
4CF6  1C                 .    ...
4CF7  19 16 AD           ...  ORA &AD16,Y
4CFA  57                 W    ...
4CFB  19 77 02           .w.  ORA &0277,Y
4CFE  19 A5 B8           ...  ORA &B8A5,Y
4D01  05 1C              ..   ORA &1C
4D03  8F                 .    ...
4D04  B2                 .    ...
4D05  57                 W    ...
4D06  77                 w    ...
4D07  15 AA              ..   ORA &AA,X
4D09  A7                 .    ...
4D0A  10 57              .W   BPL &4D63
4D0C  77                 w    ...
4D0D  13                 .    ...
4D0E  02                 .    ...
4D0F  1B                 .    ...
4D10  1B                 .    ...
4D11  57                 W    ...
4D12  77                 w    ...
4D13  03                 .    ...
4D14  12                 .    ...
4D15  A6 18              ..   LDX &18
4D17  BB                 .    ...
4D18  57                 W    ...
4D19  77                 w    ...
4D1A  A5 01              ..   LDA &01
4D1C  18                 .    CLC
4D1D  1B                 .    ...
4D1E  03                 .    ...
4D1F  A7                 .    ...
4D20  10 57              .W   BPL &4D79
4D22  C6 57              .W   DEC &57
4D24  C5 57              .W   CMP &57
4D26  07                 .    ...
4D27  AE BE 57           ..W  LDX &57BE
4D2A  1B                 .    ...
4D2B  8C 03 B2           ...  STY &B203
4D2E  77                 w    ...
4D2F  C6 57              .W   DEC &57
4D31  13                 .    ...
4D32  02                 .    ...
4D33  1A                 .    ...
4D34  07                 .    ...
4D35  57                 W    ...
4D36  1E 77 1F           .w.  ASL &1F77,Y
4D39  12                 .    ...
4D3A  B9 87 25           ..%  LDA &2587,Y
4D3D  77                 w    ...
4D3E  B7                 .    ...
4D3F  18                 .    CLC
4D40  1C                 .    ...
4D41  94 98              ..   STY &98
4D43  77                 w    ...
4D44  16 07              ..   ASL &07,X
4D46  07                 .    ...
4D47  12                 .    ...
4D48  B9 93 A2           ...  LDA &A293,Y
4D4B  86 57              .W   STX &57
4D4D  0E 12 16           ...  ASL &1612
4D50  1F                 .    ...
4D51  7B                 {    ...
4D52  77                 w    ...
4D53  1E 77 1F           .w.  ASL &1F77,Y
4D56  12                 .    ...
4D57  B9 87 25           ..%  LDA &2587,Y
4D5A  77                 w    ...
4D5B  98                 .    TYA
4D5C  77                 w    ...
4D5D  B2                 .    ...
4D5E  11 03              ..   ORA (&03),Y
4D60  86 87              ..   STX &87
4D62  77                 w    ...
.addr4D63
4D63  00                 .    BRK
4D64  1F                 .    ...
4D65  1E B2 77           ..w  ASL &77B2,Y
4D68  15 16              ..   ORA &16,X
.addr4D6A
4D6A  14                 .    ...
4D6B  1C                 .    ...
4D6C  57                 W    ...
4D6D  10 8A              ..   BPL &4CF9
4D6F  77                 w    ...
4D70  E4 05              ..   CPX &05
4D72  77                 w    ...
4D73  1E 05 88           ...  ASL &8805,Y
4D76  77                 w    ...
4D77  16 04              ..   ASL &04,X
.addr4D79
4D79  04                 .    ...
4D7A  77                 w    ...
4D7B  18                 .    CLC
4D7C  01 A3              ..   ORA (&A3,X)
4D7E  77                 w    ...
4D7F  03                 .    ...
4D80  18                 .    CLC
4D81  86 57              .W   STX &57
4D83  BC 1A 12           ...  LDY &121A,X
4D86  77                 w    ...
4D87  24 85              $.   BIT &85
4D89  98                 .    TYA
4D8A  77                 w    ...
4D8B  00                 .    BRK
4D8C  16 04              ..   ASL &04,X
4D8E  77                 w    ...
4D8F  8D A1 77           ..w  STA &77A1
4D92  A2 86              ..   LDX #&86
4D94  57                 W    ...
4D95  03                 .    ...
4D96  05 0E              ..   ORA &0E
4D98  86 57              .W   STX &57
4D9A  57                 W    ...
4D9B  57                 W    ...
4D9C  57                 W    ...
4D9D  57                 W    ...
4D9E  00                 .    BRK
4D9F  16 04              ..   ASL &04,X
4DA1  07                 .    ...
4DA2  57                 W    ...
4DA3  1A                 .    ...
4DA4  18                 .    CLC
4DA5  B5 57              .W   LDA &57,X
4DA7  10 05              ..   BPL &4DAE
4DA9  02                 .    ...
4DAA  15 57              .W   ORA &57,X
4DAC  A8                 .    TAY
4DAD  03                 .    ...
.addr4DAE
4DAE  57                 W    ...
4DAF  45 57              EW   EOR &57
4DB1  07                 .    ...
4DB2  18                 .    CLC
4DB3  8A                 .    TXA
4DB4  57                 W    ...
4DB5  B9 03 04           ...  LDA &0403,Y
4DB8  77                 w    ...
4DB9  10 AF              ..   BPL &4D6A
4DBB  13                 .    ...
4DBC  02                 .    ...
4DBD  A2 12              ..   LDX #&12
4DBF  57                 W    ...
4DC0  0E 16 1C           ...  ASL &1C16
4DC3  57                 W    ...
4DC4  04                 .    ...
4DC5  19 16 8B           ...  ORA &8B16,Y
4DC8  57                 W    ...
4DC9  04                 .    ...
4DCA  1B                 .    ...
4DCB  02                 .    ...
4DCC  10 57              .W   BPL &4E25
4DCE  03                 .    ...
4DCF  05 18              ..   ORA &18
4DD1  07                 .    ...
4DD2  1E 14 B3           ...  ASL &B314,Y
4DD5  57                 W    ...
4DD6  13                 .    ...
4DD7  A1 8D              ..   LDA (&8D,X)
4DD9  57                 W    ...
4DDA  AF                 .    ...
4DDB  A7                 .    ...
4DDC  57                 W    ...
4DDD  1E 1A 07           ...  ASL &071A,Y
4DE0  A1 8A              ..   LDA (&8A,X)
4DE2  AF                 .    ...
4DE3  15 B2              ..   ORA &B2,X
4DE5  57                 W    ...
4DE6  12                 .    ...
4DE7  0F                 .    ...
4DE8  02                 .    ...
4DE9  A0 AF              ..   LDY #&AF
4DEB  19 03 57           ..W  ORA &5703,Y
4DEE  11 02              ..   ORA (&02),Y
4DF0  19 19 0E           ...  ORA &0E19,Y
4DF3  57                 W    ...
4DF4  00                 .    BRK
4DF5  1E A3 13           ...  ASL &13A3,Y
4DF8  57                 W    ...
4DF9  02                 .    ...
4DFA  B6 04              ..   LDX &04,Y
4DFC  02                 .    ...
4DFD  B3                 .    ...
4DFE  57                 W    ...
4DFF  89                 .    ...
4E00  AF                 .    ...
4E01  19 B0 57           ..W  ORA &57B0,Y
4E04  07                 .    ...
4E05  12                 .    ...
4E06  14                 .    ...
4E07  02                 .    ...
4E08  1B                 .    ...
4E09  1E B9 57           ..W  ASL &57B9,Y
4E0C  11 A5              ..   ORA (&A5),Y
4E0E  A9 A1              ..   LDA #&A1
4E10  03                 .    ...
4E11  57                 W    ...
4E12  18                 .    CLC
4E13  14                 .    ...
4E14  14                 .    ...
4E15  16 04              ..   ASL &04,X
4E17  1E 88 B3           ...  ASL &B388,Y
4E1A  57                 W    ...
4E1B  02                 .    ...
4E1C  19 07 A5           ...  ORA &A507,Y
4E1F  A6 14              ..   LDX &14
4E21  03                 .    ...
4E22  8F                 .    ...
4E23  B2                 .    ...
4E24  57                 W    ...
.addr4E25
4E25  13                 .    ...
4E26  A5 16              ..   LDA &16
4E28  13                 .    ...
4E29  11 02              ..   ORA (&02),Y
4E2B  1B                 .    ...
4E2C  57                 W    ...
4E2D  FC                 .    ...
4E2E  57                 W    ...
4E2F  0B                 .    ...
4E30  77                 w    ...
4E31  0C                 .    ...
4E32  77                 w    ...
4E33  11 AA              ..   ORA (&AA),Y
4E35  77                 w    ...
4E36  32                 2    ...
4E37  57                 W    ...
4E38  DB                 .    ...
4E39  E5 32              .2   SBC &32
4E3B  57                 W    ...
4E3C  31 77              1w   AND (&77),Y
4E3E  15 0E              ..   ORA &0E,X
4E40  77                 w    ...
4E41  30 57              0W   BMI &4E9A
4E43  DB                 .    ...
4E44  77                 w    ...
4E45  15 02              ..   ORA &02,X
4E47  03                 .    ...
4E48  77                 w    ...
4E49  D9 57 77           .Ww  CMP &7757,Y
4E4C  16 38              .8   ASL &38,X
4E4E  77                 w    ...
4E4F  27                 '    ...
4E50  57                 W    ...
4E51  07                 .    ...
4E52  1B                 .    ...
4E53  A8                 .    TAY
4E54  8A                 .    TXA
4E55  57                 W    ...
4E56  00                 .    BRK
4E57  AA                 .    TAX
4E58  1B                 .    ...
4E59  13                 .    ...
4E5A  57                 W    ...
4E5B  B5 12              ..   LDA &12,X
4E5D  77                 w    ...
4E5E  57                 W    ...
4E5F  B5 1E              ..   LDA &1E,X
4E61  04                 .    ...
4E62  77                 w    ...
4E63  57                 W    ...
4E64  B7                 .    ...
4E65  16 13              ..   ASL &13,X
4E67  85 CD              ..   STA &CD
4E69  57                 W    ...
4E6A  5E 5C 56           ^\V  LSR &565C,Y
4E6D  5F                 _    ...
4E6E  57                 W    ...
4E6F  13                 .    ...
4E70  05 1E              ..   ORA &1E
4E72  AD 57 77           .Ww  LDA &7757
4E75  14                 .    ...
4E76  A2 16              ..   LDX #&16
.addr4E78
4E78  B7                 .    ...
4E79  10 02              ..   BPL &4E7D
4E7B  12                 .    ...
4E7C  57                 W    ...
.addr4E7D
4E7D  1E A8 57           ..W  ASL &57A8,Y
4E80  44                 D    ...
4E81  14                 .    ...
4E82  18                 .    CLC
4E83  1A                 .    ...
4E84  1A                 .    ...
4E85  A8                 .    TAY
4E86  13                 .    ...
4E87  A3                 .    ...
4E88  57                 W    ...
4E89  3F                 ?    ...
4E8A  57                 W    ...
4E8B  1A                 .    ...
4E8C  8E 19 03           ...  STX &0319
4E8F  16 A7              ..   ASL &A7,X
4E91  57                 W    ...
4E92  AB                 .    ...
4E93  1E 15 B2           ...  ASL &B215,Y
4E96  57                 W    ...
4E97  03                 .    ...
4E98  A5 12              ..   LDA &12
.addr4E9A
4E9A  57                 W    ...
4E9B  04                 .    ...
4E9C  07                 .    ...
4E9D  18                 .    CLC
4E9E  03                 .    ...
4E9F  03                 .    ...
4EA0  AB                 .    ...
4EA1  57                 W    ...
4EA2  2F                 /    ...
4EA3  57                 W    ...
4EA4  2E 57 36           .W6  ROL &3657
4EA7  18                 .    CLC
4EA8  1E 13 57           ..W  ASL &5713,Y
4EAB  28                 (    PLP
4EAC  57                 W    ...
4EAD  29 57              )W   AND #&57
4EAF  A8                 .    TAY
4EB0  14                 .    ...
4EB1  1E A1 03           ...  ASL &03A1,Y
4EB4  57                 W    ...
4EB5  12                 .    ...
4EB6  0F                 .    ...
4EB7  BE 07 AC           ...  LDX &AC07,Y
4EBA  88                 .    DEY
4EBB  B3                 .    ...
4EBC  57                 W    ...
4EBD  12                 .    ...
4EBE  14                 .    ...
4EBF  BE 19 03           ...  LDX &0319,Y
4EC2  05 1E              ..   ORA &1E
4EC4  14                 .    ...
4EC5  57                 W    ...
4EC6  A7                 .    ...
4EC7  10 AF              ..   BPL &4E78
4EC9  A7                 .    ...
4ECA  AB                 .    ...
4ECB  57                 W    ...
4ECC  25 57              %W   AND &57
4ECE  1C                 .    ...
4ECF  8B                 .    ...
4ED0  1B                 .    ...
4ED1  A3                 .    ...
4ED2  57                 W    ...
4ED3  13                 .    ...
4ED4  12                 .    ...
4ED5  16 13              ..   ASL &13,X
4ED7  1B                 .    ...
4ED8  0E 57 12           .W.  ASL &1257
4EDB  01 8B              ..   ORA (&8B,X)
4EDD  57                 W    ...
4EDE  B2                 .    ...
4EDF  B5 B3              ..   LDA &B3,X
4EE1  57                 W    ...
4EE2  01 1E              ..   ORA (&1E,X)
4EE4  14                 .    ...
4EE5  1E 18 BB           ...  ASL &BB18,Y
4EE8  57                 W    ...
4EE9  8C 04 77           ..w  STY &7704
4EEC  57                 W    ...
4EED  5A                 Z    ...
4EEE  59 44 57           YDW  EOR &5744,Y
4EF1  79 5B 58           y[X  ADC &585B,Y
4EF4  57                 W    ...
4EF5  77                 w    ...
4EF6  A8                 .    TAY
4EF7  13                 .    ...
4EF8  77                 w    ...
4EF9  57                 W    ...
4EFA  0E 8E 57           ..W  ASL &578E
4EFD  07                 .    ...
4EFE  B9 1C 94           ...  LDA &941C,Y
4F01  1A                 .    ...
4F02  8A                 .    TXA
4F03  A3                 .    ...
4F04  04                 .    ...
4F05  57                 W    ...
4F06  13                 .    ...
4F07  BB                 .    ...
4F08  03                 .    ...
4F09  77                 w    ...
4F0A  14                 .    ...
4F0B  B7                 .    ...
4F0C  02                 .    ...
4F0D  13                 .    ...
4F0E  04                 .    ...
4F0F  57                 W    ...
4F10  1E BE 77           ..w  ASL &77BE,Y
4F13  A0 05              ..   LDY #&05
4F15  10 04              ..   BPL &4F1B
4F17  57                 W    ...
4F18  05 18              ..   ORA &18
4F1A  14                 .    ...
.addr4F1B
4F1B  1C                 .    ...
4F1C  77                 w    ...
4F1D  11 AA              ..   ORA (&AA),Y
4F1F  B8                 .    CLV
4F20  AC 88 04           ...  LDY &0488
4F23  57                 W    ...
4F24  01 18              ..   ORA (&18,X)
4F26  1B                 .    ...
4F27  14                 .    ...
4F28  16 B4              ..   ASL &B4,X
4F2A  BA                 .    TSX
4F2B  57                 W    ...
4F2C  07                 .    ...
4F2D  1B                 .    ...
4F2E  A8                 .    TAY
4F2F  03                 .    ...
4F30  57                 W    ...
4F31  03                 .    ...
4F32  02                 .    ...
4F33  1B                 .    ...
4F34  1E 07 57           ..W  ASL &5707,Y
4F37  15 A8              ..   ORA &A8,X
4F39  A8                 .    TAY
4F3A  16 57              .W   ASL &57,X
4F3C  14                 .    ...
4F3D  AA                 .    TAX
4F3E  19 57 45           .WE  ORA &4557,Y
4F41  00                 .    BRK
4F42  12                 .    ...
4F43  AB                 .    ...
4F44  57                 W    ...
4F45  45 57              EW   EOR &57
4F47  46 77              Fw   LSR &77
4F49  45 57              EW   EOR &57
4F4B  46 77              Fw   LSR &77
4F4D  3F                 ?    ...
4F4E  57                 W    ...
4F4F  A7                 .    ...
4F50  1F                 .    ...
4F51  16 BD              ..   ASL &BD,X
4F53  03                 .    ...
4F54  A8                 .    TAY
4F55  03                 .    ...
4F56  57                 W    ...
4F57  E8                 .    INX
4F58  57                 W    ...
4F59  A7                 .    ...
4F5A  10 77              .w   BPL &4FD3
4F5C  57                 W    ...
4F5D  AB                 .    ...
4F5E  77                 w    ...
4F5F  57                 W    ...
4F60  57                 W    ...
4F61  57                 W    ...
4F62  57                 W    ...
4F63  77                 w    ...
4F64  19 16 1A           ...  ORA &1A16,Y
4F67  12                 .    ...
4F68  68                 h    PLA
4F69  77                 w    ...
4F6A  57                 W    ...
4F6B  77                 w    ...
4F6C  03                 .    ...
4F6D  18                 .    CLC
4F6E  77                 w    ...
4F6F  57                 W    ...
4F70  77                 w    ...
4F71  1E 04 77           ..w  ASL &7704,Y
4F74  57                 W    ...
4F75  00                 .    BRK
4F76  16 04              ..   ASL &04,X
4F78  77                 w    ...
4F79  AE 89 77           ..w  LDX &7789
4F7C  8D A1 77           ..w  STA &77A1
4F7F  A2 77              .w   LDX #&77
4F81  44                 D    ...
4F82  57                 W    ...
4F83  79 5B 77           y[w  ADC &775B,Y
4F86  44                 D    ...
4F87  57                 W    ...
4F88  13                 .    ...
4F89  18                 .    CLC
4F8A  14                 .    ...
4F8B  1C                 .    ...
4F8C  AB                 .    ...
4F8D  57                 W    ...
4F8E  56 7F              V   LSR &7F,X
4F90  0E 78 19           .x.  ASL &1978
4F93  7E 68 57           ~hW  ROR &5768,X
4F96  04                 .    ...
4F97  1F                 .    ...
4F98  1E 07 57           ..W  ASL &5707,Y
4F9B  77                 w    ...
4F9C  16 77              .w   ASL &77,X
4F9E  57                 W    ...
4F9F  77                 w    ...
4FA0  A3                 .    ...
4FA1  05 1E              ..   ORA &1E
4FA3  BB                 .    ...
4FA4  57                 W    ...
4FA5  77                 w    ...
4FA6  19 12 00           ...  ORA &0012,Y
4FA9  77                 w    ...
4FAA  57                 W    ...
4FAB  55 77              Uw   EOR &77,X
4FAD  1F                 .    ...
4FAE  A3                 .    ...
4FAF  77                 w    ...
4FB0  B8                 .    CLV
4FB1  1D BA 03           ...  ORA &03BA,X
4FB4  0E 70 04           .p.  ASL &0470
4FB7  77                 w    ...
4FB8  04                 .    ...
4FB9  07                 .    ...
4FBA  16 BE              ..   ASL &BE,X
4FBC  77                 w    ...
4FBD  19 16 01           ...  ORA &0116,Y
4FC0  0E 5A 57           .ZW  ASL &575A
4FC3  E6 5F              ._   INC &5F
4FC5  56 77              Vw   LSR &77,X
4FC7  77                 w    ...
4FC8  1A                 .    ...
4FC9  BA                 .    TSX
4FCA  04                 .    ...
4FCB  16 B0              ..   ASL &B0,X
4FCD  77                 w    ...
4FCE  A1 13              ..   LDA (&13,X)
4FD0  04                 .    ...
4FD1  57                 W    ...
4FD2  77                 w    ...
.addr4FD3
4FD3  CD 77 53           .wS  CMP &5377
4FD6  7B                 {    ...
4FD7  77                 w    ...
4FD8  1E 77 5A           .wZ  ASL &5A77,Y
4FDB  16 1A              ..   ASL &1A,X
4FDD  55 77              Uw   EOR &77,X
4FDF  14                 .    ...
4FE0  16 07              ..   ASL &07,X
4FE2  03                 .    ...
4FE3  16 A7              ..   ASL &A7,X
4FE5  77                 w    ...
4FE6  4C 77 5A           LwZ  JMP &5A77
4FE9  18                 .    CLC
4FEA  11 84              ..   ORA (&84),Y
4FEC  57                 W    ...
4FED  57                 W    ...
4FEE  58                 X    CLI
4FEF  77                 w    ...
4FF0  02                 .    ...
4FF1  19 1C B4           ...  ORA &B41C,Y
4FF4  00                 .    BRK
4FF5  19 77 C6           .w.  ORA &C677,Y
4FF8  57                 W    ...
4FF9  5E 5F 40           ^_@  LSR &405F,Y
4FFC  56 A7              V.   LSR &A7,X
4FFE  14                 .    ...
4FFF  18                 .    CLC
5000  1A                 .    ...
5001  94 1A              ..   STY &1A
5003  BA                 .    TSX
5004  04                 .    ...
5005  16 B0              ..   ASL &B0,X
5007  57                 W    ...
5008  14                 .    ...
5009  02                 .    ...
500A  05 05              ..   ORA &05
500C  02                 .    ...
500D  B5 A3              ..   LDA &A3,X
500F  04                 .    ...
5010  57                 W    ...
5011  11 18              ..   ORA (&18),Y
5013  04                 .    ...
5014  13                 .    ...
5015  0E 1C 12           ...  ASL &121C
5018  77                 w    ...
5019  04                 .    ...
501A  1A                 .    ...
501B  0E B5 12           ...  ASL &12B5
.addr501E
501E  57                 W    ...
501F  11 AA              ..   ORA (&AA),Y
5021  03                 .    ...
5022  BA                 .    TSX
5023  A9 12              ..   LDA #&12
5025  57                 W    ...
5026  9C                 .    ...
5027  A5 BA              ..   LDA &BA
5029  A6 BE              ..   LDX &BE
502B  57                 W    ...
502C  1E 04 77           ..w  ASL &7704,Y
502F  A0 1B              ..   LDY #&1B
5031  1E 12 01           ...  ASL &0112,Y
5034  AB                 .    ...
5035  9E                 .    ...
5036  1F                 .    ...
5037  16 AD              ..   ASL &AD,X
5039  77                 w    ...
503A  1D 02 1A           ...  ORA &1A02,X
503D  07                 .    ...
503E  AB                 .    ...
503F  9E                 .    ...
5040  C3                 .    ...
5041  10 B3              ..   BPL &4FF6
5043  16 0F              ..   ASL &0F,X
5045  0E 57 4E           .WN  ASL &4E57
5048  5E 4A 59           ^JY  LSR &594A,Y
504B  55 10              U.   EOR &10,X
504D  18                 .    CLC
504E  18                 .    CLC
504F  13                 .    ...
5050  77                 w    ...
5051  13                 .    ...
5052  16 0E              ..   ASL &0E,X
5054  77                 w    ...
5055  CD 77 53           .wS  CMP &5377
5058  9B                 .    ...
5059  1E 5A 77           .Zw  ASL &775A,Y
505C  16 1A              ..   ASL &1A,X
505E  77                 w    ...
505F  44                 D    ...
5060  16 10              ..   ASL &10,X
5062  A1 03              ..   LDA (&03,X)
5064  77                 w    ...
5065  44                 D    ...
5066  15 AE              ..   ORA &AE,X
5068  1C                 .    ...
5069  12                 .    ...
506A  77                 w    ...
506B  18                 .    CLC
506C  11 77              .w   ORA (&77),Y
506E  44                 D    ...
506F  19 16 01           ...  ORA &0116,Y
5072  16 1B              ..   ASL &1B,X
5074  77                 w    ...
5075  44                 D    ...
5076  A7                 .    ...
5077  03                 .    ...
5078  12                 .    ...
5079  1B                 .    ...
507A  B2                 .    ...
507B  10 A1              ..   BPL &501E
507D  BE 9B 16           ...  LDX &169B,Y
5080  04                 .    ...
5081  77                 w    ...
5082  E4 77              .w   CPX &77
5084  1C                 .    ...
5085  B4 00              ..   LDY &00
5087  7B                 {    ...
5088  77                 w    ...
5089  C4 44              .D   CPY &44
508B  19 16 01           ...  ORA &0116,Y
508E  0E 77 1F           .w.  ASL &1F77
5091  16 AD              ..   ASL &AD,X
5093  77                 w    ...
5094  A0 A1              ..   LDY #&A1
5096  77                 w    ...
5097  1C                 .    ...
5098  12                 .    ...
5099  12                 .    ...
509A  07                 .    ...
509B  94 C4              ..   STY &C4
509D  44                 D    ...
509E  B5 B9              ..   LDA &B9,X
50A0  10 18              ..   BPL &50BA
50A2  1E 13 04           ...  ASL &0413,Y
50A5  77                 w    ...
50A6  18                 .    CLC
50A7  11 11              ..   ORA (&11),Y
50A9  77                 w    ...
50AA  E4 05              ..   CPX &05
50AC  77                 w    ...
50AD  16 04              ..   ASL &04,X
50AF  04                 .    ...
50B0  77                 w    ...
50B1  8E 03 77           ..w  STX &7703
50B4  A7                 .    ...
50B5  77                 w    ...
50B6  13                 .    ...
50B7  12                 .    ...
50B8  12                 .    ...
50B9  07                 .    ...
.addr50BA
50BA  77                 w    ...
50BB  04                 .    ...
50BC  07                 .    ...
50BD  16 BE              ..   ASL &BE,X
50BF  77                 w    ...
50C0  11 AA              ..   ORA (&AA),Y
50C2  77                 w    ...
50C3  B8                 .    CLV
50C4  19 0E 77           ..w  ORA &770E,Y
50C7  0E 12 B9           ...  ASL &B912
50CA  04                 .    ...
50CB  77                 w    ...
50CC  B4 00              ..   LDY &00
50CE  79 77 44           ywD  ADC &4477,Y
50D1  00                 .    BRK
50D2  12                 .    ...
50D3  1B                 .    ...
50D4  1B                 .    ...
50D5  77                 w    ...
50D6  C4 04              ..   CPY &04
50D8  8C 02 16           ...  STY &1602
50DB  AC 88 77           ..w  LDY &7788
50DE  1F                 .    ...
50DF  16 04              ..   ASL &04,X
50E1  77                 w    ...
50E2  14                 .    ...
50E3  1F                 .    ...
50E4  A8                 .    TAY
50E5  10 AB              ..   BPL &5092
50E7  9B                 .    ...
50E8  8E 05 77           ..w  STX &7705
50EB  15 18              ..   ORA &18,X
50ED  0E 04 77           ..w  ASL &7704
50F0  B9 12 77           ..w  LDA &7712,Y
50F3  A5 16              ..   LDA &16
50F5  13                 .    ...
50F6  0E 77 11           .w.  ASL &1177
50F9  AA                 .    TAX
50FA  87                 .    ...
50FB  07                 .    ...
50FC  02                 .    ...
50FD  04                 .    ...
50FE  1F                 .    ...
50FF  77                 w    ...
5100  05 1E              ..   ORA &1E
5102  10 1F              ..   BPL &5123
5104  03                 .    ...
5105  9E                 .    ...
5106  C4 1F              ..   CPY &1F
5108  18                 .    CLC
5109  1A                 .    ...
510A  12                 .    ...
.addr510B
510B  77                 w    ...
510C  04                 .    ...
510D  0E 04 03           ...  ASL &0304
5110  12                 .    ...
5111  1A                 .    ...
5112  77                 w    ...
5113  18                 .    CLC
5114  11 77              .w   ORA (&77),Y
5116  B5 18              ..   LDA &18,X
5118  8D 77 1A           .w.  STA &1A77
511B  18                 .    CLC
511C  B5 A3              ..   LDA &A3,X
511E  04                 .    ...
.addr511F
511F  9B                 .    ...
5120  4F                 O    ...
5121  5E 4A 1E           ^J.  LSR &1E4A,Y
5124  5A                 Z    ...
5125  77                 w    ...
5126  1F                 .    ...
5127  16 AD              ..   ASL &AD,X
5129  77                 w    ...
512A  18                 .    CLC
512B  15 03              ..   ORA &03,X
512D  16 A7              ..   ASL &A7,X
512F  93                 .    ...
5130  C4 13              ..   CPY &13
5132  12                 .    ...
5133  11 A1              ..   ORA (&A1),Y
5135  BE 77 07           .w.  LDX &0777,Y
5138  AE 19 04           ...  LDX &0419
513B  77                 w    ...
513C  11 AA              ..   ORA (&AA),Y
513E  77                 w    ...
513F  B5 12              ..   LDA &12,X
5141  1E 05 77           ..w  ASL &7705,Y
5144  44                 D    ...
5145  1F                 .    ...
5146  1E AD 77           ..w  ASL &77AD,Y
5149  44                 D    ...
514A  00                 .    BRK
514B  AA                 .    TAX
514C  1B                 .    ...
514D  13                 .    ...
514E  04                 .    ...
514F  9B                 .    ...
5150  C4 A0              ..   CPY &A0
5152  8A                 .    TXA
5153  B2                 .    ...
5154  04                 .    ...
5155  77                 w    ...
5156  1C                 .    ...
5157  B4 00              ..   LDY &00
5159  77                 w    ...
515A  00                 .    BRK
515B  12                 .    ...
515C  70 AD              p.   BVS &510B
515E  77                 w    ...
515F  10 18              ..   BPL &5179
5161  03                 .    ...
5162  77                 w    ...
5163  BC 1A 12           ...  LDY &121A,X
5166  B5 94              ..   LDA &94,X
5168  15 02              ..   ORA &02,X
516A  03                 .    ...
516B  77                 w    ...
516C  B4 03              ..   LDY &03
516E  77                 w    ...
516F  00                 .    BRK
5170  1F                 .    ...
5171  A2 9B              ..   LDX #&9B
5173  1E 11 77           ..w  ASL &7711,Y
5176  44                 D    ...
5177  1E 77 03           .w.  ASL &0377,Y
517A  AF                 .    ...
517B  19 04 1A           ...  ORA &1A04,Y
517E  8C 77 C4           .w.  STY &C477
5181  07                 .    ...
5182  AE 19 04           ...  LDX &0419
5185  9E                 .    ...
5186  8E 05 77           ..w  STX &7705
5189  15 16              ..   ORA &16,X
518B  8D 77 88           .w.  STA &8877
518E  77                 w    ...
518F  44                 D    ...
5190  BD A5 AF           ...  LDA &AFA5,X
5193  77                 w    ...
5194  B5 12              ..   LDA &12,X
5196  0E 70 1B           .p.  ASL &1B70
5199  1B                 .    ...
519A  77                 w    ...
519B  A7                 .    ...
519C  03                 .    ...
519D  A3                 .    ...
519E  BE 07 03           ...  LDX &0307,Y
51A1  77                 w    ...
51A2  C4 03              ..   CPY &03
51A4  05 A8              ..   ORA &A8
51A6  04                 .    ...
51A7  1A                 .    ...
51A8  1E 04 04           ...  ASL &0404,Y
51AB  1E 88 79           ..y  ASL &7988,Y
51AE  77                 w    ...
51AF  44                 D    ...
51B0  1E 77 19           .w.  ASL &1977,Y
51B3  12                 .    ...
51B4  AB                 .    ...
51B5  87                 .    ...
51B6  98                 .    TYA
51B7  9E                 .    ...
51B8  B8                 .    CLV
51B9  1C                 .    ...
51BA  12                 .    ...
51BB  77                 w    ...
51BC  C4 05              ..   CPY &05
51BE  02                 .    ...
51BF  19 9B E4           ...  ORA &E49B,Y
51C2  70 A5              p.   BVS &5169
51C4  77                 w    ...
51C5  12                 .    ...
51C6  B2                 .    ...
51C7  14                 .    ...
51C8  03                 .    ...
51C9  AB                 .    ...
51CA  9B                 .    ...
51CB  C4 07              ..   CPY &07
51CD  AE 19 04           ...  LDX &0419
51D0  77                 w    ...
51D1  16 A5              ..   ASL &A5,X
51D3  77                 w    ...
51D4  02                 .    ...
51D5  19 1E 07           ...  ORA &071E,Y
51D8  02                 .    ...
51D9  1B                 .    ...
51DA  8D 77 14           .w.  STA &1477
51DD  18                 .    CLC
51DE  13                 .    ...
51DF  93                 .    ...
51E0  00                 .    BRK
51E1  1E B5 A7           ...  ASL &A7B5,Y
51E4  77                 w    ...
51E5  C3                 .    ...
51E6  03                 .    ...
51E7  05 A8              ..   ORA &A8
51E9  04                 .    ...
51EA  1A                 .    ...
51EB  1E 04 04           ...  ASL &0404,Y
51EE  1E 88 9B           ...  ASL &9B88,Y
51F1  5F                 _    ...
51F2  E4 77              .w   CPX &77
51F4  00                 .    BRK
51F5  8B                 .    ...
51F6  1B                 .    ...
51F7  77                 w    ...
51F8  A0 77              .w   LDY #&77
51FA  07                 .    ...
51FB  16 1E              ..   ASL &1E,X
51FD  13                 .    ...
51FE  9B                 .    ...
51FF  77                 w    ...
5200  77                 w    ...
5201  77                 w    ...
5202  77                 w    ...
5203  44                 D    ...
5204  10 18              ..   BPL &521E
5206  18                 .    CLC
5207  13                 .    ...
5208  77                 w    ...
5209  1B                 .    ...
520A  02                 .    ...
520B  14                 .    ...
520C  1C                 .    ...
520D  77                 w    ...
520E  CD 83 4F           ..O  CMP &4F83
5211  57                 W    ...
5212  4E 5E 4A           N^J  LSR &4A5E
5215  5F                 _    ...
5216  59 5A 44           YZD  EOR &445A,Y
5219  00                 .    BRK
521A  12                 .    ...
521B  1B                 .    ...
521C  1B                 .    ...
521D  77                 w    ...
.addr521E
521E  13                 .    ...
521F  88                 .    DEY
5220  12                 .    ...
5221  77                 w    ...
5222  CD 9B E4           ...  CMP &E49B
5225  77                 w    ...
5226  1F                 .    ...
5227  16 AD              ..   ASL &AD,X
5229  77                 w    ...
522A  8D 05 01           ...  STA &0105
522D  93                 .    ...
522E  02                 .    ...
522F  04                 .    ...
5230  77                 w    ...
5231  00                 .    BRK
5232  12                 .    ...
5233  1B                 .    ...
5234  1B                 .    ...
5235  E5 00              ..   SBC &00
5237  12                 .    ...
5238  77                 w    ...
5239  04                 .    ...
523A  1F                 .    ...
523B  B3                 .    ...
523C  1B                 .    ...
523D  77                 w    ...
523E  A5 1A              ..   LDA &1A
5240  12                 .    ...
5241  1A                 .    ...
5242  15 A3              ..   ORA &A3,X
5244  9B                 .    ...
5245  00                 .    BRK
5246  12                 .    ...
5247  77                 w    ...
5248  13                 .    ...
5249  1E 13 77           ..w  ASL &7713,Y
524C  B4 03              ..   LDY &03
524E  77                 w    ...
524F  12                 .    ...
5250  0F                 .    ...
5251  07                 .    ...
5252  12                 .    ...
5253  14                 .    ...
5254  03                 .    ...
5255  77                 w    ...
5256  C4 44              .D   CPY &44
5258  B5 B9              ..   LDA &B9,X
525A  10 18              ..   BPL &5274
525C  1E 13 04           ...  ASL &0413,Y
525F  9E                 .    ...
5260  11 A7              ..   ORA (&A7),Y
5262  13                 .    ...
5263  77                 w    ...
5264  8E 03 77           ..w  STX &7703
5267  16 15              ..   ASL &15,X
5269  8E 03 77           ..w  STX &7703
526C  E4 9B              ..   CPX &9B
526E  11 AA              ..   ORA (&AA),Y
5270  77                 w    ...
5271  C4 1A              ..   CPY &1A
5273  18                 .    CLC
.addr5274
5274  1A                 .    ...
5275  A1 03              ..   LDA (&03,X)
5277  77                 w    ...
5278  07                 .    ...
5279  B2                 .    ...
527A  16 8D              ..   ASL &8D,X
527C  77                 w    ...
527D  16 14              ..   ASL &14,X
527F  BE 07 03           ...  LDX &0307,Y
5282  77                 w    ...
5283  C3                 .    ...
5284  44                 D    ...
5285  19 16 01           ...  ORA &0116,Y
5288  0E 77 51           .wQ  ASL &5177
528B  25 52              %R   AND &52
528D  77                 w    ...
528E  16 04              ..   ASL &04,X
5290  77                 w    ...
5291  07                 .    ...
5292  16 0E              ..   ASL &0E,X
5294  1A                 .    ...
5295  A1 03              ..   LDA (&03,X)
5297  83                 .    ...
5298  4F                 O    ...
5299  57                 W    ...
529A  57                 W    ...
529B  04                 .    ...
529C  1F                 .    ...
529D  A5 00              ..   LDA &00
529F  57                 W    ...
52A0  A0 16              ..   LDY #&16
52A2  89                 .    ...
52A3  57                 W    ...
52A4  15 1E              ..   ORA &1E,X
52A6  04                 .    ...
52A7  88                 .    DEY
52A8  57                 W    ...
52A9  04                 .    ...
52AA  19 16 1C           ...  ORA &1C16,Y
52AD  12                 .    ...
52AE  57                 W    ...
52AF  00                 .    BRK
52B0  18                 .    CLC
52B1  1B                 .    ...
52B2  11 57              .W   ORA (&57),Y
52B4  B2                 .    ...
52B5  18                 .    CLC
52B6  07                 .    ...
52B7  B9 13 57           ..W  LDA &5713,Y
52BA  14                 .    ...
52BB  A2 57              .W   LDX #&57
52BD  1A                 .    ...
52BE  88                 .    DEY
52BF  1C                 .    ...
52C0  12                 .    ...
52C1  0E 57 10           .W.  ASL &1057
52C4  18                 .    CLC
52C5  A2 57              .W   LDX #&57
52C7  11 1E              ..   ORA (&1E),Y
52C9  04                 .    ...
52CA  1F                 .    ...
52CB  57                 W    ...
52CC  3D 77 3E           =w>  AND &3E77,X
52CF  57                 W    ...
52D0  46 77              Fw   LSR &77
52D2  2F                 /    ...
52D3  77                 w    ...
52D4  2C 57 F8           ,W.  BIT &F857
52D7  3C                 <    ...
52D8  77                 w    ...
52D9  2E 77 2C           .w,  ROL &2C77
52DC  57                 W    ...
52DD  2B                 +    ...
52DE  77                 w    ...
52DF  2A                 *    ROL A
52E0  57                 W    ...
52E1  3D 77 3E           =w>  AND &3E77,X
52E4  57                 W    ...
52E5  1A                 .    ...
52E6  12                 .    ...
52E7  A2 57              .W   LDX #&57
52E9  14                 .    ...
52EA  02                 .    ...
.addr52EB
52EB  03                 .    ...
52EC  1B                 .    ...
52ED  8A                 .    TXA
52EE  57                 W    ...
52EF  89                 .    ...
52F0  12                 .    ...
52F1  16 1C              ..   ASL &1C,X
52F3  57                 W    ...
52F4  15 02              ..   ORA &02,X
52F6  05 10              ..   ORA &10
52F8  A3                 .    ...
52F9  04                 .    ...
52FA  57                 W    ...
52FB  BC 02 07           ...  LDY &0702,X
52FE  57                 W    ...
52FF  1E BE 57           ..W  ASL &57BE,Y
5302  1A                 .    ...
5303  02                 .    ...
5304  13                 .    ...
5305  57                 W    ...
5306  0D A3 18           ...  ORA &18A3
5309  7A                 z    ...
530A  44                 D    ...
530B  10 57              .W   BPL &5364
530D  01 16              ..   ORA (&16,X)
530F  14                 .    ...
5310  02                 .    ...
5311  02                 .    ...
5312  1A                 .    ...
5313  57                 W    ...
5314  46 77              Fw   LSR &77
5316  02                 .    ...
5317  1B                 .    ...
5318  03                 .    ...
5319  AF                 .    ...
531A  57                 W    ...
531B  1F                 .    ...
531C  18                 .    CLC
531D  14                 .    ...
531E  1C                 .    ...
531F  12                 .    ...
5320  0E 57 14           .W.  ASL &1457
5323  05 1E              ..   ORA &1E
5325  14                 .    ...
5326  1C                 .    ...
5327  8A                 .    TXA
5328  57                 W    ...
5329  1C                 .    ...
532A  B9 A2 12           ...  LDA &12A2,Y
532D  57                 W    ...
532E  07                 .    ...
532F  18                 .    CLC
5330  B7                 .    ...
5331  57                 W    ...
5332  03                 .    ...
5333  A1 19              ..   LDA (&19,X)
5335  1E 04 57           ..W  ASL &5704,Y
5338  57                 W    ...
5339  D3                 .    ...
533A  96 24              .$   STX &24,Y
533C  1C                 .    ...
.addr533D
533D  FD 4F 35           .O5  SBC &354F,X
5340  76 64              vd   ROR &64,X
5342  20 44 A4            D.  JSR &A444
5345  DC                 .    ...
5346  6A                 j    ROR A
5347  10 A2              ..   BPL &52EB
5349  03                 .    ...
534A  6B                 k    ...
534B  1A                 .    ...
534C  C0 B8              ..   CPY #&B8
534E  05 65              .e   ORA &65
5350  C1 29              .)   CMP (&29,X)
5352  80                 .    ...
5353  00                 .    BRK
5354  00                 .    BRK
5355  00                 .    BRK
5356  01 01              ..   ORA (&01,X)
5358  01 01              ..   ORA (&01,X)
535A  82                 .    ...
535B  01 01              ..   ORA (&01,X)
535D  01 01              ..   ORA (&01,X)
535F  01 01              ..   ORA (&01,X)
5361  01 01              ..   ORA (&01,X)
5363  01 01              ..   ORA (&01,X)
5365  01 01              ..   ORA (&01,X)
5367  01 02              ..   ORA (&02,X)
5369  01 82              ..   ORA (&82,X)
536B  57                 W    ...
536C  C4 14              ..   CPY &14
536E  18                 .    CLC
536F  B7                 .    ...
5370  19 1E 89           ...  ORA &891E,Y
5373  04                 .    ...
5374  77                 w    ...
5375  1F                 .    ...
5376  12                 .    ...
5377  A5 77              .w   LDA &77
5379  1F                 .    ...
537A  16 AD              ..   ASL &AD,X
537C  77                 w    ...
537D  01 1E              ..   ORA (&1E,X)
537F  18                 .    CLC
5380  1B                 .    ...
5381  A2 AB              ..   LDX #&AB
5383  55 77              Uw   EOR &77,X
5385  A7                 .    ...
5386  03                 .    ...
5387  A3                 .    ...
5388  10 B3              ..   BPL &533D
538A  16 14              ..   ASL &14,X
538C  AC 14 77           ..w  LDY &7714
538F  14                 .    ...
5390  B7                 .    ...
5391  19 94 07           ...  ORA &0794,Y
5394  05 18              ..   ORA &18
5396  03                 .    ...
5397  18                 .    CLC
5398  14                 .    ...
5399  18                 .    CLC
539A  1B                 .    ...
539B  5A                 Z    ...
539C  E5 04              ..   SBC &04
539E  1F                 .    ...
539F  8E 1B 13           ...  STX &131B
53A2  77                 w    ...
53A3  A0 77              .w   LDY #&77
53A5  16 01              ..   ASL &01,X
53A7  18                 .    CLC
53A8  1E 13 AB           ...  ASL &AB13,Y
53AB  57                 W    ...
53AC  C4 14              ..   CPY &14
53AE  88                 .    DEY
.addr53AF
53AF  89                 .    ...
53B0  05 1E              ..   ORA &1E
53B2  14                 .    ...
53B3  03                 .    ...
53B4  AA                 .    TAX
53B5  77                 w    ...
53B6  9C                 .    ...
53B7  A5 BA              ..   LDA &BA
53B9  A6 BE              ..   LDX &BE
53BB  7B                 {    ...
53BC  77                 w    ...
53BD  CD 57 16           .W.  CMP &1657
53C0  77                 w    ...
53C1  25 77              %w   AND &77
53C3  B7                 .    ...
53C4  18                 .    CLC
53C5  1C                 .    ...
53C6  94 98              ..   STY &98
53C8  77                 w    ...
53C9  B2                 .    ...
53CA  11 03              ..   ORA (&03),Y
53CC  77                 w    ...
53CD  1F                 .    ...
53CE  12                 .    ...
53CF  A5 87              ..   LDA &87
53D1  00                 .    BRK
53D2  1F                 .    ...
53D3  1E B2 77           ..w  ASL &77B2,Y
53D6  15 16              ..   ORA &16,X
53D8  14                 .    ...
53D9  1C                 .    ...
53DA  79 77 1B           yw.  ADC &1B77,Y
53DD  18                 .    CLC
53DE  18                 .    CLC
53DF  1C                 .    ...
53E0  93                 .    ...
53E1  15 8E              ..   ORA &8E,X
53E3  19 13 77           ..w  ORA &7713,Y
53E6  11 AA              ..   ORA (&AA),Y
53E8  77                 w    ...
53E9  B9 12 B1           ...  LDA &B112,Y
53EC  57                 W    ...
53ED  0E 12 07           ...  ASL &0712
53F0  7B                 {    ...
53F1  87                 .    ...
53F2  25 85              %.   AND &85
53F4  98                 .    TYA
53F5  77                 w    ...
53F6  1F                 .    ...
53F7  16 13              ..   ASL &13,X
53F9  87                 .    ...
53FA  10 B3              ..   BPL &53AF
53FC  16 14              ..   ASL &14,X
53FE  AC 14 77           ..w  LDY &7714
5401  1F                 .    ...
5402  0E 07 A3           ...  ASL &A307
5405  13                 .    ...
5406  05 1E              ..   ORA &1E
5408  AD 77 11           .w.  LDA &1177
540B  8C 03 93           ...  STY &9303
540E  1F                 .    ...
540F  12                 .    ...
5410  A5 79              .y   LDA &79
5412  77                 w    ...
5413  BB                 .    ...
5414  93                 .    ...
5415  8C 77 03           .w.  STY &0377
5418  18                 .    CLC
5419  18                 .    CLC
541A  57                 W    ...
541B  C3                 .    ...
541C  77                 w    ...
541D  25 77              %w   AND &77
.addr541F
541F  98                 .    TYA
5420  77                 w    ...
5421  13                 .    ...
5422  12                 .    ...
5423  1F                 .    ...
5424  0E 07 93           ...  ASL &9307
5427  1F                 .    ...
5428  12                 .    ...
5429  A5 77              .w   LDA &77
542B  11 05              ..   ORA (&05),Y
542D  18                 .    CLC
542E  1A                 .    ...
542F  77                 w    ...
5430  B4 00              ..   LDY &00
5432  1F                 .    ...
5433  12                 .    ...
5434  A5 7B              .{   LDA &7B
5436  77                 w    ...
5437  04                 .    ...
5438  02                 .    ...
5439  19 77 04           .w.  ORA &0477,Y
543C  1C                 .    ...
543D  1E 1A 1A           ...  ASL &1A1A,Y
5440  AB                 .    ...
5441  E5 1D              ..   SBC &1D
5443  02                 .    ...
5444  1A                 .    ...
5445  07                 .    ...
5446  AB                 .    ...
5447  79 77 1E           yw.  ADC &1E77,Y
544A  77                 w    ...
544B  1F                 .    ...
544C  12                 .    ...
544D  B9 77 8C           .w.  LDA &8C77,Y
5450  77                 w    ...
5451  00                 .    BRK
5452  A1 03              ..   LDA (&03,X)
5454  9E                 .    ...
5455  A7                 .    ...
5456  BD A0 57           ..W  LDA &57A0,X
5459  24 77              $w   BIT &77
545B  98                 .    TYA
545C  77                 w    ...
545D  00                 .    BRK
545E  A1 03              ..   LDA (&03,X)
5460  77                 w    ...
5461  11 AA              ..   ORA (&AA),Y
5463  77                 w    ...
5464  1A                 .    ...
5465  12                 .    ...
5466  77                 w    ...
5467  A2 77              .w   LDX #&77
5469  16 BB              ..   ASL &BB,X
546B  B9 79 77           .yw  LDA &7779,Y
546E  1A                 .    ...
546F  0E 77 AE           .w.  ASL &AE77
5472  04                 .    ...
5473  A3                 .    ...
5474  04                 .    ...
5475  77                 w    ...
5476  13                 .    ...
5477  1E 13 19           ...  ASL &1913,Y
547A  70 03              p.   BVS &547F
547C  77                 w    ...
547D  12                 .    ...
547E  01 A1              ..   ORA (&A1,X)
5480  77                 w    ...
5481  04                 .    ...
5482  14                 .    ...
5483  AF                 .    ...
5484  03                 .    ...
5485  14                 .    ...
5486  1F                 .    ...
5487  77                 w    ...
5488  C4 24              .$   CPY &24
548A  57                 W    ...
548B  18                 .    CLC
548C  1F                 .    ...
548D  77                 w    ...
548E  13                 .    ...
548F  12                 .    ...
5490  B9 77 1A           .w.  LDA &1A77,Y
5493  12                 .    ...
5494  77                 w    ...
5495  0E BA 79           ..y  ASL &79BA
5498  87                 .    ...
5499  11 05              ..   ORA (&05),Y
549B  1E 10 1F           ...  ASL &1F10,Y
549E  03                 .    ...
549F  11 02              ..   ORA (&02),Y
54A1  1B                 .    ...
54A2  77                 w    ...
54A3  05 18              ..   ORA &18
54A5  10 02              ..   BPL &54A9
54A7  12                 .    ...
54A8  77                 w    ...
.addr54A9
54A9  00                 .    BRK
54AA  1E B5 77           ..w  ASL &77B5,Y
54AD  00                 .    BRK
54AE  1F                 .    ...
54AF  A2 77              .w   LDX #&77
54B1  1E 77 A0           .w.  ASL &A077,Y
54B4  1B                 .    ...
54B5  1E 12 AD           ...  ASL &AD12,Y
54B8  77                 w    ...
54B9  E4 77              .w   CPX &77
54BB  07                 .    ...
54BC  12                 .    ...
54BD  18                 .    CLC
54BE  07                 .    ...
54BF  B2                 .    ...
54C0  77                 w    ...
54C1  14                 .    ...
54C2  B3                 .    ...
54C3  1B                 .    ...
54C4  87                 .    ...
54C5  B2                 .    ...
54C6  16 13              ..   ASL &13,X
54C8  77                 w    ...
54C9  07                 .    ...
54CA  18                 .    CLC
54CB  89                 .    ...
54CC  A3                 .    ...
54CD  1E AA 77           ..w  ASL &77AA,Y
54D0  04                 .    ...
54D1  1F                 .    ...
54D2  18                 .    CLC
54D3  03                 .    ...
54D4  77                 w    ...
54D5  02                 .    ...
54D6  07                 .    ...
54D7  77                 w    ...
54D8  B7                 .    ...
54D9  03                 .    ...
54DA  04                 .    ...
54DB  77                 w    ...
54DC  18                 .    CLC
54DD  11 77              .w   ORA (&77),Y
54DF  B5 18              ..   LDA &18,X
54E1  8D 77 A0           .w.  STA &A077
54E4  16 89              ..   ASL &89,X
54E6  1B                 .    ...
54E7  0E 77 07           .w.  ASL &0777
54EA  1E AF 03           ...  ASL &03AF,Y
54ED  BA                 .    TSX
54EE  E5 00              ..   SBC &00
54F0  A1 03              ..   LDA (&03,X)
54F2  9E                 .    ...
54F3  BB                 .    ...
54F4  B2                 .    ...
54F5  05 1E              ..   ORA &1E
54F7  57                 W    ...
54F8  E4 77              .w   CPX &77
54FA  14                 .    ...
54FB  A8                 .    TAY
54FC  77                 w    ...
54FD  03                 .    ...
54FE  16 14              ..   ASL &14,X
5500  1C                 .    ...
5501  B2                 .    ...
5502  77                 w    ...
5503  C4 3F              .?   CPY &3F
5505  77                 w    ...
5506  24 77              $w   BIT &77
5508  1E 11 77           ..w  ASL &7711,Y
550B  E4 77              .w   CPX &77
550D  1B                 .    ...
550E  1E 1C 12           ...  ASL &121C,Y
5511  79 77 1F           yw.  ADC &1F77,Y
5514  12                 .    ...
5515  70 04              p.   BVS &551B
5517  77                 w    ...
5518  A2 77              .w   LDX #&77
551A  AA                 .    TAX
.addr551B
551B  B9 AF 57           ..W  LDA &57AF,Y
551E  56 14              V.   LSR &14,X
5520  18                 .    CLC
5521  1A                 .    ...
5522  94 BC              ..   STY &BC
5524  88                 .    DEY
5525  6D 77 12           mw.  ADC &1277
5528  1B                 .    ...
5529  8C 12 77           ..w  STY &7712
552C  1E 1E 57           ..W  ASL &571E,Y
552F  23                 #    ...
5530  57                 W    ...
5531  23                 #    ...
5532  57                 W    ...
5533  23                 #    ...
5534  57                 W    ...
5535  23                 #    ...
5536  57                 W    ...
5537  23                 #    ...
5538  57                 W    ...
5539  23                 #    ...
553A  57                 W    ...
553B  23                 #    ...
553C  57                 W    ...
553D  23                 #    ...
553E  57                 W    ...
553F  23                 #    ...
5540  57                 W    ...
5541  23                 #    ...
5542  57                 W    ...
5543  23                 #    ...
5544  57                 W    ...
5545  23                 #    ...
5546  57                 W    ...
5547  23                 #    ...
5548  57                 W    ...
5549  15 18              ..   ORA &18,X
554B  0E 77 16           .w.  ASL &1677
554E  A5 77              .w   LDA &77
5550  E4 77              .w   CPX &77
5552  A7                 .    ...
5553  77                 w    ...
5554  C4 00              ..   CPY &00
5556  05 88              ..   ORA &88
5558  10 77              .w   BPL &55D1
555A  10 B3              ..   BPL &550F
555C  16 0F              ..   ASL &0F,X
555E  0E 76 57           .vW  ASL &5776
5561  B5 A3              ..   LDA &A3,X
5563  12                 .    ...
5564  70 04              p.   BVS &556A
5566  87                 .    ...
5567  A5 B3              ..   LDA &B3
5569  77                 w    ...
.addr556A
556A  24 77              $w   BIT &77
556C  07                 .    ...
556D  1E AF 03           ...  ASL &03AF,Y
5570  12                 .    ...
5571  77                 w    ...
5572  8E 03 77           ..w  STX &7703
5575  B5 A3              ..   LDA &A3,X
5577  12                 .    ...
5578  57                 W    ...
5579  C4 96              ..   CPY &96
557B  04                 .    ...
557C  77                 w    ...
557D  18                 .    CLC
557E  11 77              .w   ORA (&77),Y
5580  3A                 :    ...
5581  77                 w    ...
5582  16 A5              ..   ASL &A5,X
5584  77                 w    ...
5585  BC 77 16           .w.  LDY &1677,X
5588  B8                 .    CLV
5589  0D A7 10           ...  ORA &10A7
558C  1B                 .    ...
558D  0E 77 07           .w.  ASL &0777
5590  05 1E              ..   ORA &1E
5592  1A                 .    ...
5593  1E AC AD           ...  ASL &ADAC,Y
5596  77                 w    ...
5597  B5 A2              ..   LDA &A2,X
5599  77                 w    ...
559A  B5 12              ..   LDA &12,X
559C  0E 77 89           .w.  ASL &8977
559F  8B                 .    ...
55A0  1B                 .    ...
55A1  77                 w    ...
55A2  B5 A7              ..   LDA &A7,X
55A4  1C                 .    ...
55A5  77                 w    ...
55A6  44                 D    ...
55A7  16 7D              .}   ASL &7D,X
55A9  7D 7D 7D           }}}  ADC &7D7D,X
55AC  7D 05 9D           }..  ADC &9D05,X
55AF  16 77              .w   ASL &77,X
55B1  07                 .    ...
55B2  A5 03              ..   LDA &03
55B4  03                 .    ...
55B5  0E 77 19           .w.  ASL &1977
55B8  12                 .    ...
55B9  A2 77              .w   LDX #&77
55BB  10 16              ..   BPL &55D3
55BD  1A                 .    ...
55BE  12                 .    ...
55BF  57                 W    ...

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

SAVE "bin/T.Code", start, end, start, start
