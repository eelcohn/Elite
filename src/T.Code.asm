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
1447  A8                 .    TAY
1448  13                 .    ...
1449  AB                 .    ...
144A  13                 .    ...
144B  AC 31 AC           .1.  LDY &AC31
144E  31 D9              1.   AND (&D9),Y
1450  13                 .    ...
1451  D2                 .    ...
1452  13                 .    ...
1453  8F                 .    ...
1454  1C                 .    ...
1455  B6 13              ..   LDX &13,Y
1457  C0 13              ..   CPY #&13
1459  8F                 .    ...
145A  1C                 .    ...
145B  F5 18              ..   SBC &18,X
145D  8F                 .    ...
145E  1C                 .    ...
145F  C7                 .    ...
1460  13                 .    ...
1461  DF                 .    ...
1462  13                 .    ...
1463  E2                 .    ...
1464  13                 .    ...
1465  8D 1C EC           ...  STA &EC1C
1468  13                 .    ...
1469  0A                 .    ASL A
146A  14                 .    ...
146B  29 14              ).   AND #&14
146D  8F                 .    ...
146E  1C                 .    ...
146F  A3                 .    ...
1470  25 D7              %.   AND &D7
1472  24 ED              $.   BIT &ED
1474  24 0E              $.   BIT &0E
1476  25 CD              %.   AND &CD
1478  24 CC              $.   BIT &CC
147A  39 B1 12           9..  AND &12B1,Y
147D  B4 12              ..   LDY &12
147F  F0 24              .$   BEQ &14A5
1481  8F                 .    ...
1482  1C                 .    ...
1483  8F                 .    ...
1484  1C                 .    ...
1485  8F                 .    ...
1486  1C                 .    ...
1487  0C                 .    ...
1488  0A                 .    ASL A
1489  41 42              AB   EOR (&42,X)
148B  4F                 O    ...
148C  55 53              US   EOR &53,X
148E  45 49              EI   EOR &49
1490  54                 T    ...
1491  49 4C              IL   EOR #&4C
1493  45 54              ET   EOR &54
1495  53                 S    ...
1496  54                 T    ...
1497  4F                 O    ...
1498  4E 4C 4F           NLO  LSR &4F4C
149B  4E 55 54           NUT  LSR &5455
149E  48                 H    PHA
149F  4E 4F 41           NOA  LSR &414F
14A2  4C 4C 45           LLE  JMP &454C
14A5  58                 X    CLI
14A6  45 47              EG   EOR &47
14A8  45 5A              EZ   EOR &5A
14AA  41 43              AC   EOR (&43,X)
14AC  45 42              EB   EOR &42
14AE  49 53              IS   EOR #&53
14B0  4F                 O    ...
14B1  55 53              US   EOR &53,X
14B3  45 53              ES   EOR &53
14B5  41 52              AR   EOR (&52,X)
14B7  4D 41 49           MAI  EOR &4941
14BA  4E 44 49           NDI  LSR &4944
14BD  52                 R    ...
14BE  45 41              EA   EOR &41
14C0  3F                 ?    ...
14C1  45 52              ER   EOR &52
14C3  41 54              AT   EOR (&54,X)
14C5  45 4E              EN   EOR &4E
14C7  42                 B    ...
14C8  45 52              ER   EOR &52
14CA  41 4C              AL   EOR (&4C,X)
14CC  41 56              AV   EOR (&56,X)
14CE  45 54              ET   EOR &54
14D0  49 45              IE   EOR #&45
14D2  44                 D    ...
14D3  4F                 O    ...
14D4  52                 R    ...
14D5  51 55              QU   EOR (&55),Y
14D7  41 4E              AN   EOR (&4E,X)
14D9  54                 T    ...
14DA  45 49              EI   EOR &49
14DC  53                 S    ...
14DD  52                 R    ...
14DE  49 4F              IO   EOR #&4F
14E0  4E A5 65           N.e  LSR &65A5

; -----------------------------------------------------------------------------
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
1741  00                 .    BRK
1742  09 25              .%   ORA #&25
1744  09 4A              .J   ORA #&4A
1746  09 6F              .o   ORA #&6F
1748  09 94              ..   ORA #&94
174A  09 B9              ..   ORA #&B9
174C  09 DE              ..   ORA #&DE
174E  09 03              ..   ORA #&03
1750  0A                 .    ASL A
1751  28                 (    PLP
1752  0A                 .    ASL A
1753  4D 0A 72           M.r  EOR &720A
1756  0A                 .    ASL A
1757  97                 .    ...
1758  0A                 .    ASL A
1759  BC 0A 80           ...  LDY &800A,X
175C  40                 @    RTI
175D  20 10 08            ..  JSR &0810
1760  04                 .    ...
1761  02                 .    ...
1762  01 C0              ..   ORA (&C0,X)
1764  60                 `    RTS
1765  30 18              0.   BMI &177F
1767  0C                 .    ...
1768  06 03              ..   ASL &03
176A  03                 .    ...
176B  88                 .    DEY
176C  44                 D    ...
176D  22                 "    ...
176E  11                 EQUB &11
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
1999  80                 .    ...
199A  C0 E0              ..   CPY #&E0
199C  F0 F8              ..   BEQ &1996
199E  FC                 .    ...
199F  FE FF 7F           ..  INC &7FFF,X
19A2  3F                 ?    ...
19A3  1F                 .    ...
19A4  0F                 .    ...
19A5  07                 .    ...
19A6  03                 .    ...
19A7  01                 .    EQUB &01

.addr19A6
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

.addr1AD0
1AD0  01 00              ..   ORA (&00,X)
1AD2  2C 01 A0           ,..  BIT &A001
1AD5  0F                 .    ...
1AD6  70 17              p.   BVS &1AEF
1AD8  A0 0F              ..   LDY #&0F
1ADA  10 27              .'   BPL &1B03
1ADC  82                 .    ...
1ADD  14                 .    ...
1ADE  10 27              .'   BPL &1B07
1AE0  28                 (    PLP
1AE1  23                 #    ...
1AE2  98                 .    TYA
1AE3  3A                 :    ...
1AE4  10 27              .'   BPL &1B0D
1AE6  50 C3              P.   BVC &1AAB
1AE8  60                 `    RTS
1AE9  EA                 .    NOP
1AEA  40                 @    RTI
1AEB  1F                 .    ...
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
1C83  20 FF 00            ..  JSR &00FF
1C86  00                 .    BRK
1C87  00                 .    BRK
1C88  00                 .    BRK
1C89  FF                 .    ...
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
1F99  02                 .    ...
1F9A  54                 T    ...
1F9B  3B                 ;    ...
1F9C  03                 .    ...
1F9D  82                 .    ...
1F9E  B0 00              ..   BCS &1FA0
1FA0  00                 .    BRK
1FA1  00                 .    BRK
1FA2  01 50              .P   ORA (&50,X)
1FA4  11 01              ..   ORA (&01),Y
1FA6  D1 28              .(   CMP (&28),Y
1FA8  01 40              .@   ORA (&40,X)
1FAA  06 03              ..   ASL &03
1FAC  60                 `    RTS
1FAD  90 04              ..   BCC &1FB3
1FAF  10 D1              ..   BPL &1F82
1FB1  00                 .    BRK
1FB2  00                 .    BRK
.addr1FB3
1FB3  00                 .    BRK
1FB4  06 51              .Q   ASL &51
1FB6  F8                 .    SED
1FB7  07                 .    ...
1FB8  60                 `    RTS
1FB9  75 00              u.   ADC &00,X
1FBB  00                 .    BRK
1FBC  00                 .    BRK

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
2192  8C E7 8D           ...  STY &8DE7
2195  ED 8A E6           ...  SBC &E68A
2198  C1 C8              ..   CMP (&C8,X)
219A  C8                 .    INY
219B  8B                 .    ...
219C  E0 8A              ..   CPX #&8A
219E  E6 D6              ..   INC &D6
21A0  C5 C6              ..   CMP &C6
21A2  C1 CA              ..   CMP (&CA,X)
21A4  95 9D              ..   STA &9D,X
21A6  9C                 .    ...
21A7  97                 .    ...
21A8  85 40              .@   STA &40
21AA  85 41              .A   STA &41
21AC  85 42              .B   STA &42
21AE  85 43              .C   STA &43
21B0  18                 .    CLC
21B1  60                 `    RTS
21B2  A6 24              .$   LDX &24
21B4  86 82              ..   STX &82
21B6  A6 25              .%   LDX &25
21B8  86 83              ..   STX &83
21BA  A6 31              .1   LDX &31
21BC  86 1B              ..   STX &1B
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
311B  B5 6C              .l   LDA &6C,X
311D  95 73              .s   STA &73,X
311F  CA                 .    DEX
3120  10 F9              ..   BPL &311B
3122  A0 03              ..   LDY #&03
3124  24 6C              $l   BIT &6C
3126  70 01              p.   BVS &3129
3128  88                 .    DEY
.addr3129
3129  84 D1              ..   STY &D1
.addr312B
312B  A5 71              .q   LDA &71
312D  29 1F              ).   AND #&1F
312F  F0 05              ..   BEQ &3136
3131  09 80              ..   ORA #&80
3133  20 AC 31            .1  JSR &31AC
.addr3136
3136  20 37 26            7&  JSR &2637
3139  C6 D1              ..   DEC &D1
313B  10 EE              ..   BPL &312B
313D  A2 05              ..   LDX #&05
.addr313F
313F  B5 73              .s   LDA &73,X
3141  95 6C              .l   STA &6C,X
3143  CA                 .    DEX
3144  10 F9              ..   BPL &313F
3146  60                 `    RTS
.addr3147
3147  20 29 14            ).  JSR &1429
314A  A0 00              ..   LDY #&00
.addr314C
314C  B9 81 11           ...  LDA &1181,Y
314F  C9 0D              ..   CMP #&0D
3151  F0 06              ..   BEQ &3159
3153  20 8F 1C            ..  JSR &1C8F
3156  C8                 .    INY
3157  D0 F3              ..   BNE &314C
.addr3159
3159  60                 `    RTS
.addr315A
315A  20 60 31            `1  JSR &3160
315D  20 19 31            .1  JSR &3119
.addr3160
3160  A2 05              ..   LDX #&05
.addr3162
3162  B5 6C              .l   LDA &6C,X
3164  BC B2 03           ...  LDY &03B2,X
3167  9D B2 03           ...  STA &03B2,X
316A  94 6C              .l   STY &6C
316C  CA                 .    DEX
316D  10 F3              ..   BPL &3162
316F  60                 `    RTS
.addr3170
3170  18                 .    CLC
3171  AE 67 03           .g.  LDX &0367
3174  E8                 .    INX
3175  4C C0 1B           L..  JMP &1BC0
.addr3178
3178  A9 69              .i   LDA #&69
317A  20 A7 31            .1  JSR &31A7
317D  AE 65 03           .e.  LDX &0365
3180  38                 8    SEC
3181  20 C0 1B            ..  JSR &1BC0
3184  A9 C3              ..   LDA #&C3
3186  20 A1 31            .1  JSR &31A1
3189  A9 77              .w   LDA #&77
318B  D0 1F              ..   BNE &31AC
.addr318D
318D  A2 03              ..   LDX #&03
.addr318F
318F  BD 61 03           .a.  LDA &0361,X
3192  95 40              .@   STA &40,X
3194  CA                 .    DEX
3195  10 F8              ..   BPL &318F
3197  A9 09              ..   LDA #&09
3199  85 80              ..   STA &80
319B  38                 8    SEC
319C  20 D0 1B            ..  JSR &1BD0
319F  A9 E2              ..   LDA #&E2
.addr31A1
31A1  20 AC 31            .1  JSR &31AC
31A4  4C 83 26           L.&  JMP &2683
.addr31A7
31A7  20 AC 31            .1  JSR &31AC
.addr31AA
31AA  A9 3A              .:   LDA #&3A
.addr31AC
31AC  AA                 .    TAX
31AD  F0 DE              ..   BEQ &318D
31AF  30 74              0t   BMI &3225
31B1  CA                 .    DEX
31B2  F0 BC              ..   BEQ &3170
31B4  CA                 .    DEX
31B5  F0 A3              ..   BEQ &315A
31B7  CA                 .    DEX
31B8  D0 03              ..   BNE &31BD
31BA  4C 19 31           L.1  JMP &3119
.addr31BD
31BD  CA                 .    DEX
31BE  F0 87              ..   BEQ &3147
31C0  CA                 .    DEX
31C1  F0 B5              ..   BEQ &3178
31C3  CA                 .    DEX
31C4  D0 05              ..   BNE &31CB
31C6  A9 80              ..   LDA #&80
31C8  85 72              .r   STA &72
31CA  60                 `    RTS
.addr31CB
31CB  CA                 .    DEX
31CC  CA                 .    DEX
31CD  D0 03              ..   BNE &31D2
31CF  86 72              .r   STX &72
31D1  60                 `    RTS
.addr31D2
31D2  CA                 .    DEX
31D3  F0 38              .8   BEQ &320D
31D5  C9 60              .`   CMP #&60
31D7  B0 66              .f   BCS &323F
31D9  C9 0E              ..   CMP #&0E
31DB  90 04              ..   BCC &31E1
31DD  C9 20              .    CMP #&20
31DF  90 28              .(   BCC &3209
.addr31E1
31E1  A6 72              .r   LDX &72
31E3  F0 3D              .=   BEQ &3222
31E5  30 11              0.   BMI &31F8
31E7  24 72              $r   BIT &72
31E9  70 30              p0   BVS &321B
.addr31EB
31EB  C9 41              .A   CMP #&41
31ED  90 06              ..   BCC &31F5
31EF  C9 5B              .[   CMP #&5B
31F1  B0 02              ..   BCS &31F5
31F3  69 20              i    ADC #&20
.addr31F5
31F5  4C 8F 1C           L..  JMP &1C8F
.addr31F8
31F8  24 72              $r   BIT &72
31FA  70 17              p.   BVS &3213
31FC  C9 41              .A   CMP #&41
31FE  90 22              ."   BCC &3222
3200  48                 H    PHA
3201  8A                 .    TXA
3202  09 40              .@   ORA #&40
3204  85 72              .r   STA &72
3206  68                 h    PLA
3207  D0 EC              ..   BNE &31F5
.addr3209
3209  69 72              ir   ADC #&72
320B  D0 32              .2   BNE &323F
.addr320D
320D  A9 15              ..   LDA #&15
320F  85 2C              .,   STA &2C
3211  D0 97              ..   BNE &31AA
.addr3213
3213  E0 FF              ..   CPX #&FF
3215  F0 63              .c   BEQ &327A
3217  C9 41              .A   CMP #&41
3219  B0 D0              ..   BCS &31EB
.addr321B
321B  48                 H    PHA
321C  8A                 .    TXA
321D  29 BF              ).   AND #&BF
321F  85 72              .r   STA &72
3221  68                 h    PLA
.addr3222
3222  4C 8F 1C           L..  JMP &1C8F
.addr3225
3225  C9 A0              ..   CMP #&A0
3227  B0 14              ..   BCS &323D
3229  29 7F              )   AND #&7F
322B  0A                 .    ASL A
322C  A8                 .    TAY
322D  B9 A1 14           ...  LDA &14A1,Y
3230  20 AC 31            .1  JSR &31AC
3233  B9 A2 14           ...  LDA &14A2,Y
3236  C9 3F              .?   CMP #&3F
3238  F0 40              .@   BEQ &327A
323A  4C AC 31           L.1  JMP &31AC
.addr323D
323D  E9 A0              ..   SBC #&A0
.addr323F
323F  AA                 .    TAX
3240  A9 00              ..   LDA #&00
3242  85 22              ."   STA &22
3244  A9 04              ..   LDA #&04
3246  85 23              .#   STA &23
3248  A0 00              ..   LDY #&00
324A  8A                 .    TXA
324B  F0 13              ..   BEQ &3260
.addr324D
324D  B1 22              ."   LDA (&22),Y
324F  F0 07              ..   BEQ &3258
3251  C8                 .    INY
3252  D0 F9              ..   BNE &324D
3254  E6 23              .#   INC &23
3256  D0 F5              ..   BNE &324D
.addr3258
3258  C8                 .    INY
3259  D0 02              ..   BNE &325D
325B  E6 23              .#   INC &23
.addr325D
325D  CA                 .    DEX
325E  D0 ED              ..   BNE &324D
.addr3260
3260  98                 .    TYA
3261  48                 H    PHA
3262  A5 23              .#   LDA &23
3264  48                 H    PHA
3265  B1 22              ."   LDA (&22),Y
3267  49 23              I#   EOR #&23
3269  20 AC 31            .1  JSR &31AC
326C  68                 h    PLA
326D  85 23              .#   STA &23
326F  68                 h    PLA
3270  A8                 .    TAY
3271  C8                 .    INY
3272  D0 02              ..   BNE &3276
3274  E6 23              .#   INC &23
.addr3276
3276  B1 22              ."   LDA (&22),Y
3278  D0 E6              ..   BNE &3260
.addr327A
327A  60                 `    RTS
327B  A5 65              .e   LDA &65
327D  09 A0              ..   ORA #&A0
327F  85 65              .e   STA &65
3281  60                 `    RTS
.addr3282
3282  60                 `    RTS
.addr3283
3283  A2 00              ..   LDX #&00
.addr3285
3285  BD 11 03           ...  LDA &0311,X
3288  F0 1E              ..   BEQ &32A8
328A  30 19              0.   BMI &32A5
328C  20 ED 32            .2  JSR &32ED
328F  A0 1F              ..   LDY #&1F
.addr3291
3291  B1 20              .    LDA (&20),Y
3293  99 46 00           .F.  STA &0046,Y
3296  88                 .    DEY
3297  10 F8              ..   BPL &3291
3299  86 84              ..   STX &84
329B  A6 84              ..   LDX &84
329D  A0 1F              ..   LDY #&1F
329F  B1 20              .    LDA (&20),Y
32A1  29 A7              ).   AND #&A7
32A3  91 20              .    STA (&20),Y
.addr32A5
32A5  E8                 .    INX
32A6  D0 DD              ..   BNE &3285
.addr32A8
32A8  A2 FF              ..   LDX #&FF
32AA  8E C0 0E           ...  STX &0EC0
32AD  8E 0E 0F           ...  STX &0F0E
.addr32B0
32B0  A0 BF              ..   LDY #&BF
32B2  A9 00              ..   LDA #&00
.addr32B4
32B4  99 00 0E           ...  STA &0E00,Y
32B7  88                 .    DEY
32B8  D0 FA              ..   BNE &32B4
32BA  88                 .    DEY
32BB  8C 00 0E           ...  STY &0E00
32BE  60                 `    RTS
32BF  A9 06              ..   LDA #&06
32C1  78                 x    SEI
32C2  8D 00 FE           ...  STA crtc_register
32C5  8E 01 FE           ...  STX crtc_data
32C8  58                 X    CLI
32C9  60                 `    RTS
.addr32CA
32CA  CA                 .    DEX
32CB  60                 `    RTS
32CC  E8                 .    INX
32CD  F0 FB              ..   BEQ &32CA
32CF  CE A7 03           ...  DEC &03A7
32D2  08                 .    PHP
32D3  D0 03              ..   BNE &32D8
32D5  EE A7 03           ...  INC &03A7
.addr32D8
32D8  28                 (    PLP
32D9  60                 `    RTS
.addr32DA
32DA  BD 01 09           ...  LDA &0901,X
32DD  95 D2              ..   STA &D2,X
32DF  BD 02 09           ...  LDA &0902,X
32E2  A8                 .    TAY
32E3  29 7F              )   AND #&7F
32E5  95 D3              ..   STA &D3,X
32E7  98                 .    TYA
32E8  29 80              ).   AND #&80
32EA  95 D4              ..   STA &D4,X
32EC  60                 `    RTS
.addr32ED
32ED  8A                 .    TXA
32EE  0A                 .    ASL A
32EF  A8                 .    TAY
32F0  B9 41 17           .A.  LDA &1741,Y
32F3  85 20              .    STA &20
32F5  B9 42 17           .B.  LDA &1742,Y
32F8  85 21              .!   STA &21
32FA  60                 `    RTS
.addr32FB
32FB  85 D1              ..   STA &D1
32FD  A2 00              ..   LDX #&00
.addr32FF
32FF  BD 11 03           ...  LDA &0311,X
3302  F0 07              ..   BEQ &330B
3304  E8                 .    INX
3305  E0 0C              ..   CPX #&0C
3307  90 F6              ..   BCC &32FF
3309  18                 .    CLC
.addr330A
330A  60                 `    RTS
.addr330B
330B  20 ED 32            .2  JSR &32ED
330E  A5 D1              ..   LDA &D1
3310  30 50              0P   BMI &3362
3312  0A                 .    ASL A
3313  A8                 .    TAY
3314  B9 FE 55           ..U  LDA &55FE,Y
3317  85 1E              ..   STA &1E
3319  B9 FF 55           ..U  LDA &55FF,Y
331C  85 1F              ..   STA &1F
331E  C0 04              ..   CPY #&04
3320  F0 30              .0   BEQ &3352
3322  A0 05              ..   LDY #&05
3324  B1 1E              ..   LDA (&1E),Y
3326  85 06              ..   STA &06
3328  AD B0 03           ...  LDA &03B0
332B  38                 8    SEC
332C  E5 06              ..   SBC &06
332E  85 67              .g   STA &67
3330  AD B1 03           ...  LDA &03B1
3333  E9 00              ..   SBC #&00
3335  85 68              .h   STA &68
3337  A5 67              .g   LDA &67
3339  E5 20              .    SBC &20
333B  A8                 .    TAY
333C  A5 68              .h   LDA &68
333E  E5 21              .!   SBC &21
3340  90 C8              ..   BCC &330A
3342  D0 04              ..   BNE &3348
3344  C0 25              .%   CPY #&25
3346  90 C2              ..   BCC &330A
.addr3348
3348  A5 67              .g   LDA &67
334A  8D B0 03           ...  STA &03B0
334D  A5 68              .h   LDA &68
334F  8D B1 03           ...  STA &03B1
.addr3352
3352  A0 0E              ..   LDY #&0E
3354  B1 1E              ..   LDA (&1E),Y
3356  85 69              .i   STA &69
3358  A0 13              ..   LDY #&13
335A  B1 1E              ..   LDA (&1E),Y
335C  29 07              ).   AND #&07
335E  85 65              .e   STA &65
3360  A5 D1              ..   LDA &D1
.addr3362
3362  9D 11 03           ...  STA &0311,X
3365  AA                 .    TAX
3366  30 03              0.   BMI &336B
3368  FE 1E 03           ...  INC &031E,X
.addr336B
336B  A0 24              .$   LDY #&24
.addr336D
336D  B9 46 00           .F.  LDA &0046,Y
3370  91 20              .    STA (&20),Y
3372  88                 .    DEY
3373  10 F8              ..   BPL &336D
3375  38                 8    SEC
3376  60                 `    RTS
3377  B5 46              .F   LDA &46,X
3379  49 80              I.   EOR #&80
337B  95 46              .F   STA &46,X
337D  E8                 .    INX
337E  E8                 .    INX
337F  60                 `    RTS
3380  A2 FF              ..   LDX #&FF
3382  86 45              .E   STX &45
3384  AE 8B 03           ...  LDX &038B
3387  20 A7 33            .3  JSR &33A7
338A  8C 44 03           .D.  STY &0344
338D  60                 `    RTS
338E  A9 C0              ..   LDA #&C0
3390  A2 9F              ..   LDX #&9F
3392  A0 33              .3   LDY #&33
3394  85 07              ..   STA &07
3396  86 1C              ..   STX &1C
3398  84 1D              ..   STY &1D
339A  A9 7D              .}   LDA #&7D
339C  4C C8 1D           L..  JMP &1DC8
339F  E0 E0              ..   CPX #&E0
33A1  80                 .    ...
33A2  E0 E0              ..   CPX #&E0
33A4  20 E0 E0            ..  JSR &E0E0
.addr33A7
33A7  8A                 .    TXA
33A8  0A                 .    ASL A
33A9  0A                 .    ASL A
33AA  0A                 .    ASL A
33AB  85 D1              ..   STA &D1
33AD  A9 31              .1   LDA #&31
33AF  E5 D1              ..   SBC &D1
33B1  85 07              ..   STA &07
33B3  A9 7E              .~   LDA #&7E
33B5  85 08              ..   STA &08
33B7  98                 .    TYA
33B8  A0 05              ..   LDY #&05
.addr33BA
33BA  91 07              ..   STA (&07),Y
33BC  88                 .    DEY
33BD  D0 FB              ..   BNE &33BA
33BF  60                 `    RTS
.addr33C0
33C0  8A                 .    TXA
33C1  49 FF              I.   EOR #&FF
33C3  18                 .    CLC
33C4  69 01              i.   ADC #&01
33C6  AA                 .    TAX
.addr33C7
33C7  A9 FF              ..   LDA #&FF
33C9  D0 43              .C   BNE &340E
.addr33CB
33CB  A9 01              ..   LDA #&01
33CD  8D 00 0E           ...  STA &0E00
33D0  20 B7 35            .5  JSR &35B7
33D3  A9 00              ..   LDA #&00
33D5  A6 40              .@   LDX &40
33D7  E0 60              .`   CPX #&60
33D9  2A                 *    ROL A
33DA  E0 28              .(   CPX #&28
33DC  2A                 *    ROL A
33DD  E0 10              ..   CPX #&10
33DF  2A                 *    ROL A
33E0  85 93              ..   STA &93
33E2  A9 BF              ..   LDA #&BF
33E4  A6 1D              ..   LDX &1D
33E6  D0 0A              ..   BNE &33F2
33E8  C5 1C              ..   CMP &1C
33EA  90 06              ..   BCC &33F2
33EC  A5 1C              ..   LDA &1C
33EE  D0 02              ..   BNE &33F2
33F0  A9 01              ..   LDA #&01
.addr33F2
33F2  85 8F              ..   STA &8F
33F4  A9 BF              ..   LDA #&BF
33F6  38                 8    SEC
33F7  E5 E0              ..   SBC &E0
33F9  AA                 .    TAX
33FA  A9 00              ..   LDA #&00
33FC  E5 E1              ..   SBC &E1
33FE  30 C0              0.   BMI &33C0
3400  D0 08              ..   BNE &340A
3402  E8                 .    INX
3403  CA                 .    DEX
3404  F0 C1              ..   BEQ &33C7
3406  E4 40              .@   CPX &40
3408  90 04              ..   BCC &340E
.addr340A
340A  A6 40              .@   LDX &40
340C  A9 00              ..   LDA #&00
.addr340E
340E  86 22              ."   STX &22
3410  85 23              .#   STA &23
3412  A5 40              .@   LDA &40
3414  20 C0 21            .!  JSR &21C0
3417  85 9C              ..   STA &9C
3419  A5 1B              ..   LDA &1B
341B  85 9B              ..   STA &9B
341D  A0 BF              ..   LDY #&BF
341F  A5 28              .(   LDA &28
3421  85 26              .&   STA &26
3423  A5 29              .)   LDA &29
3425  85 27              .'   STA &27
.addr3427
3427  C4 8F              ..   CPY &8F
3429  F0 0B              ..   BEQ &3436
342B  B9 00 0E           ...  LDA &0E00,Y
342E  F0 03              ..   BEQ &3433
3430  20 09 19            ..  JSR &1909
.addr3433
3433  88                 .    DEY
3434  D0 F1              ..   BNE &3427
.addr3436
3436  A5 22              ."   LDA &22
3438  20 C0 21            .!  JSR &21C0
343B  85 D1              ..   STA &D1
343D  A5 9B              ..   LDA &9B
343F  38                 8    SEC
3440  E5 1B              ..   SBC &1B
3442  85 81              ..   STA &81
3444  A5 9C              ..   LDA &9C
3446  E5 D1              ..   SBC &D1
3448  85 82              ..   STA &82
344A  84 35              .5   STY &35
344C  20 3E 3F            >?  JSR &3F3E
344F  A4 35              .5   LDY &35
3451  20 36 37            67  JSR &3736
3454  25 93              %.   AND &93
3456  18                 .    CLC
3457  65 81              e.   ADC &81
3459  90 02              ..   BCC &345D
345B  A9 FF              ..   LDA #&FF
.addr345D
345D  BE 00 0E           ...  LDX &0E00,Y
3460  99 00 0E           ...  STA &0E00,Y
3463  F0 4A              .J   BEQ &34AF
3465  A5 28              .(   LDA &28
3467  85 26              .&   STA &26
3469  A5 29              .)   LDA &29
346B  85 27              .'   STA &27
346D  8A                 .    TXA
346E  20 86 35            .5  JSR &3586
3471  A5 34              .4   LDA &34
3473  85 24              .$   STA &24
3475  A5 36              .6   LDA &36
3477  85 25              .%   STA &25
3479  A5 D2              ..   LDA &D2
347B  85 26              .&   STA &26
347D  A5 D3              ..   LDA &D3
347F  85 27              .'   STA &27
3481  B9 00 0E           ...  LDA &0E00,Y
3484  20 86 35            .5  JSR &3586
3487  B0 0B              ..   BCS &3494
3489  A5 36              .6   LDA &36
348B  A6 24              .$   LDX &24
348D  86 36              .6   STX &36
348F  85 24              .$   STA &24
3491  20 13 19            ..  JSR &1913
.addr3494
3494  A5 24              .$   LDA &24
3496  85 34              .4   STA &34
3498  A5 25              .%   LDA &25
349A  85 36              .6   STA &36
.addr349C
349C  20 13 19            ..  JSR &1913
.addr349F
349F  88                 .    DEY
34A0  F0 3F              .?   BEQ &34E1
34A2  A5 23              .#   LDA &23
34A4  D0 1D              ..   BNE &34C3
34A6  C6 22              ."   DEC &22
34A8  D0 8C              ..   BNE &3436
34AA  C6 23              .#   DEC &23
.addr34AC
34AC  4C 36 34           L64  JMP &3436
.addr34AF
34AF  A6 D2              ..   LDX &D2
34B1  86 26              .&   STX &26
34B3  A6 D3              ..   LDX &D3
34B5  86 27              .'   STX &27
34B7  20 86 35            .5  JSR &3586
34BA  90 E0              ..   BCC &349C
34BC  A9 00              ..   LDA #&00
34BE  99 00 0E           ...  STA &0E00,Y
34C1  F0 DC              ..   BEQ &349F
.addr34C3
34C3  A6 22              ."   LDX &22
34C5  E8                 .    INX
34C6  86 22              ."   STX &22
34C8  E4 40              .@   CPX &40
34CA  90 E0              ..   BCC &34AC
34CC  F0 DE              ..   BEQ &34AC
34CE  A5 28              .(   LDA &28
34D0  85 26              .&   STA &26
34D2  A5 29              .)   LDA &29
34D4  85 27              .'   STA &27
.addr34D6
34D6  B9 00 0E           ...  LDA &0E00,Y
34D9  F0 03              ..   BEQ &34DE
34DB  20 09 19            ..  JSR &1909
.addr34DE
34DE  88                 .    DEY
34DF  D0 F5              ..   BNE &34D6
.addr34E1
34E1  18                 .    CLC
34E2  A5 D2              ..   LDA &D2
34E4  85 28              .(   STA &28
34E6  A5 D3              ..   LDA &D3
34E8  85 29              .)   STA &29
34EA  60                 `    RTS
34EB  A9 00              ..   LDA #&00
34ED  8D C0 0E           ...  STA &0EC0
34F0  A6 40              .@   LDX &40
34F2  A9 08              ..   LDA #&08
34F4  E0 08              ..   CPX #&08
34F6  90 06              ..   BCC &34FE
34F8  4A                 J    LSR A
34F9  E0 3C              .<   CPX #&3C
34FB  90 01              ..   BCC &34FE
34FD  4A                 J    LSR A
.addr34FE
34FE  85 95              ..   STA &95
.addr3500
3500  A2 FF              ..   LDX #&FF
3502  86 92              ..   STX &92
3504  E8                 .    INX
3505  86 93              ..   STX &93
.addr3507
3507  A5 93              ..   LDA &93
3509  20 F0 21            .!  JSR &21F0
350C  A2 00              ..   LDX #&00
350E  86 D1              ..   STX &D1
3510  A6 93              ..   LDX &93
3512  E0 21              .!   CPX #&21
3514  90 0D              ..   BCC &3523
3516  49 FF              I.   EOR #&FF
3518  69 00              i.   ADC #&00
351A  AA                 .    TAX
351B  A9 FF              ..   LDA #&FF
351D  69 00              i.   ADC #&00
351F  85 D1              ..   STA &D1
3521  8A                 .    TXA
3522  18                 .    CLC
.addr3523
3523  65 D2              e.   ADC &D2
3525  85 76              .v   STA &76
3527  A5 D3              ..   LDA &D3
3529  65 D1              e.   ADC &D1
352B  85 77              .w   STA &77
352D  A5 93              ..   LDA &93
352F  18                 .    CLC
3530  69 10              i.   ADC #&10
3532  20 F0 21            .!  JSR &21F0
3535  AA                 .    TAX
3536  A9 00              ..   LDA #&00
3538  85 D1              ..   STA &D1
353A  A5 93              ..   LDA &93
353C  69 0F              i.   ADC #&0F
353E  29 3F              )?   AND #&3F
3540  C9 21              .!   CMP #&21
3542  90 0D              ..   BCC &3551
3544  8A                 .    TXA
3545  49 FF              I.   EOR #&FF
3547  69 00              i.   ADC #&00
3549  AA                 .    TAX
354A  A9 FF              ..   LDA #&FF
354C  69 00              i.   ADC #&00
354E  85 D1              ..   STA &D1
3550  18                 .    CLC
.addr3551
3551  20 16 1A            ..  JSR &1A16
3554  C9 41              .A   CMP #&41
3556  B0 03              ..   BCS &355B
3558  4C 07 35           L.5  JMP &3507
.addr355B
355B  18                 .    CLC
355C  60                 `    RTS
355D  A9 01              ..   LDA #&01
355F  85 6B              .k   STA &6B
3561  A9 FF              ..   LDA #&FF
3563  8D C0 0E           ...  STA &0EC0
3566  60                 `    RTS
3567  AD 00 0E           ...  LDA &0E00
356A  30 42              0B   BMI &35AE
356C  A5 28              .(   LDA &28
356E  85 26              .&   STA &26
3570  A5 29              .)   LDA &29
3572  85 27              .'   STA &27
3574  A0 BF              ..   LDY #&BF
.addr3576
3576  B9 00 0E           ...  LDA &0E00,Y
3579  F0 03              ..   BEQ &357E
357B  20 09 19            ..  JSR &1909
.addr357E
357E  88                 .    DEY
357F  D0 F5              ..   BNE &3576
.addr3581
3581  88                 .    DEY
3582  8C 00 0E           ...  STY &0E00
3585  60                 `    RTS
.addr3586
3586  85 D1              ..   STA &D1
3588  18                 .    CLC
3589  65 26              e&   ADC &26
358B  85 36              .6   STA &36
358D  A5 27              .'   LDA &27
358F  69 00              i.   ADC #&00
3591  30 1D              0.   BMI &35B0
3593  F0 04              ..   BEQ &3599
3595  A9 FE              ..   LDA #&FE
3597  85 36              .6   STA &36
.addr3599
3599  A5 26              .&   LDA &26
359B  38                 8    SEC
359C  E5 D1              ..   SBC &D1
359E  85 34              .4   STA &34
35A0  A5 27              .'   LDA &27
35A2  E9 00              ..   SBC #&00
35A4  D0 02              ..   BNE &35A8
35A6  18                 .    CLC
35A7  60                 `    RTS
.addr35A8
35A8  10 06              ..   BPL &35B0
35AA  A9 02              ..   LDA #&02
35AC  85 34              .4   STA &34
.addr35AE
35AE  18                 .    CLC
35AF  60                 `    RTS
.addr35B0
35B0  A9 00              ..   LDA #&00
35B2  99 00 0E           ...  STA &0E00,Y
.addr35B5
35B5  38                 8    SEC
35B6  60                 `    RTS
.addr35B7
35B7  A5 D2              ..   LDA &D2
35B9  18                 .    CLC
35BA  65 40              e@   ADC &40
35BC  A5 D3              ..   LDA &D3
35BE  69 00              i.   ADC #&00
35C0  30 F3              0.   BMI &35B5
35C2  A5 D2              ..   LDA &D2
35C4  38                 8    SEC
35C5  E5 40              .@   SBC &40
35C7  A5 D3              ..   LDA &D3
35C9  E9 00              ..   SBC #&00
35CB  30 02              0.   BMI &35CF
35CD  D0 E6              ..   BNE &35B5
.addr35CF
35CF  A5 E0              ..   LDA &E0
35D1  18                 .    CLC
35D2  65 40              e@   ADC &40
35D4  85 1C              ..   STA &1C
35D6  A5 E1              ..   LDA &E1
35D8  69 00              i.   ADC #&00
35DA  30 D9              0.   BMI &35B5
35DC  85 1D              ..   STA &1D
35DE  A5 E0              ..   LDA &E0
35E0  38                 8    SEC
35E1  E5 40              .@   SBC &40
35E3  AA                 .    TAX
35E4  A5 E1              ..   LDA &E1
35E6  E9 00              ..   SBC #&00
35E8  30 C4              0.   BMI &35AE
35EA  D0 C9              ..   BNE &35B5
35EC  E0 BF              ..   CPX #&BF
35EE  60                 `    RTS
.addr35EF
35EF  20 F0 3C            .<  JSR &3CF0
35F2  AD CD 03           ...  LDA &03CD
35F5  F0 25              .%   BEQ &361C
35F7  AD 4C 03           .L.  LDA &034C
35FA  49 FF              I.   EOR #&FF
35FC  20 04 36            .6  JSR &3604
35FF  98                 .    TYA
3600  AA                 .    TAX
3601  AD 4D 03           .M.  LDA &034D
.addr3604
3604  A8                 .    TAY
3605  A9 00              ..   LDA #&00
3607  C0 10              ..   CPY #&10
3609  E9 00              ..   SBC #&00
360B  C0 40              .@   CPY #&40
360D  E9 00              ..   SBC #&00
360F  C0 C0              ..   CPY #&C0
3611  69 00              i.   ADC #&00
3613  C0 E0              ..   CPY #&E0
3615  69 00              i.   ADC #&00
3617  A8                 .    TAY
3618  AD 00 03           ...  LDA &0300
361B  60                 `    RTS
.addr361C
361C  AD 00 03           ...  LDA &0300
361F  A2 00              ..   LDX #&00
3621  A0 00              ..   LDY #&00
3623  C9 19              ..   CMP #&19
3625  D0 01              ..   BNE &3628
3627  CA                 .    DEX
.addr3628
3628  C9 79              .y   CMP #&79
362A  D0 01              ..   BNE &362D
362C  E8                 .    INX
.addr362D
362D  C9 39              .9   CMP #&39
362F  D0 01              ..   BNE &3632
3631  C8                 .    INY
.addr3632
3632  C9 29              .)   CMP #&29
3634  D0 01              ..   BNE &3637
3636  88                 .    DEY
.addr3637
3637  86 D1              ..   STX &D1
3639  A2 00              ..   LDX #&00
363B  20 93 3C            .<  JSR &3C93
363E  10 08              ..   BPL &3648
3640  06 D1              ..   ASL &D1
3642  06 D1              ..   ASL &D1
3644  98                 .    TYA
3645  0A                 .    ASL A
3646  0A                 .    ASL A
3647  A8                 .    TAY
.addr3648
3648  A6 D1              ..   LDX &D1
364A  AD 00 03           ...  LDA &0300
364D  60                 `    RTS
.addr364E
364E  A2 01              ..   LDX #&01
.addr3650
3650  BD 59 03           .Y.  LDA &0359,X
3653  9D C1 03           ...  STA &03C1,X
3656  CA                 .    DEX
3657  10 F7              ..   BPL &3650
.addr3659
3659  60                 `    RTS
365A  12                 .    ...
365B  01 00              ..   ORA (&00,X)
365D  10 12              ..   BPL &3671
365F  02                 .    ...
3660  2C 08 11           ,..  BIT &1108
3663  03                 .    ...
3664  F0 18              ..   BEQ &367E
3666  10 F1              ..   BPL &3659
3668  07                 .    ...
3669  1A                 .    ...
366A  03                 .    ...
366B  F1 BC              ..   SBC (&BC),Y
366D  01 13              ..   ORA (&13,X)
366F  F4                 .    ...
3670  0C                 .    ...
.addr3671
3671  08                 .    PHP
3672  10 F1              ..   BPL &3665
3674  06 0C              ..   ASL &0C
3676  10 02              ..   BPL &367A
3678  60                 `    RTS
3679  10 13              ..   BPL &368E
367B  04                 .    ...
367C  C2                 .    ...
367D  FF                 .    ...
.addr367E
367E  13                 .    ...
367F  00                 .    BRK
3680  00                 .    BRK
3681  00                 .    BRK
.addr3682
3682  20 EE 39            .9  JSR &39EE
3685  A2 06              ..   LDX #&06
.addr3687
3687  95 2A              .*   STA &2A,X
3689  CA                 .    DEX
368A  10 FB              ..   BPL &3687
368C  8A                 .    TXA
368D  85 8E              ..   STA &8E
368F  A2 02              ..   LDX #&02
.addr3691
3691  9D A5 03           ...  STA &03A5,X
3694  CA                 .    DEX
3695  10 FA              ..   BPL &3691
.addr3697
3697  A9 12              ..   LDA #&12
3699  8D C3 03           ...  STA &03C3
369C  A2 FF              ..   LDX #&FF
369E  8E C0 0E           ...  STX &0EC0
36A1  8E 0E 0F           ...  STX &0F0E
36A4  86 45              .E   STX &45
36A6  A9 80              ..   LDA #&80
36A8  8D 4D 03           .M.  STA &034D
36AB  85 32              .2   STA &32
36AD  85 7B              .{   STA &7B
36AF  0A                 .    ASL A
36B0  85 33              .3   STA &33
36B2  85 7C              .|   STA &7C
36B4  85 8A              ..   STA &8A
36B6  A9 03              ..   LDA #&03
36B8  85 7D              .}   STA &7D
36BA  85 8D              ..   STA &8D
36BC  85 31              .1   STA &31
36BE  A5 30              .0   LDA &30
36C0  F0 03              ..   BEQ &36C5
36C2  20 2F 3C            /<  JSR &3C2F
.addr36C5
36C5  20 83 32            .2  JSR &3283
36C8  20 EE 39            .9  JSR &39EE
36CB  A9 FF              ..   LDA #&FF
36CD  8D B0 03           ...  STA &03B0
36D0  A9 0C              ..   LDA #&0C
36D2  8D B1 03           ...  STA &03B1
36D5  20 E5 1D            ..  JSR &1DE5
.addr36D8
36D8  A0 24              .$   LDY #&24
36DA  A9 00              ..   LDA #&00
.addr36DC
36DC  99 46 00           .F.  STA &0046,Y
36DF  88                 .    DEY
36E0  10 FA              ..   BPL &36DC
36E2  A9 60              .`   LDA #&60
36E4  85 58              .X   STA &58
36E6  85 5C              .\   STA &5C
36E8  09 80              ..   ORA #&80
36EA  85 54              .T   STA &54
36EC  60                 `    RTS
.addr36ED
36ED  A2 04              ..   LDX #&04
.addr36EF
36EF  EC 8B 03           ...  CPX &038B
36F2  F0 09              ..   BEQ &36FD
36F4  A0 00              ..   LDY #&00
36F6  20 A7 33            .3  JSR &33A7
36F9  CA                 .    DEX
36FA  D0 F3              ..   BNE &36EF
36FC  60                 `    RTS
.addr36FD
36FD  A0 EE              ..   LDY #&EE
36FF  20 A7 33            .3  JSR &33A7
3702  CA                 .    DEX
3703  D0 F8              ..   BNE &36FD
3705  60                 `    RTS
.addr3706
3706  AD A4 03           ...  LDA &03A4
3709  20 82 3D            .=  JSR &3D82
370C  A9 00              ..   LDA #&00
370E  8D 4A 03           .J.  STA &034A
3711  4C 54 37           LT7  JMP &3754
3714  20 D8 36            .6  JSR &36D8
3717  20 36 37            67  JSR &3736
371A  85 06              ..   STA &06
371C  29 80              ).   AND #&80
371E  85 48              .H   STA &48
3720  8A                 .    TXA
3721  29 80              ).   AND #&80
3723  85 4B              .K   STA &4B
3725  A9 19              ..   LDA #&19
3727  85 47              .G   STA &47
3729  85 4A              .J   STA &4A
372B  85 4D              .M   STA &4D
372D  8A                 .    TXA
372E  C9 F5              ..   CMP #&F5
3730  2A                 *    ROL A
3731  09 C0              ..   ORA #&C0
3733  85 66              .f   STA &66
3735  18                 .    CLC
.addr3736
3736  A5 00              ..   LDA &00
3738  2A                 *    ROL A
3739  AA                 .    TAX
373A  65 02              e.   ADC &02
373C  85 00              ..   STA &00
373E  86 02              ..   STX &02
3740  A5 01              ..   LDA &01
3742  AA                 .    TAX
3743  65 03              e.   ADC &03
3745  85 01              ..   STA &01
3747  86 03              ..   STX &03
3749  60                 `    RTS
.addr374A
374A  CE 4A 03           .J.  DEC &034A
374D  F0 B7              ..   BEQ &3706
374F  10 03              ..   BPL &3754
3751  EE 4A 03           .J.  INC &034A
.addr3754
3754  C6 8A              ..   DEC &8A
3756  F0 03              ..   BEQ &375B
.addr3758
3758  4C 89 37           L.7  JMP &3789
.addr375B
375B  AD 41 03           .A.  LDA &0341
375E  D0 F8              ..   BNE &3758
3760  20 36 37            67  JSR &3736
3763  C9 23              .#   CMP #&23
3765  B0 22              ."   BCS &3789
3767  AD 25 03           .%.  LDA &0325
376A  C9 03              ..   CMP #&03
376C  B0 1B              ..   BCS &3789
376E  20 D8 36            .6  JSR &36D8
3771  A9 26              .&   LDA #&26
3773  85 4D              .M   STA &4D
3775  20 36 37            67  JSR &3736
3778  85 46              .F   STA &46
377A  86 49              .I   STX &49
377C  29 80              ).   AND #&80
377E  85 48              .H   STA &48
3780  8A                 .    TXA
3781  29 80              ).   AND #&80
3783  85 4B              .K   STA &4B
3785  26 47              &G   ROL &47
3787  26 47              &G   ROL &47
.addr3789
3789  A2 FF              ..   LDX #&FF
378B  9A                 .    TXS
378C  AE 47 03           .G.  LDX &0347
378F  F0 03              ..   BEQ &3794
3791  CE 47 03           .G.  DEC &0347
.addr3794
3794  20 E5 1D            ..  JSR &1DE5
3797  A5 87              ..   LDA &87
3799  F0 05              ..   BEQ &37A0
379B  A0 02              ..   LDY #&02
379D  20 9C 25            .%  JSR &259C
.addr37A0
37A0  20 EF 35            .5  JSR &35EF
.addr37A3
37A3  20 AD 37            .7  JSR &37AD
37A6  A5 8E              ..   LDA &8E
37A8  D0 DF              ..   BNE &3789
37AA  4C 4A 37           LJ7  JMP &374A
.addr37AD
37AD  C9 76              .v   CMP #&76
37AF  D0 03              ..   BNE &37B4
37B1  4C FF 1A           L..  JMP &1AFF
.addr37B4
37B4  C9 14              ..   CMP #&14
37B6  D0 03              ..   BNE &37BB
37B8  4C 12 28           L.(  JMP &2812
.addr37BB
37BB  C9 74              .t   CMP #&74
37BD  D0 03              ..   BNE &37C2
37BF  4C 7C 2B           L|+  JMP &2B7C
.addr37C2
37C2  C9 75              .u   CMP #&75
37C4  D0 06              ..   BNE &37CC
37C6  20 33 2C            3,  JSR &2C33
37C9  4C 96 26           L.&  JMP &2696
.addr37CC
37CC  C9 77              .w   CMP #&77
37CE  D0 03              ..   BNE &37D3
37D0  4C B8 2A           L.*  JMP &2AB8
.addr37D3
37D3  C9 16              ..   CMP #&16
37D5  D0 03              ..   BNE &37DA
37D7  4C 23 2E           L#.  JMP &2E23
.addr37DA
37DA  C9 20              .    CMP #&20
37DC  D0 03              ..   BNE &37E1
37DE  4C 92 2E           L..  JMP &2E92
.addr37E1
37E1  C9 73              .s   CMP #&73
37E3  D0 03              ..   BNE &37E8
37E5  4C 08 2F           L./  JMP &2F08
.addr37E8
37E8  C9 71              .q   CMP #&71
37EA  D0 03              ..   BNE &37EF
37EC  4C 04 29           L.)  JMP &2904
.addr37EF
37EF  C9 47              .G   CMP #&47
37F1  D0 0B              ..   BNE &37FE
37F3  20 86 3A            .:  JSR &3A86
37F6  90 03              ..   BCC &37FB
37F8  4C 9D 38           L.8  JMP &389D
.addr37FB
37FB  4C B0 38           L.8  JMP &38B0
.addr37FE
37FE  C9 72              .r   CMP #&72
3800  D0 03              ..   BNE &3805
3802  4C 19 2A           L.*  JMP &2A19
.addr3805
3805  C9 54              .T   CMP #&54
3807  D0 0C              ..   BNE &3815
3809  20 A3 25            .%  JSR &25A3
380C  A9 0F              ..   LDA #&0F
380E  85 2C              .,   STA &2C
3810  A9 CD              ..   LDA #&CD
3812  4C CE 12           L..  JMP &12CE
.addr3815
3815  C9 32              .2   CMP #&32
3817  F0 2C              .,   BEQ &3845
3819  C9 43              .C   CMP #&43
381B  D0 09              ..   BNE &3826
381D  A5 87              ..   LDA &87
381F  29 C0              ).   AND #&C0
3821  F0 21              .!   BEQ &3844
3823  4C 41 1F           LA.  JMP &1F41
.addr3826
3826  85 06              ..   STA &06
3828  A5 87              ..   LDA &87
382A  29 C0              ).   AND #&C0
382C  F0 16              ..   BEQ &3844
382E  A5 2F              ./   LDA &2F
3830  D0 12              ..   BNE &3844
3832  A5 06              ..   LDA &06
3834  C9 36              .6   CMP #&36
3836  D0 09              ..   BNE &3841
3838  20 23 2B            #+  JSR &2B23
383B  20 4E 36            N6  JSR &364E
383E  20 23 2B            #+  JSR &2B23
.addr3841
3841  20 F6 2A            .*  JSR &2AF6
.addr3844
3844  60                 `    RTS
.addr3845
3845  A5 87              ..   LDA &87
3847  29 C0              ).   AND #&C0
3849  F0 F9              ..   BEQ &3844
384B  20 D8 30            .0  JSR &30D8
384E  85 72              .r   STA &72
3850  20 19 31            .1  JSR &3119
3853  A9 80              ..   LDA #&80
3855  85 72              .r   STA &72
3857  A9 01              ..   LDA #&01
3859  85 2C              .,   STA &2C
385B  E6 2D              .-   INC &2D
385D  4C 5E 26           L^&  JMP &265E
3860  AD 72 03           .r.  LDA &0372
3863  18                 .    CLC
3864  6D 75 03           mu.  ADC &0375
3867  0A                 .    ASL A
3868  6D 79 03           my.  ADC &0379
386B  60                 `    RTS
386C  00                 .    BRK
386D  CE 6C 38           .l8  DEC &386C
3870  D0 13              ..   BNE &3885
3872  20 97 36            .6  JSR &3697
.addr3875
3875  20 A6 12            ..  JSR &12A6
3878  A2 0A              ..   LDX #&0A
387A  A9 00              ..   LDA #&00
.addr387C
387C  9D C5 03           ...  STA &03C5,X
387F  CA                 .    DEX
3880  10 FA              ..   BPL &387C
.addr3882
3882  A2 FF              ..   LDX #&FF
3884  9A                 .    TXS
.addr3885
3885  A2 03              ..   LDX #&03
3887  86 2C              .,   STX &2C
3889  20 84 3B            .;  JSR &3B84
388C  A2 0B              ..   LDX #&0B
388E  A9 06              ..   LDA #&06
3890  20 E1 38            .8  JSR &38E1
3893  C9 44              .D   CMP #&44
3895  D0 06              ..   BNE &389D
3897  20 B9 38            .8  JSR &38B9
389A  20 86 3A            .:  JSR &3A86
.addr389D
389D  20 B9 38            .8  JSR &38B9
38A0  20 ED 36            .6  JSR &36ED
38A3  A9 07              ..   LDA #&07
38A5  A2 13              ..   LDX #&13
38A7  20 E1 38            .8  JSR &38E1
38AA  20 4E 36            N6  JSR &364E
38AD  20 6B 2E            k.  JSR &2E6B
.addr38B0
38B0  A9 FF              ..   LDA #&FF
38B2  85 8E              ..   STA &8E
38B4  A9 76              .v   LDA #&76
38B6  4C A3 37           L.7  JMP &37A3
.addr38B9
38B9  A2 53              .S   LDX #&53
.addr38BB
38BB  BD 80 11           ...  LDA &1180,X
38BE  9D 4F 03           .O.  STA &034F,X
38C1  CA                 .    DEX
38C2  D0 F7              ..   BNE &38BB
38C4  86 87              ..   STX &87
.addr38C6
38C6  20 84 39            .9  JSR &3984
38C9  CD D4 11           ...  CMP &11D4
38CC  D0 F8              ..   BNE &38C6
38CE  49 A9              I.   EOR #&A9
38D0  AA                 .    TAX
38D1  AD 66 03           .f.  LDA &0366
38D4  EC D3 11           ...  CPX &11D3
38D7  F0 02              ..   BEQ &38DB
38D9  09 80              ..   ORA #&80
.addr38DB
38DB  09 04              ..   ORA #&04
38DD  8D 66 03           .f.  STA &0366
38E0  60                 `    RTS
.addr38E1
38E1  48                 H    PHA
38E2  86 8C              ..   STX &8C
38E4  20 82 36            .6  JSR &3682
38E7  A9 01              ..   LDA #&01
38E9  20 37 25            7%  JSR &2537
38EC  C6 87              ..   DEC &87
38EE  A9 60              .`   LDA #&60
38F0  85 54              .T   STA &54
38F2  A5 9F              ..   LDA &9F
38F4  C9 DB              ..   CMP #&DB
38F6  F0 0A              ..   BEQ &3902
38F8  A9 10              ..   LDA #&10
38FA  8D B8 36           ..6  STA &36B8
38FD  A9 FE              ..   LDA #&FE
38FF  8D B9 36           ..6  STA &36B9
.addr3902
3902  85 4D              .M   STA &4D
3904  A2 7F              .   LDX #&7F
3906  86 63              .c   STX &63
3908  86 64              .d   STX &64
390A  E8                 .    INX
390B  86 72              .r   STX &72
390D  A5 8C              ..   LDA &8C
390F  20 FB 32            .2  JSR &32FB
3912  A0 06              ..   LDY #&06
3914  84 2C              .,   STY &2C
3916  A9 1E              ..   LDA #&1E
3918  20 A1 31            .1  JSR &31A1
391B  A0 06              ..   LDY #&06
391D  84 2C              .,   STY &2C
391F  E6 2D              .-   INC &2D
3921  AD C9 03           ...  LDA &03C9
3924  F0 05              ..   BEQ &392B
3926  A9 0D              ..   LDA #&0D
3928  20 CE 12            ..  JSR &12CE
.addr392B
392B  AD 6C 38           .l8  LDA &386C
392E  F0 15              ..   BEQ &3945
3930  EE 6C 38           .l8  INC &386C
3933  A9 07              ..   LDA #&07
3935  85 2C              .,   STA &2C
3937  A9 0A              ..   LDA #&0A
3939  85 2D              .-   STA &2D
393B  A0 00              ..   LDY #&00
.addr393D
393D  20 EE FF            ..  JSR oswrch
3940  C8                 .    INY
3941  B1 FD              ..   LDA (&FD),Y
3943  D0 F8              ..   BNE &393D
.addr3945
3945  20 A3 25            .%  JSR &25A3
3948  84 7D              .}   STY &7D
394A  8C CD 03           ...  STY &03CD
394D  68                 h    PLA
394E  20 CE 12            ..  JSR &12CE
3951  A9 0C              ..   LDA #&0C
3953  A2 07              ..   LDX #&07
3955  86 2C              .,   STX &2C
3957  20 CE 12            ..  JSR &12CE
.addr395A
395A  A5 4D              .M   LDA &4D
395C  C9 01              ..   CMP #&01
395E  F0 02              ..   BEQ &3962
3960  C6 4D              .M   DEC &4D
.addr3962
3962  20 E1 14            ..  JSR addr14E1
3965  A9 80              ..   LDA #&80
3967  85 4C              .L   STA &4C
3969  0A                 .    ASL A
396A  85 46              .F   STA &46
396C  85 49              .I   STA &49
396E  20 0F 40            .@  JSR &400F
3971  C6 8A              ..   DEC &8A
3973  AD 40 FE           .@.  LDA systemvia_irb
3976  29 10              ).   AND #&10
3978  F0 06              ..   BEQ &3980
397A  20 20 3C             <  JSR &3C20
397D  F0 DB              ..   BEQ &395A
397F  60                 `    RTS
.addr3980
3980  CE CD 03           ...  DEC &03CD
3983  60                 `    RTS
.addr3984
3984  A2 49              .I   LDX #&49
3986  18                 .    CLC
3987  8A                 .    TXA
.addr3988
3988  7D 88 11           }..  ADC &1188,X
398B  5D 89 11           ]..  EOR &1189,X
398E  CA                 .    DEX
398F  D0 F7              ..   BNE &3988
3991  60                 `    RTS
.addr3992
3992  A2 07              ..   LDX #&07
.addr3994
3994  B5 4B              .K   LDA &4B,X
3996  9D 81 11           ...  STA &1181,X
3999  CA                 .    DEX
399A  10 F8              ..   BPL &3994
.addr399C
399C  A2 07              ..   LDX #&07
.addr399E
399E  BD 81 11           ...  LDA &1181,X
39A1  95 4B              .K   STA &4B,X
39A3  CA                 .    DEX
39A4  10 F8              ..   BPL &399E
39A6  60                 `    RTS
.addr39A7
39A7  A0 08              ..   LDY #&08
39A9  20 9C 25            .%  JSR &259C
.addr39AC
39AC  A2 04              ..   LDX #&04
.addr39AE
39AE  BD 7C 11           .|.  LDA &117C,X
39B1  95 46              .F   STA &46,X
39B3  CA                 .    DEX
39B4  10 F8              ..   BPL &39AE
39B6  A9 07              ..   LDA #&07
39B8  8D EB 39           ..9  STA &39EB
39BB  A9 08              ..   LDA #&08
39BD  20 CE 12            ..  JSR &12CE
39C0  20 CC 39            .9  JSR &39CC
39C3  A9 09              ..   LDA #&09
39C5  8D EB 39           ..9  STA &39EB
39C8  98                 .    TYA
39C9  F0 D1              ..   BEQ &399C
39CB  60                 `    RTS
.addr39CC
39CC  A9 81              ..   LDA #%10000001
39CE  8D 4E FE           .N.  STA systemvia_ier
39D1  20 EC 18            ..  JSR &18EC
39D4  A2 E9              ..   LDX #&E9
39D6  A0 39              .9   LDY #&39
39D8  A9 00              ..   LDA #&00
39DA  20 F1 FF            ..  JSR osword
39DD  90 02              ..   BCC &39E1
39DF  A0 00              ..   LDY #&00
.addr39E1
39E1  A9 01              ..   LDA #%00000001
39E3  8D 4E FE           .N.  STA systemvia_ier
39E6  4C 8A 1C           L..  JMP &1C8A
39E9  4B                 K    ...
39EA  00                 .    BRK
39EB  09 21              .!   ORA #&21
39ED  7B                 {    ...
.addr39EE
39EE  A2 3A              .:   LDX #&3A
39F0  A9 00              ..   LDA #&00
.addr39F2
39F2  9D 11 03           ...  STA &0311,X
39F5  CA                 .    DEX
39F6  10 FA              ..   BPL &39F2
39F8  60                 `    RTS
.addr39F9
39F9  A2 0C              ..   LDX #&0C
39FB  20 FF 39            .9  JSR &39FF
39FE  CA                 .    DEX
.addr39FF
39FF  A0 00              ..   LDY #&00
3A01  84 07              ..   STY &07
.addr3A03
3A03  A9 00              ..   LDA #&00
3A05  86 08              ..   STX &08
.addr3A07
3A07  91 07              ..   STA (&07),Y
3A09  C8                 .    INY
3A0A  D0 FB              ..   BNE &3A07
3A0C  60                 `    RTS

.str_cat_0
	EQUS".0", &0D

.str_delete
	EQUS "DE.:0.E.1234567", &0D

.addr3A20
	JSR &3B2F
3A22  3B                 ;    ...
3A23  B0 1D              ..   BCS &3A42
3A25  8D 0E 3A           ..:  STA &3A0E
3A28  8D 8E 1C           ...  STA &1C8E
3A2B  A9 04              ..   LDA #&04
3A2D  20 CE 12            ..  JSR &12CE
3A30  A9 01              ..   LDA #&01
3A32  8D CF 03           ...  STA &03CF
3A35  85 2C              .,   STA &2C
3A37  A2 0D              ..   LDX #str_cat_0
3A39  A0 3A              .:   LDY #str_cat_0 DIV 256
3A3B  20 F7 FF            ..  JSR oscli
3A3E  CE CF 03           ...  DEC &03CF
3A41  18                 .    CLC
.addr3A42
3A42  60                 `    RTS
.addr3A43
3A43  20 20 3A             :  JSR &3A20
3A46  B0 3E              .>   BCS &3A86
3A48  AD 0E 3A           ..:  LDA &3A0E
3A4B  8D 14 3A           ..:  STA &3A14
3A4E  A9 09              ..   LDA #&09
3A50  20 CE 12            ..  JSR &12CE
3A53  20 CC 39            .9  JSR &39CC
3A56  98                 .    TYA
3A57  F0 2D              .-   BEQ &3A86
3A59  A2 09              ..   LDX #&09
.addr3A5B
3A5B  B5 4A              .J   LDA &4A,X
3A5D  9D 15 3A           ..:  STA &3A15,X
3A60  CA                 .    DEX
3A61  D0 F8              ..   BNE &3A5B
3A63  A2 10              ..   LDX #str_delete MOD 256
3A65  A0 3A              .:   LDY #str_delete DIV 256
3A67  20 F7 FF            ..  JSR oscli
3A6A  4C 86 3A           L.:  JMP &3A86
3A6D  00                 .    BRK
3A6E  AE 6D 3A           .m:  LDX &3A6D
3A71  9A                 .    TXS
3A72  A0 00              ..   LDY #&00
3A74  A9 07              ..   LDA #&07
.addr3A76
3A76  20 EE FF            ..  JSR oswrch
3A79  C8                 .    INY
3A7A  B1 FD              ..   LDA (&FD),Y
3A7C  D0 F8              ..   BNE &3A76
3A7E  F0 03              ..   BEQ &3A83
.addr3A80
3A80  20 20 3A             :  JSR &3A20
.addr3A83
3A83  20 61 3D            a=  JSR &3D61
.addr3A86
3A86  20 F9 39            .9  JSR &39F9
3A89  BA                 .    TSX
3A8A  8E 6D 3A           .m:  STX &3A6D
3A8D  A9 6E              .n   LDA #&6E
3A8F  8D EF 11           ...  STA &11EF
3A92  A9 3A              .:   LDA #&3A
3A94  8D F0 11           ...  STA &11F0
3A97  A9 01              ..   LDA #&01
3A99  20 CE 12            ..  JSR &12CE
3A9C  20 61 3D            a=  JSR &3D61
3A9F  C9 31              .1   CMP #&31
3AA1  90 71              .q   BCC &3B14
3AA3  C9 34              .4   CMP #&34
3AA5  F0 9C              ..   BEQ &3A43
3AA7  B0 6B              .k   BCS &3B14
3AA9  C9 32              .2   CMP #&32
3AAB  B0 0C              ..   BCS &3AB9
3AAD  20 A7 39            .9  JSR &39A7
3AB0  20 48 3B            H;  JSR &3B48
3AB3  20 92 39            .9  JSR &3992
3AB6  38                 8    SEC
3AB7  B0 5C              .\   BCS &3B15
.addr3AB9
3AB9  D0 C5              ..   BNE &3A80
3ABB  20 A7 39            .9  JSR &39A7
3ABE  20 92 39            .9  JSR &3992
3AC1  4E A1 03           N..  LSR &03A1
3AC4  A9 03              ..   LDA #&03
3AC6  20 CE 12            ..  JSR &12CE
3AC9  A2 4B              .K   LDX #&4B
.addr3ACB
3ACB  BD 58 03           .X.  LDA &0358,X
3ACE  9D 00 0B           ...  STA &0B00,X
3AD1  9D 89 11           ...  STA &1189,X
3AD4  CA                 .    DEX
3AD5  10 F4              ..   BPL &3ACB
3AD7  20 84 39            .9  JSR &3984
3ADA  8D D4 11           ...  STA &11D4
3ADD  48                 H    PHA
3ADE  09 80              ..   ORA #&80
3AE0  85 40              .@   STA &40
3AE2  4D 66 03           Mf.  EOR &0366
3AE5  85 42              .B   STA &42
3AE7  4D 63 03           Mc.  EOR &0363
3AEA  85 41              .A   STA &41
3AEC  49 5A              IZ   EOR #&5A
3AEE  4D A0 03           M..  EOR &03A0
3AF1  85 43              .C   STA &43
3AF3  18                 .    CLC
3AF4  20 D0 1B            ..  JSR &1BD0
3AF7  20 83 26            .&  JSR &2683
3AFA  68                 h    PLA
3AFB  8D 4B 0B           .K.  STA &0B4B
3AFE  49 A9              I.   EOR #&A9
3B00  8D D3 11           ...  STA &11D3
3B03  8D 4A 0B           .J.  STA &0B4A
3B06  A0 0B              ..   LDY #&0B
3B08  8C 0B 0C           ...  STY &0C0B
3B0B  C8                 .    INY
3B0C  8C 0F 0C           ...  STY &0C0F
3B0F  A9 00              ..   LDA #&00
3B11  20 18 3B            .;  JSR &3B18
.addr3B14
3B14  18                 .    CLC
.addr3B15
3B15  4C A6 12           L..  JMP &12A6
.addr3B18
3B18  48                 H    PHA
3B19  20 2F 3B            /;  JSR &3B2F
3B1C  85 47              .G   STA &47
3B1E  68                 h    PLA
3B1F  B0 0D              ..   BCS &3B2E
3B21  A2 46              .F   LDX #&46
3B23  8E 00 0C           ...  STX &0C00
3B26  A2 00              ..   LDX #&00
3B28  A0 0C              ..   LDY #&0C
3B2A  20 DD FF            ..  JSR osfile
3B2D  18                 .    CLC
.addr3B2E
3B2E  60                 `    RTS
.addr3B2F
3B2F  A9 02              ..   LDA #&02
3B31  20 CE 12            ..  JSR &12CE
3B34  20 61 3D            a=  JSR &3D61
3B37  09 10              ..   ORA #&10
3B39  20 56 1D            V.  JSR &1D56
3B3C  48                 H    PHA
3B3D  20 8A 1C            ..  JSR &1C8A
3B40  68                 h    PLA
3B41  C9 30              .0   CMP #&30
3B43  90 25              .%   BCC &3B6A
3B45  C9 34              .4   CMP #&34
3B47  60                 `    RTS
.addr3B48
3B48  20 F9 39            .9  JSR &39F9
3B4B  A0 0B              ..   LDY #&0B
3B4D  8C 03 0C           ...  STY &0C03
3B50  EE 0B 0C           ...  INC &0C0B
3B53  A9 FF              ..   LDA #&FF
3B55  20 18 3B            .;  JSR &3B18
3B58  B0 10              ..   BCS &3B6A
3B5A  AD 00 0B           ...  LDA &0B00
3B5D  30 0D              0.   BMI &3B6C
3B5F  A2 4B              .K   LDX #&4B
.addr3B61
3B61  BD 00 0B           ...  LDA &0B00,X
3B64  9D 89 11           ...  STA &1189,X
3B67  CA                 .    DEX
3B68  10 F7              ..   BPL &3B61
.addr3B6A
3B6A  38                 8    SEC
3B6B  60                 `    RTS
.addr3B6C
3B6C  00                 .    BRK
3B6D  49 49              II   EOR #&49
3B6F  6C 6C 65           lle  JMP (&656C)
3B72  67                 g    ...
3B73  61 6C              al   ADC (&6C,X)
3B75  20 45 4C            EL  JSR &4C45
3B78  49 54              IT   EOR #&54
3B7A  45 20              E    EOR &20
3B7C  49 49              II   EOR #&49
3B7E  20 66 69            fi  JSR &6966
3B81  6C 65 00           le.  JMP (&0065)
.addr3B84
3B84  A0 00              ..   LDY #&00
3B86  A9 C8              ..   LDA #&C8
3B88  4C F4 FF           L..  JMP osbyte
3B8B  20 AC 39            .9  JSR &39AC
3B8E  60                 `    RTS
3B8F  A2 00              ..   LDX #&00
3B91  20 DA 32            .2  JSR &32DA
3B94  A2 03              ..   LDX #&03
3B96  20 DA 32            .2  JSR &32DA
3B99  A2 06              ..   LDX #&06
3B9B  20 DA 32            .2  JSR &32DA
3B9E  A5 D2              ..   LDA &D2
3BA0  05 D5              ..   ORA &D5
3BA2  05 D8              ..   ORA &D8
3BA4  09 01              ..   ORA #&01
3BA6  85 DB              ..   STA &DB
3BA8  A5 D3              ..   LDA &D3
3BAA  05 D6              ..   ORA &D6
3BAC  05 D9              ..   ORA &D9
.addr3BAE
3BAE  06 DB              ..   ASL &DB
3BB0  2A                 *    ROL A
3BB1  B0 0E              ..   BCS &3BC1
3BB3  06 D2              ..   ASL &D2
3BB5  26 D3              &.   ROL &D3
3BB7  06 D5              ..   ASL &D5
3BB9  26 D6              &.   ROL &D6
3BBB  06 D8              ..   ASL &D8
3BBD  26 D9              &.   ROL &D9
3BBF  90 ED              ..   BCC &3BAE
.addr3BC1
3BC1  A5 D3              ..   LDA &D3
3BC3  4A                 J    LSR A
3BC4  05 D4              ..   ORA &D4
3BC6  85 34              .4   STA &34
3BC8  A5 D6              ..   LDA &D6
3BCA  4A                 J    LSR A
3BCB  05 D7              ..   ORA &D7
3BCD  85 35              .5   STA &35
3BCF  A5 D9              ..   LDA &D9
3BD1  4A                 J    LSR A
3BD2  05 DA              ..   ORA &DA
3BD4  85 36              .6   STA &36
.addr3BD6
3BD6  A5 34              .4   LDA &34
3BD8  20 BE 21            .!  JSR &21BE
3BDB  85 82              ..   STA &82
3BDD  A5 1B              ..   LDA &1B
3BDF  85 81              ..   STA &81
3BE1  A5 35              .5   LDA &35
3BE3  20 BE 21            .!  JSR &21BE
3BE6  85 D1              ..   STA &D1
3BE8  A5 1B              ..   LDA &1B
3BEA  65 81              e.   ADC &81
3BEC  85 81              ..   STA &81
3BEE  A5 D1              ..   LDA &D1
3BF0  65 82              e.   ADC &82
3BF2  85 82              ..   STA &82
3BF4  A5 36              .6   LDA &36
3BF6  20 BE 21            .!  JSR &21BE
3BF9  85 D1              ..   STA &D1
3BFB  A5 1B              ..   LDA &1B
3BFD  65 81              e.   ADC &81
3BFF  85 81              ..   STA &81
3C01  A5 D1              ..   LDA &D1
3C03  65 82              e.   ADC &82
3C05  85 82              ..   STA &82
3C07  20 3E 3F            >?  JSR &3F3E
3C0A  A5 34              .4   LDA &34
3C0C  20 8C 3E            .>  JSR &3E8C
3C0F  85 34              .4   STA &34
3C11  A5 35              .5   LDA &35
3C13  20 8C 3E            .>  JSR &3E8C
3C16  85 35              .5   STA &35
3C18  A5 36              .6   LDA &36
3C1A  20 8C 3E            .>  JSR &3E8C
3C1D  85 36              .6   STA &36
.addr3C1F
3C1F  60                 `    RTS
.addr3C20
3C20  A2 10              ..   LDX #&10
.addr3C22
3C22  20 93 3C            .<  JSR &3C93
3C25  30 04              0.   BMI &3C2B
3C27  E8                 .    INX
3C28  10 F8              ..   BPL &3C22
3C2A  8A                 .    TXA
.addr3C2B
3C2B  49 80              I.   EOR #&80
3C2D  AA                 .    TAX
3C2E  60                 `    RTS
.addr3C2F
3C2F  A9 00              ..   LDA #&00
3C31  85 30              .0   STA &30
3C33  8D 40 03           .@.  STA &0340
3C36  A9 48              .H   LDA #&48
3C38  D0 32              .2   BNE &3C6C
3C3A  A9 10              ..   LDA #&10
3C3C  20 6C 3C            l<  JSR &3C6C
3C3F  A9 18              ..   LDA #&18
3C41  D0 29              .)   BNE &3C6C
.addr3C43
3C43  A9 20              .    LDA #&20
3C45  D0 25              .%   BNE &3C6C
3C47  EE 9F 03           ...  INC &039F
3C4A  D0 08              ..   BNE &3C54
3C4C  EE A0 03           ...  INC &03A0
3C4F  A9 65              .e   LDA #&65
3C51  20 82 3D            .=  JSR &3D82
.addr3C54
3C54  A2 07              ..   LDX #&07
3C56  86 D1              ..   STX &D1
3C58  A9 18              ..   LDA #&18
3C5A  20 7D 3C            }<  JSR &3C7D
3C5D  A5 4D              .M   LDA &4D
3C5F  4A                 J    LSR A
3C60  4A                 J    LSR A
3C61  25 D1              %.   AND &D1
3C63  09 F1              ..   ORA #&F1
3C65  85 0B              ..   STA &0B
3C67  20 6F 3C            o<  JSR &3C6F
3C6A  A9 10              ..   LDA #&10
.addr3C6C
3C6C  20 7D 3C            }<  JSR &3C7D
.addr3C6F
3C6F  AE C6 03           ...  LDX &03C6
3C72  D0 AB              ..   BNE &3C1F
3C74  A2 09              ..   LDX #&09
3C76  A0 00              ..   LDY #&00
3C78  A9 07              ..   LDA #&07
3C7A  4C F1 FF           L..  JMP osword
.addr3C7D
3C7D  4A                 J    LSR A
3C7E  69 03              i.   ADC #&03
3C80  A8                 .    TAY
3C81  A2 07              ..   LDX #&07
.addr3C83
3C83  A9 00              ..   LDA #&00
3C85  95 09              ..   STA &09,X
3C87  CA                 .    DEX
3C88  B9 5A 36           .Z6  LDA &365A,Y
3C8B  95 09              ..   STA &09,X
3C8D  88                 .    DEY
3C8E  CA                 .    DEX
3C8F  10 F2              ..   BPL &3C83
.addr3C91
3C91  A2 01              ..   LDX #&01
.addr3C93
3C93  A9 03              ..   LDA #&03
3C95  78                 x    SEI
3C96  8D 40 FE           .@.  STA systemvia_irb
3C99  A9 7F              .   LDA #&7F
3C9B  8D 43 FE           .C.  STA systemvia_ddra
3C9E  8E 4F FE           .O.  STX systemvia_ora_nh
3CA1  AE 4F FE           .O.  LDX systemvia_ira_nh
3CA4  A9 0B              ..   LDA #&0B
3CA6  8D 40 FE           .@.  STA systemvia_orb
3CA9  58                 X    CLI
3CAA  8A                 .    TXA
3CAB  60                 `    RTS
.addr3CAC
3CAC  A9 80              ..   LDA #&80
3CAE  20 F4 FF            ..  JSR osbyte
3CB1  98                 .    TYA
3CB2  4D CC 03           M..  EOR &03CC
3CB5  60                 `    RTS
.addr3CB6
3CB6  84 D1              ..   STY &D1
3CB8  E4 D1              ..   CPX &D1
3CBA  D0 10              ..   BNE &3CCC
3CBC  BD 87 03           ...  LDA &0387,X
3CBF  49 FF              I.   EOR #&FF
3CC1  9D 87 03           ...  STA &0387,X
3CC4  20 54 1D            T.  JSR &1D54
3CC7  20 9C 25            .%  JSR &259C
3CCA  A4 D1              ..   LDY &D1
.addr3CCC
3CCC  60                 `    RTS
3CCD  AD 40 FE           .@.  LDA systemvia_irb
3CD0  AA                 .    TAX
3CD1  29 10              ).   AND #&10
3CD3  49 10              I.   EOR #&10
3CD5  8D 07 03           ...  STA &0307
3CD8  A2 01              ..   LDX #&01
3CDA  20 AC 3C            .<  JSR &3CAC
3CDD  09 01              ..   ORA #&01
3CDF  8D 4C 03           .L.  STA &034C
3CE2  A2 02              ..   LDX #&02
3CE4  20 AC 3C            .<  JSR &3CAC
3CE7  4D CB 03           M..  EOR &03CB
3CEA  8D 4D 03           .M.  STA &034D
3CED  4C 0A 3D           L.=  JMP &3D0A
.addr3CF0
3CF0  AD CD 03           ...  LDA &03CD
3CF3  F0 65              .e   BEQ &3D5A
3CF5  A2 01              ..   LDX #&01
3CF7  20 AC 3C            .<  JSR &3CAC
3CFA  09 01              ..   ORA #&01
3CFC  8D 4C 03           .L.  STA &034C
3CFF  A2 02              ..   LDX #&02
3D01  20 AC 3C            .<  JSR &3CAC
3D04  4D CB 03           M..  EOR &03CB
3D07  8D 4D 03           .M.  STA &034D
.addr3D0A
3D0A  20 20 3C             <  JSR &3C20
3D0D  8E 00 03           ...  STX &0300
3D10  E0 69              .i   CPX #&69
3D12  D0 3D              .=   BNE &3D51
.addr3D14
3D14  20 0B 26            .&  JSR &260B
3D17  20 20 3C             <  JSR &3C20
3D1A  E0 51              .Q   CPX #&51
3D1C  D0 05              ..   BNE &3D23
3D1E  A9 00              ..   LDA #&00
3D20  8D C6 03           ...  STA &03C6
.addr3D23
3D23  A0 40              .@   LDY #&40
.addr3D25
3D25  20 B6 3C            .<  JSR &3CB6
3D28  C8                 .    INY
3D29  C0 47              .G   CPY #&47
3D2B  D0 F8              ..   BNE &3D25
3D2D  E0 10              ..   CPX #&10
3D2F  D0 03              ..   BNE &3D34
3D31  8E C6 03           ...  STX &03C6
.addr3D34
3D34  E0 70              .p   CPX #&70
3D36  D0 03              ..   BNE &3D3B
3D38  4C 85 38           L.8  JMP &3885
.addr3D3B
3D3B  E0 64              .d   CPX #&64
3D3D  D0 0E              ..   BNE &3D4D
3D3F  AD CE 03           ...  LDA &03CE
3D42  49 FF              I.   EOR #&FF
3D44  8D CE 03           ...  STA &03CE
3D47  8D CD 03           ...  STA &03CD
3D4A  8D CC 03           ...  STA &03CC
.addr3D4D
3D4D  E0 59              .Y   CPX #&59
3D4F  D0 C3              ..   BNE &3D14
.addr3D51
3D51  A5 87              ..   LDA &87
3D53  D0 21              .!   BNE &3D76
3D55  A0 10              ..   LDY #&10
3D57  A9 FF              ..   LDA #&FF
3D59  60                 `    RTS
.addr3D5A
3D5A  8D CE 03           ...  STA &03CE
.addr3D5D
3D5D  F0 AB              ..   BEQ &3D0A
.addr3D5F
3D5F  84 85              ..   STY &85
.addr3D61
3D61  A0 02              ..   LDY #&02
3D63  20 9C 25            .%  JSR &259C
3D66  20 20 3C             <  JSR &3C20
3D69  D0 F6              ..   BNE &3D61
.addr3D6B
3D6B  20 20 3C             <  JSR &3C20
3D6E  F0 FB              ..   BEQ &3D6B
3D70  A8                 .    TAY
3D71  B1 04              ..   LDA (&04),Y
3D73  A4 85              ..   LDY &85
3D75  AA                 .    TAX
.addr3D76
3D76  60                 `    RTS
.addr3D77
3D77  8E 4A 03           .J.  STX &034A
3D7A  48                 H    PHA
3D7B  AD A4 03           ...  LDA &03A4
3D7E  20 99 3D            .=  JSR &3D99
3D81  68                 h    PLA
.addr3D82
3D82  A2 00              ..   LDX #&00
3D84  86 72              .r   STX &72
3D86  A0 09              ..   LDY #&09
3D88  84 2C              .,   STY &2C
3D8A  A0 16              ..   LDY #&16
3D8C  84 2D              .-   STY &2D
3D8E  EC 4A 03           .J.  CPX &034A
3D91  D0 E4              ..   BNE &3D77
3D93  8C 4A 03           .J.  STY &034A
3D96  8D A4 03           ...  STA &03A4
.addr3D99
3D99  20 AC 31            .1  JSR &31AC
3D9C  4E 4B 03           NK.  LSR &034B
3D9F  F0 D5              ..   BEQ &3D76
3DA1  A9 FD              ..   LDA #&FD
3DA3  4C AC 31           L.1  JMP &31AC
3DA6  13                 .    ...
3DA7  82                 .    ...
3DA8  06 01              ..   ASL &01
3DAA  14                 .    ...
3DAB  81 0A              ..   STA (&0A,X)
3DAD  03                 .    ...
3DAE  41 83              A.   EOR (&83,X)
3DB0  02                 .    ...
3DB1  07                 .    ...
3DB2  28                 (    PLP
3DB3  85 E2              ..   STA &E2
3DB5  1F                 .    ...
3DB6  53                 S    ...
3DB7  85 FB              ..   STA &FB
3DB9  0F                 .    ...
3DBA  C4 08              ..   CPY &08
3DBC  36 03              6.   ROL &03,X
3DBE  EB                 .    ...
3DBF  1D 08 78           ..x  ORA &7808,X
3DC2  9A                 .    TXS
3DC3  0E 38 03           .8.  ASL &0338
3DC6  75 06              u.   ADC &06,X
3DC8  28                 (    PLP
3DC9  07                 .    ...
3DCA  4E 01 11           N..  LSR &1101
3DCD  1F                 .    ...
3DCE  7C                 |    ...
3DCF  0D 1D 07           ...  ORA &071D
3DD2  B0 89              ..   BCS &3D5D
3DD4  DC                 .    ...
3DD5  3F                 ?    ...
3DD6  20 81 35            .5  JSR &3581
3DD9  03                 .    ...
3DDA  61 A1              a.   ADC (&A1,X)
3DDC  42                 B    ...
3DDD  07                 .    ...
3DDE  AB                 .    ...
3DDF  A2 37              .7   LDX #&37
3DE1  1F                 .    ...
3DE2  2D C1 FA           -..  AND &FAC1
3DE5  0F                 .    ...
3DE6  35 0F              5.   AND &0F,X
3DE8  C0 07              ..   CPY #&07
.addr3DEA
3DEA  98                 .    TYA
3DEB  A0 02              ..   LDY #&02
3DED  20 B9 3E            .>  JSR &3EB9
3DF0  85 5A              .Z   STA &5A
3DF2  4C 32 3E           L2>  JMP &3E32
.addr3DF5
3DF5  AA                 .    TAX
3DF6  A5 35              .5   LDA &35
3DF8  29 60              )`   AND #&60
3DFA  F0 EE              ..   BEQ &3DEA
3DFC  A9 02              ..   LDA #&02
3DFE  20 B9 3E            .>  JSR &3EB9
3E01  85 58              .X   STA &58
3E03  4C 32 3E           L2>  JMP &3E32
.addr3E06
3E06  A5 50              .P   LDA &50
3E08  85 34              .4   STA &34
3E0A  A5 52              .R   LDA &52
3E0C  85 35              .5   STA &35
3E0E  A5 54              .T   LDA &54
3E10  85 36              .6   STA &36
3E12  20 D6 3B            .;  JSR &3BD6
3E15  A5 34              .4   LDA &34
3E17  85 50              .P   STA &50
3E19  A5 35              .5   LDA &35
3E1B  85 52              .R   STA &52
3E1D  A5 36              .6   LDA &36
3E1F  85 54              .T   STA &54
3E21  A0 04              ..   LDY #&04
3E23  A5 34              .4   LDA &34
3E25  29 60              )`   AND #&60
3E27  F0 CC              ..   BEQ &3DF5
3E29  A2 02              ..   LDX #&02
3E2B  A9 00              ..   LDA #&00
3E2D  20 B9 3E            .>  JSR &3EB9
3E30  85 56              .V   STA &56
.addr3E32
3E32  A5 56              .V   LDA &56
3E34  85 34              .4   STA &34
3E36  A5 58              .X   LDA &58
3E38  85 35              .5   STA &35
3E3A  A5 5A              .Z   LDA &5A
3E3C  85 36              .6   STA &36
3E3E  20 D6 3B            .;  JSR &3BD6
3E41  A5 34              .4   LDA &34
3E43  85 56              .V   STA &56
3E45  A5 35              .5   LDA &35
3E47  85 58              .X   STA &58
3E49  A5 36              .6   LDA &36
3E4B  85 5A              .Z   STA &5A
3E4D  A5 52              .R   LDA &52
3E4F  85 81              ..   STA &81
3E51  A5 5A              .Z   LDA &5A
3E53  20 87 22            ."  JSR &2287
3E56  A6 54              .T   LDX &54
3E58  A5 58              .X   LDA &58
3E5A  20 EC 22            ."  JSR &22EC
3E5D  49 80              I.   EOR #&80
3E5F  85 5C              .\   STA &5C
3E61  A5 56              .V   LDA &56
3E63  20 87 22            ."  JSR &2287
3E66  A6 50              .P   LDX &50
3E68  A5 5A              .Z   LDA &5A
3E6A  20 EC 22            ."  JSR &22EC
3E6D  49 80              I.   EOR #&80
3E6F  85 5E              .^   STA &5E
3E71  A5 58              .X   LDA &58
3E73  20 87 22            ."  JSR &2287
3E76  A6 52              .R   LDX &52
3E78  A5 56              .V   LDA &56
3E7A  20 EC 22            ."  JSR &22EC
3E7D  49 80              I.   EOR #&80
3E7F  85 60              .`   STA &60
3E81  A9 00              ..   LDA #&00
3E83  A2 0E              ..   LDX #&0E
.addr3E85
3E85  95 4F              .O   STA &4F,X
3E87  CA                 .    DEX
3E88  CA                 .    DEX
3E89  10 FA              ..   BPL &3E85
3E8B  60                 `    RTS
.addr3E8C
3E8C  A8                 .    TAY
3E8D  29 7F              )   AND #&7F
3E8F  C5 81              ..   CMP &81
3E91  B0 20              .    BCS &3EB3
3E93  A2 FE              ..   LDX #&FE
3E95  86 D1              ..   STX &D1
.addr3E97
3E97  0A                 .    ASL A
3E98  C5 81              ..   CMP &81
3E9A  90 02              ..   BCC &3E9E
3E9C  E5 81              ..   SBC &81
.addr3E9E
3E9E  26 D1              &.   ROL &D1
3EA0  B0 F5              ..   BCS &3E97
3EA2  A5 D1              ..   LDA &D1
3EA4  4A                 J    LSR A
3EA5  4A                 J    LSR A
3EA6  85 D1              ..   STA &D1
3EA8  4A                 J    LSR A
3EA9  65 D1              e.   ADC &D1
3EAB  85 D1              ..   STA &D1
3EAD  98                 .    TYA
3EAE  29 80              ).   AND #&80
3EB0  05 D1              ..   ORA &D1
3EB2  60                 `    RTS
.addr3EB3
3EB3  98                 .    TYA
3EB4  29 80              ).   AND #&80
3EB6  09 60              .`   ORA #&60
3EB8  60                 `    RTS
.addr3EB9
3EB9  85 1D              ..   STA &1D
3EBB  B5 50              .P   LDA &50,X
3EBD  85 81              ..   STA &81
3EBF  B5 56              .V   LDA &56,X
3EC1  20 87 22            ."  JSR &2287
3EC4  B6 50              .P   LDX &50,Y
3EC6  86 81              ..   STX &81
3EC8  B9 56 00           .V.  LDA &0056,Y
3ECB  20 AD 22            ."  JSR &22AD
3ECE  86 1B              ..   STX &1B
3ED0  A4 1D              ..   LDY &1D
3ED2  B6 50              .P   LDX &50,Y
3ED4  86 81              ..   STX &81
3ED6  49 80              I.   EOR #&80
3ED8  85 1C              ..   STA &1C
3EDA  45 81              E.   EOR &81
3EDC  29 80              ).   AND #&80
3EDE  85 D1              ..   STA &D1
3EE0  A9 00              ..   LDA #&00
3EE2  A2 10              ..   LDX #&10
3EE4  06 1B              ..   ASL &1B
3EE6  26 1C              &.   ROL &1C
3EE8  06 81              ..   ASL &81
3EEA  46 81              F.   LSR &81
.addr3EEC
3EEC  2A                 *    ROL A
3EED  C5 81              ..   CMP &81
3EEF  90 02              ..   BCC &3EF3
3EF1  E5 81              ..   SBC &81
.addr3EF3
3EF3  26 1B              &.   ROL &1B
3EF5  26 1C              &.   ROL &1C
3EF7  CA                 .    DEX
3EF8  D0 F2              ..   BNE &3EEC
3EFA  A5 1B              ..   LDA &1B
3EFC  05 D1              ..   ORA &D1
3EFE  60                 `    RTS
.addr3EFF
3EFF  20 59 40            Y@  JSR &4059
3F02  A9 60              .`   LDA #&60
3F04  C9 BE              ..   CMP #&BE
3F06  B0 1B              ..   BCS &3F23
3F08  A0 02              ..   LDY #&02
3F0A  20 2A 3F            *?  JSR &3F2A
3F0D  A0 06              ..   LDY #&06
3F0F  A9 60              .`   LDA #&60
3F11  69 01              i.   ADC #&01
3F13  20 2A 3F            *?  JSR &3F2A
3F16  A9 08              ..   LDA #&08
3F18  05 65              .e   ORA &65
3F1A  85 65              .e   STA &65
3F1C  A9 08              ..   LDA #&08
3F1E  4C EF 46           L.F  JMP &46EF
.addr3F21
3F21  68                 h    PLA
3F22  68                 h    PLA
.addr3F23
3F23  A9 F7              ..   LDA #&F7
3F25  25 65              %e   AND &65
3F27  85 65              .e   STA &65
3F29  60                 `    RTS
.addr3F2A
3F2A  91 67              .g   STA (&67),Y
3F2C  C8                 .    INY
3F2D  C8                 .    INY
3F2E  91 67              .g   STA (&67),Y
3F30  A9 80              ..   LDA #&80
3F32  88                 .    DEY
3F33  91 67              .g   STA (&67),Y
3F35  69 03              i.   ADC #&03
3F37  B0 E8              ..   BCS &3F21
3F39  88                 .    DEY
3F3A  88                 .    DEY
3F3B  91 67              .g   STA (&67),Y
3F3D  60                 `    RTS
.addr3F3E
3F3E  A4 82              ..   LDY &82
3F40  A5 81              ..   LDA &81
3F42  85 83              ..   STA &83
3F44  A2 00              ..   LDX #&00
3F46  86 81              ..   STX &81
3F48  A9 08              ..   LDA #&08
3F4A  85 D1              ..   STA &D1
.addr3F4C
3F4C  E4 81              ..   CPX &81
3F4E  90 0E              ..   BCC &3F5E
3F50  D0 04              ..   BNE &3F56
3F52  C0 40              .@   CPY #&40
3F54  90 08              ..   BCC &3F5E
.addr3F56
3F56  98                 .    TYA
3F57  E9 40              .@   SBC #&40
3F59  A8                 .    TAY
3F5A  8A                 .    TXA
3F5B  E5 81              ..   SBC &81
3F5D  AA                 .    TAX
.addr3F5E
3F5E  26 81              &.   ROL &81
3F60  06 83              ..   ASL &83
3F62  98                 .    TYA
3F63  2A                 *    ROL A
3F64  A8                 .    TAY
3F65  8A                 .    TXA
3F66  2A                 *    ROL A
3F67  AA                 .    TAX
3F68  06 83              ..   ASL &83
3F6A  98                 .    TYA
3F6B  2A                 *    ROL A
3F6C  A8                 .    TAY
3F6D  8A                 .    TXA
3F6E  2A                 *    ROL A
3F6F  AA                 .    TAX
3F70  C6 D1              ..   DEC &D1
3F72  D0 D8              ..   BNE &3F4C
3F74  60                 `    RTS
.addr3F75
3F75  C5 81              ..   CMP &81
3F77  B0 1A              ..   BCS &3F93
.addr3F79
3F79  A2 FE              ..   LDX #&FE
3F7B  86 82              ..   STX &82
.addr3F7D
3F7D  0A                 .    ASL A
3F7E  B0 0B              ..   BCS &3F8B
3F80  C5 81              ..   CMP &81
3F82  90 02              ..   BCC &3F86
3F84  E5 81              ..   SBC &81
.addr3F86
3F86  26 82              &.   ROL &82
3F88  B0 F3              ..   BCS &3F7D
3F8A  60                 `    RTS
.addr3F8B
3F8B  E5 81              ..   SBC &81
3F8D  38                 8    SEC
3F8E  26 82              &.   ROL &82
3F90  B0 EB              ..   BCS &3F7D
3F92  60                 `    RTS
.addr3F93
3F93  A9 FF              ..   LDA #&FF
3F95  85 82              ..   STA &82
3F97  60                 `    RTS
.addr3F98
3F98  45 83              E.   EOR &83
3F9A  30 06              0.   BMI &3FA2
3F9C  A5 81              ..   LDA &81
3F9E  18                 .    CLC
3F9F  65 82              e.   ADC &82
3FA1  60                 `    RTS
.addr3FA2
3FA2  A5 82              ..   LDA &82
3FA4  38                 8    SEC
3FA5  E5 81              ..   SBC &81
3FA7  90 02              ..   BCC &3FAB
3FA9  18                 .    CLC
3FAA  60                 `    RTS
.addr3FAB
3FAB  48                 H    PHA
3FAC  A5 83              ..   LDA &83
3FAE  49 80              I.   EOR #&80
3FB0  85 83              ..   STA &83
3FB2  68                 h    PLA
3FB3  49 FF              I.   EOR #&FF
3FB5  69 01              i.   ADC #&01
3FB7  60                 `    RTS
.addr3FB8
3FB8  A2 00              ..   LDX #&00
3FBA  A0 00              ..   LDY #&00
.addr3FBC
3FBC  A5 34              .4   LDA &34
3FBE  85 81              ..   STA &81
3FC0  B5 09              ..   LDA &09,X
3FC2  20 FA 21            .!  JSR &21FA
3FC5  85 D1              ..   STA &D1
3FC7  A5 35              .5   LDA &35
3FC9  55 0A              U.   EOR &0A,X
3FCB  85 83              ..   STA &83
3FCD  A5 36              .6   LDA &36
3FCF  85 81              ..   STA &81
3FD1  B5 0B              ..   LDA &0B,X
3FD3  20 FA 21            .!  JSR &21FA
3FD6  85 81              ..   STA &81
3FD8  A5 D1              ..   LDA &D1
3FDA  85 82              ..   STA &82
3FDC  A5 37              .7   LDA &37
3FDE  55 0C              U.   EOR &0C,X
3FE0  20 98 3F            .?  JSR &3F98
3FE3  85 D1              ..   STA &D1
3FE5  A5 38              .8   LDA &38
3FE7  85 81              ..   STA &81
3FE9  B5 0D              ..   LDA &0D,X
3FEB  20 FA 21            .!  JSR &21FA
3FEE  85 81              ..   STA &81
3FF0  A5 D1              ..   LDA &D1
3FF2  85 82              ..   STA &82
3FF4  A5 39              .9   LDA &39
3FF6  55 0E              U.   EOR &0E,X
3FF8  20 98 3F            .?  JSR &3F98
3FFB  99 3A 00           .:.  STA &003A,Y
3FFE  A5 83              ..   LDA &83
4000  99 3B 00           .;.  STA &003B,Y
4003  C8                 .    INY
4004  C8                 .    INY
4005  8A                 .    TXA
4006  18                 .    CLC
4007  69 06              i.   ADC #&06
4009  AA                 .    TAX
400A  C9 11              ..   CMP #&11
400C  90 AE              ..   BCC &3FBC
400E  60                 `    RTS
.addr400F
400F  A9 1F              ..   LDA #&1F
4011  85 96              ..   STA &96
4013  A9 20              .    LDA #&20
4015  24 65              $e   BIT &65
4017  D0 2D              .-   BNE &4046
4019  10 2B              .+   BPL &4046
401B  05 65              .e   ORA &65
.addr401D
401D  29 3F              )?   AND #&3F
401F  85 65              .e   STA &65
4021  A9 00              ..   LDA #&00
4023  A0 1C              ..   LDY #&1C
4025  91 20              .    STA (&20),Y
4027  A0 1E              ..   LDY #&1E
4029  91 20              .    STA (&20),Y
402B  20 59 40            Y@  JSR &4059
402E  A0 01              ..   LDY #&01
4030  A9 12              ..   LDA #&12
4032  91 67              .g   STA (&67),Y
4034  A0 07              ..   LDY #&07
4036  B1 1E              ..   LDA (&1E),Y
4038  A0 02              ..   LDY #&02
403A  91 67              .g   STA (&67),Y
.addr403C
403C  C8                 .    INY
403D  20 36 37            67  JSR &3736
4040  91 67              .g   STA (&67),Y
4042  C0 06              ..   CPY #&06
4044  D0 F6              ..   BNE &403C
.addr4046
4046  A5 4E              .N   LDA &4E
4048  10 1D              ..   BPL &4067
.addr404A
404A  A5 65              .e   LDA &65
404C  29 20              )    AND #&20
404E  F0 09              ..   BEQ &4059
4050  A5 65              .e   LDA &65
4052  29 F7              ).   AND #&F7
4054  85 65              .e   STA &65
4056  4C 82 32           L.2  JMP &3282
.addr4059
4059  A9 08              ..   LDA #&08
405B  24 65              $e   BIT &65
405D  F0 07              ..   BEQ &4066
405F  45 65              Ee   EOR &65
4061  85 65              .e   STA &65
4063  4C F3 46           L.F  JMP &46F3
.addr4066
4066  60                 `    RTS
.addr4067
4067  A5 4D              .M   LDA &4D
4069  C9 C0              ..   CMP #&C0
406B  B0 DD              ..   BCS &404A
406D  A5 46              .F   LDA &46
406F  C5 4C              .L   CMP &4C
4071  A5 47              .G   LDA &47
4073  E5 4D              .M   SBC &4D
4075  B0 D3              ..   BCS &404A
4077  A5 49              .I   LDA &49
4079  C5 4C              .L   CMP &4C
407B  A5 4A              .J   LDA &4A
407D  E5 4D              .M   SBC &4D
407F  B0 C9              ..   BCS &404A
4081  A0 06              ..   LDY #&06
4083  B1 1E              ..   LDA (&1E),Y
4085  AA                 .    TAX
4086  A9 FF              ..   LDA #&FF
4088  9D 00 01           ...  STA &0100,X
408B  9D 01 01           ...  STA &0101,X
408E  A5 4C              .L   LDA &4C
4090  85 D1              ..   STA &D1
4092  A5 4D              .M   LDA &4D
4094  4A                 J    LSR A
4095  66 D1              f.   ROR &D1
4097  4A                 J    LSR A
4098  66 D1              f.   ROR &D1
409A  4A                 J    LSR A
409B  66 D1              f.   ROR &D1
409D  4A                 J    LSR A
409E  D0 0A              ..   BNE &40AA
40A0  A5 D1              ..   LDA &D1
40A2  6A                 j    ROR A
40A3  4A                 J    LSR A
40A4  4A                 J    LSR A
40A5  4A                 J    LSR A
40A6  85 96              ..   STA &96
40A8  10 11              ..   BPL &40BB
.addr40AA
40AA  A0 0D              ..   LDY #&0D
40AC  B1 1E              ..   LDA (&1E),Y
40AE  C5 4D              .M   CMP &4D
40B0  B0 09              ..   BCS &40BB
40B2  A9 20              .    LDA #&20
40B4  25 65              %e   AND &65
40B6  D0 03              ..   BNE &40BB
40B8  4C FF 3E           L.>  JMP &3EFF
.addr40BB
40BB  A2 05              ..   LDX #&05
.addr40BD
40BD  B5 5B              .[   LDA &5B,X
40BF  95 09              ..   STA &09,X
40C1  B5 55              .U   LDA &55,X
40C3  95 0F              ..   STA &0F,X
40C5  B5 4F              .O   LDA &4F,X
40C7  95 15              ..   STA &15,X
40C9  CA                 .    DEX
40CA  10 F1              ..   BPL &40BD
40CC  A9 C5              ..   LDA #&C5
40CE  85 81              ..   STA &81
40D0  A0 10              ..   LDY #&10
.addr40D2
40D2  B9 09 00           ...  LDA &0009,Y
40D5  0A                 .    ASL A
40D6  B9 0A 00           ...  LDA &000A,Y
40D9  2A                 *    ROL A
40DA  20 75 3F            u?  JSR &3F75
40DD  A6 82              ..   LDX &82
40DF  96 09              ..   STX &09,Y
40E1  88                 .    DEY
40E2  88                 .    DEY
40E3  10 ED              ..   BPL &40D2
40E5  A2 08              ..   LDX #&08
.addr40E7
40E7  B5 46              .F   LDA &46,X
40E9  95 72              .r   STA &72,X
40EB  CA                 .    DEX
40EC  10 F9              ..   BPL &40E7
40EE  A9 FF              ..   LDA #&FF
40F0  85 E1              ..   STA &E1
40F2  A0 0C              ..   LDY #&0C
40F4  A5 65              .e   LDA &65
40F6  29 20              )    AND #&20
40F8  F0 12              ..   BEQ &410C
40FA  B1 1E              ..   LDA (&1E),Y
40FC  4A                 J    LSR A
40FD  4A                 J    LSR A
40FE  AA                 .    TAX
40FF  A9 FF              ..   LDA #&FF
.addr4101
4101  95 D2              ..   STA &D2,X
4103  CA                 .    DEX
4104  10 FB              ..   BPL &4101
4106  E8                 .    INX
4107  86 96              ..   STX &96
.addr4109
4109  4C 7F 42           LB  JMP &427F
.addr410C
410C  B1 1E              ..   LDA (&1E),Y
410E  F0 F9              ..   BEQ &4109
4110  85 97              ..   STA &97
4112  A0 12              ..   LDY #&12
4114  B1 1E              ..   LDA (&1E),Y
4116  AA                 .    TAX
4117  A5 79              .y   LDA &79
4119  A8                 .    TAY
411A  F0 0F              ..   BEQ &412B
.addr411C
411C  E8                 .    INX
411D  46 76              Fv   LSR &76
411F  66 75              fu   ROR &75
4121  46 73              Fs   LSR &73
4123  66 72              fr   ROR &72
4125  4A                 J    LSR A
4126  66 78              fx   ROR &78
4128  A8                 .    TAY
4129  D0 F1              ..   BNE &411C
.addr412B
412B  86 86              ..   STX &86
412D  A5 7A              .z   LDA &7A
412F  85 39              .9   STA &39
4131  A5 72              .r   LDA &72
4133  85 34              .4   STA &34
4135  A5 74              .t   LDA &74
4137  85 35              .5   STA &35
4139  A5 75              .u   LDA &75
413B  85 36              .6   STA &36
413D  A5 77              .w   LDA &77
413F  85 37              .7   STA &37
4141  A5 78              .x   LDA &78
4143  85 38              .8   STA &38
4145  20 B8 3F            .?  JSR &3FB8
4148  A5 3A              .:   LDA &3A
414A  85 72              .r   STA &72
414C  A5 3B              .;   LDA &3B
414E  85 74              .t   STA &74
4150  A5 3C              .<   LDA &3C
4152  85 75              .u   STA &75
4154  A5 3D              .=   LDA &3D
4156  85 77              .w   STA &77
4158  A5 3E              .>   LDA &3E
415A  85 78              .x   STA &78
415C  A5 3F              .?   LDA &3F
415E  85 7A              .z   STA &7A
4160  A0 04              ..   LDY #&04
4162  B1 1E              ..   LDA (&1E),Y
4164  18                 .    CLC
4165  65 1E              e.   ADC &1E
4167  85 22              ."   STA &22
4169  A0 11              ..   LDY #&11
416B  B1 1E              ..   LDA (&1E),Y
416D  65 1F              e.   ADC &1F
416F  85 23              .#   STA &23
4171  A0 00              ..   LDY #&00
.addr4173
4173  B1 22              ."   LDA (&22),Y
4175  85 3B              .;   STA &3B
4177  29 1F              ).   AND #&1F
4179  C5 96              ..   CMP &96
417B  B0 0F              ..   BCS &418C
417D  98                 .    TYA
417E  4A                 J    LSR A
417F  4A                 J    LSR A
4180  AA                 .    TAX
4181  A9 FF              ..   LDA #&FF
4183  95 D2              ..   STA &D2,X
4185  98                 .    TYA
4186  69 04              i.   ADC #&04
4188  A8                 .    TAY
4189  4C 78 42           LxB  JMP &4278
.addr418C
418C  A5 3B              .;   LDA &3B
418E  0A                 .    ASL A
418F  85 3D              .=   STA &3D
4191  0A                 .    ASL A
4192  85 3F              .?   STA &3F
4194  C8                 .    INY
4195  B1 22              ."   LDA (&22),Y
4197  85 3A              .:   STA &3A
4199  C8                 .    INY
419A  B1 22              ."   LDA (&22),Y
419C  85 3C              .<   STA &3C
419E  C8                 .    INY
419F  B1 22              ."   LDA (&22),Y
41A1  85 3E              .>   STA &3E
41A3  A6 86              ..   LDX &86
41A5  E0 04              ..   CPX #&04
41A7  90 23              .#   BCC &41CC
41A9  A5 72              .r   LDA &72
41AB  85 34              .4   STA &34
41AD  A5 74              .t   LDA &74
41AF  85 35              .5   STA &35
41B1  A5 75              .u   LDA &75
41B3  85 36              .6   STA &36
41B5  A5 77              .w   LDA &77
41B7  85 37              .7   STA &37
41B9  A5 78              .x   LDA &78
41BB  85 38              .8   STA &38
41BD  A5 7A              .z   LDA &7A
41BF  85 39              .9   STA &39
41C1  4C 2A 42           L*B  JMP &422A
.addr41C4
41C4  46 72              Fr   LSR &72
41C6  46 78              Fx   LSR &78
41C8  46 75              Fu   LSR &75
41CA  A2 01              ..   LDX #&01
.addr41CC
41CC  A5 3A              .:   LDA &3A
41CE  85 34              .4   STA &34
41D0  A5 3C              .<   LDA &3C
41D2  85 36              .6   STA &36
41D4  A5 3E              .>   LDA &3E
41D6  CA                 .    DEX
41D7  30 08              0.   BMI &41E1
.addr41D9
41D9  46 34              F4   LSR &34
41DB  46 36              F6   LSR &36
41DD  4A                 J    LSR A
41DE  CA                 .    DEX
41DF  10 F8              ..   BPL &41D9
.addr41E1
41E1  85 82              ..   STA &82
41E3  A5 3F              .?   LDA &3F
41E5  85 83              ..   STA &83
41E7  A5 78              .x   LDA &78
41E9  85 81              ..   STA &81
41EB  A5 7A              .z   LDA &7A
41ED  20 98 3F            .?  JSR &3F98
41F0  B0 D2              ..   BCS &41C4
41F2  85 38              .8   STA &38
41F4  A5 83              ..   LDA &83
41F6  85 39              .9   STA &39
41F8  A5 34              .4   LDA &34
41FA  85 82              ..   STA &82
41FC  A5 3B              .;   LDA &3B
41FE  85 83              ..   STA &83
4200  A5 72              .r   LDA &72
4202  85 81              ..   STA &81
4204  A5 74              .t   LDA &74
4206  20 98 3F            .?  JSR &3F98
4209  B0 B9              ..   BCS &41C4
420B  85 34              .4   STA &34
420D  A5 83              ..   LDA &83
420F  85 35              .5   STA &35
4211  A5 36              .6   LDA &36
4213  85 82              ..   STA &82
4215  A5 3D              .=   LDA &3D
4217  85 83              ..   STA &83
4219  A5 75              .u   LDA &75
421B  85 81              ..   STA &81
421D  A5 77              .w   LDA &77
421F  20 98 3F            .?  JSR &3F98
4222  B0 A0              ..   BCS &41C4
4224  85 36              .6   STA &36
4226  A5 83              ..   LDA &83
4228  85 37              .7   STA &37
.addr422A
422A  A5 3A              .:   LDA &3A
422C  85 81              ..   STA &81
422E  A5 34              .4   LDA &34
4230  20 FA 21            .!  JSR &21FA
4233  85 D1              ..   STA &D1
4235  A5 3B              .;   LDA &3B
4237  45 35              E5   EOR &35
4239  85 83              ..   STA &83
423B  A5 3C              .<   LDA &3C
423D  85 81              ..   STA &81
423F  A5 36              .6   LDA &36
4241  20 FA 21            .!  JSR &21FA
4244  85 81              ..   STA &81
4246  A5 D1              ..   LDA &D1
4248  85 82              ..   STA &82
424A  A5 3D              .=   LDA &3D
424C  45 37              E7   EOR &37
424E  20 98 3F            .?  JSR &3F98
4251  85 D1              ..   STA &D1
4253  A5 3E              .>   LDA &3E
4255  85 81              ..   STA &81
4257  A5 38              .8   LDA &38
4259  20 FA 21            .!  JSR &21FA
425C  85 81              ..   STA &81
425E  A5 D1              ..   LDA &D1
4260  85 82              ..   STA &82
4262  A5 39              .9   LDA &39
4264  45 3F              E?   EOR &3F
4266  20 98 3F            .?  JSR &3F98
4269  48                 H    PHA
426A  98                 .    TYA
426B  4A                 J    LSR A
426C  4A                 J    LSR A
426D  AA                 .    TAX
426E  68                 h    PLA
426F  24 83              $.   BIT &83
4271  30 02              0.   BMI &4275
4273  A9 00              ..   LDA #&00
.addr4275
4275  95 D2              ..   STA &D2,X
4277  C8                 .    INY
.addr4278
4278  C4 97              ..   CPY &97
427A  B0 03              ..   BCS &427F
427C  4C 73 41           LsA  JMP &4173
.addr427F
427F  A4 0B              ..   LDY &0B
4281  A6 0C              ..   LDX &0C
4283  A5 0F              ..   LDA &0F
4285  85 0B              ..   STA &0B
4287  A5 10              ..   LDA &10
4289  85 0C              ..   STA &0C
428B  84 0F              ..   STY &0F
428D  86 10              ..   STX &10
428F  A4 0D              ..   LDY &0D
4291  A6 0E              ..   LDX &0E
4293  A5 15              ..   LDA &15
4295  85 0D              ..   STA &0D
4297  A5 16              ..   LDA &16
4299  85 0E              ..   STA &0E
429B  84 15              ..   STY &15
429D  86 16              ..   STX &16
429F  A4 13              ..   LDY &13
42A1  A6 14              ..   LDX &14
42A3  A5 17              ..   LDA &17
42A5  85 13              ..   STA &13
42A7  A5 18              ..   LDA &18
42A9  85 14              ..   STA &14
42AB  84 17              ..   STY &17
42AD  86 18              ..   STX &18
42AF  A0 08              ..   LDY #&08
42B1  B1 1E              ..   LDA (&1E),Y
42B3  85 97              ..   STA &97
42B5  A5 1E              ..   LDA &1E
42B7  18                 .    CLC
42B8  69 14              i.   ADC #&14
42BA  85 22              ."   STA &22
42BC  A5 1F              ..   LDA &1F
42BE  69 00              i.   ADC #&00
42C0  85 23              .#   STA &23
42C2  A0 00              ..   LDY #&00
42C4  84 93              ..   STY &93
.addr42C6
42C6  84 86              ..   STY &86
42C8  B1 22              ."   LDA (&22),Y
42CA  85 34              .4   STA &34
42CC  C8                 .    INY
42CD  B1 22              ."   LDA (&22),Y
42CF  85 36              .6   STA &36
42D1  C8                 .    INY
42D2  B1 22              ."   LDA (&22),Y
42D4  85 38              .8   STA &38
42D6  C8                 .    INY
42D7  B1 22              ."   LDA (&22),Y
42D9  85 D1              ..   STA &D1
42DB  29 1F              ).   AND #&1F
42DD  C5 96              ..   CMP &96
42DF  90 2E              ..   BCC &430F
42E1  C8                 .    INY
42E2  B1 22              ."   LDA (&22),Y
42E4  85 1B              ..   STA &1B
42E6  29 0F              ).   AND #&0F
42E8  AA                 .    TAX
42E9  B5 D2              ..   LDA &D2,X
42EB  D0 25              .%   BNE &4312
42ED  A5 1B              ..   LDA &1B
42EF  4A                 J    LSR A
42F0  4A                 J    LSR A
42F1  4A                 J    LSR A
42F2  4A                 J    LSR A
42F3  AA                 .    TAX
42F4  B5 D2              ..   LDA &D2,X
42F6  D0 1A              ..   BNE &4312
42F8  C8                 .    INY
42F9  B1 22              ."   LDA (&22),Y
42FB  85 1B              ..   STA &1B
42FD  29 0F              ).   AND #&0F
42FF  AA                 .    TAX
4300  B5 D2              ..   LDA &D2,X
4302  D0 0E              ..   BNE &4312
4304  A5 1B              ..   LDA &1B
4306  4A                 J    LSR A
4307  4A                 J    LSR A
4308  4A                 J    LSR A
4309  4A                 J    LSR A
430A  AA                 .    TAX
430B  B5 D2              ..   LDA &D2,X
430D  D0 03              ..   BNE &4312
.addr430F
430F  4C 87 44           L.D  JMP &4487
.addr4312
4312  A5 D1              ..   LDA &D1
4314  85 35              .5   STA &35
4316  0A                 .    ASL A
4317  85 37              .7   STA &37
4319  0A                 .    ASL A
431A  85 39              .9   STA &39
431C  20 B8 3F            .?  JSR &3FB8
431F  A5 48              .H   LDA &48
4321  85 36              .6   STA &36
4323  45 3B              E;   EOR &3B
4325  30 10              0.   BMI &4337
4327  18                 .    CLC
4328  A5 3A              .:   LDA &3A
432A  65 46              eF   ADC &46
432C  85 34              .4   STA &34
432E  A5 47              .G   LDA &47
4330  69 00              i.   ADC #&00
4332  85 35              .5   STA &35
4334  4C 5A 43           LZC  JMP &435A
.addr4337
4337  A5 46              .F   LDA &46
4339  38                 8    SEC
433A  E5 3A              .:   SBC &3A
433C  85 34              .4   STA &34
433E  A5 47              .G   LDA &47
4340  E9 00              ..   SBC #&00
4342  85 35              .5   STA &35
4344  B0 14              ..   BCS &435A
4346  49 FF              I.   EOR #&FF
4348  85 35              .5   STA &35
434A  A9 01              ..   LDA #&01
434C  E5 34              .4   SBC &34
434E  85 34              .4   STA &34
4350  90 02              ..   BCC &4354
4352  E6 35              .5   INC &35
.addr4354
4354  A5 36              .6   LDA &36
4356  49 80              I.   EOR #&80
4358  85 36              .6   STA &36
.addr435A
435A  A5 4B              .K   LDA &4B
435C  85 39              .9   STA &39
435E  45 3D              E=   EOR &3D
4360  30 10              0.   BMI &4372
4362  18                 .    CLC
4363  A5 3C              .<   LDA &3C
4365  65 49              eI   ADC &49
4367  85 37              .7   STA &37
4369  A5 4A              .J   LDA &4A
436B  69 00              i.   ADC #&00
436D  85 38              .8   STA &38
436F  4C 97 43           L.C  JMP &4397
.addr4372
4372  A5 49              .I   LDA &49
4374  38                 8    SEC
4375  E5 3C              .<   SBC &3C
4377  85 37              .7   STA &37
4379  A5 4A              .J   LDA &4A
437B  E9 00              ..   SBC #&00
437D  85 38              .8   STA &38
437F  B0 16              ..   BCS &4397
4381  49 FF              I.   EOR #&FF
4383  85 38              .8   STA &38
4385  A5 37              .7   LDA &37
4387  49 FF              I.   EOR #&FF
4389  69 01              i.   ADC #&01
438B  85 37              .7   STA &37
438D  A5 39              .9   LDA &39
438F  49 80              I.   EOR #&80
4391  85 39              .9   STA &39
4393  90 02              ..   BCC &4397
4395  E6 38              .8   INC &38
.addr4397
4397  A5 3F              .?   LDA &3F
4399  30 4A              0J   BMI &43E5
439B  A5 3E              .>   LDA &3E
439D  18                 .    CLC
439E  65 4C              eL   ADC &4C
43A0  85 D1              ..   STA &D1
43A2  A5 4D              .M   LDA &4D
43A4  69 00              i.   ADC #&00
43A6  85 80              ..   STA &80
43A8  4C 04 44           L.D  JMP &4404
.addr43AB
43AB  A6 81              ..   LDX &81
43AD  F0 1C              ..   BEQ &43CB
43AF  A2 00              ..   LDX #&00
.addr43B1
43B1  4A                 J    LSR A
43B2  E8                 .    INX
43B3  C5 81              ..   CMP &81
43B5  B0 FA              ..   BCS &43B1
43B7  86 83              ..   STX &83
43B9  20 75 3F            u?  JSR &3F75
43BC  A6 83              ..   LDX &83
43BE  A5 82              ..   LDA &82
.addr43C0
43C0  0A                 .    ASL A
43C1  26 80              &.   ROL &80
43C3  30 06              0.   BMI &43CB
43C5  CA                 .    DEX
43C6  D0 F8              ..   BNE &43C0
43C8  85 82              ..   STA &82
43CA  60                 `    RTS
.addr43CB
43CB  A9 32              .2   LDA #&32
43CD  85 82              ..   STA &82
43CF  85 80              ..   STA &80
43D1  60                 `    RTS
.addr43D2
43D2  A9 80              ..   LDA #&80
43D4  38                 8    SEC
43D5  E5 82              ..   SBC &82
43D7  9D 00 01           ...  STA &0100,X
43DA  E8                 .    INX
43DB  A9 00              ..   LDA #&00
43DD  E5 80              ..   SBC &80
43DF  9D 00 01           ...  STA &0100,X
43E2  4C 44 44           LDD  JMP &4444
.addr43E5
43E5  A5 4C              .L   LDA &4C
43E7  38                 8    SEC
43E8  E5 3E              .>   SBC &3E
43EA  85 D1              ..   STA &D1
43EC  A5 4D              .M   LDA &4D
43EE  E9 00              ..   SBC #&00
43F0  85 80              ..   STA &80
43F2  90 08              ..   BCC &43FC
43F4  D0 0E              ..   BNE &4404
43F6  A5 D1              ..   LDA &D1
43F8  C9 04              ..   CMP #&04
43FA  B0 08              ..   BCS &4404
.addr43FC
43FC  A9 00              ..   LDA #&00
43FE  85 80              ..   STA &80
4400  A9 04              ..   LDA #&04
4402  85 D1              ..   STA &D1
.addr4404
4404  A5 80              ..   LDA &80
4406  05 35              .5   ORA &35
4408  05 38              .8   ORA &38
440A  F0 0F              ..   BEQ &441B
440C  46 35              F5   LSR &35
440E  66 34              f4   ROR &34
4410  46 38              F8   LSR &38
4412  66 37              f7   ROR &37
4414  46 80              F.   LSR &80
4416  66 D1              f.   ROR &D1
4418  4C 04 44           L.D  JMP &4404
.addr441B
441B  A5 D1              ..   LDA &D1
441D  85 81              ..   STA &81
441F  A5 34              .4   LDA &34
4421  C5 81              ..   CMP &81
4423  90 06              ..   BCC &442B
4425  20 AB 43            .C  JSR &43AB
4428  4C 2E 44           L.D  JMP &442E
.addr442B
442B  20 75 3F            u?  JSR &3F75
.addr442E
442E  A6 93              ..   LDX &93
4430  A5 36              .6   LDA &36
4432  30 9E              0.   BMI &43D2
4434  A5 82              ..   LDA &82
4436  18                 .    CLC
4437  69 80              i.   ADC #&80
4439  9D 00 01           ...  STA &0100,X
443C  E8                 .    INX
443D  A5 80              ..   LDA &80
443F  69 00              i.   ADC #&00
4441  9D 00 01           ...  STA &0100,X
.addr4444
4444  8A                 .    TXA
4445  48                 H    PHA
4446  A9 00              ..   LDA #&00
4448  85 80              ..   STA &80
444A  A5 D1              ..   LDA &D1
444C  85 81              ..   STA &81
444E  A5 37              .7   LDA &37
4450  C5 81              ..   CMP &81
4452  90 19              ..   BCC &446D
4454  20 AB 43            .C  JSR &43AB
4457  4C 70 44           LpD  JMP &4470
.addr445A
445A  A9 60              .`   LDA #&60
445C  18                 .    CLC
445D  65 82              e.   ADC &82
445F  9D 00 01           ...  STA &0100,X
4462  E8                 .    INX
4463  A9 00              ..   LDA #&00
4465  65 80              e.   ADC &80
4467  9D 00 01           ...  STA &0100,X
446A  4C 87 44           L.D  JMP &4487
.addr446D
446D  20 75 3F            u?  JSR &3F75
.addr4470
4470  68                 h    PLA
4471  AA                 .    TAX
4472  E8                 .    INX
4473  A5 39              .9   LDA &39
4475  30 E3              0.   BMI &445A
4477  A9 60              .`   LDA #&60
4479  38                 8    SEC
447A  E5 82              ..   SBC &82
447C  9D 00 01           ...  STA &0100,X
447F  E8                 .    INX
4480  A9 00              ..   LDA #&00
4482  E5 80              ..   SBC &80
4484  9D 00 01           ...  STA &0100,X
.addr4487
4487  18                 .    CLC
4488  A5 93              ..   LDA &93
448A  69 04              i.   ADC #&04
448C  85 93              ..   STA &93
448E  A5 86              ..   LDA &86
4490  69 06              i.   ADC #&06
4492  A8                 .    TAY
4493  B0 07              ..   BCS &449C
4495  C5 97              ..   CMP &97
4497  B0 03              ..   BCS &449C
4499  4C C6 42           L.B  JMP &42C6
.addr449C
449C  A5 65              .e   LDA &65
449E  29 20              )    AND #&20
44A0  F0 09              ..   BEQ &44AB
44A2  A5 65              .e   LDA &65
44A4  09 08              ..   ORA #&08
44A6  85 65              .e   STA &65
44A8  4C 82 32           L.2  JMP &3282
.addr44AB
44AB  A9 08              ..   LDA #&08
44AD  24 65              $e   BIT &65
44AF  F0 05              ..   BEQ &44B6
44B1  20 F3 46            .F  JSR &46F3
44B4  A9 08              ..   LDA #&08
.addr44B6
44B6  05 65              .e   ORA &65
44B8  85 65              .e   STA &65
44BA  A0 09              ..   LDY #&09
44BC  B1 1E              ..   LDA (&1E),Y
44BE  85 97              ..   STA &97
44C0  A0 00              ..   LDY #&00
44C2  84 80              ..   STY &80
44C4  84 86              ..   STY &86
44C6  E6 80              ..   INC &80
44C8  24 65              $e   BIT &65
44CA  50 54              PT   BVC &4520
44CC  A5 65              .e   LDA &65
44CE  29 BF              ).   AND #&BF
44D0  85 65              .e   STA &65
44D2  A0 06              ..   LDY #&06
44D4  B1 1E              ..   LDA (&1E),Y
44D6  A8                 .    TAY
44D7  BE 00 01           ...  LDX &0100,Y
44DA  86 34              .4   STX &34
44DC  E8                 .    INX
44DD  F0 41              .A   BEQ &4520
44DF  BE 01 01           ...  LDX &0101,Y
44E2  86 35              .5   STX &35
44E4  E8                 .    INX
44E5  F0 39              .9   BEQ &4520
44E7  BE 02 01           ...  LDX &0102,Y
44EA  86 36              .6   STX &36
44EC  BE 03 01           ...  LDX &0103,Y
44EF  86 37              .7   STX &37
44F1  A9 00              ..   LDA #&00
44F3  85 38              .8   STA &38
44F5  85 39              .9   STA &39
44F7  85 3B              .;   STA &3B
44F9  A5 4C              .L   LDA &4C
44FB  85 3A              .:   STA &3A
44FD  A5 48              .H   LDA &48
44FF  10 02              ..   BPL &4503
4501  C6 38              .8   DEC &38
.addr4503
4503  20 94 45            .E  JSR &4594
4506  B0 18              ..   BCS &4520
4508  A4 80              ..   LDY &80
450A  A5 34              .4   LDA &34
450C  91 67              .g   STA (&67),Y
450E  C8                 .    INY
450F  A5 35              .5   LDA &35
4511  91 67              .g   STA (&67),Y
4513  C8                 .    INY
4514  A5 36              .6   LDA &36
4516  91 67              .g   STA (&67),Y
4518  C8                 .    INY
4519  A5 37              .7   LDA &37
451B  91 67              .g   STA (&67),Y
451D  C8                 .    INY
451E  84 80              ..   STY &80
.addr4520
4520  A0 03              ..   LDY #&03
4522  18                 .    CLC
4523  B1 1E              ..   LDA (&1E),Y
4525  65 1E              e.   ADC &1E
4527  85 22              ."   STA &22
4529  A0 10              ..   LDY #&10
452B  B1 1E              ..   LDA (&1E),Y
452D  65 1F              e.   ADC &1F
452F  85 23              .#   STA &23
4531  A0 05              ..   LDY #&05
4533  B1 1E              ..   LDA (&1E),Y
4535  85 06              ..   STA &06
4537  A4 86              ..   LDY &86
.addr4539
4539  B1 22              ."   LDA (&22),Y
453B  C5 96              ..   CMP &96
453D  90 18              ..   BCC &4557
453F  C8                 .    INY
4540  B1 22              ."   LDA (&22),Y
4542  C8                 .    INY
4543  85 1B              ..   STA &1B
4545  29 0F              ).   AND #&0F
4547  AA                 .    TAX
4548  B5 D2              ..   LDA &D2,X
454A  D0 0E              ..   BNE &455A
.addr454C
454C  A5 1B              ..   LDA &1B
454E  4A                 J    LSR A
454F  4A                 J    LSR A
4550  4A                 J    LSR A
4551  4A                 J    LSR A
4552  AA                 .    TAX
4553  B5 D2              ..   LDA &D2,X
4555  D0 03              ..   BNE &455A
.addr4557
4557  4C D6 46           L.F  JMP &46D6
.addr455A
455A  B1 22              ."   LDA (&22),Y
455C  AA                 .    TAX
455D  C8                 .    INY
455E  B1 22              ."   LDA (&22),Y
4560  85 81              ..   STA &81
4562  BD 01 01           ...  LDA &0101,X
4565  85 35              .5   STA &35
4567  BD 00 01           ...  LDA &0100,X
456A  85 34              .4   STA &34
456C  BD 02 01           ...  LDA &0102,X
456F  85 36              .6   STA &36
4571  BD 03 01           ...  LDA &0103,X
4574  85 37              .7   STA &37
4576  A6 81              ..   LDX &81
4578  BD 00 01           ...  LDA &0100,X
457B  85 38              .8   STA &38
457D  BD 03 01           ...  LDA &0103,X
4580  85 3B              .;   STA &3B
4582  BD 02 01           ...  LDA &0102,X
4585  85 3A              .:   STA &3A
4587  BD 01 01           ...  LDA &0101,X
458A  85 39              .9   STA &39
458C  20 9A 45            .E  JSR &459A
458F  B0 C6              ..   BCS &4557
4591  4C BA 46           L.F  JMP &46BA
.addr4594
4594  A9 00              ..   LDA #&00
4596  85 90              ..   STA &90
4598  A5 39              .9   LDA &39
.addr459A
459A  A2 BF              ..   LDX #&BF
459C  05 3B              .;   ORA &3B
459E  D0 06              ..   BNE &45A6
45A0  E4 3A              .:   CPX &3A
45A2  90 02              ..   BCC &45A6
45A4  A2 00              ..   LDX #&00
.addr45A6
45A6  86 89              ..   STX &89
45A8  A5 35              .5   LDA &35
45AA  05 37              .7   ORA &37
45AC  D0 1C              ..   BNE &45CA
45AE  A9 BF              ..   LDA #&BF
45B0  C5 36              .6   CMP &36
45B2  90 16              ..   BCC &45CA
45B4  A5 89              ..   LDA &89
45B6  D0 10              ..   BNE &45C8
.addr45B8
45B8  A5 36              .6   LDA &36
45BA  85 35              .5   STA &35
45BC  A5 38              .8   LDA &38
45BE  85 36              .6   STA &36
45C0  A5 3A              .:   LDA &3A
45C2  85 37              .7   STA &37
45C4  18                 .    CLC
45C5  60                 `    RTS
.addr45C6
45C6  38                 8    SEC
45C7  60                 `    RTS
.addr45C8
45C8  46 89              F.   LSR &89
.addr45CA
45CA  A5 89              ..   LDA &89
45CC  10 2F              ./   BPL &45FD
45CE  A5 35              .5   LDA &35
45D0  25 39              %9   AND &39
45D2  30 F2              0.   BMI &45C6
45D4  A5 37              .7   LDA &37
45D6  25 3B              %;   AND &3B
45D8  30 EC              0.   BMI &45C6
45DA  A6 35              .5   LDX &35
45DC  CA                 .    DEX
45DD  8A                 .    TXA
45DE  A6 39              .9   LDX &39
45E0  CA                 .    DEX
45E1  86 3C              .<   STX &3C
45E3  05 3C              .<   ORA &3C
45E5  10 DF              ..   BPL &45C6
45E7  A5 36              .6   LDA &36
45E9  C9 C0              ..   CMP #&C0
45EB  A5 37              .7   LDA &37
45ED  E9 00              ..   SBC #&00
45EF  85 3C              .<   STA &3C
45F1  A5 3A              .:   LDA &3A
45F3  C9 C0              ..   CMP #&C0
45F5  A5 3B              .;   LDA &3B
45F7  E9 00              ..   SBC #&00
45F9  05 3C              .<   ORA &3C
45FB  10 C9              ..   BPL &45C6
.addr45FD
45FD  98                 .    TYA
45FE  48                 H    PHA
45FF  A5 38              .8   LDA &38
4601  38                 8    SEC
4602  E5 34              .4   SBC &34
4604  85 3C              .<   STA &3C
4606  A5 39              .9   LDA &39
4608  E5 35              .5   SBC &35
460A  85 3D              .=   STA &3D
460C  A5 3A              .:   LDA &3A
460E  38                 8    SEC
460F  E5 36              .6   SBC &36
4611  85 3E              .>   STA &3E
4613  A5 3B              .;   LDA &3B
4615  E5 37              .7   SBC &37
4617  85 3F              .?   STA &3F
4619  45 3D              E=   EOR &3D
461B  85 83              ..   STA &83
461D  A5 3F              .?   LDA &3F
461F  10 0D              ..   BPL &462E
4621  A9 00              ..   LDA #&00
4623  38                 8    SEC
4624  E5 3E              .>   SBC &3E
4626  85 3E              .>   STA &3E
4628  A9 00              ..   LDA #&00
462A  E5 3F              .?   SBC &3F
462C  85 3F              .?   STA &3F
.addr462E
462E  A5 3D              .=   LDA &3D
4630  10 0B              ..   BPL &463D
4632  38                 8    SEC
4633  A9 00              ..   LDA #&00
4635  E5 3C              .<   SBC &3C
4637  85 3C              .<   STA &3C
4639  A9 00              ..   LDA #&00
463B  E5 3D              .=   SBC &3D
.addr463D
463D  AA                 .    TAX
463E  D0 04              ..   BNE &4644
4640  A6 3F              .?   LDX &3F
4642  F0 0A              ..   BEQ &464E
.addr4644
4644  4A                 J    LSR A
4645  66 3C              f<   ROR &3C
4647  46 3F              F?   LSR &3F
4649  66 3E              f>   ROR &3E
464B  4C 3D 46           L=F  JMP &463D
.addr464E
464E  86 D1              ..   STX &D1
4650  A5 3C              .<   LDA &3C
4652  C5 3E              .>   CMP &3E
4654  90 0A              ..   BCC &4660
4656  85 81              ..   STA &81
4658  A5 3E              .>   LDA &3E
465A  20 75 3F            u?  JSR &3F75
465D  4C 6B 46           LkF  JMP &466B
.addr4660
4660  A5 3E              .>   LDA &3E
4662  85 81              ..   STA &81
4664  A5 3C              .<   LDA &3C
4666  20 75 3F            u?  JSR &3F75
4669  C6 D1              ..   DEC &D1
.addr466B
466B  A5 82              ..   LDA &82
466D  85 3C              .<   STA &3C
466F  A5 83              ..   LDA &83
4671  85 3D              .=   STA &3D
4673  A5 89              ..   LDA &89
4675  F0 02              ..   BEQ &4679
4677  10 13              ..   BPL &468C
.addr4679
4679  20 1A 47            .G  JSR &471A
467C  A5 89              ..   LDA &89
467E  10 31              .1   BPL &46B1
4680  A5 35              .5   LDA &35
4682  05 37              .7   ORA &37
4684  D0 30              .0   BNE &46B6
4686  A5 36              .6   LDA &36
4688  C9 C0              ..   CMP #&C0
468A  B0 2A              .*   BCS &46B6
.addr468C
468C  A6 34              .4   LDX &34
468E  A5 38              .8   LDA &38
4690  85 34              .4   STA &34
4692  86 38              .8   STX &38
4694  A5 39              .9   LDA &39
4696  A6 35              .5   LDX &35
4698  86 39              .9   STX &39
469A  85 35              .5   STA &35
469C  A6 36              .6   LDX &36
469E  A5 3A              .:   LDA &3A
46A0  85 36              .6   STA &36
46A2  86 3A              .:   STX &3A
46A4  A5 3B              .;   LDA &3B
46A6  A6 37              .7   LDX &37
46A8  86 3B              .;   STX &3B
46AA  85 37              .7   STA &37
46AC  20 1A 47            .G  JSR &471A
46AF  C6 90              ..   DEC &90
.addr46B1
46B1  68                 h    PLA
46B2  A8                 .    TAY
46B3  4C B8 45           L.E  JMP &45B8
.addr46B6
46B6  68                 h    PLA
46B7  A8                 .    TAY
46B8  38                 8    SEC
46B9  60                 `    RTS
.addr46BA
46BA  A4 80              ..   LDY &80
46BC  A5 34              .4   LDA &34
46BE  91 67              .g   STA (&67),Y
46C0  C8                 .    INY
46C1  A5 35              .5   LDA &35
46C3  91 67              .g   STA (&67),Y
46C5  C8                 .    INY
46C6  A5 36              .6   LDA &36
46C8  91 67              .g   STA (&67),Y
46CA  C8                 .    INY
46CB  A5 37              .7   LDA &37
46CD  91 67              .g   STA (&67),Y
46CF  C8                 .    INY
46D0  84 80              ..   STY &80
46D2  C4 06              ..   CPY &06
46D4  B0 17              ..   BCS &46ED
.addr46D6
46D6  E6 86              ..   INC &86
46D8  A4 86              ..   LDY &86
46DA  C4 97              ..   CPY &97
46DC  B0 0F              ..   BCS &46ED
46DE  A0 00              ..   LDY #&00
46E0  A5 22              ."   LDA &22
46E2  69 04              i.   ADC #&04
46E4  85 22              ."   STA &22
46E6  90 02              ..   BCC &46EA
46E8  E6 23              .#   INC &23
.addr46EA
46EA  4C 39 45           L9E  JMP &4539
.addr46ED
46ED  A5 80              ..   LDA &80
.addr46EF
46EF  A0 00              ..   LDY #&00
46F1  91 67              .g   STA (&67),Y
.addr46F3
46F3  A0 00              ..   LDY #&00
46F5  B1 67              .g   LDA (&67),Y
46F7  85 97              ..   STA &97
46F9  C9 04              ..   CMP #&04
46FB  90 1C              ..   BCC &4719
46FD  C8                 .    INY
.addr46FE
46FE  B1 67              .g   LDA (&67),Y
4700  85 34              .4   STA &34
4702  C8                 .    INY
4703  B1 67              .g   LDA (&67),Y
4705  85 35              .5   STA &35
4707  C8                 .    INY
4708  B1 67              .g   LDA (&67),Y
470A  85 36              .6   STA &36
470C  C8                 .    INY
470D  B1 67              .g   LDA (&67),Y
470F  85 37              .7   STA &37
4711  20 6F 17            o.  JSR &176F
4714  C8                 .    INY
4715  C4 97              ..   CPY &97
4717  90 E5              ..   BCC &46FE
.addr4719
4719  60                 `    RTS
.addr471A
471A  A5 35              .5   LDA &35
471C  10 17              ..   BPL &4735
471E  85 83              ..   STA &83
4720  20 94 47            .G  JSR &4794
4723  8A                 .    TXA
4724  18                 .    CLC
4725  65 36              e6   ADC &36
4727  85 36              .6   STA &36
4729  98                 .    TYA
472A  65 37              e7   ADC &37
472C  85 37              .7   STA &37
472E  A9 00              ..   LDA #&00
4730  85 34              .4   STA &34
4732  85 35              .5   STA &35
4734  AA                 .    TAX
.addr4735
4735  F0 19              ..   BEQ &4750
4737  85 83              ..   STA &83
4739  C6 83              ..   DEC &83
473B  20 94 47            .G  JSR &4794
473E  8A                 .    TXA
473F  18                 .    CLC
4740  65 36              e6   ADC &36
4742  85 36              .6   STA &36
4744  98                 .    TYA
4745  65 37              e7   ADC &37
4747  85 37              .7   STA &37
4749  A2 FF              ..   LDX #&FF
474B  86 34              .4   STX &34
474D  E8                 .    INX
474E  86 35              .5   STX &35
.addr4750
4750  A5 37              .7   LDA &37
4752  10 1A              ..   BPL &476E
4754  85 83              ..   STA &83
4756  A5 36              .6   LDA &36
4758  85 82              ..   STA &82
475A  20 C3 47            .G  JSR &47C3
475D  8A                 .    TXA
475E  18                 .    CLC
475F  65 34              e4   ADC &34
4761  85 34              .4   STA &34
4763  98                 .    TYA
4764  65 35              e5   ADC &35
4766  85 35              .5   STA &35
4768  A9 00              ..   LDA #&00
476A  85 36              .6   STA &36
476C  85 37              .7   STA &37
.addr476E
476E  A5 36              .6   LDA &36
4770  38                 8    SEC
4771  E9 C0              ..   SBC #&C0
4773  85 82              ..   STA &82
4775  A5 37              .7   LDA &37
4777  E9 00              ..   SBC #&00
4779  85 83              ..   STA &83
477B  90 16              ..   BCC &4793
477D  20 C3 47            .G  JSR &47C3
4780  8A                 .    TXA
4781  18                 .    CLC
4782  65 34              e4   ADC &34
4784  85 34              .4   STA &34
4786  98                 .    TYA
4787  65 35              e5   ADC &35
4789  85 35              .5   STA &35
478B  A9 BF              ..   LDA #&BF
478D  85 36              .6   STA &36
478F  A9 00              ..   LDA #&00
4791  85 37              .7   STA &37
.addr4793
4793  60                 `    RTS
.addr4794
4794  A5 34              .4   LDA &34
4796  85 82              ..   STA &82
4798  20 FF 47            .G  JSR &47FF
479B  48                 H    PHA
479C  A6 D1              ..   LDX &D1
479E  D0 2B              .+   BNE &47CB
.addr47A0
47A0  A9 00              ..   LDA #&00
47A2  AA                 .    TAX
47A3  A8                 .    TAY
47A4  46 83              F.   LSR &83
47A6  66 82              f.   ROR &82
47A8  06 81              ..   ASL &81
47AA  90 09              ..   BCC &47B5
.addr47AC
47AC  8A                 .    TXA
47AD  18                 .    CLC
47AE  65 82              e.   ADC &82
47B0  AA                 .    TAX
47B1  98                 .    TYA
47B2  65 83              e.   ADC &83
47B4  A8                 .    TAY
.addr47B5
47B5  46 83              F.   LSR &83
47B7  66 82              f.   ROR &82
47B9  06 81              ..   ASL &81
47BB  B0 EF              ..   BCS &47AC
47BD  D0 F6              ..   BNE &47B5
47BF  68                 h    PLA
47C0  10 30              .0   BPL &47F2
47C2  60                 `    RTS
.addr47C3
47C3  20 FF 47            .G  JSR &47FF
47C6  48                 H    PHA
47C7  A6 D1              ..   LDX &D1
47C9  D0 D5              ..   BNE &47A0
.addr47CB
47CB  A9 FF              ..   LDA #&FF
47CD  A8                 .    TAY
47CE  0A                 .    ASL A
47CF  AA                 .    TAX
.addr47D0
47D0  06 82              ..   ASL &82
47D2  26 83              &.   ROL &83
47D4  A5 83              ..   LDA &83
47D6  B0 04              ..   BCS &47DC
47D8  C5 81              ..   CMP &81
47DA  90 0B              ..   BCC &47E7
.addr47DC
47DC  E5 81              ..   SBC &81
47DE  85 83              ..   STA &83
47E0  A5 82              ..   LDA &82
47E2  E9 00              ..   SBC #&00
47E4  85 82              ..   STA &82
47E6  38                 8    SEC
.addr47E7
47E7  8A                 .    TXA
47E8  2A                 *    ROL A
47E9  AA                 .    TAX
47EA  98                 .    TYA
47EB  2A                 *    ROL A
47EC  A8                 .    TAY
47ED  B0 E1              ..   BCS &47D0
47EF  68                 h    PLA
47F0  30 0C              0.   BMI &47FE
.addr47F2
47F2  8A                 .    TXA
47F3  49 FF              I.   EOR #&FF
47F5  69 01              i.   ADC #&01
47F7  AA                 .    TAX
47F8  98                 .    TYA
47F9  49 FF              I.   EOR #&FF
47FB  69 00              i.   ADC #&00
47FD  A8                 .    TAY
.addr47FE
47FE  60                 `    RTS
.addr47FF
47FF  A6 3C              .<   LDX &3C
4801  86 81              ..   STX &81
4803  A5 83              ..   LDA &83
4805  10 11              ..   BPL &4818
4807  A9 00              ..   LDA #&00
4809  38                 8    SEC
480A  E5 82              ..   SBC &82
480C  85 82              ..   STA &82
480E  A5 83              ..   LDA &83
4810  48                 H    PHA
4811  49 FF              I.   EOR #&FF
4813  69 00              i.   ADC #&00
4815  85 83              ..   STA &83
4817  68                 h    PLA
.addr4818
4818  45 3D              E=   EOR &3D
481A  60                 `    RTS
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
.addr484C
484C  63                 c    ...
484D  79 77 13           yw.  ADC &1377,Y
4850  12                 .    ...
4851  1B                 .    ...
4852  8A                 .    TXA
4853  12                 .    ...
.addr4854
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
.addr4956
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
.addr4A25
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
.addr4A76
4A76  04                 .    ...
4A77  02                 .    ...
4A78  14                 .    ...
.addr4A79
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
.addr4AEA
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
.addr4B84
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
55C0  10 15              ..   BPL &55D7
55C2  1A                 .    ...
55C3  1F                 .    ...
55C4  9B                 .    ...
55C5  A0 2E              ..   LDY #&2E
55C7  A5 24              .$   LDA &24
55C9  29 3D              )=   AND #&3D
55CB  33                 3    ...
55CC  38                 8    SEC
55CD  AA                 .    TAX
55CE  42                 B    ...
55CF  47                 G    ...
55D0  4C 51 56           LQV  JMP &5651
.addr55D3
55D3  8C 60 65           .`e  STY &6560
55D6  87                 .    ...
.addr55D7
55D7  82                 .    ...
55D8  5B                 [    ...
55D9  6A                 j    ROR A
55DA  B4 B9              ..   LDY &B9
55DC  BE E1 E6           ...  LDX &E6E1,Y
55DF  EB                 .    ...
55E0  F0 F5              ..   BEQ &55D7
55E2  FA                 .    ...
55E3  73                 s    ...
55E4  78                 x    SEI
55E5  7D 45 4E           }EN  ADC &4E45,X
55E8  44                 D    ...
55E9  2D 45 4E           -EN  AND &4E45
55EC  44                 D    ...
55ED  2D 45 4E           -EN  AND &4E45
55F0  44                 D    ...
55F1  8E 13 1C           ...  STX &1C13
55F4  00                 .    BRK
55F5  00                 .    BRK
55F6  73                 s    ...
55F7  56 52              VR   LSR &52,X
55F9  49 53              IS   EOR #&53
55FB  00                 .    BRK
55FC  8E 13 34           ..4  STX &3413
55FF  B3                 .    ...
5600  00                 .    BRK
5601  7F                     ...
5602  00                 .    BRK
5603  00                 .    BRK
5604  00                 .    BRK
5605  00                 .    BRK
5606  00                 .    BRK
5607  00                 .    BRK
5608  5D 56 00           ]V.  EOR &0056,X
560B  00                 .    BRK
560C  00                 .    BRK
560D  00                 .    BRK
560E  00                 .    BRK
560F  00                 .    BRK
5610  05 57              .W   ORA &57
5612  37                 7    ...
5613  58                 X    CLI
5614  19 5A A1           .Z.  ORA &A15A,Y
5617  5B                 [    ...
5618  00                 .    BRK
5619  00                 .    BRK
561A  00                 .    BRK
561B  00                 .    BRK
561C  00                 .    BRK
561D  00                 .    BRK
561E  93                 .    ...
.addr561F
561F  5C                 \    ...
5620  00                 .    BRK
5621  00                 .    BRK
5622  00                 .    BRK
5623  00                 .    BRK
5624  6D 5D 00           m].  ADC &005D
5627  00                 .    BRK
5628  00                 .    BRK
5629  00                 .    BRK
562A  00                 .    BRK
562B  00                 .    BRK
562C  00                 .    BRK
562D  00                 .    BRK
562E  00                 .    BRK
562F  00                 .    BRK
5630  00                 .    BRK
5631  00                 .    BRK
5632  00                 .    BRK
5633  00                 .    BRK
5634  00                 .    BRK
5635  00                 .    BRK
5636  00                 .    BRK
5637  00                 .    BRK
5638  00                 .    BRK
5639  00                 .    BRK
563A  00                 .    BRK
563B  00                 .    BRK
563C  53                 S    ...
563D  5E 00 00           ^..  LSR &0000,Y
5640  00                 .    BRK
5641  00                 .    BRK
5642  00                 .    BRK
5643  00                 .    BRK
5644  00                 .    BRK
5645  00                 .    BRK
5646  21 61              !a   AND (&61,X)
5648  A0 A0              ..   LDY #&A0
564A  00                 .    BRK
564B  00                 .    BRK
564C  00                 .    BRK
564D  C2                 .    ...
564E  00                 .    BRK
564F  00                 .    BRK
5650  8C 00 00           ...  STY &0000
5653  00                 .    BRK
5654  00                 .    BRK
5655  00                 .    BRK
5656  00                 .    BRK
5657  00                 .    BRK
5658  00                 .    BRK
5659  00                 .    BRK
565A  00                 .    BRK
565B  00                 .    BRK
565C  8C 00 90           ...  STY &9000
565F  01 50              .P   ORA (&50,X)
5661  8C 31 00           .1.  STY &0031
5664  12                 .    ...
5665  3C                 <    ...
5666  0F                 .    ...
5667  00                 .    BRK
5668  00                 .    BRK
5669  1C                 .    ...
566A  0C                 .    ...
566B  11 0F              ..   ORA (&0F),Y
566D  00                 .    BRK
566E  00                 .    BRK
566F  02                 .    ...
5670  00                 .    BRK
5671  18                 .    CLC
5672  10 00              ..   BPL &5674
.addr5674
5674  1F                 .    ...
5675  10 55              .U   BPL &56CC
5677  18                 .    CLC
5678  05 0F              ..   ORA &0F
567A  1F                 .    ...
567B  10 22              ."   BPL &569F
567D  18                 .    CLC
567E  0D 09 5F           .._  ORA &5F09
5681  20 33 18            3.  JSR &1833
5684  0D 09 7F           ..  ORA &7F09
5687  30 44              0D   BMI &56CD
5689  18                 .    CLC
568A  05 0F              ..   ORA &0F
568C  3F                 ?    ...
568D  40                 @    RTI
568E  55 18              U.   EOR &18,X
5690  10 00              ..   BPL &5692
.addr5692
5692  9F                 .    ...
5693  51 66              Qf   EOR (&66),Y
5695  18                 .    CLC
5696  05 0F              ..   ORA &0F
5698  9F                 .    ...
5699  21 66              !f   AND (&66,X)
569B  18                 .    CLC
569C  0D 09 DF           ...  ORA &DF09
.addr569F
569F  32                 2    ...
56A0  66 18              f.   ROR &18
56A2  0D 09 FF           ...  ORA &FF09
56A5  43                 C    ...
56A6  66 18              f.   ROR &18
56A8  05 0F              ..   ORA &0F
56AA  BF                 .    ...
56AB  54                 T    ...
56AC  66 1F              f.   ROR &1F
56AE  10 00              ..   BPL &56B0
.addr56B0
56B0  04                 .    ...
56B1  1F                 .    ...
56B2  20 04 08            ..  JSR &0804
56B5  1F                 .    ...
56B6  30 08              0.   BMI &56C0
56B8  0C                 .    ...
56B9  1F                 .    ...
56BA  40                 @    RTI
56BB  0C                 .    ...
56BC  10 1F              ..   BPL &56DD
56BE  50 00              P.   BVC &56C0
.addr56C0
56C0  10 1F              ..   BPL &56E1
56C2  51 00              Q.   EOR (&00),Y
56C4  14                 .    ...
56C5  1F                 .    ...
56C6  21 04              !.   AND (&04,X)
56C8  18                 .    CLC
56C9  1F                 .    ...
56CA  32                 2    ...
56CB  08                 .    PHP
.addr56CC
56CC  1C                 .    ...
.addr56CD
56CD  1F                 .    ...
56CE  43                 C    ...
56CF  0C                 .    ...
56D0  20 1F 54            .T  JSR &541F
56D3  10 24              .$   BPL &56F9
56D5  1F                 .    ...
56D6  61 14              a.   ADC (&14,X)
56D8  18                 .    CLC
56D9  1F                 .    ...
56DA  62                 b    ...
56DB  18                 .    CLC
56DC  1C                 .    ...
.addr56DD
56DD  1F                 .    ...
56DE  63                 c    ...
56DF  1C                 .    ...
56E0  20 1F 64            .d  JSR &641F
56E3  20 24 1F            $.  JSR &1F24
56E6  65 24              e$   ADC &24
56E8  14                 .    ...
56E9  1F                 .    ...
56EA  60                 `    RTS
56EB  00                 .    BRK
56EC  00                 .    BRK
.addr56ED
56ED  1F                 .    ...
56EE  00                 .    BRK
56EF  29 1E              ).   AND #&1E
56F1  5F                 _    ...
56F2  00                 .    BRK
56F3  12                 .    ...
56F4  30 5F              0_   BMI &5755
56F6  00                 .    BRK
56F7  33                 3    ...
56F8  00                 .    BRK
.addr56F9
56F9  7F                     ...
56FA  00                 .    BRK
56FB  12                 .    ...
56FC  30 3F              0?   BMI &573D
56FE  00                 .    BRK
56FF  29 1E              ).   AND #&1E
5701  9F                 .    ...
5702  60                 `    RTS
5703  00                 .    BRK
5704  00                 .    BRK
5705  0F                 .    ...
5706  C4 09              ..   CPY &09
5708  86 FE              ..   STX &FE
570A  6D 00 26           m.&  ADC &2600
570D  72                 r    ...
570E  1E 00 00           ...  ASL &0000,Y
5711  34                 4    ...
5712  16 20              .    ASL &20,X
5714  08                 .    PHP
5715  00                 .    BRK
5716  00                 .    BRK
5717  02                 .    ...
5718  00                 .    BRK
5719  00                 .    BRK
571A  23                 #    ...
571B  2F                 /    ...
571C  5F                 _    ...
571D  FF                 .    ...
571E  FF                 .    ...
571F  23                 #    ...
5720  00                 .    BRK
5721  2F                 /    ...
5722  9F                 .    ...
5723  FF                 .    ...
5724  FF                 .    ...
5725  00                 .    BRK
5726  23                 #    ...
5727  2F                 /    ...
5728  1F                 .    ...
5729  FF                 .    ...
572A  FF                 .    ...
572B  23                 #    ...
572C  00                 .    BRK
572D  2F                 /    ...
572E  1F                 .    ...
572F  FF                 .    ...
5730  FF                 .    ...
5731  28                 (    PLP
5732  28                 (    PLP
5733  35 FF              5.   AND &FF,X
5735  12                 .    ...
5736  39 28 28           9((  AND &2828,Y
5739  35 BF              5.   AND &BF,X
573B  34                 4    ...
573C  59 28 28           Y((  EOR &2828,Y
573F  35 3F              5?   AND &3F,X
5741  56 79              Vy   LSR &79,X
5743  28                 (    PLP
5744  28                 (    PLP
5745  35 7F              5   AND &7F,X
5747  17                 .    ...
5748  89                 .    ...
5749  0A                 .    ASL A
574A  00                 .    BRK
574B  35 30              50   AND &30,X
574D  99 99 00           ...  STA &0099,Y
5750  05 35              .5   ORA &35
5752  70 99              p.   BVS &56ED
5754  99 0A 00           ...  STA &000A,Y
5757  35 A8              5.   AND &A8,X
5759  99 99 00           ...  STA &0099,Y
575C  05 35              .5   ORA &35
575E  28                 (    PLP
575F  99 99 00           ...  STA &0099,Y
5762  11 47              .G   ORA (&47),Y
5764  50 0A              P.   BVC &5770
5766  BC 05 02           ...  LDY &0205,X
5769  3D 46 FF           =F.  AND &FF46,X
576C  02                 .    ...
576D  07                 .    ...
576E  17                 .    ...
576F  31 07              1.   AND (&07),Y
5771  01 F4              ..   ORA (&F4,X)
5773  15 09              ..   ORA &09,X
5775  31 07              1.   AND (&07),Y
5777  A1 3F              .?   LDA (&3F,X)
5779  05 02              ..   ORA &02
577B  3D C6 6B           =.k  AND &6BC6,X
577E  23                 #    ...
577F  07                 .    ...
5780  17                 .    ...
5781  31 87              1.   AND (&87),Y
5783  F8                 .    SED
5784  C0 15              ..   CPY #&15
5786  09 31              .1   ORA #&31
5788  87                 .    ...
5789  4F                 O    ...
578A  18                 .    CLC
578B  1F                 .    ...
578C  02                 .    ...
578D  00                 .    BRK
578E  04                 .    ...
578F  1F                 .    ...
5790  4A                 J    LSR A
5791  04                 .    ...
5792  08                 .    PHP
5793  1F                 .    ...
5794  6B                 k    ...
5795  08                 .    PHP
5796  0C                 .    ...
5797  1F                 .    ...
5798  8C 00 0C           ...  STY &0C00
579B  1F                 .    ...
579C  18                 .    CLC
579D  00                 .    BRK
579E  1C                 .    ...
579F  18                 .    CLC
57A0  12                 .    ...
57A1  00                 .    BRK
57A2  10 1F              ..   BPL &57C3
57A4  23                 #    ...
57A5  04                 .    ...
57A6  10 18              ..   BPL &57C0
57A8  34                 4    ...
57A9  04                 .    ...
57AA  14                 .    ...
57AB  1F                 .    ...
57AC  45 08              E.   EOR &08
57AE  14                 .    ...
57AF  0C                 .    ...
57B0  56 08              V.   LSR &08,X
57B2  18                 .    CLC
57B3  1F                 .    ...
57B4  67                 g    ...
57B5  0C                 .    ...
57B6  18                 .    CLC
57B7  18                 .    CLC
57B8  78                 x    SEI
57B9  0C                 .    ...
57BA  1C                 .    ...
57BB  1F                 .    ...
57BC  39 10 14           9..  AND &1410,Y
57BF  1F                 .    ...
.addr57C0
57C0  59 14 18           Y..  EOR &1814,Y
.addr57C3
57C3  1F                 .    ...
57C4  79 18 1C           y..  ADC &1C18,Y
57C7  1F                 .    ...
57C8  19 10 1C           ...  ORA &1C10,Y
57CB  10 0C              ..   BPL &57D9
57CD  00                 .    BRK
57CE  30 10              0.   BMI &57E0
57D0  0A                 .    ASL A
57D1  04                 .    ...
57D2  30 10              0.   BMI &57E4
57D4  AB                 .    ...
57D5  08                 .    PHP
57D6  30 10              0.   BMI &57E8
57D8  BC 0C 30           ..0  LDY &300C,X
57DB  10 99              ..   BPL &5776
57DD  20 24 06            $.  JSR &0624
.addr57E0
57E0  99 24 28           .$(  STA &2824,Y
57E3  08                 .    PHP
.addr57E4
57E4  99 28 2C           .(,  STA &2C28,Y
57E7  06 99              ..   ASL &99
57E9  20 2C 04            ,.  JSR &042C
57EC  BB                 .    ...
57ED  34                 4    ...
57EE  38                 8    SEC
57EF  07                 .    ...
57F0  BB                 .    ...
57F1  38                 8    SEC
57F2  3C                 <    ...
57F3  06 BB              ..   ASL &BB
57F5  34                 4    ...
57F6  3C                 <    ...
57F7  04                 .    ...
57F8  AA                 .    TAX
57F9  40                 @    RTI
57FA  44                 D    ...
57FB  07                 .    ...
57FC  AA                 .    TAX
57FD  44                 D    ...
57FE  48                 H    PHA
57FF  06 AA              ..   ASL &AA
5801  40                 @    RTI
5802  48                 H    PHA
5803  DF                 .    ...
5804  6E 6E 50           nnP  ROR &506E
5807  5F                 _    ...
5808  00                 .    BRK
5809  95 07              ..   STA &07,X
580B  DF                 .    ...
580C  66 66              ff   ROR &66
580E  2E 9F 95           ...  ROL &959F
5811  00                 .    BRK
5812  07                 .    ...
5813  9F                 .    ...
5814  66 66              ff   ROR &66
5816  2E 1F 00           ...  ROL &001F
5819  95 07              ..   STA &07,X
581B  1F                 .    ...
581C  66 66              ff   ROR &66
581E  2E 1F 95           ...  ROL &951F
5821  00                 .    BRK
5822  07                 .    ...
5823  5F                 _    ...
5824  66 66              ff   ROR &66
5826  2E 3F 00           .?.  ROL &003F
5829  00                 .    BRK
582A  D5 9F              ..   CMP &9F,X
582C  51 51              QQ   EOR (&51),Y
582E  B1 1F              ..   LDA (&1F),Y
5830  51 51              QQ   EOR (&51),Y
5832  B1 5F              ._   LDA (&5F),Y
5834  6E 6E 50           nnP  ROR &506E
5837  00                 .    BRK
5838  C4 09              ..   CPY &09
583A  F2                 .    ...
583B  AA                 .    TAX
583C  91 30              .0   STA (&30),Y
583E  1A                 .    ...
583F  DE 2E 00           ...  DEC &002E,X
5842  00                 .    BRK
5843  38                 8    SEC
5844  10 20              .    BPL &5866
5846  0A                 .    ASL A
5847  00                 .    BRK
5848  01 01              ..   ORA (&01,X)
584A  00                 .    BRK
584B  00                 .    BRK
584C  13                 .    ...
584D  33                 3    ...
584E  3F                 ?    ...
584F  06 77              .w   ASL &77
5851  33                 3    ...
5852  07                 .    ...
5853  33                 3    ...
5854  BF                 .    ...
5855  01 77              .w   ORA (&77,X)
5857  39 07 33           9.3  AND &3307,Y
585A  FF                 .    ...
585B  01 22              ."   ORA (&22,X)
585D  33                 3    ...
585E  11 33              .3   ORA (&33),Y
5860  FF                 .    ...
5861  02                 .    ...
5862  33                 3    ...
5863  33                 3    ...
5864  11 33              .3   ORA (&33),Y
.addr5866
5866  7F                     ...
5867  03                 .    ...
5868  44                 D    ...
5869  39 07 33           9.3  AND &3307,Y
586C  7F                     ...
586D  04                 .    ...
586E  55 33              U3   EOR &33,X
5870  07                 .    ...
5871  33                 3    ...
5872  3F                 ?    ...
5873  05 66              .f   ORA &66
5875  00                 .    BRK
5876  0C                 .    ...
5877  18                 .    CLC
5878  12                 .    ...
5879  FF                 .    ...
587A  FF                 .    ...
587B  3C                 <    ...
587C  02                 .    ...
587D  18                 .    CLC
587E  DF                 .    ...
587F  17                 .    ...
5880  89                 .    ...
5881  42                 B    ...
5882  11 18              ..   ORA (&18),Y
5884  DF                 .    ...
5885  12                 .    ...
5886  39 42 11           9B.  AND &1142,Y
5889  18                 .    CLC
588A  5F                 _    ...
588B  34                 4    ...
588C  5A                 Z    ...
588D  3C                 <    ...
588E  02                 .    ...
588F  18                 .    CLC
5890  5F                 _    ...
5891  56 AB              V.   LSR &AB,X
5893  16 05              ..   ASL &05,X
5895  3D DF 89           =..  AND &89DF,X
5898  CD 1B 11           ...  CMP &111B
589B  3D DF 39           =.9  AND &39DF,X
589E  DD 1B 11           ...  CMP &111B,X
58A1  3D 5F 3A           =_:  AND &3A5F,X
58A4  DD 16 05           ...  CMP &0516,X
58A7  3D 5F AB           =_.  AND &AB5F,X
58AA  CD 0A 0B           ...  CMP &0B0A
58AD  05 86              ..   ORA &86
58AF  77                 w    ...
58B0  77                 w    ...
58B1  24 05              $.   BIT &05
58B3  05 86              ..   ORA &86
58B5  77                 w    ...
58B6  77                 w    ...
58B7  0A                 .    ASL A
58B8  0D 0E A6           ...  ORA &A60E
58BB  77                 w    ...
58BC  77                 w    ...
58BD  24 07              $.   BIT &07
58BF  0E A6 77           ..w  ASL &77A6
58C2  77                 w    ...
58C3  17                 .    ...
58C4  0C                 .    ...
58C5  1D A6 77           ..w  ORA &77A6,X
58C8  77                 w    ...
58C9  17                 .    ...
58CA  0A                 .    ASL A
58CB  0E A6 77           ..w  ASL &77A6
58CE  77                 w    ...
58CF  0A                 .    ASL A
58D0  0F                 .    ...
58D1  1D 26 66           .&f  ORA &6626,X
58D4  66 24              f$   ROR &24
58D6  09 1D              ..   ORA #&1D
58D8  26 66              &f   ROL &66
58DA  66 17              f.   ROR &17
58DC  0A                 .    ASL A
58DD  0E 26 66           .&f  ASL &6626
58E0  66 0A              f.   ROR &0A
58E2  0C                 .    ...
58E3  06 26              .&   ASL &26
58E5  66 66              ff   ROR &66
58E7  24 06              $.   BIT &06
58E9  06 26              .&   ASL &26
58EB  66 66              ff   ROR &66
58ED  17                 .    ...
58EE  07                 .    ...
58EF  10 06              ..   BPL &58F7
58F1  66 66              ff   ROR &66
58F3  17                 .    ...
58F4  09 06              ..   ORA #&06
58F6  26 66              &f   ROL &66
58F8  66 21              f!   ROR &21
58FA  11 1A              ..   ORA (&1A),Y
58FC  E5 33              .3   SBC &33
58FE  33                 3    ...
58FF  21 11              !.   AND (&11,X)
5901  21 C5              !.   AND (&C5,X)
5903  33                 3    ...
.addr5904
5904  33                 3    ...
5905  21 11              !.   AND (&11,X)
5907  1A                 .    ...
5908  65 33              e3   ADC &33
590A  33                 3    ...
590B  21 11              !.   AND (&11,X)
590D  21 45              !E   AND (&45,X)
590F  33                 3    ...
5910  33                 3    ...
5911  19 06 33           ..3  ORA &3306,Y
5914  E7                 .    ...
5915  00                 .    BRK
5916  00                 .    BRK
5917  1A                 .    ...
5918  06 33              .3   ASL &33
591A  67                 g    ...
591B  00                 .    BRK
591C  00                 .    BRK
591D  11 06              ..   ORA (&06),Y
591F  33                 3    ...
5920  24 00              $.   BIT &00
5922  00                 .    BRK
5923  11 06              ..   ORA (&06),Y
5925  33                 3    ...
5926  A4 00              ..   LDY &00
5928  00                 .    BRK
5929  1F                 .    ...
592A  07                 .    ...
592B  00                 .    BRK
592C  04                 .    ...
592D  1F                 .    ...
592E  01 04              ..   ORA (&04,X)
5930  08                 .    PHP
5931  1F                 .    ...
.addr5932
5932  02                 .    ...
5933  08                 .    PHP
5934  0C                 .    ...
5935  1F                 .    ...
5936  03                 .    ...
5937  0C                 .    ...
5938  10 1F              ..   BPL &5959
593A  04                 .    ...
593B  10 14              ..   BPL &5951
593D  1F                 .    ...
593E  05 14              ..   ORA &14
5940  18                 .    CLC
5941  1F                 .    ...
5942  06 00              ..   ASL &00
5944  18                 .    CLC
5945  0F                 .    ...
5946  67                 g    ...
5947  00                 .    BRK
5948  1C                 .    ...
5949  1F                 .    ...
594A  17                 .    ...
594B  04                 .    ...
594C  20 0A 12            ..  JSR &120A
594F  08                 .    PHP
5950  24 1F              $.   BIT &1F
5952  23                 #    ...
5953  0C                 .    ...
5954  24 1F              $.   BIT &1F
5956  34                 4    ...
5957  10 28              .(   BPL &5981
.addr5959
5959  0A                 .    ASL A
595A  45 14              E.   EOR &14
595C  28                 (    PLP
595D  1F                 .    ...
595E  56 18              V.   LSR &18,X
5960  2C 10 78           ,.x  BIT &7810
5963  1C                 .    ...
5964  20 10 19            ..  JSR &1910
5967  20 24 10            $.  JSR &1024
596A  5A                 Z    ...
596B  28                 (    PLP
596C  2C 10 6B           ,.k  BIT &6B10
596F  1C                 .    ...
5970  2C 12 BC           ,..  BIT &BC12
5973  1C                 .    ...
5974  3C                 <    ...
5975  12                 .    ...
5976  8C 1C 30           ..0  STY &301C
5979  10 89              ..   BPL &5904
597B  20 30 1F            0.  JSR &1F30
597E  39 24 34           9$4  AND &3424,Y
.addr5981
5981  1F                 .    ...
5982  3A                 :    ...
5983  28                 (    PLP
5984  38                 8    SEC
5985  10 AB              ..   BPL &5932
5987  2C 3C 1F           ,<.  BIT &1F3C
598A  9D 30 34           .04  STA &3430,X
598D  1F                 .    ...
598E  3D 34 38           =48  AND &3834,X
5991  1F                 .    ...
5992  AD 38 3C           .8<  LDA &3C38
5995  1F                 .    ...
5996  CD 30 3C           .0<  CMP &3C30
5999  06 77              .w   ASL &77
599B  40                 @    RTI
599C  44                 D    ...
599D  06 77              .w   ASL &77
599F  48                 H    PHA
59A0  4C 06 77           L.w  JMP &7706
59A3  4C 50 06           LP.  JMP &0650
59A6  77                 w    ...
59A7  48                 H    PHA
59A8  50 06              P.   BVC &59B0
59AA  77                 w    ...
59AB  50 54              PT   BVC &5A01
59AD  06 66              .f   ASL &66
59AF  58                 X    CLI
.addr59B0
59B0  5C                 \    ...
59B1  06 66              .f   ASL &66
59B3  5C                 \    ...
59B4  60                 `    RTS
59B5  06 66              .f   ASL &66
59B7  60                 `    RTS
59B8  58                 X    CLI
59B9  06 66              .f   ASL &66
59BB  64                 d    ...
59BC  68                 h    PLA
59BD  06 66              .f   ASL &66
59BF  68                 h    PLA
59C0  6C 06 66           l.f  JMP (&6606)
59C3  64                 d    ...
59C4  6C 06 66           l.f  JMP (&6606)
59C7  6C 70 05           lp.  JMP (&0570)
59CA  33                 3    ...
59CB  74                 t    ...
59CC  78                 x    SEI
59CD  05 33              .3   ORA &33
59CF  7C                 |    ...
59D0  80                 .    ...
59D1  07                 .    ...
59D2  00                 .    BRK
59D3  84 88              ..   STY &88
59D5  04                 .    ...
59D6  00                 .    BRK
59D7  88                 .    DEY
59D8  8C 04 00           ...  STY &0004
59DB  8C 90 04           ...  STY &0490
59DE  00                 .    BRK
59DF  90 84              ..   BCC &5965
59E1  3F                 ?    ...
59E2  00                 .    BRK
59E3  00                 .    BRK
59E4  67                 g    ...
59E5  BF                 .    ...
59E6  6F                 o    ...
59E7  30 07              0.   BMI &59F0
59E9  FF                 .    ...
59EA  69 3F              i?   ADC #&3F
59EC  15 5F              ._   ORA &5F,X
59EE  00                 .    BRK
59EF  22                 "    ...
.addr59F0
59F0  00                 .    BRK
59F1  7F                     ...
59F2  69 3F              i?   ADC #&3F
59F4  15 3F              .?   ORA &3F,X
59F6  6F                 o    ...
59F7  30 07              0.   BMI &5A00
59F9  1F                 .    ...
59FA  08                 .    PHP
59FB  20 03 9F            ..  JSR &9F03
59FE  08                 .    PHP
59FF  20 03 92            ..  JSR &9203
5A02  08                 .    PHP
5A03  22                 "    ...
5A04  0B                 .    ...
5A05  9F                 .    ...
5A06  4B                 K    ...
5A07  20 4F 1F            O.  JSR &1F4F
5A0A  4B                 K    ...
5A0B  20 4F 12            O.  JSR &124F
5A0E  08                 .    PHP
5A0F  22                 "    ...
5A10  0B                 .    ...
5A11  1F                 .    ...
5A12  00                 .    BRK
5A13  26 11              &.   ROL &11
5A15  1F                 .    ...
5A16  00                 .    BRK
5A17  00                 .    BRK
5A18  79 03 41           y.A  ADC &4103,Y
5A1B  23                 #    ...
5A1C  BC 54 99           .T.  LDY &9954,X
5A1F  54                 T    ...
5A20  2A                 *    ROL A
5A21  A8                 .    TAY
5A22  26 00              &.   ROL &00
5A24  00                 .    BRK
5A25  34                 4    ...
5A26  32                 2    ...
5A27  96 1C              ..   STX &1C,Y
5A29  00                 .    BRK
5A2A  01 01              ..   ORA (&01,X)
5A2C  13                 .    ...
5A2D  20 00 4C            .L  JSR &4C00
5A30  1F                 .    ...
5A31  FF                 .    ...
5A32  FF                 .    ...
5A33  20 00 4C            .L  JSR &4C00
5A36  9F                 .    ...
5A37  FF                 .    ...
5A38  FF                 .    ...
5A39  00                 .    BRK
5A3A  1A                 .    ...
5A3B  18                 .    CLC
5A3C  1F                 .    ...
5A3D  FF                 .    ...
5A3E  FF                 .    ...
5A3F  78                 x    SEI
5A40  03                 .    ...
5A41  08                 .    PHP
5A42  FF                 .    ...
5A43  73                 s    ...
5A44  AA                 .    TAX
5A45  78                 x    SEI
5A46  03                 .    ...
5A47  08                 .    PHP
5A48  7F                     ...
5A49  84 CC              ..   STY &CC
5A4B  58                 X    CLI
5A4C  10 28              .(   BPL &5A76
5A4E  BF                 .    ...
5A4F  FF                 .    ...
5A50  FF                 .    ...
5A51  58                 X    CLI
5A52  10 28              .(   BPL &5A7C
5A54  3F                 ?    ...
5A55  FF                 .    ...
5A56  FF                 .    ...
5A57  80                 .    ...
5A58  08                 .    PHP
5A59  28                 (    PLP
5A5A  7F                     ...
5A5B  98                 .    TYA
5A5C  CC 80 08           ...  CPY &0880
5A5F  28                 (    PLP
5A60  FF                 .    ...
5A61  97                 .    ...
5A62  AA                 .    TAX
5A63  00                 .    BRK
5A64  1A                 .    ...
5A65  28                 (    PLP
5A66  3F                 ?    ...
5A67  65 99              e.   ADC &99
5A69  20 18 28            .(  JSR &2818
.addr5A6C
5A6C  FF                 .    ...
5A6D  A9 BB              ..   LDA #&BB
5A6F  20 18 28            .(  JSR &2818
5A72  7F                     ...
5A73  B9 CC 24           ..$  LDA &24CC,Y
.addr5A76
5A76  08                 .    PHP
.addr5A77
5A77  28                 (    PLP
5A78  B4 99              ..   LDY &99
5A7A  99 08 0C           ...  STA &0C08,Y
5A7D  28                 (    PLP
5A7E  B4 99              ..   LDY &99
5A80  99 08 0C           ...  STA &0C08,Y
5A83  28                 (    PLP
5A84  34                 4    ...
5A85  99 99 24           ..$  STA &2499,Y
5A88  08                 .    PHP
5A89  28                 (    PLP
5A8A  34                 4    ...
5A8B  99 99 24           ..$  STA &2499,Y
5A8E  0C                 .    ...
5A8F  28                 (    PLP
5A90  74                 t    ...
5A91  99 99 08           ...  STA &0899,Y
5A94  10 28              .(   BPL &5ABE
5A96  74                 t    ...
5A97  99 99 08           ...  STA &0899,Y
5A9A  10 28              .(   BPL &5AC4
5A9C  F4                 .    ...
5A9D  99 99 24           ..$  STA &2499,Y
5AA0  0C                 .    ...
5AA1  28                 (    PLP
5AA2  F4                 .    ...
5AA3  99 99 00           ...  STA &0099,Y
5AA6  00                 .    BRK
5AA7  4C 06 B0           L..  JMP &B006
5AAA  BB                 .    ...
5AAB  00                 .    BRK
5AAC  00                 .    BRK
5AAD  5A                 Z    ...
5AAE  1F                 .    ...
5AAF  B0 BB              ..   BCS &5A6C
5AB1  50 06              P.   BVC &5AB9
5AB3  28                 (    PLP
5AB4  E8                 .    INX
5AB5  99 99 50           ..P  STA &5099,Y
5AB8  06 28              .(   ASL &28
5ABA  A8                 .    TAY
5ABB  99 99 58           ..X  STA &5899,Y
.addr5ABE
5ABE  00                 .    BRK
5ABF  28                 (    PLP
5AC0  A6 99              ..   LDX &99
5AC2  99 50 06           .P.  STA &0650,Y
5AC5  28                 (    PLP
5AC6  28                 (    PLP
5AC7  99 99 58           ..X  STA &5899,Y
5ACA  00                 .    BRK
5ACB  28                 (    PLP
5ACC  26 99              &.   ROL &99
5ACE  99 50 06           .P.  STA &0650,Y
5AD1  28                 (    PLP
5AD2  68                 h    PLA
5AD3  99 99 1F           ...  STA &1F99,Y
5AD6  B0 00              ..   BCS &5AD8
.addr5AD8
5AD8  04                 .    ...
5AD9  1F                 .    ...
5ADA  C4 00              ..   CPY &00
5ADC  10 1F              ..   BPL &5AFD
5ADE  A3                 .    ...
5ADF  04                 .    ...
5AE0  0C                 .    ...
5AE1  1F                 .    ...
5AE2  A7                 .    ...
5AE3  0C                 .    ...
5AE4  20 1F C8            ..  JSR &C81F
5AE7  10 1C              ..   BPL &5B05
5AE9  1F                 .    ...
5AEA  98                 .    TYA
5AEB  18                 .    CLC
5AEC  1C                 .    ...
5AED  1F                 .    ...
5AEE  96 18              ..   STX &18,Y
5AF0  24 1F              $.   BIT &1F
5AF2  95 14              ..   STA &14,X
5AF4  24 1F              $.   BIT &1F
5AF6  97                 .    ...
5AF7  14                 .    ...
5AF8  20 1F 51            .Q  JSR &511F
5AFB  08                 .    PHP
5AFC  14                 .    ...
.addr5AFD
5AFD  1F                 .    ...
5AFE  62                 b    ...
5AFF  08                 .    PHP
5B00  18                 .    CLC
5B01  1F                 .    ...
5B02  73                 s    ...
5B03  0C                 .    ...
5B04  14                 .    ...
.addr5B05
5B05  1F                 .    ...
5B06  84 10              ..   STY &10
5B08  18                 .    CLC
5B09  1F                 .    ...
5B0A  10 04              ..   BPL &5B10
5B0C  08                 .    PHP
5B0D  1F                 .    ...
5B0E  20 00 08            ..  JSR &0800
5B11  1F                 .    ...
5B12  A9 20              .    LDA #&20
5B14  28                 (    PLP
5B15  1F                 .    ...
5B16  B9 28 2C           .(,  LDA &2C28,Y
.addr5B19
5B19  1F                 .    ...
5B1A  C9 1C              ..   CMP #&1C
5B1C  2C 1F BA           ,..  BIT &BA1F
5B1F  04                 .    ...
5B20  28                 (    PLP
5B21  1F                 .    ...
5B22  CB                 .    ...
5B23  00                 .    BRK
5B24  2C 1D 31           ,.1  BIT &311D
5B27  04                 .    ...
5B28  14                 .    ...
5B29  1D 42 00           .B.  ORA &0042,X
5B2C  18                 .    CLC
5B2D  06 B0              ..   ASL &B0
5B2F  50 54              PT   BVC &5B85
5B31  14                 .    ...
5B32  99 30 34           .04  STA &3430,Y
5B35  14                 .    ...
5B36  99 48 4C           .HL  STA &4C48,Y
5B39  14                 .    ...
5B3A  99 38 3C           .8<  STA &3C38,Y
5B3D  14                 .    ...
5B3E  99 40 44           .@D  STA &4440,Y
5B41  13                 .    ...
5B42  99 3C 40           .<@  STA &403C,Y
5B45  11 99              ..   ORA (&99),Y
5B47  38                 8    SEC
5B48  44                 D    ...
5B49  13                 .    ...
5B4A  99 34 48           .4H  STA &4834,Y
5B4D  13                 .    ...
5B4E  99 30 4C           .0L  STA &4C30,Y
5B51  1E 65 08           .e.  ASL &0865,Y
5B54  24 06              $.   BIT &06
5B56  99 58 60           .X`  STA &6058,Y
5B59  06 99              ..   ASL &99
5B5B  5C                 \    ...
5B5C  60                 `    RTS
5B5D  08                 .    PHP
5B5E  99 58 5C           .X\  STA &5C58,Y
5B61  06 99              ..   ASL &99
5B63  64                 d    ...
5B64  68                 h    PLA
5B65  06 99              ..   ASL &99
5B67  68                 h    PLA
5B68  6C 08 99           l..  JMP (&9908)
5B6B  64                 d    ...
5B6C  6C 1F 00           l..  JMP (&001F)
5B6F  3E 1F 9F           >..  ROL &9F1F,X
5B72  12                 .    ...
5B73  37                 7    ...
5B74  10 1F              ..   BPL &5B95
5B76  12                 .    ...
5B77  37                 7    ...
5B78  10 9F              ..   BPL &5B19
5B7A  10 34              .4   BPL &5BB0
5B7C  0E 1F 10           ...  ASL &101F
5B7F  34                 4    ...
5B80  0E 9F 0E           ...  ASL &0E9F
5B83  2F                 /    ...
5B84  00                 .    BRK
.addr5B85
5B85  1F                 .    ...
5B86  0E 2F 00           ./.  ASL &002F
5B89  9F                 .    ...
.addr5B8A
5B8A  3D 66 00           =f.  AND &0066,X
5B8D  1F                 .    ...
5B8E  3D 66 00           =f.  AND &0066,X
5B91  3F                 ?    ...
5B92  00                 .    BRK
5B93  00                 .    BRK
5B94  50 DF              P.   BVC &5B75
5B96  07                 .    ...
5B97  2A                 *    ROL A
5B98  09 5F              ._   ORA #&5F
5B9A  00                 .    BRK
5B9B  1E 06 5F           .._  ASL &5F06,Y
5B9E  07                 .    ...
5B9F  2A                 *    ROL A
5BA0  09 05              ..   ORA #&05
5BA2  00                 .    BRK
5BA3  19 56 BE           .V.  ORA &BE56,Y
5BA6  55 00              U.   EOR &00,X
5BA8  2A                 *    ROL A
5BA9  42                 B    ...
5BAA  1A                 .    ...
5BAB  00                 .    BRK
5BAC  00                 .    BRK
5BAD  34                 4    ...
5BAE  28                 (    PLP
5BAF  FA                 .    ...
.addr5BB0
5BB0  14                 .    ...
5BB1  00                 .    BRK
5BB2  00                 .    BRK
5BB3  00                 .    BRK
5BB4  1B                 .    ...
5BB5  00                 .    BRK
5BB6  00                 .    BRK
5BB7  E0 1F              ..   CPX #&1F
5BB9  10 32              .2   BPL &5BED
5BBB  00                 .    BRK
5BBC  30 30              00   BMI &5BEE
5BBE  1E 10 54           ..T  ASL &5410,Y
5BC1  60                 `    RTS
5BC2  00                 .    BRK
5BC3  10 3F              .?   BPL &5C04
5BC5  FF                 .    ...
5BC6  FF                 .    ...
5BC7  60                 `    RTS
5BC8  00                 .    BRK
5BC9  10 BF              ..   BPL &5B8A
5BCB  FF                 .    ...
5BCC  FF                 .    ...
5BCD  00                 .    BRK
5BCE  30 20              0    BMI &5BF0
5BD0  3E 54 98           >T.  ROL &9854,X
5BD3  00                 .    BRK
5BD4  18                 .    CLC
5BD5  70 3F              p?   BVS &5C16
5BD7  89                 .    ...
5BD8  CC 30 00           .0.  CPY &0030
5BDB  70 BF              p.   BVS &5B9C
5BDD  B8                 .    CLV
5BDE  CC 30 00           .0.  CPY &0030
5BE1  70 3F              p?   BVS &5C22
5BE3  A9 CC              ..   LDA #&CC
5BE5  00                 .    BRK
5BE6  30 30              00   BMI &5C18
5BE8  5E 32 76           ^2v  LSR &7632,Y
5BEB  00                 .    BRK
5BEC  30 20              0    BMI &5C0E
.addr5BEE
5BEE  7E 76 BA           ~v.  ROR &BA76,X
5BF1  00                 .    BRK
5BF2  18                 .    CLC
5BF3  70 7E              p~   BVS &5C73
5BF5  BA                 .    TSX
5BF6  CC 1E 32           ..2  CPY &321E
5BF9  00                 .    BRK
5BFA  20 1F 20            .   JSR &201F
5BFD  00                 .    BRK
5BFE  0C                 .    ...
5BFF  1F                 .    ...
5C00  31 00              1.   AND (&00),Y
5C02  08                 .    PHP
5C03  1E 10 00           ...  ASL &0010,Y
5C06  04                 .    ...
5C07  1D 59 08           .Y.  ORA &0859,X
5C0A  10 1D              ..   BPL &5C29
5C0C  51 04              Q.   EOR (&04),Y
.addr5C0E
5C0E  08                 .    PHP
5C0F  1D 37 08           .7.  ORA &0837,X
5C12  20 1D 40            .@  JSR &401D
5C15  04                 .    ...
.addr5C16
5C16  0C                 .    ...
5C17  1D 62 0C           .b.  ORA &0C62,X
5C1A  20 1D A7            ..  JSR &A71D
5C1D  08                 .    PHP
5C1E  24 1D              $.   BIT &1D
5C20  84 0C              ..   STY &0C
.addr5C22
5C22  10 1D              ..   BPL &5C41
5C24  B6 0C              ..   LDX &0C,Y
5C26  24 05              $.   BIT &05
5C28  88                 .    DEY
.addr5C29
5C29  0C                 .    ...
5C2A  14                 .    ...
5C2B  05 BB              ..   ORA &BB
5C2D  0C                 .    ...
5C2E  28                 (    PLP
5C2F  05 99              ..   ORA &99
5C31  08                 .    PHP
5C32  14                 .    ...
5C33  05 AA              ..   ORA &AA
5C35  08                 .    PHP
5C36  28                 (    PLP
5C37  1F                 .    ...
5C38  A9 08              ..   LDA #&08
5C3A  1C                 .    ...
5C3B  1F                 .    ...
5C3C  B8                 .    CLV
5C3D  0C                 .    ...
5C3E  18                 .    CLC
5C3F  1F                 .    ...
5C40  C8                 .    INY
.addr5C41
5C41  14                 .    ...
5C42  18                 .    CLC
5C43  1F                 .    ...
5C44  C9 14              ..   CMP #&14
5C46  1C                 .    ...
5C47  1D AC 1C           ...  ORA &1CAC,X
5C4A  28                 (    PLP
5C4B  1D CB 18           ...  ORA &18CB,X
5C4E  28                 (    PLP
5C4F  1D 98 10           ...  ORA &1098,X
5C52  14                 .    ...
5C53  1D BA 24           ..$  ORA &24BA,X
5C56  28                 (    PLP
5C57  1D 54 04           .T.  ORA &0454,X
5C5A  10 1D              ..   BPL &5C79
5C5C  76 20              v    ROR &20,X
5C5E  24 9E              $.   BIT &9E
5C60  1B                 .    ...
5C61  28                 (    PLP
5C62  0B                 .    ...
5C63  1E 1B 28           ..(  ASL &281B,Y
5C66  0B                 .    ...
5C67  DE 1B 28           ..(  DEC &281B,X
5C6A  0B                 .    ...
5C6B  5E 1B 28           ^.(  LSR &281B,Y
5C6E  0B                 .    ...
5C6F  9E                 .    ...
5C70  13                 .    ...
5C71  26 00              &.   ROL &00
.addr5C73
5C73  1E 13 26           ..&  ASL &2613,Y
5C76  00                 .    BRK
5C77  DE 13 26           ..&  DEC &2613,X
5C7A  00                 .    BRK
5C7B  5E 13 26           ^.&  LSR &2613,Y
5C7E  00                 .    BRK
5C7F  BE 19 25           ..%  LDX &2519,Y
5C82  0B                 .    ...
5C83  3E 19 25           >.%  ROL &2519,X
5C86  0B                 .    ...
5C87  7E 19 25           ~.%  ROR &2519,X
5C8A  0B                 .    ...
5C8B  FE 19 25           ..%  INC &2519,X
5C8E  0B                 .    ...
5C8F  3E 00 00           >..  ROL &0000,X
5C92  70 00              p.   BVS &5C94
.addr5C94
5C94  F9 15 6E           ..n  SBC &6E15,Y
5C97  BE 4D 00           .M.  LDX &004D,Y
5C9A  2A                 *    ROL A
5C9B  5A                 Z    ...
5C9C  14                 .    ...
5C9D  00                 .    BRK
5C9E  00                 .    BRK
5C9F  1C                 .    ...
5CA0  17                 .    ...
5CA1  64                 d    ...
5CA2  20 00 00            ..  JSR &0000
5CA5  01 11              ..   ORA (&11,X)
5CA7  00                 .    BRK
5CA8  00                 .    BRK
5CA9  48                 H    PHA
5CAA  1F                 .    ...
5CAB  21 43              !C   AND (&43,X)
5CAD  00                 .    BRK
5CAE  10 18              ..   BPL &5CC8
5CB0  1E 10 22           .."  ASL &2210,Y
5CB3  00                 .    BRK
5CB4  10 18              ..   BPL &5CCE
5CB6  5E 43 55           ^CU  LSR &5543,Y
5CB9  30 00              0.   BMI &5CBB
.addr5CBB
5CBB  18                 .    CLC
5CBC  3F                 ?    ...
5CBD  42                 B    ...
5CBE  66 30              f0   ROR &30
5CC0  00                 .    BRK
5CC1  18                 .    CLC
5CC2  BF                 .    ...
5CC3  31 66              1f   AND (&66),Y
5CC5  18                 .    CLC
5CC6  10 18              ..   BPL &5CE0
.addr5CC8
5CC8  7E 54 66           ~Tf  ROR &6654,X
5CCB  18                 .    CLC
5CCC  10 18              ..   BPL &5CE6
.addr5CCE
5CCE  FE 35 66           .5f  INC &6635,X
5CD1  18                 .    CLC
5CD2  10 18              ..   BPL &5CEC
5CD4  3F                 ?    ...
5CD5  20 66 18            f.  JSR &1866
5CD8  10 18              ..   BPL &5CF2
5CDA  BF                 .    ...
5CDB  10 66              .f   BPL &5D43
5CDD  20 00 18            ..  JSR &1800
.addr5CE0
5CE0  B3                 .    ...
5CE1  66 66              ff   ROR &66
5CE3  20 00 18            ..  JSR &1800
.addr5CE6
5CE6  33                 3    ...
5CE7  66 66              ff   ROR &66
5CE9  08                 .    PHP
5CEA  08                 .    PHP
5CEB  18                 .    CLC
.addr5CEC
5CEC  33                 3    ...
5CED  66 66              ff   ROR &66
5CEF  08                 .    PHP
5CF0  08                 .    PHP
5CF1  18                 .    CLC
.addr5CF2
5CF2  B3                 .    ...
5CF3  66 66              ff   ROR &66
5CF5  08                 .    PHP
5CF6  08                 .    PHP
5CF7  18                 .    CLC
5CF8  F2                 .    ...
5CF9  66 66              ff   ROR &66
5CFB  08                 .    PHP
5CFC  08                 .    PHP
5CFD  18                 .    CLC
5CFE  72                 r    ...
5CFF  66 66              ff   ROR &66
5D01  1F                 .    ...
5D02  42                 B    ...
5D03  00                 .    BRK
5D04  0C                 .    ...
5D05  1E 21 00           .!.  ASL &0021,Y
5D08  04                 .    ...
5D09  1E 43 00           .C.  ASL &0043,Y
5D0C  08                 .    PHP
5D0D  1F                 .    ...
5D0E  31 00              1.   AND (&00),Y
5D10  10 1E              ..   BPL &5D30
5D12  20 04 1C            ..  JSR &1C04
5D15  1E 10 04           ...  ASL &0410,Y
5D18  20 1E 54            .T  JSR &541E
5D1B  08                 .    PHP
5D1C  14                 .    ...
5D1D  1E 53 08           .S.  ASL &0853,Y
5D20  18                 .    CLC
5D21  1F                 .    ...
5D22  60                 `    RTS
5D23  1C                 .    ...
5D24  20 1E 65            .e  JSR &651E
5D27  14                 .    ...
5D28  18                 .    CLC
5D29  1F                 .    ...
5D2A  61 10              a.   ADC (&10,X)
5D2C  20 1E 63            .c  JSR &631E
5D2F  10 18              ..   BPL &5D49
5D31  1F                 .    ...
5D32  62                 b    ...
5D33  0C                 .    ...
5D34  1C                 .    ...
5D35  1E 46 0C           .F.  ASL &0C46,Y
5D38  14                 .    ...
5D39  13                 .    ...
5D3A  66 24              f$   ROR &24
5D3C  30 12              0.   BMI &5D50
5D3E  66 24              f$   ROR &24
5D40  34                 4    ...
5D41  13                 .    ...
5D42  66 28              f(   ROR &28
5D44  2C 12 66           ,.f  BIT &6612
5D47  28                 (    PLP
5D48  38                 8    SEC
.addr5D49
5D49  10 66              .f   BPL &5DB1
5D4B  2C 38 10           ,8.  BIT &1038
5D4E  66 30              f0   ROR &30
.addr5D50
5D50  34                 4    ...
5D51  1F                 .    ...
5D52  00                 .    BRK
5D53  20 00 9F            ..  JSR &9F00
5D56  16 21              .!   ASL &21,X
5D58  0B                 .    ...
5D59  1F                 .    ...
5D5A  16 21              .!   ASL &21,X
5D5C  0B                 .    ...
5D5D  DF                 .    ...
5D5E  16 21              .!   ASL &21,X
5D60  0B                 .    ...
5D61  5F                 _    ...
5D62  16 21              .!   ASL &21,X
5D64  0B                 .    ...
5D65  5F                 _    ...
5D66  00                 .    BRK
5D67  20 00 3F            .?  JSR &3F00
5D6A  00                 .    BRK
5D6B  00                 .    BRK
5D6C  30 01              0.   BMI &5D6F
5D6E  10 0E              ..   BPL &5D7E
5D70  7A                 z    ...
5D71  CE 55 00           .U.  DEC &0055
5D74  12                 .    ...
5D75  66 15              f.   ROR &15
5D77  64                 d    ...
5D78  00                 .    BRK
5D79  18                 .    CLC
5D7A  14                 .    ...
5D7B  50 1E              P.   BVC &5D9B
5D7D  00                 .    BRK
.addr5D7E
5D7E  00                 .    BRK
5D7F  02                 .    ...
5D80  10 00              ..   BPL &5D82
.addr5D82
5D82  00                 .    BRK
5D83  60                 `    RTS
5D84  1F                 .    ...
5D85  01 23              .#   ORA (&23,X)
5D87  00                 .    BRK
5D88  12                 .    ...
5D89  30 3F              0?   BMI &5DCA
5D8B  03                 .    ...
5D8C  45 00              E.   EOR &00
5D8E  12                 .    ...
5D8F  30 7F              0   BMI &5E10
5D91  12                 .    ...
5D92  45 5A              EZ   EOR &5A
5D94  00                 .    BRK
5D95  03                 .    ...
5D96  3F                 ?    ...
5D97  01 44              .D   ORA (&44,X)
5D99  5A                 Z    ...
5D9A  00                 .    BRK
.addr5D9B
5D9B  03                 .    ...
5D9C  BF                 .    ...
5D9D  23                 #    ...
5D9E  55 5A              UZ   EOR &5A,X
5DA0  00                 .    BRK
5DA1  57                 W    ...
5DA2  1C                 .    ...
5DA3  01 11              ..   ORA (&11,X)
5DA5  5A                 Z    ...
5DA6  00                 .    BRK
5DA7  57                 W    ...
5DA8  9C                 .    ...
5DA9  23                 #    ...
5DAA  33                 3    ...
5DAB  00                 .    BRK
5DAC  05 35              .5   ORA &35
5DAE  09 00              ..   ORA #&00
5DB0  33                 3    ...
.addr5DB1
5DB1  00                 .    BRK
5DB2  07                 .    ...
5DB3  26 06              &.   ROL &06
5DB5  00                 .    BRK
5DB6  33                 3    ...
5DB7  12                 .    ...
5DB8  07                 .    ...
5DB9  13                 .    ...
5DBA  89                 .    ...
5DBB  33                 3    ...
5DBC  33                 3    ...
5DBD  12                 .    ...
5DBE  07                 .    ...
5DBF  13                 .    ...
5DC0  09 00              ..   ORA #&00
5DC2  00                 .    BRK
5DC3  12                 .    ...
5DC4  0B                 .    ...
5DC5  27                 '    ...
5DC6  28                 (    PLP
5DC7  44                 D    ...
5DC8  44                 D    ...
5DC9  12                 .    ...
.addr5DCA
5DCA  0B                 .    ...
5DCB  27                 '    ...
5DCC  68                 h    PLA
5DCD  44                 D    ...
5DCE  44                 D    ...
5DCF  24 00              $.   BIT &00
5DD1  1E 28 44           .(D  ASL &4428,Y
5DD4  44                 D    ...
5DD5  12                 .    ...
5DD6  0B                 .    ...
5DD7  27                 '    ...
5DD8  A8                 .    TAY
5DD9  55 55              UU   EOR &55,X
5DDB  12                 .    ...
5DDC  0B                 .    ...
5DDD  27                 '    ...
5DDE  E8                 .    INX
5DDF  55 55              UU   EOR &55,X
5DE1  24 00              $.   BIT &00
5DE3  1E A8 55           ..U  ASL &55A8,Y
5DE6  55 1F              U.   EOR &1F,X
5DE8  03                 .    ...
5DE9  00                 .    BRK
5DEA  04                 .    ...
5DEB  1F                 .    ...
5DEC  12                 .    ...
5DED  00                 .    BRK
5DEE  08                 .    PHP
5DEF  1F                 .    ...
5DF0  01 00              ..   ORA (&00,X)
5DF2  0C                 .    ...
5DF3  1F                 .    ...
5DF4  23                 #    ...
5DF5  00                 .    BRK
5DF6  10 1F              ..   BPL &5E17
5DF8  35 04              5.   AND &04,X
5DFA  10 1F              ..   BPL &5E1B
5DFC  25 10              %.   AND &10
5DFE  08                 .    PHP
5DFF  1F                 .    ...
5E00  14                 .    ...
5E01  08                 .    PHP
5E02  0C                 .    ...
5E03  1F                 .    ...
5E04  04                 .    ...
5E05  0C                 .    ...
5E06  04                 .    ...
5E07  1C                 .    ...
5E08  01 0C              ..   ORA (&0C,X)
5E0A  14                 .    ...
5E0B  1C                 .    ...
5E0C  23                 #    ...
5E0D  10 18              ..   BPL &5E27
5E0F  05 45              .E   ORA &45
5E11  04                 .    ...
5E12  08                 .    PHP
5E13  09 00              ..   ORA #&00
5E15  1C                 .    ...
5E16  28                 (    PLP
.addr5E17
5E17  06 00              ..   ASL &00
5E19  20 28 09            (.  JSR &0928
5E1C  33                 3    ...
5E1D  1C                 .    ...
5E1E  24 06              $.   BIT &06
5E20  33                 3    ...
5E21  20 24 08            $.  JSR &0824
5E24  44                 D    ...
5E25  2C 34 08           ,4.  BIT &0834
5E28  44                 D    ...
5E29  34                 4    ...
5E2A  30 07              0.   BMI &5E33
5E2C  44                 D    ...
5E2D  30 2C              0,   BMI &5E5B
5E2F  07                 .    ...
5E30  55 38              U8   EOR &38,X
5E32  3C                 <    ...
.addr5E33
5E33  08                 .    PHP
5E34  55 3C              U<   EOR &3C,X
5E36  40                 @    RTI
5E37  08                 .    PHP
5E38  55 40              U@   EOR &40,X
5E3A  38                 8    SEC
5E3B  1F                 .    ...
5E3C  07                 .    ...
5E3D  30 06              0.   BMI &5E45
5E3F  5F                 _    ...
5E40  07                 .    ...
5E41  30 06              0.   BMI &5E49
5E43  DF                 .    ...
5E44  07                 .    ...
.addr5E45
5E45  30 06              0.   BMI &5E4D
5E47  9F                 .    ...
5E48  07                 .    ...
.addr5E49
5E49  30 06              0.   BMI &5E51
5E4B  3F                 ?    ...
5E4C  4D 00 9A           M..  EOR &9A00
5E4F  BF                 .    ...
.addr5E50
5E50  4D 00 9A           M..  EOR &9A00
5E53  F3                 .    ...
5E54  49 26              I&   EOR #&26
5E56  7A                 z    ...
5E57  DA                 .    ...
5E58  4D 00 2E           M..  EOR &2E00
.addr5E5B
5E5B  66 18              f.   ROR &18
5E5D  00                 .    BRK
5E5E  00                 .    BRK
5E5F  28                 (    PLP
5E60  2D C8 37           -.7  AND &37C8
5E63  00                 .    BRK
5E64  00                 .    BRK
5E65  02                 .    ...
5E66  2F                 /    ...
5E67  14                 .    ...
5E68  07                 .    ...
5E69  50 5F              P_   BVC &5ECA
5E6B  02                 .    ...
5E6C  99 14 07           ...  STA &0714,Y
5E6F  50 DF              P.   BVC &5E50
5E71  01 99              ..   ORA (&99,X)
5E73  36 07              6.   ROL &07,X
5E75  28                 (    PLP
5E76  DF                 .    ...
5E77  14                 .    ...
5E78  99 36 07           .6.  STA &0736,Y
5E7B  28                 (    PLP
5E7C  FF                 .    ...
5E7D  45 89              E.   EOR &89
5E7F  14                 .    ...
5E80  0D 28 BF           .(.  ORA &BF28
5E83  56 88              V.   LSR &88,X
5E85  14                 .    ...
5E86  0D 28 3F           .(?  ORA &3F28
5E89  67                 g    ...
5E8A  88                 .    DEY
5E8B  36 07              6.   ROL &07,X
5E8D  28                 (    PLP
5E8E  7F                     ...
5E8F  37                 7    ...
5E90  89                 .    ...
5E91  36 07              6.   ROL &07,X
5E93  28                 (    PLP
5E94  5F                 _    ...
5E95  23                 #    ...
5E96  99 14 0D           ...  STA &0D14,Y
5E99  05 1F              ..   ORA &1F
5E9B  FF                 .    ...
5E9C  FF                 .    ...
5E9D  14                 .    ...
5E9E  0D 05 9F           ...  ORA &9F05
5EA1  FF                 .    ...
5EA2  FF                 .    ...
5EA3  14                 .    ...
5EA4  07                 .    ...
5EA5  3E 52 99           >R.  ROL &9952,X
5EA8  99 14 07           ...  STA &0714,Y
5EAB  3E D2 99           >..  ROL &99D2,X
5EAE  99 19 07           ...  STA &0719,Y
5EB1  19 72 99           .r.  ORA &9972,Y
5EB4  99 19 07           ...  STA &0719,Y
5EB7  19 F2 99           ...  ORA &99F2,Y
5EBA  99 0F 07           ...  STA &070F,Y
5EBD  0F                 .    ...
5EBE  6A                 j    ROR A
5EBF  99 99 0F           ...  STA &0F99,Y
5EC2  07                 .    ...
5EC3  0F                 .    ...
5EC4  EA                 .    NOP
5EC5  99 99 00           ...  STA &0099,Y
5EC8  07                 .    ...
5EC9  00                 .    BRK
.addr5ECA
5ECA  40                 @    RTI
5ECB  9F                 .    ...
5ECC  01 1F              ..   ORA (&1F,X)
5ECE  09 00              ..   ORA #&00
5ED0  04                 .    ...
5ED1  1F                 .    ...
5ED2  19 04 08           ...  ORA &0804,Y
5ED5  1F                 .    ...
5ED6  01 04              ..   ORA (&04,X)
5ED8  24 1F              $.   BIT &1F
5EDA  02                 .    ...
5EDB  00                 .    BRK
5EDC  20 1F 29            .)  JSR &291F
5EDF  00                 .    BRK
5EE0  1C                 .    ...
5EE1  1F                 .    ...
5EE2  23                 #    ...
5EE3  1C                 .    ...
5EE4  20 1F 14            ..  JSR &141F
5EE7  08                 .    PHP
5EE8  24 1F              $.   BIT &1F
5EEA  49 08              I.   EOR #&08
5EEC  0C                 .    ...
5EED  1F                 .    ...
5EEE  39 18 1C           9..  AND &1C18,Y
5EF1  1F                 .    ...
5EF2  37                 7    ...
5EF3  18                 .    CLC
5EF4  20 1F 67            .g  JSR &671F
5EF7  14                 .    ...
5EF8  20 1F 56            .V  JSR &561F
5EFB  10 24              .$   BPL &5F21
5EFD  1F                 .    ...
5EFE  45 0C              E.   EOR &0C
5F00  24 1F              $.   BIT &1F
5F02  58                 X    CLI
5F03  0C                 .    ...
5F04  10 1F              ..   BPL &5F25
5F06  68                 h    PLA
5F07  10 14              ..   BPL &5F1D
5F09  1F                 .    ...
5F0A  78                 x    SEI
5F0B  14                 .    ...
5F0C  18                 .    CLC
5F0D  1F                 .    ...
5F0E  89                 .    ...
5F0F  0C                 .    ...
5F10  18                 .    CLC
5F11  1F                 .    ...
5F12  06 20              .    ASL &20
5F14  24 12              $.   BIT &12
5F16  99 28 30           .(0  STA &3028,Y
5F19  05 99              ..   ORA &99
5F1B  30 38              08   BMI &5F55
.addr5F1D
5F1D  0A                 .    ASL A
5F1E  99 38 28           .8(  STA &2838,Y
.addr5F21
5F21  0A                 .    ASL A
5F22  99 2C 3C           .,<  STA &3C2C,Y
.addr5F25
5F25  05 99              ..   ORA &99
5F27  34                 4    ...
5F28  3C                 <    ...
5F29  12                 .    ...
5F2A  99 2C 34           .,4  STA &342C,Y
5F2D  1F                 .    ...
5F2E  00                 .    BRK
5F2F  37                 7    ...
5F30  0F                 .    ...
5F31  9F                 .    ...
5F32  18                 .    CLC
5F33  4B                 K    ...
5F34  14                 .    ...
5F35  1F                 .    ...
5F36  18                 .    CLC
5F37  4B                 K    ...
5F38  14                 .    ...
5F39  1F                 .    ...
5F3A  2C 4B 00           ,K.  BIT &004B
5F3D  9F                 .    ...
5F3E  2C 4B 00           ,K.  BIT &004B
5F41  9F                 .    ...
5F42  2C 4B 00           ,K.  BIT &004B
5F45  1F                 .    ...
5F46  00                 .    BRK
5F47  35 00              5.   AND &00,X
5F49  1F                 .    ...
5F4A  2C 4B 00           ,K.  BIT &004B
5F4D  3F                 ?    ...
5F4E  00                 .    BRK
5F4F  00                 .    BRK
5F50  A0 5F              ._   LDY #&5F
5F52  00                 .    BRK
5F53  1B                 .    ...
5F54  00                 .    BRK
.addr5F55
5F55  00                 .    BRK
5F56  00                 .    BRK
5F57  00                 .    BRK
5F58  00                 .    BRK
5F59  00                 .    BRK
5F5A  00                 .    BRK
5F5B  00                 .    BRK
5F5C  00                 .    BRK
5F5D  00                 .    BRK
5F5E  00                 .    BRK
5F5F  00                 .    BRK
5F60  00                 .    BRK
5F61  00                 .    BRK
5F62  00                 .    BRK
5F63  00                 .    BRK
5F64  00                 .    BRK
5F65  00                 .    BRK
5F66  00                 .    BRK
5F67  00                 .    BRK
5F68  00                 .    BRK
5F69  00                 .    BRK
5F6A  00                 .    BRK
5F6B  00                 .    BRK
5F6C  00                 .    BRK
5F6D  00                 .    BRK
5F6E  00                 .    BRK
5F6F  00                 .    BRK
5F70  00                 .    BRK
5F71  00                 .    BRK
5F72  00                 .    BRK
5F73  00                 .    BRK
5F74  00                 .    BRK
5F75  00                 .    BRK
5F76  00                 .    BRK
5F77  00                 .    BRK
5F78  00                 .    BRK
5F79  00                 .    BRK
5F7A  00                 .    BRK
5F7B  00                 .    BRK
5F7C  00                 .    BRK
5F7D  00                 .    BRK
5F7E  00                 .    BRK
5F7F  00                 .    BRK
5F80  00                 .    BRK
5F81  00                 .    BRK
5F82  00                 .    BRK
5F83  00                 .    BRK
5F84  00                 .    BRK
5F85  00                 .    BRK
5F86  00                 .    BRK
5F87  00                 .    BRK
5F88  00                 .    BRK
5F89  00                 .    BRK
5F8A  00                 .    BRK
5F8B  00                 .    BRK
5F8C  00                 .    BRK
5F8D  00                 .    BRK
5F8E  00                 .    BRK
5F8F  00                 .    BRK
5F90  00                 .    BRK
5F91  00                 .    BRK
5F92  00                 .    BRK
5F93  00                 .    BRK
5F94  00                 .    BRK
5F95  00                 .    BRK
5F96  00                 .    BRK
5F97  00                 .    BRK
5F98  00                 .    BRK
5F99  00                 .    BRK
5F9A  00                 .    BRK
5F9B  00                 .    BRK
5F9C  00                 .    BRK
5F9D  00                 .    BRK
5F9E  00                 .    BRK
5F9F  00                 .    BRK
5FA0  00                 .    BRK
5FA1  00                 .    BRK
5FA2  00                 .    BRK
5FA3  00                 .    BRK
5FA4  00                 .    BRK
5FA5  00                 .    BRK
5FA6  00                 .    BRK
5FA7  00                 .    BRK
5FA8  00                 .    BRK
5FA9  00                 .    BRK
5FAA  00                 .    BRK
5FAB  00                 .    BRK
5FAC  00                 .    BRK
5FAD  00                 .    BRK
5FAE  00                 .    BRK
5FAF  00                 .    BRK
5FB0  00                 .    BRK
5FB1  00                 .    BRK
5FB2  00                 .    BRK
5FB3  00                 .    BRK
5FB4  00                 .    BRK
5FB5  00                 .    BRK
5FB6  00                 .    BRK
5FB7  00                 .    BRK
5FB8  00                 .    BRK
5FB9  00                 .    BRK
5FBA  00                 .    BRK
5FBB  00                 .    BRK
5FBC  00                 .    BRK
5FBD  00                 .    BRK
5FBE  00                 .    BRK
5FBF  00                 .    BRK
5FC0  00                 .    BRK
5FC1  00                 .    BRK
5FC2  00                 .    BRK
5FC3  00                 .    BRK
5FC4  00                 .    BRK
5FC5  00                 .    BRK
5FC6  00                 .    BRK
5FC7  00                 .    BRK
5FC8  00                 .    BRK
5FC9  00                 .    BRK
5FCA  00                 .    BRK
5FCB  00                 .    BRK
5FCC  00                 .    BRK
5FCD  00                 .    BRK
5FCE  00                 .    BRK
5FCF  00                 .    BRK
5FD0  00                 .    BRK
5FD1  00                 .    BRK
5FD2  00                 .    BRK
5FD3  00                 .    BRK
5FD4  00                 .    BRK
5FD5  00                 .    BRK
5FD6  00                 .    BRK
5FD7  00                 .    BRK
5FD8  00                 .    BRK
5FD9  00                 .    BRK
5FDA  00                 .    BRK
5FDB  00                 .    BRK
5FDC  00                 .    BRK
5FDD  00                 .    BRK
5FDE  00                 .    BRK
5FDF  00                 .    BRK
5FE0  00                 .    BRK
5FE1  00                 .    BRK
5FE2  00                 .    BRK
5FE3  00                 .    BRK
5FE4  00                 .    BRK
5FE5  00                 .    BRK
5FE6  00                 .    BRK
5FE7  00                 .    BRK
5FE8  00                 .    BRK
5FE9  00                 .    BRK
5FEA  00                 .    BRK
5FEB  00                 .    BRK
5FEC  00                 .    BRK
5FED  00                 .    BRK
5FEE  00                 .    BRK
5FEF  00                 .    BRK
5FF0  00                 .    BRK
5FF1  00                 .    BRK
5FF2  00                 .    BRK
5FF3  00                 .    BRK
5FF4  00                 .    BRK
5FF5  00                 .    BRK
5FF6  00                 .    BRK
5FF7  00                 .    BRK
5FF8  00                 .    BRK
5FF9  00                 .    BRK
5FFA  00                 .    BRK
5FFB  00                 .    BRK
5FFC  00                 .    BRK
5FFD  00                 .    BRK
5FFE  00                 .    BRK
5FFF  00                 .    BRK

.end

SAVE "bin/T.Code", start, end, start
