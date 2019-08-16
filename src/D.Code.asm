ORG &11E3

11E3  4C 01 12           L..  JMP &1201
11E6  4C 01 12           L..  JMP &1201
11E9  4C FC 1E           L..  JMP &1EFC
11EC  4B                 K    ...
11ED  11 4C              .L   ORA (&4C),Y
11EF  D5 11              ..   CMP &11,X
.addr11F1
11F1  A2 F8              ..   LDX #&F8
11F3  A0 11              ..   LDY #&11
11F5  20 F7 FF            ..  JSR &FFF7
11F8  4C 2E 54           L.T  JMP &542E
11FB  2E 43 4F           .CO  ROL &4F43
11FE  44                 D    ...
11FF  45 0D              E.   EOR &0D
.addr1201
1201  A0 00              ..   LDY #&00
1203  84 07              ..   STY &07
1205  A2 13              ..   LDX #&13
.addr1207
1207  86 08              ..   STX &08
1209  98                 .    TYA
120A  51 07              Q.   EOR (&07),Y
120C  49 33              I3   EOR #&33
120E  91 07              ..   STA (&07),Y
1210  88                 .    DEY
1211  D0 F4              ..   BNE &1207
1213  E8                 .    INX
1214  E0 56              .V   CPX #&56
1216  D0 EF              ..   BNE &1207
1218  4C 44 42           LDB  JMP &4244
.addr121B
121B  A9 52              .R   LDA #&52
121D  8D F8 11           ...  STA &11F8
.addr1220
1220  20 E1 3E            .>  JSR &3EE1
1223  20 7A 0D            z.  JSR &0D7A
1226  D0 C9              ..   BNE &11F1
.addr1228
1228  AD 00 09           ...  LDA &0900
122B  85 00              ..   STA &00
122D  AE 4C 03           .L.  LDX &034C
1230  20 FF 29            .)  JSR &29FF
1233  20 FF 29            .)  JSR &29FF
1236  8A                 .    TXA
1237  49 80              I.   EOR #&80
1239  A8                 .    TAY
123A  29 80              ).   AND #&80
123C  85 32              .2   STA &32
123E  8E 4C 03           .L.  STX &034C
1241  49 80              I.   EOR #&80
1243  85 33              .3   STA &33
1245  98                 .    TYA
1246  10 05              ..   BPL &124D
1248  49 FF              I.   EOR #&FF
124A  18                 .    CLC
124B  69 01              i.   ADC #&01
.addr124D
124D  4A                 J    LSR A
124E  4A                 J    LSR A
124F  C9 08              ..   CMP #&08
1251  B0 01              ..   BCS &1254
1253  4A                 J    LSR A
.addr1254
1254  85 31              .1   STA &31
1256  05 32              .2   ORA &32
1258  85 8D              ..   STA &8D
125A  AE 4D 03           .M.  LDX &034D
125D  20 FF 29            .)  JSR &29FF
1260  8A                 .    TXA
1261  49 80              I.   EOR #&80
1263  A8                 .    TAY
1264  29 80              ).   AND #&80
1266  8E 4D 03           .M.  STX &034D
1269  85 7C              .|   STA &7C
126B  49 80              I.   EOR #&80
126D  85 7B              .{   STA &7B
126F  98                 .    TYA
1270  10 02              ..   BPL &1274
1272  49 FF              I.   EOR #&FF
.addr1274
1274  69 04              i.   ADC #&04
1276  4A                 J    LSR A
1277  4A                 J    LSR A
1278  4A                 J    LSR A
1279  4A                 J    LSR A
127A  C9 03              ..   CMP #&03
127C  B0 01              ..   BCS &127F
127E  4A                 J    LSR A
.addr127F
127F  85 2B              .+   STA &2B
1281  05 7B              .{   ORA &7B
1283  85 2A              .*   STA &2A
1285  AD CE 03           ...  LDA &03CE
1288  F0 14              ..   BEQ &129E
128A  A2 03              ..   LDX #&03
128C  A9 80              ..   LDA #&80
128E  20 F4 FF            ..  JSR &FFF4
1291  98                 .    TYA
1292  4A                 J    LSR A
1293  4A                 J    LSR A
1294  C9 28              .(   CMP #&28
1296  90 02              ..   BCC &129A
1298  A9 28              .(   LDA #&28
.addr129A
129A  85 7D              .}   STA &7D
129C  D0 18              ..   BNE &12B6
.addr129E
129E  AD 02 03           ...  LDA &0302
12A1  F0 08              ..   BEQ &12AB
12A3  A5 7D              .}   LDA &7D
12A5  C9 28              .(   CMP #&28
12A7  B0 02              ..   BCS &12AB
12A9  E6 7D              .}   INC &7D
.addr12AB
12AB  AD 01 03           ...  LDA &0301
12AE  F0 06              ..   BEQ &12B6
12B0  C6 7D              .}   DEC &7D
12B2  D0 02              ..   BNE &12B6
12B4  E6 7D              .}   INC &7D
.addr12B6
12B6  AD 0B 03           ...  LDA &030B
12B9  2D 8B 03           -..  AND &038B
12BC  F0 0F              ..   BEQ &12CD
12BE  A0 EE              ..   LDY #&EE
12C0  20 05 38            .8  JSR &3805
12C3  A9 28              .(   LDA #&28
12C5  20 F3 43            .C  JSR &43F3
12C8  A9 00              ..   LDA #&00
12CA  8D 44 03           .D.  STA &0344
.addr12CD
12CD  A5 45              .E   LDA &45
12CF  10 12              ..   BPL &12E3
12D1  AD 0A 03           ...  LDA &030A
12D4  F0 0D              ..   BEQ &12E3
12D6  AE 8B 03           ...  LDX &038B
12D9  F0 08              ..   BEQ &12E3
12DB  8D 44 03           .D.  STA &0344
12DE  A0 E0              ..   LDY #&E0
12E0  20 3D 38            =8  JSR &383D
.addr12E3
12E3  AD 0C 03           ...  LDA &030C
12E6  F0 07              ..   BEQ &12EF
12E8  A5 45              .E   LDA &45
12EA  30 3A              0:   BMI &1326
12EC  20 2E 25            .%  JSR &252E
.addr12EF
12EF  AD 08 03           ...  LDA &0308
12F2  F0 03              ..   BEQ &12F7
12F4  0E 82 03           ...  ASL &0382
.addr12F7
12F7  AD 10 03           ...  LDA &0310
12FA  F0 05              ..   BEQ &1301
12FC  A9 00              ..   LDA #&00
12FE  8D 3F 03           .?.  STA &033F
.addr1301
1301  AD 09 03           ...  LDA &0309
1304  2D 86 03           -..  AND &0386
1307  F0 03              ..   BEQ &130C
1309  4C C1 20           L.   JMP &20C1
.addr130C
130C  AD 0E 03           ...  LDA &030E
130F  F0 03              ..   BEQ &1314
1311  20 4E 43            NC  JSR &434E
.addr1314
1314  AD 0D 03           ...  LDA &030D
1317  2D 80 03           -..  AND &0380
131A  F0 0A              ..   BEQ &1326
131C  A5 30              .0   LDA &30
131E  D0 06              ..   BNE &1326
1320  CE 40 03           .@.  DEC &0340
1323  20 13 38            .8  JSR &3813
.addr1326
1326  AD 0F 03           ...  LDA &030F
1329  2D 84 03           -..  AND &0384
132C  F0 03              ..   BEQ &1331
132E  8D 3F 03           .?.  STA &033F
.addr1331
1331  A9 00              ..   LDA #&00
1333  85 44              .D   STA &44
1335  85 7E              .~   STA &7E
1337  A5 7D              .}   LDA &7D
1339  4A                 J    LSR A
133A  66 7E              f~   ROR &7E
133C  4A                 J    LSR A
133D  66 7E              f~   ROR &7E
133F  85 7F              .   STA &7F
1341  AD 46 03           .F.  LDA &0346
1344  D0 2E              ..   BNE &1374
1346  AD 07 03           ...  LDA &0307
1349  F0 29              .)   BEQ &1374
134B  AD 47 03           .G.  LDA &0347
134E  C9 F2              ..   CMP #&F2
1350  B0 22              ."   BCS &1374
1352  AE 45 03           .E.  LDX &0345
1355  BD 68 03           .h.  LDA &0368,X
1358  F0 1A              ..   BEQ &1374
135A  48                 H    PHA
135B  29 7F              )   AND #&7F
135D  85 44              .D   STA &44
135F  8D 43 03           .C.  STA &0343
1362  A9 00              ..   LDA #&00
1364  20 F3 43            .C  JSR &43F3
1367  20 82 2A            .*  JSR &2A82
136A  68                 h    PLA
136B  10 02              ..   BPL &136F
136D  A9 00              ..   LDA #&00
.addr136F
136F  29 FA              ).   AND #&FA
1371  8D 46 03           .F.  STA &0346
.addr1374
1374  A2 00              ..   LDX #&00
.addr1376
1376  86 84              ..   STX &84
1378  BD 11 03           ...  LDA &0311,X
137B  D0 03              ..   BNE &1380
137D  4C 3F 15           L?.  JMP &153F
.addr1380
1380  85 8C              ..   STA &8C
1382  20 32 37            27  JSR &3732
1385  A0 24              .$   LDY #&24
.addr1387
1387  B1 20              .    LDA (&20),Y
1389  99 46 00           .F.  STA &0046,Y
138C  88                 .    DEY
138D  10 F8              ..   BPL &1387
138F  A5 8C              ..   LDA &8C
1391  30 23              0#   BMI &13B6
1393  0A                 .    ASL A
1394  A8                 .    TAY
1395  B9 FE 55           ..U  LDA &55FE,Y
1398  85 1E              ..   STA &1E
139A  B9 FF 55           ..U  LDA &55FF,Y
139D  85 1F              ..   STA &1F
139F  AD 82 03           ...  LDA &0382
13A2  10 12              ..   BPL &13B6
13A4  C0 04              ..   CPY #&04
13A6  F0 0E              ..   BEQ &13B6
13A8  A5 65              .e   LDA &65
13AA  29 20              )    AND #&20
13AC  D0 08              ..   BNE &13B6
13AE  06 65              .e   ASL &65
13B0  38                 8    SEC
13B1  66 65              fe   ROR &65
13B3  20 CE 43            .C  JSR &43CE
.addr13B6
13B6  20 A0 50            .P  JSR &50A0
13B9  A0 24              .$   LDY #&24
.addr13BB
13BB  B9 46 00           .F.  LDA &0046,Y
13BE  91 20              .    STA (&20),Y
13C0  88                 .    DEY
13C1  10 F8              ..   BPL &13BB
13C3  A5 65              .e   LDA &65
13C5  29 A0              ).   AND #&A0
13C7  20 BF 41            .A  JSR &41BF
13CA  D0 51              .Q   BNE &141D
13CC  A5 46              .F   LDA &46
13CE  05 49              .I   ORA &49
13D0  05 4C              .L   ORA &4C
13D2  30 49              0I   BMI &141D
13D4  A6 8C              ..   LDX &8C
13D6  30 45              0E   BMI &141D
13D8  E0 02              ..   CPX #&02
13DA  F0 44              .D   BEQ &1420
13DC  29 C0              ).   AND #&C0
13DE  D0 3D              .=   BNE &141D
13E0  E0 01              ..   CPX #&01
13E2  F0 39              .9   BEQ &141D
13E4  AD 81 03           ...  LDA &0381
13E7  25 4B              %K   AND &4B
13E9  10 79              .y   BPL &1464
13EB  E0 05              ..   CPX #&05
13ED  F0 0E              ..   BEQ &13FD
13EF  A0 00              ..   LDY #&00
13F1  B1 1E              ..   LDA (&1E),Y
13F3  4A                 J    LSR A
13F4  4A                 J    LSR A
13F5  4A                 J    LSR A
13F6  4A                 J    LSR A
13F7  F0 6B              .k   BEQ &1464
13F9  69 01              i.   ADC #&01
13FB  D0 05              ..   BNE &1402
.addr13FD
13FD  20 86 3F            .?  JSR &3F86
1400  29 07              ).   AND #&07
.addr1402
1402  20 EC 2A            .*  JSR &2AEC
1405  A0 4E              .N   LDY #&4E
1407  B0 49              .I   BCS &1452
1409  AC AD 03           ...  LDY &03AD
140C  79 6F 03           yo.  ADC &036F,Y
140F  99 6F 03           .o.  STA &036F,Y
1412  98                 .    TYA
1413  69 D0              i.   ADC #&D0
1415  20 C6 45            .E  JSR &45C6
1418  06 6A              .j   ASL &6A
141A  38                 8    SEC
141B  66 6A              fj   ROR &6A
.addr141D
141D  4C 73 14           Ls.  JMP &1473
.addr1420
1420  AD 49 09           .I.  LDA &0949
1423  29 04              ).   AND #&04
1425  D0 22              ."   BNE &1449
1427  A5 54              .T   LDA &54
1429  C9 D6              ..   CMP #&D6
142B  90 1C              ..   BCC &1449
142D  20 AE 42            .B  JSR &42AE
1430  A5 36              .6   LDA &36
1432  C9 56              .V   CMP #&56
1434  90 13              ..   BCC &1449
1436  A5 56              .V   LDA &56
1438  29 7F              )   AND #&7F
143A  C9 50              .P   CMP #&50
143C  90 0B              ..   BCC &1449
.addr143E
143E  20 E1 3E            .>  JSR &3EE1
1441  A9 08              ..   LDA #&08
1443  20 3D 26            =&  JSR &263D
1446  4C 1B 12           L..  JMP &121B
.addr1449
1449  A5 7D              .}   LDA &7D
144B  C9 05              ..   CMP #&05
144D  90 0D              ..   BCC &145C
144F  4C C6 41           L.A  JMP &41C6
.addr1452
1452  20 B1 43            .C  JSR &43B1
1455  06 65              .e   ASL &65
1457  38                 8    SEC
1458  66 65              fe   ROR &65
145A  D0 17              ..   BNE &1473
.addr145C
145C  A9 01              ..   LDA #&01
145E  85 7D              .}   STA &7D
1460  A9 05              ..   LDA #&05
1462  D0 09              ..   BNE &146D
.addr1464
1464  06 65              .e   ASL &65
1466  38                 8    SEC
1467  66 65              fe   ROR &65
1469  A5 69              .i   LDA &69
146B  38                 8    SEC
146C  6A                 j    ROR A
.addr146D
146D  20 E4 36            .6  JSR &36E4
1470  20 B1 43            .C  JSR &43B1
.addr1473
1473  A5 6A              .j   LDA &6A
1475  10 03              ..   BPL &147A
1477  20 58 55            XU  JSR &5558
.addr147A
147A  A5 87              ..   LDA &87
147C  D0 72              .r   BNE &14F0
147E  AE 45 03           .E.  LDX &0345
1481  F0 03              ..   BEQ &1486
1483  20 04 54            .T  JSR &5404
.addr1486
1486  20 C7 24            .$  JSR &24C7
1489  90 62              .b   BCC &14ED
148B  AD 44 03           .D.  LDA &0344
148E  F0 0A              ..   BEQ &149A
1490  20 BA 43            .C  JSR &43BA
1493  A6 84              ..   LDX &84
1495  A0 0E              ..   LDY #&0E
1497  20 07 38            .8  JSR &3807
.addr149A
149A  A5 44              .D   LDA &44
149C  F0 4F              .O   BEQ &14ED
149E  A2 0F              ..   LDX #&0F
14A0  20 DD 43            .C  JSR &43DD
14A3  A5 8C              ..   LDA &8C
14A5  C9 02              ..   CMP #&02
14A7  F0 3F              .?   BEQ &14E8
14A9  C9 1F              ..   CMP #&1F
14AB  D0 0A              ..   BNE &14B7
14AD  A5 44              .D   LDA &44
14AF  C9 17              ..   CMP #&17
14B1  D0 3A              .:   BNE &14ED
14B3  46 44              FD   LSR &44
14B5  46 44              FD   LSR &44
.addr14B7
14B7  A5 69              .i   LDA &69
14B9  38                 8    SEC
14BA  E5 44              .D   SBC &44
14BC  B0 28              .(   BCS &14E6
14BE  06 65              .e   ASL &65
14C0  38                 8    SEC
14C1  66 65              fe   ROR &65
14C3  A5 8C              ..   LDA &8C
14C5  C9 07              ..   CMP #&07
14C7  D0 10              ..   BNE &14D9
14C9  A5 44              .D   LDA &44
14CB  C9 32              .2   CMP #&32
14CD  D0 0A              ..   BNE &14D9
14CF  20 86 3F            .?  JSR &3F86
14D2  A2 08              ..   LDX #&08
14D4  29 03              ).   AND #&03
14D6  20 87 16            ..  JSR &1687
.addr14D9
14D9  A0 04              ..   LDY #&04
14DB  20 78 16            x.  JSR &1678
14DE  A0 05              ..   LDY #&05
14E0  20 78 16            x.  JSR &1678
14E3  20 CE 43            .C  JSR &43CE
.addr14E6
14E6  85 69              .i   STA &69
.addr14E8
14E8  A5 8C              ..   LDA &8C
14EA  20 4D 25            M%  JSR &254D
.addr14ED
14ED  20 8C 48            .H  JSR &488C
.addr14F0
14F0  A0 23              .#   LDY #&23
14F2  A5 69              .i   LDA &69
14F4  91 20              .    STA (&20),Y
14F6  A5 6A              .j   LDA &6A
14F8  30 2D              0-   BMI &1527
14FA  A5 65              .e   LDA &65
14FC  10 2C              .,   BPL &152A
14FE  29 20              )    AND #&20
1500  F0 28              .(   BEQ &152A
1502  A5 6A              .j   LDA &6A
1504  29 40              )@   AND #&40
1506  0D 8C 03           ...  ORA &038C
1509  8D 8C 03           ...  STA &038C
150C  AD 4A 03           .J.  LDA &034A
150F  0D 41 03           .A.  ORA &0341
1512  D0 13              ..   BNE &1527
1514  A0 0A              ..   LDY #&0A
1516  B1 1E              ..   LDA (&1E),Y
1518  F0 0D              ..   BEQ &1527
151A  AA                 .    TAX
151B  C8                 .    INY
151C  B1 1E              ..   LDA (&1E),Y
151E  A8                 .    TAY
151F  20 D0 32            .2  JSR &32D0
1522  A9 00              ..   LDA #&00
1524  20 C6 45            .E  JSR &45C6
.addr1527
1527  4C 7F 3D           L=  JMP &3D7F
.addr152A
152A  A5 8C              ..   LDA &8C
152C  30 05              0.   BMI &1533
152E  20 B2 41            .A  JSR &41B2
1531  90 F4              ..   BCC &1527
.addr1533
1533  A0 1F              ..   LDY #&1F
1535  A5 65              .e   LDA &65
1537  91 20              .    STA (&20),Y
1539  A6 84              ..   LDX &84
153B  E8                 .    INX
153C  4C 76 13           Lv.  JMP &1376
.addr153F
153F  AD 82 03           ...  LDA &0382
1542  10 0B              ..   BPL &154F
1544  0E 82 03           ...  ASL &0382
1547  20 F7 55            .U  JSR &55F7
154A  A9 30              .0   LDA #&30
154C  8D 21 FE           .!.  STA &FE21
.addr154F
154F  A5 8A              ..   LDA &8A
1551  29 07              ).   AND #&07
1553  D0 6D              .m   BNE &15C2
1555  AE A7 03           ...  LDX &03A7
1558  10 12              ..   BPL &156C
155A  AE A6 03           ...  LDX &03A6
155D  20 26 36            &6  JSR &3626
1560  8E A6 03           ...  STX &03A6
1563  AE A5 03           ...  LDX &03A5
1566  20 26 36            &6  JSR &3626
1569  8E A5 03           ...  STX &03A5
.addr156C
156C  38                 8    SEC
156D  AD 83 03           ...  LDA &0383
1570  6D A7 03           m..  ADC &03A7
1573  B0 03              ..   BCS &1578
1575  8D A7 03           ...  STA &03A7
.addr1578
1578  AD 41 03           .A.  LDA &0341
157B  D0 42              .B   BNE &15BF
157D  A5 8A              ..   LDA &8A
157F  29 1F              ).   AND #&1F
1581  D0 48              .H   BNE &15CB
1583  AD 20 03           . .  LDA &0320
1586  D0 37              .7   BNE &15BF
1588  A8                 .    TAY
1589  20 43 1C            C.  JSR &1C43
158C  D0 31              .1   BNE &15BF
158E  A2 1C              ..   LDX #&1C
.addr1590
1590  BD 00 09           ...  LDA &0900,X
1593  95 46              .F   STA &46,X
1595  CA                 .    DEX
1596  10 F8              ..   BPL &1590
1598  E8                 .    INX
1599  A0 09              ..   LDY #&09
159B  20 20 1C             .  JSR &1C20
159E  D0 1F              ..   BNE &15BF
15A0  A2 03              ..   LDX #&03
15A2  A0 0B              ..   LDY #&0B
15A4  20 20 1C             .  JSR &1C20
15A7  D0 16              ..   BNE &15BF
15A9  A2 06              ..   LDX #&06
15AB  A0 0D              ..   LDY #&0D
15AD  20 20 1C             .  JSR &1C20
15B0  D0 0D              ..   BNE &15BF
15B2  A9 C0              ..   LDA #&C0
15B4  20 B4 41            .A  JSR &41B4
15B7  90 06              ..   BCC &15BF
15B9  20 30 3C            0<  JSR &3C30
15BC  20 40 37            @7  JSR &3740
.addr15BF
15BF  4C 48 16           LH.  JMP &1648
.addr15C2
15C2  AD 41 03           .A.  LDA &0341
15C5  D0 F8              ..   BNE &15BF
15C7  A5 8A              ..   LDA &8A
15C9  29 1F              ).   AND #&1F
.addr15CB
15CB  C9 0A              ..   CMP #&0A
15CD  D0 2E              ..   BNE &15FD
15CF  A9 32              .2   LDA #&32
15D1  CD A7 03           ...  CMP &03A7
15D4  90 04              ..   BCC &15DA
15D6  0A                 .    ASL A
15D7  20 C6 45            .E  JSR &45C6
.addr15DA
15DA  A0 FF              ..   LDY #&FF
15DC  8C D1 0F           ...  STY &0FD1
15DF  C8                 .    INY
15E0  20 41 1C            A.  JSR &1C41
15E3  D0 63              .c   BNE &1648
15E5  20 4F 1C            O.  JSR &1C4F
15E8  B0 5E              .^   BCS &1648
15EA  E9 24              .$   SBC #&24
15EC  90 0C              ..   BCC &15FA
15EE  85 82              ..   STA &82
15F0  20 B8 47            .G  JSR &47B8
15F3  A5 81              ..   LDA &81
15F5  8D D1 0F           ...  STA &0FD1
15F8  D0 4E              .N   BNE &1648
.addr15FA
15FA  4C C6 41           L.A  JMP &41C6
.addr15FD
15FD  C9 0F              ..   CMP #&0F
15FF  D0 09              ..   BNE &160A
1601  AD 3F 03           .?.  LDA &033F
1604  F0 42              .B   BEQ &1648
1606  A9 7B              .{   LDA #&7B
1608  D0 3B              .;   BNE &1645
.addr160A
160A  C9 14              ..   CMP #&14
160C  D0 3A              .:   BNE &1648
160E  A9 1E              ..   LDA #&1E
1610  8D 42 03           .B.  STA &0342
1613  AD 20 03           . .  LDA &0320
1616  D0 30              .0   BNE &1648
1618  A0 25              .%   LDY #&25
161A  20 43 1C            C.  JSR &1C43
161D  D0 29              .)   BNE &1648
161F  20 4F 1C            O.  JSR &1C4F
1622  49 FF              I.   EOR #&FF
1624  69 1E              i.   ADC #&1E
1626  8D 42 03           .B.  STA &0342
1629  B0 CF              ..   BCS &15FA
162B  C9 E0              ..   CMP #&E0
162D  90 19              ..   BCC &1648
162F  AD 81 03           ...  LDA &0381
1632  F0 14              ..   BEQ &1648
1634  A5 7F              .   LDA &7F
1636  4A                 J    LSR A
1637  6D 65 03           me.  ADC &0365
163A  C9 46              .F   CMP #&46
163C  90 02              ..   BCC &1640
163E  A9 46              .F   LDA #&46
.addr1640
1640  8D 65 03           .e.  STA &0365
1643  A9 A0              ..   LDA #&A0
.addr1645
1645  20 C6 45            .E  JSR &45C6
.addr1648
1648  AD 43 03           .C.  LDA &0343
164B  F0 0F              ..   BEQ &165C
164D  AD 46 03           .F.  LDA &0346
1650  C9 08              ..   CMP #&08
1652  B0 08              ..   BCS &165C
1654  20 A1 2A            .*  JSR &2AA1
1657  A9 00              ..   LDA #&00
1659  8D 43 03           .C.  STA &0343
.addr165C
165C  AD 40 03           .@.  LDA &0340
165F  F0 05              ..   BEQ &1666
1661  20 29 36            )6  JSR &3629
1664  F0 08              ..   BEQ &166E
.addr1666
1666  A5 30              .0   LDA &30
1668  F0 07              ..   BEQ &1671
166A  C6 30              .0   DEC &30
166C  D0 03              ..   BNE &1671
.addr166E
166E  20 A3 43            .C  JSR &43A3
.addr1671
1671  A5 87              ..   LDA &87
1673  D0 1F              ..   BNE &1694
1675  4C 25 1A           L%.  JMP &1A25
.addr1678
1678  20 86 3F            .?  JSR &3F86
167B  10 17              ..   BPL &1694
167D  48                 H    PHA
167E  98                 .    TYA
167F  AA                 .    TAX
1680  68                 h    PLA
1681  A0 00              ..   LDY #&00
1683  31 1E              1.   AND (&1E),Y
1685  29 0F              ).   AND #&0F
.addr1687
1687  85 93              ..   STA &93
1689  F0 09              ..   BEQ &1694
.addr168B
168B  A9 00              ..   LDA #&00
168D  20 92 25            .%  JSR &2592
1690  C6 93              ..   DEC &93
1692  D0 F7              ..   BNE &168B
.addr1694
1694  60                 `    RTS
1695  00                 .    BRK
1696  09 25              .%   ORA #&25
1698  09 4A              .J   ORA #&4A
169A  09 6F              .o   ORA #&6F
169C  09 94              ..   ORA #&94
169E  09 B9              ..   ORA #&B9
16A0  09 DE              ..   ORA #&DE
16A2  09 03              ..   ORA #&03
16A4  0A                 .    ASL A
16A5  28                 (    PLP
16A6  0A                 .    ASL A
16A7  4D 0A 72           M.r  EOR &720A
16AA  0A                 .    ASL A
16AB  97                 .    ...
16AC  0A                 .    ASL A
16AD  BC 0A 80           ...  LDY &800A,X
16B0  40                 @    RTI
16B1  20 10 08            ..  JSR &0810
16B4  04                 .    ...
16B5  02                 .    ...
16B6  01 C0              ..   ORA (&C0,X)
16B8  60                 `    RTS
16B9  30 18              0.   BMI &16D3
16BB  0C                 .    ...
16BC  06 03              ..   ASL &03
16BE  03                 .    ...
16BF  88                 .    DEY
16C0  44                 D    ...
16C1  22                 "    ...
16C2  11 88              ..   ORA (&88),Y
.addr16C4
16C4  84 85              ..   STY &85
16C6  A9 80              ..   LDA #&80
16C8  85 83              ..   STA &83
16CA  0A                 .    ASL A
16CB  85 90              ..   STA &90
16CD  A5 36              .6   LDA &36
16CF  E5 34              .4   SBC &34
16D1  B0 05              ..   BCS &16D8
.addr16D3
16D3  49 FF              I.   EOR #&FF
16D5  69 01              i.   ADC #&01
16D7  38                 8    SEC
.addr16D8
16D8  85 1B              ..   STA &1B
16DA  A5 37              .7   LDA &37
16DC  E5 35              .5   SBC &35
16DE  B0 04              ..   BCS &16E4
16E0  49 FF              I.   EOR #&FF
16E2  69 01              i.   ADC #&01
.addr16E4
16E4  85 81              ..   STA &81
16E6  C5 1B              ..   CMP &1B
16E8  90 03              ..   BCC &16ED
16EA  4C 97 17           L..  JMP &1797
.addr16ED
16ED  A6 34              .4   LDX &34
16EF  E4 36              .6   CPX &36
16F1  90 11              ..   BCC &1704
16F3  C6 90              ..   DEC &90
16F5  A5 36              .6   LDA &36
16F7  85 34              .4   STA &34
16F9  86 36              .6   STX &36
16FB  AA                 .    TAX
16FC  A5 37              .7   LDA &37
16FE  A4 35              .5   LDY &35
1700  85 35              .5   STA &35
1702  84 37              .7   STY &37
.addr1704
1704  A5 35              .5   LDA &35
1706  4A                 J    LSR A
1707  4A                 J    LSR A
1708  4A                 J    LSR A
1709  09 60              .`   ORA #&60
170B  85 08              ..   STA &08
170D  A5 35              .5   LDA &35
170F  29 07              ).   AND #&07
1711  A8                 .    TAY
1712  8A                 .    TXA
1713  29 F8              ).   AND #&F8
1715  85 07              ..   STA &07
1717  8A                 .    TXA
1718  29 07              ).   AND #&07
171A  AA                 .    TAX
171B  BD AF 16           ...  LDA &16AF,X
171E  85 82              ..   STA &82
1720  A5 81              ..   LDA &81
1722  A2 FE              ..   LDX #&FE
1724  86 81              ..   STX &81
.addr1726
1726  0A                 .    ASL A
1727  B0 04              ..   BCS &172D
1729  C5 1B              ..   CMP &1B
172B  90 03              ..   BCC &1730
.addr172D
172D  E5 1B              ..   SBC &1B
172F  38                 8    SEC
.addr1730
1730  26 81              &.   ROL &81
1732  B0 F2              ..   BCS &1726
1734  A6 1B              ..   LDX &1B
1736  E8                 .    INX
1737  A5 37              .7   LDA &37
1739  E5 35              .5   SBC &35
173B  B0 2C              .,   BCS &1769
173D  A5 90              ..   LDA &90
173F  D0 07              ..   BNE &1748
1741  CA                 .    DEX
.addr1742
1742  A5 82              ..   LDA &82
1744  51 07              Q.   EOR (&07),Y
1746  91 07              ..   STA (&07),Y
.addr1748
1748  46 82              F.   LSR &82
174A  90 08              ..   BCC &1754
174C  66 82              f.   ROR &82
174E  A5 07              ..   LDA &07
1750  69 08              i.   ADC #&08
1752  85 07              ..   STA &07
.addr1754
1754  A5 83              ..   LDA &83
1756  65 81              e.   ADC &81
1758  85 83              ..   STA &83
175A  90 07              ..   BCC &1763
175C  88                 .    DEY
175D  10 04              ..   BPL &1763
175F  C6 08              ..   DEC &08
1761  A0 07              ..   LDY #&07
.addr1763
1763  CA                 .    DEX
1764  D0 DC              ..   BNE &1742
1766  A4 85              ..   LDY &85
1768  60                 `    RTS
.addr1769
1769  A5 90              ..   LDA &90
176B  F0 07              ..   BEQ &1774
176D  CA                 .    DEX
.addr176E
176E  A5 82              ..   LDA &82
1770  51 07              Q.   EOR (&07),Y
1772  91 07              ..   STA (&07),Y
.addr1774
1774  46 82              F.   LSR &82
1776  90 08              ..   BCC &1780
1778  66 82              f.   ROR &82
177A  A5 07              ..   LDA &07
177C  69 08              i.   ADC #&08
177E  85 07              ..   STA &07
.addr1780
1780  A5 83              ..   LDA &83
1782  65 81              e.   ADC &81
1784  85 83              ..   STA &83
1786  90 09              ..   BCC &1791
1788  C8                 .    INY
1789  C0 08              ..   CPY #&08
178B  D0 04              ..   BNE &1791
178D  E6 08              ..   INC &08
178F  A0 00              ..   LDY #&00
.addr1791
1791  CA                 .    DEX
1792  D0 DA              ..   BNE &176E
1794  A4 85              ..   LDY &85
1796  60                 `    RTS
.addr1797
1797  A4 35              .5   LDY &35
1799  98                 .    TYA
179A  A6 34              .4   LDX &34
179C  C4 37              .7   CPY &37
179E  B0 10              ..   BCS &17B0
17A0  C6 90              ..   DEC &90
17A2  A5 36              .6   LDA &36
17A4  85 34              .4   STA &34
17A6  86 36              .6   STX &36
17A8  AA                 .    TAX
17A9  A5 37              .7   LDA &37
17AB  85 35              .5   STA &35
17AD  84 37              .7   STY &37
17AF  A8                 .    TAY
.addr17B0
17B0  4A                 J    LSR A
17B1  4A                 J    LSR A
17B2  4A                 J    LSR A
17B3  09 60              .`   ORA #&60
17B5  85 08              ..   STA &08
17B7  8A                 .    TXA
17B8  29 F8              ).   AND #&F8
17BA  85 07              ..   STA &07
17BC  8A                 .    TXA
17BD  29 07              ).   AND #&07
17BF  AA                 .    TAX
17C0  BD AF 16           ...  LDA &16AF,X
17C3  85 82              ..   STA &82
17C5  A5 35              .5   LDA &35
17C7  29 07              ).   AND #&07
17C9  A8                 .    TAY
17CA  A5 1B              ..   LDA &1B
17CC  A2 01              ..   LDX #&01
17CE  86 1B              ..   STX &1B
.addr17D0
17D0  0A                 .    ASL A
17D1  B0 04              ..   BCS &17D7
17D3  C5 81              ..   CMP &81
17D5  90 03              ..   BCC &17DA
.addr17D7
17D7  E5 81              ..   SBC &81
17D9  38                 8    SEC
.addr17DA
17DA  26 1B              &.   ROL &1B
17DC  90 F2              ..   BCC &17D0
17DE  A6 81              ..   LDX &81
17E0  E8                 .    INX
17E1  A5 36              .6   LDA &36
17E3  E5 34              .4   SBC &34
17E5  90 2D              .-   BCC &1814
17E7  18                 .    CLC
17E8  A5 90              ..   LDA &90
17EA  F0 07              ..   BEQ &17F3
17EC  CA                 .    DEX
.addr17ED
17ED  A5 82              ..   LDA &82
17EF  51 07              Q.   EOR (&07),Y
17F1  91 07              ..   STA (&07),Y
.addr17F3
17F3  88                 .    DEY
17F4  10 04              ..   BPL &17FA
17F6  C6 08              ..   DEC &08
17F8  A0 07              ..   LDY #&07
.addr17FA
17FA  A5 83              ..   LDA &83
17FC  65 1B              e.   ADC &1B
17FE  85 83              ..   STA &83
1800  90 0C              ..   BCC &180E
1802  46 82              F.   LSR &82
1804  90 08              ..   BCC &180E
1806  66 82              f.   ROR &82
1808  A5 07              ..   LDA &07
180A  69 08              i.   ADC #&08
180C  85 07              ..   STA &07
.addr180E
180E  CA                 .    DEX
180F  D0 DC              ..   BNE &17ED
1811  A4 85              ..   LDY &85
1813  60                 `    RTS
.addr1814
1814  A5 90              ..   LDA &90
1816  F0 07              ..   BEQ &181F
1818  CA                 .    DEX
.addr1819
1819  A5 82              ..   LDA &82
181B  51 07              Q.   EOR (&07),Y
181D  91 07              ..   STA (&07),Y
.addr181F
181F  88                 .    DEY
1820  10 04              ..   BPL &1826
1822  C6 08              ..   DEC &08
1824  A0 07              ..   LDY #&07
.addr1826
1826  A5 83              ..   LDA &83
1828  65 1B              e.   ADC &1B
182A  85 83              ..   STA &83
182C  90 0D              ..   BCC &183B
182E  06 82              ..   ASL &82
1830  90 09              ..   BCC &183B
1832  26 82              &.   ROL &82
1834  A5 07              ..   LDA &07
1836  E9 07              ..   SBC #&07
1838  85 07              ..   STA &07
183A  18                 .    CLC
.addr183B
183B  CA                 .    DEX
183C  D0 DB              ..   BNE &1819
183E  A4 85              ..   LDY &85
.addr1840
1840  60                 `    RTS
1841  A9 0F              ..   LDA #&0F
1843  AA                 .    TAX
1844  4C F4 FF           L..  JMP &FFF4
.addr1847
1847  20 9A 33            .3  JSR &339A
.addr184A
184A  A9 13              ..   LDA #&13
184C  D0 04              ..   BNE &1852
.addr184E
184E  A9 17              ..   LDA #&17
1850  E6 2D              .-   INC &2D
.addr1852
1852  85 35              .5   STA &35
1854  A2 02              ..   LDX #&02
1856  86 34              .4   STX &34
1858  A2 FE              ..   LDX #&FE
185A  86 36              .6   STX &36
185C  D0 0A              ..   BNE &1868
.addr185E
185E  20 4F 3C            O<  JSR &3C4F
1861  84 35              .5   STY &35
1863  A9 00              ..   LDA #&00
1865  99 00 0E           ...  STA &0E00,Y
.addr1868
1868  84 85              ..   STY &85
186A  A6 34              .4   LDX &34
186C  E4 36              .6   CPX &36
186E  F0 D0              ..   BEQ &1840
1870  90 07              ..   BCC &1879
1872  A5 36              .6   LDA &36
1874  85 34              .4   STA &34
1876  86 36              .6   STX &36
1878  AA                 .    TAX
.addr1879
1879  C6 36              .6   DEC &36
187B  A5 35              .5   LDA &35
187D  4A                 J    LSR A
187E  4A                 J    LSR A
187F  4A                 J    LSR A
1880  09 60              .`   ORA #&60
1882  85 08              ..   STA &08
1884  A5 35              .5   LDA &35
1886  29 07              ).   AND #&07
1888  85 07              ..   STA &07
188A  8A                 .    TXA
188B  29 F8              ).   AND #&F8
188D  A8                 .    TAY
188E  8A                 .    TXA
188F  29 F8              ).   AND #&F8
1891  85 D1              ..   STA &D1
1893  A5 36              .6   LDA &36
1895  29 F8              ).   AND #&F8
1897  38                 8    SEC
1898  E5 D1              ..   SBC &D1
189A  F0 37              .7   BEQ &18D3
189C  4A                 J    LSR A
189D  4A                 J    LSR A
189E  4A                 J    LSR A
189F  85 82              ..   STA &82
18A1  A5 34              .4   LDA &34
18A3  29 07              ).   AND #&07
18A5  AA                 .    TAX
18A6  BD F5 18           ...  LDA &18F5,X
18A9  51 07              Q.   EOR (&07),Y
18AB  91 07              ..   STA (&07),Y
18AD  98                 .    TYA
18AE  69 08              i.   ADC #&08
18B0  A8                 .    TAY
18B1  A6 82              ..   LDX &82
18B3  CA                 .    DEX
18B4  F0 0E              ..   BEQ &18C4
18B6  18                 .    CLC
.addr18B7
18B7  A9 FF              ..   LDA #&FF
18B9  51 07              Q.   EOR (&07),Y
18BB  91 07              ..   STA (&07),Y
18BD  98                 .    TYA
18BE  69 08              i.   ADC #&08
18C0  A8                 .    TAY
18C1  CA                 .    DEX
18C2  D0 F3              ..   BNE &18B7
.addr18C4
18C4  A5 36              .6   LDA &36
18C6  29 07              ).   AND #&07
18C8  AA                 .    TAX
18C9  BD EE 18           ...  LDA &18EE,X
18CC  51 07              Q.   EOR (&07),Y
18CE  91 07              ..   STA (&07),Y
18D0  A4 85              ..   LDY &85
18D2  60                 `    RTS
.addr18D3
18D3  A5 34              .4   LDA &34
18D5  29 07              ).   AND #&07
18D7  AA                 .    TAX
18D8  BD F5 18           ...  LDA &18F5,X
18DB  85 D1              ..   STA &D1
18DD  A5 36              .6   LDA &36
18DF  29 07              ).   AND #&07
18E1  AA                 .    TAX
18E2  BD EE 18           ...  LDA &18EE,X
18E5  25 D1              %.   AND &D1
18E7  51 07              Q.   EOR (&07),Y
18E9  91 07              ..   STA (&07),Y
.addr18EB
18EB  A4 85              ..   LDY &85
18ED  60                 `    RTS
18EE  80                 .    ...
18EF  C0 E0              ..   CPY #&E0
18F1  F0 F8              ..   BEQ &18EB
18F3  FC                 .    ...
18F4  FE FF 7F           ..  INC &7FFF,X
18F7  3F                 ?    ...
18F8  1F                 .    ...
18F9  0F                 .    ...
18FA  07                 .    ...
18FB  03                 .    ...
18FC  01 BD              ..   ORA (&BD,X)
18FE  AF                 .    ...
18FF  16 51              .Q   ASL &51,X
1901  07                 .    ...
1902  91 07              ..   STA (&07),Y
1904  A4 06              ..   LDY &06
1906  60                 `    RTS
.addr1907
1907  20 FF 28            .(  JSR &28FF
190A  85 27              .'   STA &27
190C  8A                 .    TXA
190D  99 95 0F           ...  STA &0F95,Y
.addr1910
1910  A5 34              .4   LDA &34
1912  10 05              ..   BPL &1919
1914  49 7F              I   EOR #&7F
1916  18                 .    CLC
1917  69 01              i.   ADC #&01
.addr1919
1919  49 80              I.   EOR #&80
191B  AA                 .    TAX
191C  A5 35              .5   LDA &35
191E  29 7F              )   AND #&7F
1920  C9 60              .`   CMP #&60
1922  B0 46              .F   BCS &196A
1924  A5 35              .5   LDA &35
1926  10 04              ..   BPL &192C
1928  49 7F              I   EOR #&7F
192A  69 01              i.   ADC #&01
.addr192C
192C  85 D1              ..   STA &D1
192E  A9 61              .a   LDA #&61
1930  E5 D1              ..   SBC &D1
.addr1932
1932  84 06              ..   STY &06
1934  A8                 .    TAY
1935  4A                 J    LSR A
1936  4A                 J    LSR A
1937  4A                 J    LSR A
1938  09 60              .`   ORA #&60
193A  85 08              ..   STA &08
193C  8A                 .    TXA
193D  29 F8              ).   AND #&F8
193F  85 07              ..   STA &07
1941  98                 .    TYA
1942  29 07              ).   AND #&07
1944  A8                 .    TAY
1945  8A                 .    TXA
1946  29 07              ).   AND #&07
1948  AA                 .    TAX
1949  A5 88              ..   LDA &88
194B  C9 90              ..   CMP #&90
194D  B0 AE              ..   BCS &18FD
194F  BD B7 16           ...  LDA &16B7,X
1952  51 07              Q.   EOR (&07),Y
1954  91 07              ..   STA (&07),Y
1956  A5 88              ..   LDA &88
1958  C9 50              .P   CMP #&50
195A  B0 0C              ..   BCS &1968
195C  88                 .    DEY
195D  10 02              ..   BPL &1961
195F  A0 01              ..   LDY #&01
.addr1961
1961  BD B7 16           ...  LDA &16B7,X
1964  51 07              Q.   EOR (&07),Y
1966  91 07              ..   STA (&07),Y
.addr1968
1968  A4 06              ..   LDY &06
.addr196A
196A  60                 `    RTS
.addr196B
196B  8A                 .    TXA
196C  65 E0              e.   ADC &E0
196E  85 78              .x   STA &78
1970  A5 E1              ..   LDA &E1
1972  65 D1              e.   ADC &D1
1974  85 79              .y   STA &79
1976  A5 92              ..   LDA &92
1978  F0 12              ..   BEQ &198C
197A  E6 92              ..   INC &92
.addr197C
197C  A4 6B              .k   LDY &6B
197E  A9 FF              ..   LDA #&FF
1980  D9 0D 0F           ...  CMP &0F0D,Y
1983  F0 68              .h   BEQ &19ED
1985  99 0E 0F           ...  STA &0F0E,Y
1988  E6 6B              .k   INC &6B
198A  D0 61              .a   BNE &19ED
.addr198C
198C  A5 72              .r   LDA &72
198E  85 34              .4   STA &34
1990  A5 73              .s   LDA &73
1992  85 35              .5   STA &35
1994  A5 74              .t   LDA &74
1996  85 36              .6   STA &36
1998  A5 75              .u   LDA &75
199A  85 37              .7   STA &37
199C  A5 76              .v   LDA &76
199E  85 38              .8   STA &38
19A0  A5 77              .w   LDA &77
19A2  85 39              .9   STA &39
19A4  A5 78              .x   LDA &78
19A6  85 3A              .:   STA &3A
19A8  A5 79              .y   LDA &79
19AA  85 3B              .;   STA &3B
19AC  20 19 4E            .N  JSR &4E19
19AF  B0 CB              ..   BCS &197C
19B1  A5 90              ..   LDA &90
19B3  F0 10              ..   BEQ &19C5
19B5  A5 34              .4   LDA &34
19B7  A4 36              .6   LDY &36
19B9  85 36              .6   STA &36
19BB  84 34              .4   STY &34
19BD  A5 35              .5   LDA &35
19BF  A4 37              .7   LDY &37
19C1  85 37              .7   STA &37
19C3  84 35              .5   STY &35
.addr19C5
19C5  A4 6B              .k   LDY &6B
19C7  B9 0D 0F           ...  LDA &0F0D,Y
19CA  C9 FF              ..   CMP #&FF
19CC  D0 0B              ..   BNE &19D9
19CE  A5 34              .4   LDA &34
19D0  99 C0 0E           ...  STA &0EC0,Y
19D3  A5 35              .5   LDA &35
19D5  99 0E 0F           ...  STA &0F0E,Y
19D8  C8                 .    INY
.addr19D9
19D9  A5 36              .6   LDA &36
19DB  99 C0 0E           ...  STA &0EC0,Y
19DE  A5 37              .7   LDA &37
19E0  99 0E 0F           ...  STA &0F0E,Y
19E3  C8                 .    INY
19E4  84 6B              .k   STY &6B
19E6  20 C4 16            ..  JSR &16C4
19E9  A5 89              ..   LDA &89
19EB  D0 8F              ..   BNE &197C
.addr19ED
19ED  A5 76              .v   LDA &76
19EF  85 72              .r   STA &72
19F1  A5 77              .w   LDA &77
19F3  85 73              .s   STA &73
19F5  A5 78              .x   LDA &78
19F7  85 74              .t   STA &74
19F9  A5 79              .y   LDA &79
19FB  85 75              .u   STA &75
19FD  A5 93              ..   LDA &93
19FF  18                 .    CLC
1A00  65 95              e.   ADC &95
1A02  85 93              ..   STA &93
1A04  60                 `    RTS
.addr1A05
1A05  AC C3 03           ...  LDY &03C3
.addr1A08
1A08  BE 82 0F           ...  LDX &0F82,Y
1A0B  B9 5C 0F           .\.  LDA &0F5C,Y
1A0E  85 35              .5   STA &35
1A10  99 82 0F           ...  STA &0F82,Y
1A13  8A                 .    TXA
1A14  85 34              .4   STA &34
1A16  99 5C 0F           .\.  STA &0F5C,Y
1A19  B9 A8 0F           ...  LDA &0FA8,Y
1A1C  85 88              ..   STA &88
1A1E  20 10 19            ..  JSR &1910
1A21  88                 .    DEY
1A22  D0 E4              ..   BNE &1A08
1A24  60                 `    RTS
.addr1A25
1A25  AE 45 03           .E.  LDX &0345
1A28  F0 09              ..   BEQ &1A33
1A2A  CA                 .    DEX
1A2B  D0 03              ..   BNE &1A30
1A2D  4C 20 1B           L .  JMP &1B20
.addr1A30
1A30  4C 79 26           Ly&  JMP &2679
.addr1A33
1A33  AC C3 03           ...  LDY &03C3
.addr1A36
1A36  20 5E 29            ^)  JSR &295E
1A39  A5 82              ..   LDA &82
1A3B  46 1B              F.   LSR &1B
1A3D  6A                 j    ROR A
1A3E  46 1B              F.   LSR &1B
1A40  6A                 j    ROR A
1A41  09 01              ..   ORA #&01
1A43  85 81              ..   STA &81
1A45  B9 BB 0F           ...  LDA &0FBB,Y
1A48  E5 7E              .~   SBC &7E
1A4A  99 BB 0F           ...  STA &0FBB,Y
1A4D  B9 A8 0F           ...  LDA &0FA8,Y
1A50  85 88              ..   STA &88
1A52  E5 7F              .   SBC &7F
1A54  99 A8 0F           ...  STA &0FA8,Y
1A57  20 17 28            .(  JSR &2817
1A5A  85 27              .'   STA &27
1A5C  A5 1B              ..   LDA &1B
1A5E  79 95 0F           y..  ADC &0F95,Y
1A61  85 26              .&   STA &26
1A63  85 82              ..   STA &82
1A65  A5 35              .5   LDA &35
1A67  65 27              e'   ADC &27
1A69  85 27              .'   STA &27
1A6B  85 83              ..   STA &83
1A6D  B9 5C 0F           .\.  LDA &0F5C,Y
1A70  85 34              .4   STA &34
1A72  20 1C 28            .(  JSR &281C
1A75  85 25              .%   STA &25
1A77  A5 1B              ..   LDA &1B
1A79  79 6F 0F           yo.  ADC &0F6F,Y
1A7C  85 24              .$   STA &24
1A7E  A5 34              .4   LDA &34
1A80  65 25              e%   ADC &25
1A82  85 25              .%   STA &25
1A84  45 33              E3   EOR &33
1A86  20 C6 27            .'  JSR &27C6
1A89  20 FF 28            .(  JSR &28FF
1A8C  85 27              .'   STA &27
1A8E  86 26              .&   STX &26
1A90  45 32              E2   EOR &32
1A92  20 BE 27            .'  JSR &27BE
1A95  20 FF 28            .(  JSR &28FF
1A98  85 25              .%   STA &25
1A9A  86 24              .$   STX &24
1A9C  A6 2B              .+   LDX &2B
1A9E  A5 27              .'   LDA &27
1AA0  45 7C              E|   EOR &7C
1AA2  20 C8 27            .'  JSR &27C8
1AA5  85 81              ..   STA &81
1AA7  20 9E 28            .(  JSR &289E
1AAA  06 1B              ..   ASL &1B
1AAC  2A                 *    ROL A
1AAD  85 D1              ..   STA &D1
1AAF  A9 00              ..   LDA #&00
1AB1  6A                 j    ROR A
1AB2  05 D1              ..   ORA &D1
1AB4  20 FF 28            .(  JSR &28FF
1AB7  85 25              .%   STA &25
1AB9  8A                 .    TXA
1ABA  99 6F 0F           .o.  STA &0F6F,Y
1ABD  A5 26              .&   LDA &26
1ABF  85 82              ..   STA &82
1AC1  A5 27              .'   LDA &27
1AC3  85 83              ..   STA &83
1AC5  A9 00              ..   LDA #&00
1AC7  85 1B              ..   STA &1B
1AC9  A5 2A              .*   LDA &2A
1ACB  49 80              I.   EOR #&80
1ACD  20 07 19            ..  JSR &1907
1AD0  A5 25              .%   LDA &25
1AD2  85 34              .4   STA &34
1AD4  99 5C 0F           .\.  STA &0F5C,Y
1AD7  29 7F              )   AND #&7F
1AD9  C9 78              .x   CMP #&78
1ADB  B0 20              .    BCS &1AFD
1ADD  A5 27              .'   LDA &27
1ADF  99 82 0F           ...  STA &0F82,Y
1AE2  85 35              .5   STA &35
1AE4  29 7F              )   AND #&7F
1AE6  C9 78              .x   CMP #&78
1AE8  B0 13              ..   BCS &1AFD
1AEA  B9 A8 0F           ...  LDA &0FA8,Y
1AED  C9 10              ..   CMP #&10
1AEF  90 0C              ..   BCC &1AFD
1AF1  85 88              ..   STA &88
.addr1AF3
1AF3  20 10 19            ..  JSR &1910
1AF6  88                 .    DEY
1AF7  F0 03              ..   BEQ &1AFC
1AF9  4C 36 1A           L6.  JMP &1A36
.addr1AFC
1AFC  60                 `    RTS
.addr1AFD
1AFD  20 86 3F            .?  JSR &3F86
1B00  09 04              ..   ORA #&04
1B02  85 35              .5   STA &35
1B04  99 82 0F           ...  STA &0F82,Y
1B07  20 86 3F            .?  JSR &3F86
1B0A  09 08              ..   ORA #&08
1B0C  85 34              .4   STA &34
1B0E  99 5C 0F           .\.  STA &0F5C,Y
1B11  20 86 3F            .?  JSR &3F86
1B14  09 90              ..   ORA #&90
1B16  99 A8 0F           ...  STA &0FA8,Y
1B19  85 88              ..   STA &88
1B1B  A5 35              .5   LDA &35
1B1D  4C F3 1A           L..  JMP &1AF3
.addr1B20
1B20  AC C3 03           ...  LDY &03C3
.addr1B23
1B23  20 5E 29            ^)  JSR &295E
1B26  A5 82              ..   LDA &82
1B28  46 1B              F.   LSR &1B
1B2A  6A                 j    ROR A
1B2B  46 1B              F.   LSR &1B
1B2D  6A                 j    ROR A
1B2E  09 01              ..   ORA #&01
1B30  85 81              ..   STA &81
1B32  B9 5C 0F           .\.  LDA &0F5C,Y
1B35  85 34              .4   STA &34
1B37  20 1C 28            .(  JSR &281C
1B3A  85 25              .%   STA &25
1B3C  B9 6F 0F           .o.  LDA &0F6F,Y
1B3F  E5 1B              ..   SBC &1B
1B41  85 24              .$   STA &24
1B43  A5 34              .4   LDA &34
1B45  E5 25              .%   SBC &25
1B47  85 25              .%   STA &25
1B49  20 17 28            .(  JSR &2817
1B4C  85 27              .'   STA &27
1B4E  B9 95 0F           ...  LDA &0F95,Y
1B51  E5 1B              ..   SBC &1B
1B53  85 26              .&   STA &26
1B55  85 82              ..   STA &82
1B57  A5 35              .5   LDA &35
1B59  E5 27              .'   SBC &27
1B5B  85 27              .'   STA &27
1B5D  85 83              ..   STA &83
1B5F  B9 BB 0F           ...  LDA &0FBB,Y
1B62  65 7E              e~   ADC &7E
1B64  99 BB 0F           ...  STA &0FBB,Y
1B67  B9 A8 0F           ...  LDA &0FA8,Y
1B6A  85 88              ..   STA &88
1B6C  65 7F              e   ADC &7F
1B6E  99 A8 0F           ...  STA &0FA8,Y
1B71  A5 25              .%   LDA &25
1B73  45 32              E2   EOR &32
1B75  20 C6 27            .'  JSR &27C6
1B78  20 FF 28            .(  JSR &28FF
1B7B  85 27              .'   STA &27
1B7D  86 26              .&   STX &26
1B7F  45 33              E3   EOR &33
1B81  20 BE 27            .'  JSR &27BE
1B84  20 FF 28            .(  JSR &28FF
1B87  85 25              .%   STA &25
1B89  86 24              .$   STX &24
1B8B  A5 27              .'   LDA &27
1B8D  45 7C              E|   EOR &7C
1B8F  A6 2B              .+   LDX &2B
1B91  20 C8 27            .'  JSR &27C8
1B94  85 81              ..   STA &81
1B96  A5 25              .%   LDA &25
1B98  85 83              ..   STA &83
1B9A  49 80              I.   EOR #&80
1B9C  20 A2 28            .(  JSR &28A2
1B9F  06 1B              ..   ASL &1B
1BA1  2A                 *    ROL A
1BA2  85 D1              ..   STA &D1
1BA4  A9 00              ..   LDA #&00
1BA6  6A                 j    ROR A
1BA7  05 D1              ..   ORA &D1
1BA9  20 FF 28            .(  JSR &28FF
1BAC  85 25              .%   STA &25
1BAE  8A                 .    TXA
1BAF  99 6F 0F           .o.  STA &0F6F,Y
1BB2  A5 26              .&   LDA &26
1BB4  85 82              ..   STA &82
1BB6  A5 27              .'   LDA &27
1BB8  85 83              ..   STA &83
1BBA  A9 00              ..   LDA #&00
1BBC  85 1B              ..   STA &1B
1BBE  A5 2A              .*   LDA &2A
1BC0  20 07 19            ..  JSR &1907
1BC3  A5 25              .%   LDA &25
1BC5  85 34              .4   STA &34
1BC7  99 5C 0F           .\.  STA &0F5C,Y
1BCA  A5 27              .'   LDA &27
1BCC  99 82 0F           ...  STA &0F82,Y
1BCF  85 35              .5   STA &35
1BD1  29 7F              )   AND #&7F
1BD3  C9 6E              .n   CMP #&6E
1BD5  B0 13              ..   BCS &1BEA
1BD7  B9 A8 0F           ...  LDA &0FA8,Y
1BDA  C9 A0              ..   CMP #&A0
1BDC  B0 0C              ..   BCS &1BEA
1BDE  85 88              ..   STA &88
.addr1BE0
1BE0  20 10 19            ..  JSR &1910
1BE3  88                 .    DEY
1BE4  F0 03              ..   BEQ &1BE9
1BE6  4C 23 1B           L#.  JMP &1B23
.addr1BE9
1BE9  60                 `    RTS
.addr1BEA
1BEA  20 86 3F            .?  JSR &3F86
1BED  29 7F              )   AND #&7F
1BEF  69 0A              i.   ADC #&0A
1BF1  99 A8 0F           ...  STA &0FA8,Y
1BF4  85 88              ..   STA &88
1BF6  4A                 J    LSR A
1BF7  B0 14              ..   BCS &1C0D
1BF9  4A                 J    LSR A
1BFA  A9 FC              ..   LDA #&FC
1BFC  6A                 j    ROR A
1BFD  85 34              .4   STA &34
1BFF  99 5C 0F           .\.  STA &0F5C,Y
1C02  20 86 3F            .?  JSR &3F86
1C05  85 35              .5   STA &35
1C07  99 82 0F           ...  STA &0F82,Y
1C0A  4C E0 1B           L..  JMP &1BE0
.addr1C0D
1C0D  20 86 3F            .?  JSR &3F86
1C10  85 34              .4   STA &34
1C12  99 5C 0F           .\.  STA &0F5C,Y
1C15  4A                 J    LSR A
1C16  A9 E6              ..   LDA #&E6
1C18  6A                 j    ROR A
1C19  85 35              .5   STA &35
1C1B  99 82 0F           ...  STA &0F82,Y
1C1E  D0 C0              ..   BNE &1BE0
.addr1C20
1C20  B9 46 00           .F.  LDA &0046,Y
1C23  0A                 .    ASL A
1C24  85 41              .A   STA &41
1C26  B9 47 00           .G.  LDA &0047,Y
1C29  2A                 *    ROL A
1C2A  85 42              .B   STA &42
1C2C  A9 00              ..   LDA #&00
1C2E  6A                 j    ROR A
1C2F  85 43              .C   STA &43
1C31  20 4C 1D            L.  JSR &1D4C
1C34  95 48              .H   STA &48,X
1C36  A4 41              .A   LDY &41
1C38  94 46              .F   STY &46
1C3A  A4 42              .B   LDY &42
1C3C  94 47              .G   STY &47
1C3E  29 7F              )   AND #&7F
1C40  60                 `    RTS
.addr1C41
1C41  A9 00              ..   LDA #&00
.addr1C43
1C43  19 02 09           ...  ORA &0902,Y
1C46  19 05 09           ...  ORA &0905,Y
1C49  19 08 09           ...  ORA &0908,Y
1C4C  29 7F              )   AND #&7F
1C4E  60                 `    RTS
.addr1C4F
1C4F  B9 01 09           ...  LDA &0901,Y
1C52  20 0D 28            .(  JSR &280D
1C55  85 82              ..   STA &82
1C57  B9 04 09           ...  LDA &0904,Y
1C5A  20 0D 28            .(  JSR &280D
1C5D  65 82              e.   ADC &82
1C5F  B0 0C              ..   BCS &1C6D
1C61  85 82              ..   STA &82
1C63  B9 07 09           ...  LDA &0907,Y
1C66  20 0D 28            .(  JSR &280D
1C69  65 82              e.   ADC &82
1C6B  90 02              ..   BCC &1C6F
.addr1C6D
1C6D  A9 FF              ..   LDA #&FF
.addr1C6F
1C6F  60                 `    RTS
.addr1C70
1C70  A2 09              ..   LDX #&09
1C72  C9 19              ..   CMP #&19
1C74  B0 59              .Y   BCS &1CCF
1C76  CA                 .    DEX
1C77  C9 0A              ..   CMP #&0A
1C79  B0 54              .T   BCS &1CCF
1C7B  CA                 .    DEX
1C7C  C9 02              ..   CMP #&02
1C7E  B0 4F              .O   BCS &1CCF
1C80  CA                 .    DEX
1C81  D0 4C              .L   BNE &1CCF
.addr1C83
1C83  A9 08              ..   LDA #&08
1C85  20 C8 54            .T  JSR &54C8
1C88  20 75 2F            u/  JSR &2F75
1C8B  A9 07              ..   LDA #&07
1C8D  85 2C              .,   STA &2C
1C8F  A9 7E              .~   LDA #&7E
1C91  20 47 18            G.  JSR &1847
1C94  A9 E6              ..   LDA #&E6
1C96  AC 3E 03           .>.  LDY &033E
1C99  BE 13 03           ...  LDX &0313,Y
1C9C  F0 07              ..   BEQ &1CA5
1C9E  AC A7 03           ...  LDY &03A7
1CA1  C0 80              ..   CPY #&80
1CA3  69 01              i.   ADC #&01
.addr1CA5
1CA5  20 8F 33            .3  JSR &338F
1CA8  A9 7D              .}   LDA #&7D
1CAA  20 6D 2B            m+  JSR &2B6D
1CAD  A9 13              ..   LDA #&13
1CAF  AC 8C 03           ...  LDY &038C
1CB2  F0 04              ..   BEQ &1CB8
1CB4  C0 32              .2   CPY #&32
1CB6  69 01              i.   ADC #&01
.addr1CB8
1CB8  20 8F 33            .3  JSR &338F
1CBB  A9 10              ..   LDA #&10
1CBD  20 6D 2B            m+  JSR &2B6D
1CC0  AD A0 03           ...  LDA &03A0
1CC3  D0 AB              ..   BNE &1C70
1CC5  AA                 .    TAX
1CC6  AD 9F 03           ...  LDA &039F
1CC9  4A                 J    LSR A
1CCA  4A                 J    LSR A
.addr1CCB
1CCB  E8                 .    INX
1CCC  4A                 J    LSR A
1CCD  D0 FC              ..   BNE &1CCB
.addr1CCF
1CCF  8A                 .    TXA
1CD0  18                 .    CLC
1CD1  69 15              i.   ADC #&15
1CD3  20 8F 33            .3  JSR &338F
1CD6  A9 12              ..   LDA #&12
1CD8  20 44 1D            D.  JSR &1D44
1CDB  AD 6E 03           .n.  LDA &036E
1CDE  C9 1A              ..   CMP #&1A
1CE0  90 05              ..   BCC &1CE7
1CE2  A9 6B              .k   LDA #&6B
1CE4  20 44 1D            D.  JSR &1D44
.addr1CE7
1CE7  AD 81 03           ...  LDA &0381
1CEA  F0 05              ..   BEQ &1CF1
1CEC  A9 6F              .o   LDA #&6F
1CEE  20 44 1D            D.  JSR &1D44
.addr1CF1
1CF1  AD 80 03           ...  LDA &0380
1CF4  F0 05              ..   BEQ &1CFB
1CF6  A9 6C              .l   LDA #&6C
1CF8  20 44 1D            D.  JSR &1D44
.addr1CFB
1CFB  A9 71              .q   LDA #&71
1CFD  85 96              ..   STA &96
.addr1CFF
1CFF  A8                 .    TAY
1D00  BE 11 03           ...  LDX &0311,Y
1D03  F0 03              ..   BEQ &1D08
1D05  20 44 1D            D.  JSR &1D44
.addr1D08
1D08  E6 96              ..   INC &96
1D0A  A5 96              ..   LDA &96
1D0C  C9 75              .u   CMP #&75
1D0E  90 EF              ..   BCC &1CFF
1D10  A2 00              ..   LDX #&00
.addr1D12
1D12  86 93              ..   STX &93
1D14  BC 68 03           .h.  LDY &0368,X
1D17  F0 23              .#   BEQ &1D3C
1D19  8A                 .    TXA
1D1A  18                 .    CLC
1D1B  69 60              i`   ADC #&60
1D1D  20 6D 2B            m+  JSR &2B6D
1D20  A9 67              .g   LDA #&67
1D22  A6 93              ..   LDX &93
1D24  BC 68 03           .h.  LDY &0368,X
1D27  C0 8F              ..   CPY #&8F
1D29  D0 02              ..   BNE &1D2D
1D2B  A9 68              .h   LDA #&68
.addr1D2D
1D2D  C0 97              ..   CPY #&97
1D2F  D0 02              ..   BNE &1D33
1D31  A9 75              .u   LDA #&75
.addr1D33
1D33  C0 32              .2   CPY #&32
1D35  D0 02              ..   BNE &1D39
1D37  A9 76              .v   LDA #&76
.addr1D39
1D39  20 44 1D            D.  JSR &1D44
.addr1D3C
1D3C  A6 93              ..   LDX &93
1D3E  E8                 .    INX
1D3F  E0 04              ..   CPX #&04
1D41  90 CF              ..   BCC &1D12
1D43  60                 `    RTS
.addr1D44
1D44  20 8F 33            .3  JSR &338F
1D47  A2 06              ..   LDX #&06
1D49  86 2C              .,   STX &2C
1D4B  60                 `    RTS
.addr1D4C
1D4C  A5 43              .C   LDA &43
1D4E  85 83              ..   STA &83
1D50  29 80              ).   AND #&80
1D52  85 D1              ..   STA &D1
1D54  55 48              UH   EOR &48,X
1D56  30 18              0.   BMI &1D70
1D58  A5 41              .A   LDA &41
1D5A  18                 .    CLC
1D5B  75 46              uF   ADC &46,X
1D5D  85 41              .A   STA &41
1D5F  A5 42              .B   LDA &42
1D61  75 47              uG   ADC &47,X
1D63  85 42              .B   STA &42
1D65  A5 43              .C   LDA &43
1D67  75 48              uH   ADC &48,X
1D69  29 7F              )   AND #&7F
1D6B  05 D1              ..   ORA &D1
1D6D  85 43              .C   STA &43
1D6F  60                 `    RTS
.addr1D70
1D70  A5 83              ..   LDA &83
1D72  29 7F              )   AND #&7F
1D74  85 83              ..   STA &83
1D76  B5 46              .F   LDA &46,X
1D78  38                 8    SEC
1D79  E5 41              .A   SBC &41
1D7B  85 41              .A   STA &41
1D7D  B5 47              .G   LDA &47,X
1D7F  E5 42              .B   SBC &42
1D81  85 42              .B   STA &42
1D83  B5 48              .H   LDA &48,X
1D85  29 7F              )   AND #&7F
1D87  E5 83              ..   SBC &83
1D89  09 80              ..   ORA #&80
1D8B  45 D1              E.   EOR &D1
1D8D  85 43              .C   STA &43
1D8F  B0 16              ..   BCS &1DA7
1D91  A9 01              ..   LDA #&01
1D93  E5 41              .A   SBC &41
1D95  85 41              .A   STA &41
1D97  A9 00              ..   LDA #&00
1D99  E5 42              .B   SBC &42
1D9B  85 42              .B   STA &42
1D9D  A9 00              ..   LDA #&00
1D9F  E5 43              .C   SBC &43
1DA1  29 7F              )   AND #&7F
1DA3  05 D1              ..   ORA &D1
1DA5  85 43              .C   STA &43
.addr1DA7
1DA7  60                 `    RTS
.addr1DA8
1DA8  B5 47              .G   LDA &47,X
1DAA  29 7F              )   AND #&7F
1DAC  4A                 J    LSR A
1DAD  85 D1              ..   STA &D1
1DAF  B5 46              .F   LDA &46,X
1DB1  38                 8    SEC
1DB2  E5 D1              ..   SBC &D1
1DB4  85 82              ..   STA &82
1DB6  B5 47              .G   LDA &47,X
1DB8  E9 00              ..   SBC #&00
1DBA  85 83              ..   STA &83
1DBC  B9 46 00           .F.  LDA &0046,Y
1DBF  85 1B              ..   STA &1B
1DC1  B9 47 00           .G.  LDA &0047,Y
1DC4  29 80              ).   AND #&80
1DC6  85 D1              ..   STA &D1
1DC8  B9 47 00           .G.  LDA &0047,Y
1DCB  29 7F              )   AND #&7F
1DCD  4A                 J    LSR A
1DCE  66 1B              f.   ROR &1B
1DD0  4A                 J    LSR A
1DD1  66 1B              f.   ROR &1B
1DD3  4A                 J    LSR A
1DD4  66 1B              f.   ROR &1B
1DD6  4A                 J    LSR A
1DD7  66 1B              f.   ROR &1B
1DD9  05 D1              ..   ORA &D1
1DDB  45 9A              E.   EOR &9A
1DDD  86 81              ..   STX &81
1DDF  20 FF 28            .(  JSR &28FF
1DE2  85 41              .A   STA &41
1DE4  86 40              .@   STX &40
1DE6  A6 81              ..   LDX &81
1DE8  B9 47 00           .G.  LDA &0047,Y
1DEB  29 7F              )   AND #&7F
1DED  4A                 J    LSR A
1DEE  85 D1              ..   STA &D1
1DF0  B9 46 00           .F.  LDA &0046,Y
1DF3  38                 8    SEC
1DF4  E5 D1              ..   SBC &D1
1DF6  85 82              ..   STA &82
1DF8  B9 47 00           .G.  LDA &0047,Y
1DFB  E9 00              ..   SBC #&00
1DFD  85 83              ..   STA &83
1DFF  B5 46              .F   LDA &46,X
1E01  85 1B              ..   STA &1B
1E03  B5 47              .G   LDA &47,X
1E05  29 80              ).   AND #&80
1E07  85 D1              ..   STA &D1
1E09  B5 47              .G   LDA &47,X
1E0B  29 7F              )   AND #&7F
1E0D  4A                 J    LSR A
1E0E  66 1B              f.   ROR &1B
1E10  4A                 J    LSR A
1E11  66 1B              f.   ROR &1B
1E13  4A                 J    LSR A
1E14  66 1B              f.   ROR &1B
1E16  4A                 J    LSR A
1E17  66 1B              f.   ROR &1B
1E19  05 D1              ..   ORA &D1
1E1B  49 80              I.   EOR #&80
1E1D  45 9A              E.   EOR &9A
1E1F  86 81              ..   STX &81
1E21  20 FF 28            .(  JSR &28FF
1E24  99 47 00           .G.  STA &0047,Y
1E27  96 46              .F   STX &46,Y
1E29  A6 81              ..   LDX &81
1E2B  A5 40              .@   LDA &40
1E2D  95 46              .F   STA &46,X
1E2F  A5 41              .A   LDA &41
1E31  95 47              .G   STA &47,X
1E33  60                 `    RTS
1E34  48                 H    PHA
1E35  76 E8              v.   ROR &E8,X
1E37  00                 .    BRK
.addr1E38
1E38  A9 03              ..   LDA #&03
.addr1E3A
1E3A  A0 00              ..   LDY #&00
.addr1E3C
1E3C  85 80              ..   STA &80
1E3E  A9 00              ..   LDA #&00
1E40  85 40              .@   STA &40
1E42  85 41              .A   STA &41
1E44  84 42              .B   STY &42
1E46  86 43              .C   STX &43
.addr1E48
1E48  A2 0B              ..   LDX #&0B
1E4A  86 D1              ..   STX &D1
1E4C  08                 .    PHP
1E4D  90 04              ..   BCC &1E53
1E4F  C6 D1              ..   DEC &D1
1E51  C6 80              ..   DEC &80
.addr1E53
1E53  A9 0B              ..   LDA #&0B
1E55  38                 8    SEC
1E56  85 86              ..   STA &86
1E58  E5 80              ..   SBC &80
1E5A  85 80              ..   STA &80
1E5C  E6 80              ..   INC &80
1E5E  A0 00              ..   LDY #&00
1E60  84 83              ..   STY &83
1E62  4C A4 1E           L..  JMP &1EA4
.addr1E65
1E65  06 43              .C   ASL &43
1E67  26 42              &B   ROL &42
1E69  26 41              &A   ROL &41
1E6B  26 40              &@   ROL &40
1E6D  26 83              &.   ROL &83
1E6F  A2 03              ..   LDX #&03
.addr1E71
1E71  B5 40              .@   LDA &40,X
1E73  95 34              .4   STA &34,X
1E75  CA                 .    DEX
1E76  10 F9              ..   BPL &1E71
1E78  A5 83              ..   LDA &83
1E7A  85 38              .8   STA &38
1E7C  06 43              .C   ASL &43
1E7E  26 42              &B   ROL &42
1E80  26 41              &A   ROL &41
1E82  26 40              &@   ROL &40
1E84  26 83              &.   ROL &83
1E86  06 43              .C   ASL &43
1E88  26 42              &B   ROL &42
1E8A  26 41              &A   ROL &41
1E8C  26 40              &@   ROL &40
1E8E  26 83              &.   ROL &83
1E90  18                 .    CLC
1E91  A2 03              ..   LDX #&03
.addr1E93
1E93  B5 40              .@   LDA &40,X
1E95  75 34              u4   ADC &34,X
1E97  95 40              .@   STA &40,X
1E99  CA                 .    DEX
1E9A  10 F7              ..   BPL &1E93
1E9C  A5 38              .8   LDA &38
1E9E  65 83              e.   ADC &83
1EA0  85 83              ..   STA &83
1EA2  A0 00              ..   LDY #&00
.addr1EA4
1EA4  A2 03              ..   LDX #&03
1EA6  38                 8    SEC
.addr1EA7
1EA7  B5 40              .@   LDA &40,X
1EA9  FD 34 1E           .4.  SBC &1E34,X
1EAC  95 34              .4   STA &34,X
1EAE  CA                 .    DEX
1EAF  10 F6              ..   BPL &1EA7
1EB1  A5 83              ..   LDA &83
1EB3  E9 17              ..   SBC #&17
1EB5  85 38              .8   STA &38
1EB7  90 11              ..   BCC &1ECA
1EB9  A2 03              ..   LDX #&03
.addr1EBB
1EBB  B5 34              .4   LDA &34,X
1EBD  95 40              .@   STA &40,X
1EBF  CA                 .    DEX
1EC0  10 F9              ..   BPL &1EBB
1EC2  A5 38              .8   LDA &38
1EC4  85 83              ..   STA &83
1EC6  C8                 .    INY
1EC7  4C A4 1E           L..  JMP &1EA4
.addr1ECA
1ECA  98                 .    TYA
1ECB  D0 0C              ..   BNE &1ED9
1ECD  A5 D1              ..   LDA &D1
1ECF  F0 08              ..   BEQ &1ED9
1ED1  C6 80              ..   DEC &80
1ED3  10 0E              ..   BPL &1EE3
1ED5  A9 20              .    LDA #&20
1ED7  D0 07              ..   BNE &1EE0
.addr1ED9
1ED9  A0 00              ..   LDY #&00
1EDB  84 D1              ..   STY &D1
1EDD  18                 .    CLC
1EDE  69 30              i0   ADC #&30
.addr1EE0
1EE0  20 FC 1E            ..  JSR &1EFC
.addr1EE3
1EE3  C6 D1              ..   DEC &D1
1EE5  10 02              ..   BPL &1EE9
1EE7  E6 D1              ..   INC &D1
.addr1EE9
1EE9  C6 86              ..   DEC &86
1EEB  30 6E              0n   BMI &1F5B
1EED  D0 08              ..   BNE &1EF7
1EEF  28                 (    PLP
1EF0  90 05              ..   BCC &1EF7
1EF2  A9 2E              ..   LDA #&2E
1EF4  20 FC 1E            ..  JSR &1EFC
.addr1EF7
1EF7  4C 65 1E           Le.  JMP &1E65
.addr1EFA
1EFA  A9 07              ..   LDA #&07
.addr1EFC
1EFC  85 D2              ..   STA &D2
1EFE  8C 4F 03           .O.  STY &034F
1F01  8E 4E 03           .N.  STX &034E
1F04  A4 72              .r   LDY &72
1F06  C0 FF              ..   CPY #&FF
1F08  F0 48              .H   BEQ &1F52
1F0A  C9 07              ..   CMP #&07
1F0C  F0 4E              .N   BEQ &1F5C
1F0E  C9 20              .    CMP #&20
1F10  B0 0C              ..   BCS &1F1E
1F12  C9 0A              ..   CMP #&0A
1F14  F0 04              ..   BEQ &1F1A
1F16  A2 01              ..   LDX #&01
1F18  86 2C              .,   STX &2C
.addr1F1A
1F1A  E6 2D              .-   INC &2D
1F1C  D0 34              .4   BNE &1F52
.addr1F1E
1F1E  A2 BF              ..   LDX #&BF
1F20  0A                 .    ASL A
1F21  0A                 .    ASL A
1F22  90 02              ..   BCC &1F26
1F24  A2 C1              ..   LDX #&C1
.addr1F26
1F26  0A                 .    ASL A
1F27  90 01              ..   BCC &1F2A
1F29  E8                 .    INX
.addr1F2A
1F2A  85 1C              ..   STA &1C
1F2C  86 1D              ..   STX &1D
1F2E  A5 2C              .,   LDA &2C
1F30  0A                 .    ASL A
1F31  0A                 .    ASL A
1F32  0A                 .    ASL A
1F33  85 07              ..   STA &07
1F35  E6 2C              .,   INC &2C
1F37  A5 2D              .-   LDA &2D
1F39  C9 18              ..   CMP #&18
1F3B  90 06              ..   BCC &1F43
1F3D  20 C8 54            .T  JSR &54C8
1F40  4C 52 1F           LR.  JMP &1F52
.addr1F43
1F43  09 60              .`   ORA #&60
.addr1F45
1F45  85 08              ..   STA &08
1F47  A0 07              ..   LDY #&07
.addr1F49
1F49  B1 1C              ..   LDA (&1C),Y
1F4B  51 07              Q.   EOR (&07),Y
1F4D  91 07              ..   STA (&07),Y
1F4F  88                 .    DEY
1F50  10 F7              ..   BPL &1F49
.addr1F52
1F52  AC 4F 03           .O.  LDY &034F
1F55  AE 4E 03           .N.  LDX &034E
1F58  A5 D2              ..   LDA &D2
1F5A  18                 .    CLC
.addr1F5B
1F5B  60                 `    RTS
.addr1F5C
1F5C  20 BA 43            .C  JSR &43BA
1F5F  4C 52 1F           LR.  JMP &1F52
.addr1F62
1F62  A9 D0              ..   LDA #&D0
1F64  85 07              ..   STA &07
1F66  A9 78              .x   LDA #&78
1F68  85 08              ..   STA &08
1F6A  20 26 20            &   JSR &2026
1F6D  86 41              .A   STX &41
1F6F  85 40              .@   STA &40
1F71  A9 0E              ..   LDA #&0E
1F73  85 06              ..   STA &06
1F75  A5 7D              .}   LDA &7D
1F77  20 39 20            9   JSR &2039
1F7A  A9 00              ..   LDA #&00
1F7C  85 82              ..   STA &82
1F7E  85 1B              ..   STA &1B
1F80  A9 08              ..   LDA #&08
1F82  85 83              ..   STA &83
1F84  A5 31              .1   LDA &31
1F86  4A                 J    LSR A
1F87  4A                 J    LSR A
1F88  05 32              .2   ORA &32
1F8A  49 80              I.   EOR #&80
1F8C  20 FF 28            .(  JSR &28FF
1F8F  20 8D 20            .   JSR &208D
1F92  A5 2A              .*   LDA &2A
1F94  A6 2B              .+   LDX &2B
1F96  F0 02              ..   BEQ &1F9A
1F98  E9 01              ..   SBC #&01
.addr1F9A
1F9A  20 FF 28            .(  JSR &28FF
1F9D  20 8D 20            .   JSR &208D
1FA0  A5 8A              ..   LDA &8A
1FA2  29 03              ).   AND #&03
1FA4  D0 B5              ..   BNE &1F5B
1FA6  A0 00              ..   LDY #&00
1FA8  20 26 20            &   JSR &2026
1FAB  86 40              .@   STX &40
1FAD  85 41              .A   STA &41
1FAF  A2 03              ..   LDX #&03
1FB1  86 06              ..   STX &06
.addr1FB3
1FB3  94 3A              .:   STY &3A
1FB5  CA                 .    DEX
1FB6  10 FB              ..   BPL &1FB3
1FB8  A2 03              ..   LDX #&03
1FBA  AD A7 03           ...  LDA &03A7
1FBD  4A                 J    LSR A
1FBE  4A                 J    LSR A
1FBF  85 81              ..   STA &81
.addr1FC1
1FC1  38                 8    SEC
1FC2  E9 10              ..   SBC #&10
1FC4  90 0D              ..   BCC &1FD3
1FC6  85 81              ..   STA &81
1FC8  A9 10              ..   LDA #&10
1FCA  95 3A              .:   STA &3A,X
1FCC  A5 81              ..   LDA &81
1FCE  CA                 .    DEX
1FCF  10 F0              ..   BPL &1FC1
1FD1  30 04              0.   BMI &1FD7
.addr1FD3
1FD3  A5 81              ..   LDA &81
1FD5  95 3A              .:   STA &3A,X
.addr1FD7
1FD7  B9 3A 00           .:.  LDA &003A,Y
1FDA  84 1B              ..   STY &1B
1FDC  20 3A 20            :   JSR &203A
1FDF  A4 1B              ..   LDY &1B
1FE1  C8                 .    INY
1FE2  C0 04              ..   CPY #&04
1FE4  D0 F1              ..   BNE &1FD7
1FE6  A9 78              .x   LDA #&78
1FE8  85 08              ..   STA &08
1FEA  A9 10              ..   LDA #&10
1FEC  85 07              ..   STA &07
1FEE  AD A5 03           ...  LDA &03A5
1FF1  20 36 20            6   JSR &2036
1FF4  AD A6 03           ...  LDA &03A6
1FF7  20 36 20            6   JSR &2036
1FFA  AD 65 03           .e.  LDA &0365
1FFD  20 38 20            8   JSR &2038
2000  20 26 20            &   JSR &2026
2003  86 41              .A   STX &41
2005  85 40              .@   STA &40
2007  A2 0B              ..   LDX #&0B
2009  86 06              ..   STX &06
200B  AD 42 03           .B.  LDA &0342
200E  20 36 20            6   JSR &2036
2011  AD 47 03           .G.  LDA &0347
2014  20 36 20            6   JSR &2036
2017  A9 F0              ..   LDA #&F0
2019  85 06              ..   STA &06
201B  85 41              .A   STA &41
201D  AD D1 0F           ...  LDA &0FD1
2020  20 36 20            6   JSR &2036
2023  4C 34 36           L46  JMP &3634
.addr2026
2026  A2 F0              ..   LDX #&F0
2028  A5 8A              ..   LDA &8A
202A  29 08              ).   AND #&08
202C  2D CA 03           -..  AND &03CA
202F  F0 02              ..   BEQ &2033
2031  8A                 .    TXA
2032  2C A9 0F           ,..  BIT &0FA9
2035  60                 `    RTS
.addr2036
2036  4A                 J    LSR A
2037  4A                 J    LSR A
.addr2038
2038  4A                 J    LSR A
.addr2039
2039  4A                 J    LSR A
.addr203A
203A  85 81              ..   STA &81
203C  A2 FF              ..   LDX #&FF
203E  86 82              ..   STX &82
2040  C5 06              ..   CMP &06
2042  B0 04              ..   BCS &2048
2044  A5 41              .A   LDA &41
2046  D0 02              ..   BNE &204A
.addr2048
2048  A5 40              .@   LDA &40
.addr204A
204A  85 91              ..   STA &91
204C  A0 02              ..   LDY #&02
204E  A2 03              ..   LDX #&03
.addr2050
2050  A5 81              ..   LDA &81
2052  C9 04              ..   CMP #&04
2054  90 1A              ..   BCC &2070
2056  E9 04              ..   SBC #&04
2058  85 81              ..   STA &81
205A  A5 82              ..   LDA &82
.addr205C
205C  25 91              %.   AND &91
205E  91 07              ..   STA (&07),Y
2060  C8                 .    INY
2061  91 07              ..   STA (&07),Y
2063  C8                 .    INY
2064  91 07              ..   STA (&07),Y
2066  98                 .    TYA
2067  18                 .    CLC
2068  69 06              i.   ADC #&06
206A  A8                 .    TAY
206B  CA                 .    DEX
206C  30 1C              0.   BMI &208A
206E  10 E0              ..   BPL &2050
.addr2070
2070  49 03              I.   EOR #&03
2072  85 81              ..   STA &81
2074  A5 82              ..   LDA &82
.addr2076
2076  0A                 .    ASL A
2077  29 EF              ).   AND #&EF
2079  C6 81              ..   DEC &81
207B  10 F9              ..   BPL &2076
207D  48                 H    PHA
207E  A9 00              ..   LDA #&00
2080  85 82              ..   STA &82
2082  A9 63              .c   LDA #&63
2084  85 81              ..   STA &81
2086  68                 h    PLA
2087  4C 5C 20           L\   JMP &205C
.addr208A
208A  E6 08              ..   INC &08
208C  60                 `    RTS
.addr208D
208D  A0 01              ..   LDY #&01
208F  85 81              ..   STA &81
.addr2091
2091  38                 8    SEC
2092  A5 81              ..   LDA &81
2094  E9 04              ..   SBC #&04
2096  B0 0E              ..   BCS &20A6
2098  A9 FF              ..   LDA #&FF
209A  A6 81              ..   LDX &81
209C  85 81              ..   STA &81
209E  BD BF 16           ...  LDA &16BF,X
20A1  29 F0              ).   AND #&F0
20A3  4C AA 20           L.   JMP &20AA
.addr20A6
20A6  85 81              ..   STA &81
20A8  A9 00              ..   LDA #&00
.addr20AA
20AA  91 07              ..   STA (&07),Y
20AC  C8                 .    INY
20AD  91 07              ..   STA (&07),Y
20AF  C8                 .    INY
20B0  91 07              ..   STA (&07),Y
20B2  C8                 .    INY
20B3  91 07              ..   STA (&07),Y
20B5  98                 .    TYA
20B6  18                 .    CLC
20B7  69 05              i.   ADC #&05
20B9  A8                 .    TAY
20BA  C0 1E              ..   CPY #&1E
20BC  90 D3              ..   BCC &2091
20BE  E6 08              ..   INC &08
20C0  60                 `    RTS
.addr20C1
20C1  20 E1 3E            .>  JSR &3EE1
20C4  A2 0B              ..   LDX #&0B
20C6  86 8C              ..   STX &8C
20C8  20 08 25            .%  JSR &2508
20CB  B0 05              ..   BCS &20D2
20CD  A2 18              ..   LDX #&18
20CF  20 08 25            .%  JSR &2508
.addr20D2
20D2  A9 08              ..   LDA #&08
20D4  85 61              .a   STA &61
20D6  A9 C2              ..   LDA #&C2
20D8  85 64              .d   STA &64
20DA  4A                 J    LSR A
20DB  85 66              .f   STA &66
.addr20DD
20DD  20 A0 50            .P  JSR &50A0
20E0  20 8C 48            .H  JSR &488C
20E3  C6 66              .f   DEC &66
20E5  D0 F6              ..   BNE &20DD
20E7  20 58 55            XU  JSR &5558
20EA  A9 00              ..   LDA #&00
20EC  A2 10              ..   LDX #&10
.addr20EE
20EE  9D 6F 03           .o.  STA &036F,X
20F1  CA                 .    DEX
20F2  10 FA              ..   BPL &20EE
20F4  8D 8C 03           ...  STA &038C
20F7  8D 86 03           ...  STA &0386
20FA  A9 46              .F   LDA #&46
20FC  8D 65 03           .e.  STA &0365
20FF  4C 3E 14           L>.  JMP &143E
.addr2102
2102  A9 00              ..   LDA #&00
2104  20 BF 41            .A  JSR &41BF
2107  F0 03              ..   BEQ &210C
2109  4C C5 21           L.!  JMP &21C5
.addr210C
210C  20 60 21            `!  JSR &2160
210F  20 B1 43            .C  JSR &43B1
2112  A9 FA              ..   LDA #&FA
2114  4C E4 36           L.6  JMP &36E4
.addr2117
2117  A5 30              .0   LDA &30
2119  D0 35              .5   BNE &2150
211B  A5 66              .f   LDA &66
211D  0A                 .    ASL A
211E  30 E2              0.   BMI &2102
2120  4A                 J    LSR A
2121  AA                 .    TAX
2122  BD 95 16           ...  LDA &1695,X
2125  85 22              ."   STA &22
2127  BD 96 16           ...  LDA &1696,X
212A  20 09 24            .$  JSR &2409
212D  A5 D4              ..   LDA &D4
212F  05 D7              ..   ORA &D7
2131  05 DA              ..   ORA &DA
2133  29 7F              )   AND #&7F
2135  05 D3              ..   ORA &D3
2137  05 D6              ..   ORA &D6
2139  05 D9              ..   ORA &D9
213B  D0 29              .)   BNE &2166
213D  A5 66              .f   LDA &66
213F  C9 82              ..   CMP #&82
2141  F0 0D              ..   BEQ &2150
2143  A0 1F              ..   LDY #&1F
2145  B1 22              ."   LDA (&22),Y
2147  2C 6E 21           ,n!  BIT &216E
214A  D0 04              ..   BNE &2150
214C  09 80              ..   ORA #&80
214E  91 22              ."   STA (&22),Y
.addr2150
2150  A5 46              .F   LDA &46
2152  05 49              .I   ORA &49
2154  05 4C              .L   ORA &4C
2156  D0 05              ..   BNE &215D
2158  A9 50              .P   LDA #&50
215A  20 E4 36            .6  JSR &36E4
.addr215D
215D  20 CE 43            .C  JSR &43CE
.addr2160
2160  06 65              .e   ASL &65
2162  38                 8    SEC
2163  66 65              fe   ROR &65
.addr2165
2165  60                 `    RTS
.addr2166
2166  20 86 3F            .?  JSR &3F86
2169  C9 10              ..   CMP #&10
216B  B0 07              ..   BCS &2174
216D  A0 20              .    LDY #&20
216F  B1 22              ."   LDA (&22),Y
2171  4A                 J    LSR A
2172  B0 03              ..   BCS &2177
.addr2174
2174  4C 1A 22           L."  JMP &221A
.addr2177
2177  4C 13 38           L.8  JMP &3813
.addr217A
217A  A0 03              ..   LDY #&03
217C  84 99              ..   STY &99
217E  C8                 .    INY
217F  84 9A              ..   STY &9A
2181  A9 16              ..   LDA #&16
2183  85 94              ..   STA &94
2185  E0 01              ..   CPX #&01
2187  F0 8E              ..   BEQ &2117
2189  E0 02              ..   CPX #&02
218B  D0 2E              ..   BNE &21BB
218D  A5 6A              .j   LDA &6A
218F  29 04              ).   AND #&04
2191  D0 13              ..   BNE &21A6
2193  AD 28 03           .(.  LDA &0328
2196  D0 CD              ..   BNE &2165
2198  20 86 3F            .?  JSR &3F86
219B  C9 FD              ..   CMP #&FD
219D  90 C6              ..   BCC &2165
219F  29 01              ).   AND #&01
21A1  69 08              i.   ADC #&08
21A3  AA                 .    TAX
21A4  D0 10              ..   BNE &21B6
.addr21A6
21A6  20 86 3F            .?  JSR &3F86
21A9  C9 F0              ..   CMP #&F0
21AB  90 B8              ..   BCC &2165
21AD  AD 2E 03           ...  LDA &032E
21B0  C9 04              ..   CMP #&04
21B2  B0 20              .    BCS &21D4
21B4  A2 10              ..   LDX #&10
.addr21B6
21B6  A9 F1              ..   LDA #&F1
21B8  4C 92 25           L.%  JMP &2592
.addr21BB
21BB  A0 0E              ..   LDY #&0E
21BD  A5 69              .i   LDA &69
21BF  D1 1E              ..   CMP (&1E),Y
21C1  B0 02              ..   BCS &21C5
21C3  E6 69              .i   INC &69
.addr21C5
21C5  E0 1E              ..   CPX #&1E
21C7  D0 0C              ..   BNE &21D5
21C9  AD 3B 03           .;.  LDA &033B
21CC  D0 07              ..   BNE &21D5
21CE  46 66              Ff   LSR &66
21D0  06 66              .f   ASL &66
21D2  46 61              Fa   LSR &61
.addr21D4
21D4  60                 `    RTS
.addr21D5
21D5  20 86 3F            .?  JSR &3F86
21D8  A5 6A              .j   LDA &6A
21DA  4A                 J    LSR A
21DB  90 04              ..   BCC &21E1
21DD  E0 64              .d   CPX #&64
21DF  B0 F3              ..   BCS &21D4
.addr21E1
21E1  4A                 J    LSR A
21E2  90 0F              ..   BCC &21F3
21E4  AE 8C 03           ...  LDX &038C
21E7  E0 28              .(   CPX #&28
21E9  90 08              ..   BCC &21F3
21EB  A5 6A              .j   LDA &6A
21ED  09 04              ..   ORA #&04
21EF  85 6A              .j   STA &6A
21F1  4A                 J    LSR A
21F2  4A                 J    LSR A
.addr21F3
21F3  4A                 J    LSR A
21F4  B0 0D              ..   BCS &2203
21F6  4A                 J    LSR A
21F7  4A                 J    LSR A
21F8  90 03              ..   BCC &21FD
21FA  4C 46 23           LF#  JMP &2346
.addr21FD
21FD  20 AE 42            .B  JSR &42AE
2200  4C 24 23           L$#  JMP &2324
.addr2203
2203  4A                 J    LSR A
2204  90 0B              ..   BCC &2211
2206  AD 20 03           . .  LDA &0320
2209  F0 06              ..   BEQ &2211
220B  A5 66              .f   LDA &66
220D  29 81              ).   AND #&81
220F  85 66              .f   STA &66
.addr2211
2211  A2 08              ..   LDX #&08
.addr2213
2213  B5 46              .F   LDA &46,X
2215  95 D2              ..   STA &D2,X
2217  CA                 .    DEX
2218  10 F9              ..   BPL &2213
.addr221A
221A  20 BD 42            .B  JSR &42BD
221D  20 DE 28            .(  JSR &28DE
2220  85 93              ..   STA &93
2222  A5 8C              ..   LDA &8C
2224  C9 01              ..   CMP #&01
2226  D0 03              ..   BNE &222B
2228  4C DD 22           L."  JMP &22DD
.addr222B
222B  C9 0E              ..   CMP #&0E
222D  D0 0C              ..   BNE &223B
222F  20 86 3F            .?  JSR &3F86
2232  C9 C8              ..   CMP #&C8
2234  90 05              ..   BCC &223B
2236  A2 17              ..   LDX #&17
2238  4C B6 21           L.!  JMP &21B6
.addr223B
223B  20 86 3F            .?  JSR &3F86
223E  C9 FA              ..   CMP #&FA
2240  90 07              ..   BCC &2249
2242  20 86 3F            .?  JSR &3F86
2245  09 68              .h   ORA #&68
2247  85 63              .c   STA &63
.addr2249
2249  A0 0E              ..   LDY #&0E
224B  B1 1E              ..   LDA (&1E),Y
224D  4A                 J    LSR A
224E  C5 69              .i   CMP &69
2250  90 42              .B   BCC &2294
2252  4A                 J    LSR A
2253  4A                 J    LSR A
2254  C5 69              .i   CMP &69
2256  90 15              ..   BCC &226D
2258  20 86 3F            .?  JSR &3F86
225B  C9 E6              ..   CMP #&E6
225D  90 0E              ..   BCC &226D
225F  A6 8C              ..   LDX &8C
2261  BD 3D 56           .=V  LDA &563D,X
2264  10 07              ..   BPL &226D
2266  A9 00              ..   LDA #&00
2268  85 66              .f   STA &66
226A  4C 8E 25           L.%  JMP &258E
.addr226D
226D  A5 65              .e   LDA &65
226F  29 07              ).   AND #&07
2271  F0 21              .!   BEQ &2294
2273  85 D1              ..   STA &D1
2275  20 86 3F            .?  JSR &3F86
2278  29 1F              ).   AND #&1F
227A  C5 D1              ..   CMP &D1
227C  B0 16              ..   BCS &2294
227E  A5 30              .0   LDA &30
2280  D0 12              ..   BNE &2294
2282  C6 65              .e   DEC &65
2284  A5 8C              ..   LDA &8C
2286  C9 1D              ..   CMP #&1D
2288  D0 07              ..   BNE &2291
228A  A2 1E              ..   LDX #&1E
228C  A5 66              .f   LDA &66
228E  4C 92 25           L.%  JMP &2592
.addr2291
2291  4C BE 43           L.C  JMP &43BE
.addr2294
2294  A9 00              ..   LDA #&00
2296  20 BF 41            .A  JSR &41BF
2299  29 E0              ).   AND #&E0
229B  D0 29              .)   BNE &22C6
229D  A6 93              ..   LDX &93
229F  E0 A0              ..   CPX #&A0
22A1  90 23              .#   BCC &22C6
22A3  A0 13              ..   LDY #&13
22A5  B1 1E              ..   LDA (&1E),Y
22A7  29 F8              ).   AND #&F8
22A9  F0 1B              ..   BEQ &22C6
22AB  A5 65              .e   LDA &65
22AD  09 40              .@   ORA #&40
22AF  85 65              .e   STA &65
22B1  E0 A3              ..   CPX #&A3
22B3  90 11              ..   BCC &22C6
22B5  B1 1E              ..   LDA (&1E),Y
22B7  4A                 J    LSR A
22B8  20 E4 36            .6  JSR &36E4
22BB  C6 62              .b   DEC &62
22BD  A5 30              .0   LDA &30
22BF  D0 50              .P   BNE &2311
22C1  A9 08              ..   LDA #&08
22C3  4C F3 43           L.C  JMP &43F3
.addr22C6
22C6  A5 4D              .M   LDA &4D
22C8  C9 03              ..   CMP #&03
22CA  B0 08              ..   BCS &22D4
22CC  A5 47              .G   LDA &47
22CE  05 4A              .J   ORA &4A
22D0  29 FE              ).   AND #&FE
22D2  F0 12              ..   BEQ &22E6
.addr22D4
22D4  20 86 3F            .?  JSR &3F86
22D7  09 80              ..   ORA #&80
22D9  C5 66              .f   CMP &66
22DB  B0 09              ..   BCS &22E6
.addr22DD
22DD  20 5D 24            ]$  JSR &245D
22E0  A5 93              ..   LDA &93
22E2  49 80              I.   EOR #&80
.addr22E4
22E4  85 93              ..   STA &93
.addr22E6
22E6  A0 10              ..   LDY #&10
22E8  20 E0 28            .(  JSR &28E0
22EB  AA                 .    TAX
22EC  20 32 23            2#  JSR &2332
22EF  85 64              .d   STA &64
22F1  A5 63              .c   LDA &63
22F3  0A                 .    ASL A
22F4  C9 20              .    CMP #&20
22F6  B0 0D              ..   BCS &2305
22F8  A0 16              ..   LDY #&16
22FA  20 E0 28            .(  JSR &28E0
22FD  AA                 .    TAX
22FE  45 64              Ed   EOR &64
2300  20 32 23            2#  JSR &2332
2303  85 63              .c   STA &63
.addr2305
2305  A5 93              ..   LDA &93
2307  30 09              0.   BMI &2312
2309  C5 94              ..   CMP &94
230B  90 05              ..   BCC &2312
230D  A9 03              ..   LDA #&03
230F  85 62              .b   STA &62
.addr2311
2311  60                 `    RTS
.addr2312
2312  29 7F              )   AND #&7F
2314  C9 12              ..   CMP #&12
2316  90 0B              ..   BCC &2323
2318  A9 FF              ..   LDA #&FF
231A  A6 8C              ..   LDX &8C
231C  E0 01              ..   CPX #&01
231E  D0 01              ..   BNE &2321
2320  0A                 .    ASL A
.addr2321
2321  85 62              .b   STA &62
.addr2323
2323  60                 `    RTS
.addr2324
2324  20 DE 28            .(  JSR &28DE
2327  C9 98              ..   CMP #&98
2329  90 04              ..   BCC &232F
232B  A2 00              ..   LDX #&00
232D  86 9A              ..   STX &9A
.addr232F
232F  4C E4 22           L."  JMP &22E4
.addr2332
2332  49 80              I.   EOR #&80
2334  29 80              ).   AND #&80
2336  85 D1              ..   STA &D1
2338  8A                 .    TXA
2339  0A                 .    ASL A
233A  C5 9A              ..   CMP &9A
233C  90 05              ..   BCC &2343
233E  A5 99              ..   LDA &99
2340  05 D1              ..   ORA &D1
2342  60                 `    RTS
.addr2343
2343  A5 D1              ..   LDA &D1
2345  60                 `    RTS
.addr2346
2346  A9 06              ..   LDA #&06
2348  85 9A              ..   STA &9A
234A  4A                 J    LSR A
234B  85 99              ..   STA &99
234D  A9 1D              ..   LDA #&1D
234F  85 94              ..   STA &94
2351  AD 20 03           . .  LDA &0320
2354  D0 03              ..   BNE &2359
.addr2356
2356  4C FD 21           L.!  JMP &21FD
.addr2359
2359  20 03 24            .$  JSR &2403
235C  A5 D4              ..   LDA &D4
235E  05 D7              ..   ORA &D7
2360  05 DA              ..   ORA &DA
2362  29 7F              )   AND #&7F
2364  D0 F0              ..   BNE &2356
2366  20 E0 42            .B  JSR &42E0
2369  A5 81              ..   LDA &81
236B  85 40              .@   STA &40
236D  20 BD 42            .B  JSR &42BD
2370  A0 0A              ..   LDY #&0A
2372  20 3B 24            ;$  JSR &243B
2375  30 23              0#   BMI &239A
2377  C9 23              .#   CMP #&23
2379  90 1F              ..   BCC &239A
237B  20 DE 28            .(  JSR &28DE
237E  C9 A2              ..   CMP #&A2
2380  B0 32              .2   BCS &23B4
2382  A5 40              .@   LDA &40
2384  C9 9D              ..   CMP #&9D
2386  90 04              ..   BCC &238C
2388  A5 8C              ..   LDA &8C
238A  30 28              0(   BMI &23B4
.addr238C
238C  20 5D 24            ]$  JSR &245D
238F  20 24 23            $#  JSR &2324
.addr2392
2392  A2 00              ..   LDX #&00
2394  86 62              .b   STX &62
2396  E8                 .    INX
2397  86 61              .a   STX &61
2399  60                 `    RTS
.addr239A
239A  20 03 24            .$  JSR &2403
239D  20 70 24            p$  JSR &2470
23A0  20 70 24            p$  JSR &2470
23A3  20 BD 42            .B  JSR &42BD
23A6  20 5D 24            ]$  JSR &245D
23A9  4C 24 23           L$#  JMP &2324
.addr23AC
23AC  E6 62              .b   INC &62
23AE  A9 7F              .   LDA #&7F
23B0  85 63              .c   STA &63
23B2  D0 45              .E   BNE &23F9
.addr23B4
23B4  A2 00              ..   LDX #&00
23B6  86 9A              ..   STX &9A
23B8  86 64              .d   STX &64
23BA  A5 8C              ..   LDA &8C
23BC  10 20              .    BPL &23DE
23BE  45 34              E4   EOR &34
23C0  45 35              E5   EOR &35
23C2  0A                 .    ASL A
23C3  A9 02              ..   LDA #&02
23C5  6A                 j    ROR A
23C6  85 63              .c   STA &63
23C8  A5 34              .4   LDA &34
23CA  0A                 .    ASL A
23CB  C9 0C              ..   CMP #&0C
23CD  B0 C3              ..   BCS &2392
23CF  A5 35              .5   LDA &35
23D1  0A                 .    ASL A
23D2  A9 02              ..   LDA #&02
23D4  6A                 j    ROR A
23D5  85 64              .d   STA &64
23D7  A5 35              .5   LDA &35
23D9  0A                 .    ASL A
23DA  C9 0C              ..   CMP #&0C
23DC  B0 B4              ..   BCS &2392
.addr23DE
23DE  86 63              .c   STX &63
23E0  A5 5C              .\   LDA &5C
23E2  85 34              .4   STA &34
23E4  A5 5E              .^   LDA &5E
23E6  85 35              .5   STA &35
23E8  A5 60              .`   LDA &60
23EA  85 36              .6   STA &36
23EC  A0 10              ..   LDY #&10
23EE  20 3B 24            ;$  JSR &243B
23F1  0A                 .    ASL A
23F2  C9 42              .B   CMP #&42
23F4  B0 B6              ..   BCS &23AC
23F6  20 92 23            .#  JSR &2392
.addr23F9
23F9  A5 DC              ..   LDA &DC
23FB  D0 05              ..   BNE &2402
23FD  06 6A              .j   ASL &6A
23FF  38                 8    SEC
2400  66 6A              fj   ROR &6A
.addr2402
2402  60                 `    RTS
.addr2403
2403  A9 25              .%   LDA #&25
2405  85 22              ."   STA &22
2407  A9 09              ..   LDA #&09
.addr2409
2409  85 23              .#   STA &23
240B  A0 02              ..   LDY #&02
240D  20 17 24            .$  JSR &2417
2410  A0 05              ..   LDY #&05
2412  20 17 24            .$  JSR &2417
2415  A0 08              ..   LDY #&08
.addr2417
2417  B1 22              ."   LDA (&22),Y
2419  49 80              I.   EOR #&80
241B  85 43              .C   STA &43
241D  88                 .    DEY
241E  B1 22              ."   LDA (&22),Y
2420  85 42              .B   STA &42
2422  88                 .    DEY
2423  B1 22              ."   LDA (&22),Y
2425  85 41              .A   STA &41
2427  84 80              ..   STY &80
2429  A6 80              ..   LDX &80
242B  20 4C 1D            L.  JSR &1D4C
242E  A4 80              ..   LDY &80
2430  95 D4              ..   STA &D4,X
2432  A5 42              .B   LDA &42
2434  95 D3              ..   STA &D3,X
2436  A5 41              .A   LDA &41
2438  95 D2              ..   STA &D2,X
243A  60                 `    RTS
.addr243B
243B  BE 25 09           .%.  LDX &0925,Y
243E  86 81              ..   STX &81
2440  A5 34              .4   LDA &34
2442  20 D4 28            .(  JSR &28D4
2445  BE 27 09           .'.  LDX &0927,Y
2448  86 81              ..   STX &81
244A  A5 35              .5   LDA &35
244C  20 FC 28            .(  JSR &28FC
244F  85 83              ..   STA &83
2451  86 82              ..   STX &82
2453  BE 29 09           .).  LDX &0929,Y
2456  86 81              ..   STX &81
2458  A5 36              .6   LDA &36
245A  4C FC 28           L.(  JMP &28FC
.addr245D
245D  A5 34              .4   LDA &34
245F  49 80              I.   EOR #&80
2461  85 34              .4   STA &34
2463  A5 35              .5   LDA &35
2465  49 80              I.   EOR #&80
2467  85 35              .5   STA &35
2469  A5 36              .6   LDA &36
246B  49 80              I.   EOR #&80
246D  85 36              .6   STA &36
246F  60                 `    RTS
.addr2470
2470  20 73 24            s$  JSR &2473
.addr2473
2473  AD 2F 09           ./.  LDA &092F
2476  A2 00              ..   LDX #&00
2478  20 88 24            .$  JSR &2488
247B  AD 31 09           .1.  LDA &0931
247E  A2 03              ..   LDX #&03
2480  20 88 24            .$  JSR &2488
2483  AD 33 09           .3.  LDA &0933
2486  A2 06              ..   LDX #&06
.addr2488
2488  0A                 .    ASL A
2489  85 82              ..   STA &82
248B  A9 00              ..   LDA #&00
248D  6A                 j    ROR A
248E  49 80              I.   EOR #&80
2490  55 D4              U.   EOR &D4,X
2492  30 0B              0.   BMI &249F
2494  A5 82              ..   LDA &82
2496  75 D2              u.   ADC &D2,X
2498  95 D2              ..   STA &D2,X
249A  90 02              ..   BCC &249E
249C  F6 D3              ..   INC &D3,X
.addr249E
249E  60                 `    RTS
.addr249F
249F  B5 D2              ..   LDA &D2,X
24A1  38                 8    SEC
24A2  E5 82              ..   SBC &82
24A4  95 D2              ..   STA &D2,X
24A6  B5 D3              ..   LDA &D3,X
24A8  E9 00              ..   SBC #&00
24AA  95 D3              ..   STA &D3,X
24AC  B0 F0              ..   BCS &249E
24AE  B5 D2              ..   LDA &D2,X
24B0  49 FF              I.   EOR #&FF
24B2  69 01              i.   ADC #&01
24B4  95 D2              ..   STA &D2,X
24B6  B5 D3              ..   LDA &D3,X
24B8  49 FF              I.   EOR #&FF
24BA  69 00              i.   ADC #&00
24BC  95 D3              ..   STA &D3,X
24BE  B5 D4              ..   LDA &D4,X
24C0  49 80              I.   EOR #&80
24C2  95 D4              ..   STA &D4,X
24C4  4C 9E 24           L.$  JMP &249E
.addr24C7
24C7  18                 .    CLC
24C8  A5 4E              .N   LDA &4E
24CA  D0 39              .9   BNE &2505
24CC  A5 8C              ..   LDA &8C
24CE  30 35              05   BMI &2505
24D0  A5 65              .e   LDA &65
24D2  29 20              )    AND #&20
24D4  05 47              .G   ORA &47
24D6  05 4A              .J   ORA &4A
24D8  D0 2B              .+   BNE &2505
24DA  A5 46              .F   LDA &46
24DC  20 0D 28            .(  JSR &280D
24DF  85 83              ..   STA &83
24E1  A5 1B              ..   LDA &1B
24E3  85 82              ..   STA &82
24E5  A5 49              .I   LDA &49
24E7  20 0D 28            .(  JSR &280D
24EA  AA                 .    TAX
24EB  A5 1B              ..   LDA &1B
24ED  65 82              e.   ADC &82
24EF  85 82              ..   STA &82
24F1  8A                 .    TXA
24F2  65 83              e.   ADC &83
24F4  B0 10              ..   BCS &2506
24F6  85 83              ..   STA &83
24F8  A0 02              ..   LDY #&02
24FA  B1 1E              ..   LDA (&1E),Y
24FC  C5 83              ..   CMP &83
24FE  D0 05              ..   BNE &2505
2500  88                 .    DEY
2501  B1 1E              ..   LDA (&1E),Y
2503  C5 82              ..   CMP &82
.addr2505
2505  60                 `    RTS
.addr2506
2506  18                 .    CLC
2507  60                 `    RTS
.addr2508
2508  20 26 3F            &?  JSR &3F26
250B  A9 1C              ..   LDA #&1C
250D  85 49              .I   STA &49
250F  4A                 J    LSR A
2510  85 4C              .L   STA &4C
2512  A9 80              ..   LDA #&80
2514  85 4B              .K   STA &4B
2516  A5 45              .E   LDA &45
2518  0A                 .    ASL A
2519  09 80              ..   ORA #&80
251B  85 66              .f   STA &66
.addr251D
251D  A9 60              .`   LDA #&60
251F  85 54              .T   STA &54
2521  09 80              ..   ORA #&80
2523  85 5C              .\   STA &5C
2525  A5 7D              .}   LDA &7D
2527  2A                 *    ROL A
2528  85 61              .a   STA &61
252A  8A                 .    TXA
252B  4C 68 37           Lh7  JMP &3768
.addr252E
252E  A2 01              ..   LDX #&01
2530  20 08 25            .%  JSR &2508
2533  90 54              .T   BCC &2589
2535  A6 45              .E   LDX &45
2537  20 32 37            27  JSR &3732
253A  BD 11 03           ...  LDA &0311,X
253D  20 4D 25            M%  JSR &254D
2540  A0 00              ..   LDY #&00
2542  20 05 38            .8  JSR &3805
2545  CE 8B 03           ...  DEC &038B
2548  A9 30              .0   LDA #&30
254A  4C F3 43           L.C  JMP &43F3
.addr254D
254D  C9 02              ..   CMP #&02
254F  F0 2F              ./   BEQ &2580
2551  A0 24              .$   LDY #&24
2553  B1 20              .    LDA (&20),Y
2555  29 20              )    AND #&20
2557  F0 03              ..   BEQ &255C
2559  20 80 25            .%  JSR &2580
.addr255C
255C  A0 20              .    LDY #&20
255E  B1 20              .    LDA (&20),Y
2560  F0 A3              ..   BEQ &2505
2562  09 80              ..   ORA #&80
2564  91 20              .    STA (&20),Y
2566  A0 1C              ..   LDY #&1C
2568  A9 02              ..   LDA #&02
256A  91 20              .    STA (&20),Y
256C  0A                 .    ASL A
256D  A0 1E              ..   LDY #&1E
256F  91 20              .    STA (&20),Y
2571  A5 8C              ..   LDA &8C
2573  C9 0B              ..   CMP #&0B
2575  90 08              ..   BCC &257F
2577  A0 24              .$   LDY #&24
2579  B1 20              .    LDA (&20),Y
257B  09 04              ..   ORA #&04
257D  91 20              .    STA (&20),Y
.addr257F
257F  60                 `    RTS
.addr2580
2580  AD 49 09           .I.  LDA &0949
2583  09 04              ..   ORA #&04
2585  8D 49 09           .I.  STA &0949
2588  60                 `    RTS
.addr2589
2589  A9 C9              ..   LDA #&C9
258B  4C C6 45           L.E  JMP &45C6
.addr258E
258E  A2 03              ..   LDX #&03
.addr2590
2590  A9 FE              ..   LDA #&FE
.addr2592
2592  85 06              ..   STA &06
2594  8A                 .    TXA
2595  48                 H    PHA
2596  A5 1E              ..   LDA &1E
2598  48                 H    PHA
2599  A5 1F              ..   LDA &1F
259B  48                 H    PHA
259C  A5 20              .    LDA &20
259E  48                 H    PHA
259F  A5 21              .!   LDA &21
25A1  48                 H    PHA
25A2  A0 24              .$   LDY #&24
.addr25A4
25A4  B9 46 00           .F.  LDA &0046,Y
25A7  99 00 01           ...  STA &0100,Y
25AA  B1 20              .    LDA (&20),Y
25AC  99 46 00           .F.  STA &0046,Y
25AF  88                 .    DEY
25B0  10 F2              ..   BPL &25A4
25B2  A5 6A              .j   LDA &6A
25B4  29 1C              ).   AND #&1C
25B6  85 6A              .j   STA &6A
25B8  A5 8C              ..   LDA &8C
25BA  C9 02              ..   CMP #&02
25BC  D0 1D              ..   BNE &25DB
25BE  8A                 .    TXA
25BF  48                 H    PHA
25C0  A9 20              .    LDA #&20
25C2  85 61              .a   STA &61
25C4  A2 00              ..   LDX #&00
25C6  A5 50              .P   LDA &50
25C8  20 1A 26            .&  JSR &261A
25CB  A2 03              ..   LDX #&03
25CD  A5 52              .R   LDA &52
25CF  20 1A 26            .&  JSR &261A
25D2  A2 06              ..   LDX #&06
25D4  A5 54              .T   LDA &54
25D6  20 1A 26            .&  JSR &261A
25D9  68                 h    PLA
25DA  AA                 .    TAX
.addr25DB
25DB  A5 06              ..   LDA &06
25DD  85 66              .f   STA &66
25DF  46 63              Fc   LSR &63
25E1  06 63              .c   ASL &63
25E3  8A                 .    TXA
25E4  C9 09              ..   CMP #&09
25E6  B0 16              ..   BCS &25FE
25E8  C9 04              ..   CMP #&04
25EA  90 12              ..   BCC &25FE
25EC  48                 H    PHA
25ED  20 86 3F            .?  JSR &3F86
25F0  0A                 .    ASL A
25F1  85 64              .d   STA &64
25F3  8A                 .    TXA
25F4  29 0F              ).   AND #&0F
25F6  85 61              .a   STA &61
25F8  A9 FF              ..   LDA #&FF
25FA  6A                 j    ROR A
25FB  85 63              .c   STA &63
25FD  68                 h    PLA
.addr25FE
25FE  20 68 37            h7  JSR &3768
2601  68                 h    PLA
2602  85 21              .!   STA &21
2604  68                 h    PLA
2605  85 20              .    STA &20
2607  A2 24              .$   LDX #&24
.addr2609
2609  BD 00 01           ...  LDA &0100,X
260C  95 46              .F   STA &46,X
260E  CA                 .    DEX
260F  10 F8              ..   BPL &2609
2611  68                 h    PLA
2612  85 1F              ..   STA &1F
2614  68                 h    PLA
2615  85 1E              ..   STA &1E
2617  68                 h    PLA
2618  AA                 .    TAX
2619  60                 `    RTS
.addr261A
261A  0A                 .    ASL A
261B  85 82              ..   STA &82
261D  A9 00              ..   LDA #&00
261F  6A                 j    ROR A
2620  4C 4C 52           LLR  JMP &524C
.addr2623
2623  A9 38              .8   LDA #&38
2625  20 F3 43            .C  JSR &43F3
2628  A9 01              ..   LDA #&01
262A  8D 48 03           .H.  STA &0348
262D  A9 04              ..   LDA #&04
262F  20 3D 26            =&  JSR &263D
2632  CE 48 03           .H.  DEC &0348
2635  60                 `    RTS
.addr2636
2636  A9 30              .0   LDA #&30
2638  20 F3 43            .C  JSR &43F3
263B  A9 08              ..   LDA #&08
.addr263D
263D  85 95              ..   STA &95
263F  20 CA 54            .T  JSR &54CA
.addr2642
2642  A2 80              ..   LDX #&80
2644  86 D2              ..   STX &D2
2646  A2 60              .`   LDX #&60
2648  86 E0              ..   STX &E0
264A  A2 00              ..   LDX #&00
264C  86 96              ..   STX &96
264E  86 D3              ..   STX &D3
2650  86 E1              ..   STX &E1
.addr2652
2652  20 5E 26            ^&  JSR &265E
2655  E6 96              ..   INC &96
2657  A6 96              ..   LDX &96
2659  E0 08              ..   CPX #&08
265B  D0 F5              ..   BNE &2652
265D  60                 `    RTS
.addr265E
265E  A5 96              ..   LDA &96
2660  29 07              ).   AND #&07
2662  18                 .    CLC
2663  69 08              i.   ADC #&08
2665  85 40              .@   STA &40
.addr2667
2667  A9 01              ..   LDA #&01
2669  85 6B              .k   STA &6B
266B  20 90 3B            .;  JSR &3B90
266E  06 40              .@   ASL &40
2670  B0 06              ..   BCS &2678
2672  A5 40              .@   LDA &40
2674  C9 A0              ..   CMP #&A0
2676  90 EF              ..   BCC &2667
.addr2678
2678  60                 `    RTS
.addr2679
2679  A9 00              ..   LDA #&00
267B  E0 02              ..   CPX #&02
267D  6A                 j    ROR A
267E  85 99              ..   STA &99
2680  49 80              I.   EOR #&80
2682  85 9A              ..   STA &9A
2684  20 2D 27            -'  JSR &272D
2687  AC C3 03           ...  LDY &03C3
.addr268A
268A  B9 A8 0F           ...  LDA &0FA8,Y
268D  85 88              ..   STA &88
268F  4A                 J    LSR A
2690  4A                 J    LSR A
2691  4A                 J    LSR A
2692  20 61 29            a)  JSR &2961
2695  A5 1B              ..   LDA &1B
2697  45 9A              E.   EOR &9A
2699  85 83              ..   STA &83
269B  B9 6F 0F           .o.  LDA &0F6F,Y
269E  85 1B              ..   STA &1B
26A0  B9 5C 0F           .\.  LDA &0F5C,Y
26A3  85 34              .4   STA &34
26A5  20 FF 28            .(  JSR &28FF
26A8  85 83              ..   STA &83
26AA  86 82              ..   STX &82
26AC  B9 82 0F           ...  LDA &0F82,Y
26AF  85 35              .5   STA &35
26B1  45 7B              E{   EOR &7B
26B3  A6 2B              .+   LDX &2B
26B5  20 C8 27            .'  JSR &27C8
26B8  20 FF 28            .(  JSR &28FF
26BB  86 24              .$   STX &24
26BD  85 25              .%   STA &25
26BF  BE 95 0F           ...  LDX &0F95,Y
26C2  86 82              ..   STX &82
26C4  A6 35              .5   LDX &35
26C6  86 83              ..   STX &83
26C8  A6 2B              .+   LDX &2B
26CA  45 7C              E|   EOR &7C
26CC  20 C8 27            .'  JSR &27C8
26CF  20 FF 28            .(  JSR &28FF
26D2  86 26              .&   STX &26
26D4  85 27              .'   STA &27
26D6  A6 31              .1   LDX &31
26D8  45 32              E2   EOR &32
26DA  20 C8 27            .'  JSR &27C8
26DD  85 81              ..   STA &81
26DF  A5 24              .$   LDA &24
26E1  85 82              ..   STA &82
26E3  A5 25              .%   LDA &25
26E5  85 83              ..   STA &83
26E7  49 80              I.   EOR #&80
26E9  20 FC 28            .(  JSR &28FC
26EC  85 25              .%   STA &25
26EE  8A                 .    TXA
26EF  99 6F 0F           .o.  STA &0F6F,Y
26F2  A5 26              .&   LDA &26
26F4  85 82              ..   STA &82
26F6  A5 27              .'   LDA &27
26F8  85 83              ..   STA &83
26FA  20 FC 28            .(  JSR &28FC
26FD  85 83              ..   STA &83
26FF  86 82              ..   STX &82
2701  A9 00              ..   LDA #&00
2703  85 1B              ..   STA &1B
2705  A5 8D              ..   LDA &8D
2707  20 07 19            ..  JSR &1907
270A  A5 25              .%   LDA &25
270C  99 5C 0F           .\.  STA &0F5C,Y
270F  85 34              .4   STA &34
2711  29 7F              )   AND #&7F
2713  C9 74              .t   CMP #&74
2715  B0 31              .1   BCS &2748
2717  A5 27              .'   LDA &27
2719  99 82 0F           ...  STA &0F82,Y
271C  85 35              .5   STA &35
271E  29 7F              )   AND #&7F
2720  C9 74              .t   CMP #&74
2722  B0 37              .7   BCS &275B
.addr2724
2724  20 10 19            ..  JSR &1910
2727  88                 .    DEY
2728  F0 03              ..   BEQ &272D
272A  4C 8A 26           L.&  JMP &268A
.addr272D
272D  A5 8D              ..   LDA &8D
272F  45 99              E.   EOR &99
2731  85 8D              ..   STA &8D
2733  A5 32              .2   LDA &32
2735  45 99              E.   EOR &99
2737  85 32              .2   STA &32
2739  49 80              I.   EOR #&80
273B  85 33              .3   STA &33
273D  A5 7B              .{   LDA &7B
273F  45 99              E.   EOR &99
2741  85 7B              .{   STA &7B
2743  49 80              I.   EOR #&80
2745  85 7C              .|   STA &7C
2747  60                 `    RTS
.addr2748
2748  20 86 3F            .?  JSR &3F86
274B  85 35              .5   STA &35
274D  99 82 0F           ...  STA &0F82,Y
2750  A9 73              .s   LDA #&73
2752  05 99              ..   ORA &99
2754  85 34              .4   STA &34
2756  99 5C 0F           .\.  STA &0F5C,Y
2759  D0 11              ..   BNE &276C
.addr275B
275B  20 86 3F            .?  JSR &3F86
275E  85 34              .4   STA &34
2760  99 5C 0F           .\.  STA &0F5C,Y
2763  A9 6E              .n   LDA #&6E
2765  05 33              .3   ORA &33
2767  85 35              .5   STA &35
2769  99 82 0F           ...  STA &0F82,Y
.addr276C
276C  20 86 3F            .?  JSR &3F86
276F  09 08              ..   ORA #&08
2771  85 88              ..   STA &88
2773  99 A8 0F           ...  STA &0FA8,Y
2776  D0 AC              ..   BNE &2724
.addr2778
2778  85 40              .@   STA &40
277A  85 41              .A   STA &41
277C  85 42              .B   STA &42
277E  85 43              .C   STA &43
2780  18                 .    CLC
2781  60                 `    RTS
.addr2782
2782  85 82              ..   STA &82
2784  29 7F              )   AND #&7F
2786  85 42              .B   STA &42
2788  A5 81              ..   LDA &81
278A  29 7F              )   AND #&7F
278C  F0 EA              ..   BEQ &2778
278E  38                 8    SEC
278F  E9 01              ..   SBC #&01
2791  85 D1              ..   STA &D1
2793  A5 1C              ..   LDA &1C
2795  46 42              FB   LSR &42
2797  6A                 j    ROR A
2798  85 41              .A   STA &41
279A  A5 1B              ..   LDA &1B
279C  6A                 j    ROR A
279D  85 40              .@   STA &40
279F  A9 00              ..   LDA #&00
27A1  A2 18              ..   LDX #&18
.addr27A3
27A3  90 02              ..   BCC &27A7
27A5  65 D1              e.   ADC &D1
.addr27A7
27A7  6A                 j    ROR A
27A8  66 42              fB   ROR &42
27AA  66 41              fA   ROR &41
27AC  66 40              f@   ROR &40
27AE  CA                 .    DEX
27AF  D0 F2              ..   BNE &27A3
27B1  85 D1              ..   STA &D1
27B3  A5 82              ..   LDA &82
27B5  45 81              E.   EOR &81
27B7  29 80              ).   AND #&80
27B9  05 D1              ..   ORA &D1
27BB  85 43              .C   STA &43
27BD  60                 `    RTS
.addr27BE
27BE  A6 24              .$   LDX &24
27C0  86 82              ..   STX &82
27C2  A6 25              .%   LDX &25
27C4  86 83              ..   STX &83
.addr27C6
27C6  A6 31              .1   LDX &31
.addr27C8
27C8  86 1B              ..   STX &1B
27CA  AA                 .    TAX
27CB  29 80              ).   AND #&80
27CD  85 D1              ..   STA &D1
27CF  8A                 .    TXA
27D0  29 7F              )   AND #&7F
27D2  F0 64              .d   BEQ &2838
27D4  AA                 .    TAX
27D5  CA                 .    DEX
27D6  86 06              ..   STX &06
27D8  A9 00              ..   LDA #&00
27DA  46 1B              F.   LSR &1B
27DC  90 02              ..   BCC &27E0
27DE  65 06              e.   ADC &06
.addr27E0
27E0  6A                 j    ROR A
27E1  66 1B              f.   ROR &1B
27E3  90 02              ..   BCC &27E7
27E5  65 06              e.   ADC &06
.addr27E7
27E7  6A                 j    ROR A
27E8  66 1B              f.   ROR &1B
27EA  90 02              ..   BCC &27EE
27EC  65 06              e.   ADC &06
.addr27EE
27EE  6A                 j    ROR A
27EF  66 1B              f.   ROR &1B
27F1  90 02              ..   BCC &27F5
27F3  65 06              e.   ADC &06
.addr27F5
27F5  6A                 j    ROR A
27F6  66 1B              f.   ROR &1B
27F8  90 02              ..   BCC &27FC
27FA  65 06              e.   ADC &06
.addr27FC
27FC  6A                 j    ROR A
27FD  66 1B              f.   ROR &1B
27FF  4A                 J    LSR A
2800  66 1B              f.   ROR &1B
2802  4A                 J    LSR A
2803  66 1B              f.   ROR &1B
2805  4A                 J    LSR A
2806  66 1B              f.   ROR &1B
2808  05 D1              ..   ORA &D1
280A  60                 `    RTS
.addr280B
280B  29 7F              )   AND #&7F
.addr280D
280D  85 1B              ..   STA &1B
280F  AA                 .    TAX
2810  D0 12              ..   BNE &2824
.addr2812
2812  18                 .    CLC
2813  86 1B              ..   STX &1B
2815  8A                 .    TXA
2816  60                 `    RTS
.addr2817
2817  B9 82 0F           ...  LDA &0F82,Y
281A  85 35              .5   STA &35
.addr281C
281C  29 7F              )   AND #&7F
281E  85 1B              ..   STA &1B
.addr2820
2820  A6 81              ..   LDX &81
2822  F0 EE              ..   BEQ &2812
.addr2824
2824  CA                 .    DEX
2825  86 D1              ..   STX &D1
2827  A9 00              ..   LDA #&00
2829  A2 08              ..   LDX #&08
282B  46 1B              F.   LSR &1B
.addr282D
282D  90 02              ..   BCC &2831
282F  65 D1              e.   ADC &D1
.addr2831
2831  6A                 j    ROR A
2832  66 1B              f.   ROR &1B
2834  CA                 .    DEX
2835  D0 F6              ..   BNE &282D
2837  60                 `    RTS
.addr2838
2838  85 1C              ..   STA &1C
283A  85 1B              ..   STA &1B
283C  60                 `    RTS
.addr283D
283D  29 1F              ).   AND #&1F
283F  AA                 .    TAX
2840  BD C0 07           ...  LDA &07C0,X
2843  85 81              ..   STA &81
2845  A5 40              .@   LDA &40
.addr2847
2847  49 FF              I.   EOR #&FF
2849  38                 8    SEC
284A  6A                 j    ROR A
284B  85 1B              ..   STA &1B
284D  A9 00              ..   LDA #&00
.addr284F
284F  B0 08              ..   BCS &2859
2851  65 81              e.   ADC &81
2853  6A                 j    ROR A
2854  46 1B              F.   LSR &1B
2856  D0 F7              ..   BNE &284F
2858  60                 `    RTS
.addr2859
2859  4A                 J    LSR A
285A  46 1B              F.   LSR &1B
285C  D0 F1              ..   BNE &284F
285E  60                 `    RTS
285F  A6 81              ..   LDX &81
2861  F0 AF              ..   BEQ &2812
2863  CA                 .    DEX
2864  86 D1              ..   STX &D1
2866  A9 00              ..   LDA #&00
2868  A2 08              ..   LDX #&08
286A  46 1B              F.   LSR &1B
.addr286C
286C  90 02              ..   BCC &2870
286E  65 D1              e.   ADC &D1
.addr2870
2870  6A                 j    ROR A
2871  66 1B              f.   ROR &1B
2873  CA                 .    DEX
2874  D0 F6              ..   BNE &286C
2876  60                 `    RTS
.addr2877
2877  86 81              ..   STX &81
.addr2879
2879  49 FF              I.   EOR #&FF
287B  4A                 J    LSR A
287C  85 1C              ..   STA &1C
287E  A9 00              ..   LDA #&00
2880  A2 10              ..   LDX #&10
2882  66 1B              f.   ROR &1B
.addr2884
2884  B0 0B              ..   BCS &2891
2886  65 81              e.   ADC &81
2888  6A                 j    ROR A
2889  66 1C              f.   ROR &1C
288B  66 1B              f.   ROR &1B
288D  CA                 .    DEX
288E  D0 F4              ..   BNE &2884
2890  60                 `    RTS
.addr2891
2891  4A                 J    LSR A
2892  66 1C              f.   ROR &1C
2894  66 1B              f.   ROR &1B
2896  CA                 .    DEX
2897  D0 EB              ..   BNE &2884
2899  60                 `    RTS
289A  A6 31              .1   LDX &31
289C  86 1B              ..   STX &1B
.addr289E
289E  A6 25              .%   LDX &25
28A0  86 83              ..   STX &83
.addr28A2
28A2  A6 24              .$   LDX &24
28A4  86 82              ..   STX &82
.addr28A6
28A6  AA                 .    TAX
28A7  29 7F              )   AND #&7F
28A9  4A                 J    LSR A
28AA  85 1B              ..   STA &1B
28AC  8A                 .    TXA
28AD  45 81              E.   EOR &81
28AF  29 80              ).   AND #&80
28B1  85 D1              ..   STA &D1
28B3  A5 81              ..   LDA &81
28B5  29 7F              )   AND #&7F
28B7  F0 18              ..   BEQ &28D1
28B9  AA                 .    TAX
28BA  CA                 .    DEX
28BB  86 06              ..   STX &06
28BD  A9 00              ..   LDA #&00
28BF  A2 07              ..   LDX #&07
.addr28C1
28C1  90 02              ..   BCC &28C5
28C3  65 06              e.   ADC &06
.addr28C5
28C5  6A                 j    ROR A
28C6  66 1B              f.   ROR &1B
28C8  CA                 .    DEX
28C9  D0 F6              ..   BNE &28C1
28CB  4A                 J    LSR A
28CC  66 1B              f.   ROR &1B
28CE  05 D1              ..   ORA &D1
28D0  60                 `    RTS
.addr28D1
28D1  85 1B              ..   STA &1B
28D3  60                 `    RTS
.addr28D4
28D4  20 A6 28            .(  JSR &28A6
28D7  85 83              ..   STA &83
28D9  A5 1B              ..   LDA &1B
28DB  85 82              ..   STA &82
28DD  60                 `    RTS
.addr28DE
28DE  A0 0A              ..   LDY #&0A
.addr28E0
28E0  B6 46              .F   LDX &46,Y
28E2  86 81              ..   STX &81
28E4  A5 34              .4   LDA &34
28E6  20 D4 28            .(  JSR &28D4
28E9  B6 48              .H   LDX &48,Y
28EB  86 81              ..   STX &81
28ED  A5 35              .5   LDA &35
28EF  20 FC 28            .(  JSR &28FC
28F2  85 83              ..   STA &83
28F4  86 82              ..   STX &82
28F6  B6 4A              .J   LDX &4A,Y
28F8  86 81              ..   STX &81
28FA  A5 36              .6   LDA &36
.addr28FC
28FC  20 A6 28            .(  JSR &28A6
.addr28FF
28FF  85 06              ..   STA &06
2901  29 80              ).   AND #&80
2903  85 D1              ..   STA &D1
2905  45 83              E.   EOR &83
2907  30 0D              0.   BMI &2916
2909  A5 82              ..   LDA &82
290B  18                 .    CLC
290C  65 1B              e.   ADC &1B
290E  AA                 .    TAX
290F  A5 83              ..   LDA &83
2911  65 06              e.   ADC &06
2913  05 D1              ..   ORA &D1
2915  60                 `    RTS
.addr2916
2916  A5 83              ..   LDA &83
2918  29 7F              )   AND #&7F
291A  85 80              ..   STA &80
291C  A5 1B              ..   LDA &1B
291E  38                 8    SEC
291F  E5 82              ..   SBC &82
2921  AA                 .    TAX
2922  A5 06              ..   LDA &06
2924  29 7F              )   AND #&7F
2926  E5 80              ..   SBC &80
2928  B0 0E              ..   BCS &2938
292A  85 80              ..   STA &80
292C  8A                 .    TXA
292D  49 FF              I.   EOR #&FF
292F  69 01              i.   ADC #&01
2931  AA                 .    TAX
2932  A9 00              ..   LDA #&00
2934  E5 80              ..   SBC &80
2936  09 80              ..   ORA #&80
.addr2938
2938  45 D1              E.   EOR &D1
293A  60                 `    RTS
.addr293B
293B  86 81              ..   STX &81
293D  49 80              I.   EOR #&80
293F  20 FC 28            .(  JSR &28FC
2942  AA                 .    TAX
2943  29 80              ).   AND #&80
2945  85 D1              ..   STA &D1
2947  8A                 .    TXA
2948  29 7F              )   AND #&7F
294A  A2 FE              ..   LDX #&FE
294C  86 06              ..   STX &06
.addr294E
294E  0A                 .    ASL A
294F  C9 60              .`   CMP #&60
2951  90 02              ..   BCC &2955
2953  E9 60              .`   SBC #&60
.addr2955
2955  26 06              &.   ROL &06
2957  B0 F5              ..   BCS &294E
2959  A5 06              ..   LDA &06
295B  05 D1              ..   ORA &D1
295D  60                 `    RTS
.addr295E
295E  B9 A8 0F           ...  LDA &0FA8,Y
.addr2961
2961  85 81              ..   STA &81
2963  A5 7D              .}   LDA &7D
.addr2965
2965  A2 08              ..   LDX #&08
2967  0A                 .    ASL A
2968  85 1B              ..   STA &1B
296A  A9 00              ..   LDA #&00
.addr296C
296C  2A                 *    ROL A
296D  B0 04              ..   BCS &2973
296F  C5 81              ..   CMP &81
2971  90 03              ..   BCC &2976
.addr2973
2973  E5 81              ..   SBC &81
2975  38                 8    SEC
.addr2976
2976  26 1B              &.   ROL &1B
2978  CA                 .    DEX
2979  D0 F1              ..   BNE &296C
297B  4C F3 47           L.G  JMP &47F3
.addr297E
297E  85 1D              ..   STA &1D
2980  A5 4C              .L   LDA &4C
2982  85 81              ..   STA &81
2984  A5 4D              .M   LDA &4D
2986  85 82              ..   STA &82
2988  A5 4E              .N   LDA &4E
298A  85 83              ..   STA &83
298C  A5 1B              ..   LDA &1B
298E  09 01              ..   ORA #&01
2990  85 1B              ..   STA &1B
2992  A5 1D              ..   LDA &1D
2994  45 83              E.   EOR &83
2996  29 80              ).   AND #&80
2998  85 D1              ..   STA &D1
299A  A0 00              ..   LDY #&00
299C  A5 1D              ..   LDA &1D
299E  29 7F              )   AND #&7F
.addr29A0
29A0  C9 40              .@   CMP #&40
29A2  B0 08              ..   BCS &29AC
29A4  06 1B              ..   ASL &1B
29A6  26 1C              &.   ROL &1C
29A8  2A                 *    ROL A
29A9  C8                 .    INY
29AA  D0 F4              ..   BNE &29A0
.addr29AC
29AC  85 1D              ..   STA &1D
29AE  A5 83              ..   LDA &83
29B0  29 7F              )   AND #&7F
29B2  30 08              0.   BMI &29BC
.addr29B4
29B4  88                 .    DEY
29B5  06 81              ..   ASL &81
29B7  26 82              &.   ROL &82
29B9  2A                 *    ROL A
29BA  10 F8              ..   BPL &29B4
.addr29BC
29BC  85 81              ..   STA &81
29BE  A9 FE              ..   LDA #&FE
29C0  85 82              ..   STA &82
29C2  A5 1D              ..   LDA &1D
29C4  20 F7 47            .G  JSR &47F7
29C7  A9 00              ..   LDA #&00
29C9  85 41              .A   STA &41
29CB  85 42              .B   STA &42
29CD  85 43              .C   STA &43
29CF  98                 .    TYA
29D0  10 1E              ..   BPL &29F0
29D2  A5 82              ..   LDA &82
.addr29D4
29D4  0A                 .    ASL A
29D5  26 41              &A   ROL &41
29D7  26 42              &B   ROL &42
29D9  26 43              &C   ROL &43
29DB  C8                 .    INY
29DC  D0 F6              ..   BNE &29D4
29DE  85 40              .@   STA &40
29E0  A5 43              .C   LDA &43
29E2  05 D1              ..   ORA &D1
29E4  85 43              .C   STA &43
29E6  60                 `    RTS
.addr29E7
29E7  A5 82              ..   LDA &82
29E9  85 40              .@   STA &40
29EB  A5 D1              ..   LDA &D1
29ED  85 43              .C   STA &43
29EF  60                 `    RTS
.addr29F0
29F0  F0 F5              ..   BEQ &29E7
29F2  A5 82              ..   LDA &82
.addr29F4
29F4  4A                 J    LSR A
29F5  88                 .    DEY
29F6  D0 FC              ..   BNE &29F4
29F8  85 40              .@   STA &40
29FA  A5 D1              ..   LDA &D1
29FC  85 43              .C   STA &43
29FE  60                 `    RTS
.addr29FF
29FF  AD 3F 03           .?.  LDA &033F
2A02  D0 05              ..   BNE &2A09
2A04  AD C7 03           ...  LDA &03C7
2A07  D0 0C              ..   BNE &2A15
.addr2A09
2A09  8A                 .    TXA
2A0A  10 03              ..   BPL &2A0F
2A0C  CA                 .    DEX
2A0D  30 06              0.   BMI &2A15
.addr2A0F
2A0F  E8                 .    INX
2A10  D0 03              ..   BNE &2A15
2A12  CA                 .    DEX
2A13  F0 FA              ..   BEQ &2A0F
.addr2A15
2A15  60                 `    RTS
.addr2A16
2A16  85 D1              ..   STA &D1
2A18  8A                 .    TXA
2A19  18                 .    CLC
2A1A  65 D1              e.   ADC &D1
2A1C  AA                 .    TAX
2A1D  90 02              ..   BCC &2A21
2A1F  A2 FF              ..   LDX #&FF
.addr2A21
2A21  10 10              ..   BPL &2A33
.addr2A23
2A23  A5 D1              ..   LDA &D1
2A25  60                 `    RTS
.addr2A26
2A26  85 D1              ..   STA &D1
2A28  8A                 .    TXA
2A29  38                 8    SEC
2A2A  E5 D1              ..   SBC &D1
2A2C  AA                 .    TAX
2A2D  B0 02              ..   BCS &2A31
2A2F  A2 01              ..   LDX #&01
.addr2A31
2A31  10 F0              ..   BPL &2A23
.addr2A33
2A33  AD C8 03           ...  LDA &03C8
2A36  D0 EB              ..   BNE &2A23
2A38  A2 80              ..   LDX #&80
2A3A  30 E7              0.   BMI &2A23
.addr2A3C
2A3C  A5 1B              ..   LDA &1B
2A3E  45 81              E.   EOR &81
2A40  85 06              ..   STA &06
2A42  A5 81              ..   LDA &81
2A44  F0 25              .%   BEQ &2A6B
2A46  0A                 .    ASL A
2A47  85 81              ..   STA &81
2A49  A5 1B              ..   LDA &1B
2A4B  0A                 .    ASL A
2A4C  C5 81              ..   CMP &81
2A4E  B0 09              ..   BCS &2A59
2A50  20 75 2A            u*  JSR &2A75
2A53  38                 8    SEC
.addr2A54
2A54  A6 06              ..   LDX &06
2A56  30 16              0.   BMI &2A6E
2A58  60                 `    RTS
.addr2A59
2A59  A6 81              ..   LDX &81
2A5B  85 81              ..   STA &81
2A5D  86 1B              ..   STX &1B
2A5F  8A                 .    TXA
2A60  20 75 2A            u*  JSR &2A75
2A63  85 D1              ..   STA &D1
2A65  A9 40              .@   LDA #&40
2A67  E5 D1              ..   SBC &D1
2A69  B0 E9              ..   BCS &2A54
.addr2A6B
2A6B  A9 3F              .?   LDA #&3F
2A6D  60                 `    RTS
.addr2A6E
2A6E  85 D1              ..   STA &D1
2A70  A9 80              ..   LDA #&80
2A72  E5 D1              ..   SBC &D1
2A74  60                 `    RTS
.addr2A75
2A75  20 EF 47            .G  JSR &47EF
2A78  A5 82              ..   LDA &82
2A7A  4A                 J    LSR A
2A7B  4A                 J    LSR A
2A7C  4A                 J    LSR A
2A7D  AA                 .    TAX
2A7E  BD E0 07           ...  LDA &07E0,X
.addr2A81
2A81  60                 `    RTS
.addr2A82
2A82  20 86 3F            .?  JSR &3F86
2A85  29 07              ).   AND #&07
2A87  69 5C              i\   ADC #&5C
2A89  8D CF 0F           ...  STA &0FCF
2A8C  20 86 3F            .?  JSR &3F86
2A8F  29 07              ).   AND #&07
2A91  69 7C              i|   ADC #&7C
2A93  8D CE 0F           ...  STA &0FCE
2A96  AD 47 03           .G.  LDA &0347
2A99  69 08              i.   ADC #&08
2A9B  8D 47 03           .G.  STA &0347
2A9E  20 29 36            )6  JSR &3629
.addr2AA1
2AA1  A5 87              ..   LDA &87
2AA3  D0 DC              ..   BNE &2A81
2AA5  A9 20              .    LDA #&20
2AA7  A0 E0              ..   LDY #&E0
2AA9  20 B0 2A            .*  JSR &2AB0
2AAC  A9 30              .0   LDA #&30
2AAE  A0 D0              ..   LDY #&D0
.addr2AB0
2AB0  85 36              .6   STA &36
2AB2  AD CE 0F           ...  LDA &0FCE
2AB5  85 34              .4   STA &34
2AB7  AD CF 0F           ...  LDA &0FCF
2ABA  85 35              .5   STA &35
2ABC  A9 BF              ..   LDA #&BF
2ABE  85 37              .7   STA &37
2AC0  20 C4 16            ..  JSR &16C4
2AC3  AD CE 0F           ...  LDA &0FCE
2AC6  85 34              .4   STA &34
2AC8  AD CF 0F           ...  LDA &0FCF
2ACB  85 35              .5   STA &35
2ACD  84 36              .6   STY &36
2ACF  A9 BF              ..   LDA #&BF
2AD1  85 37              .7   STA &37
2AD3  4C C4 16           L..  JMP &16C4
2AD6  8C E7 8D           ...  STY &8DE7
2AD9  ED 8A E6           ...  SBC &E68A
2ADC  C1 C8              ..   CMP (&C8,X)
2ADE  C8                 .    INY
2ADF  8B                 .    ...
2AE0  E0 8A              ..   CPX #&8A
2AE2  E6 D6              ..   INC &D6
2AE4  C5 C6              ..   CMP &C6
2AE6  C1 CA              ..   CMP (&CA,X)
2AE8  95 9D              ..   STA &9D,X
2AEA  9C                 .    ...
2AEB  97                 .    ...
.addr2AEC
2AEC  8D AD 03           ...  STA &03AD
2AEF  A9 01              ..   LDA #&01
2AF1  48                 H    PHA
2AF2  A2 0C              ..   LDX #&0C
2AF4  EC AD 03           ...  CPX &03AD
2AF7  90 0B              ..   BCC &2B04
.addr2AF9
2AF9  7D 6F 03           }o.  ADC &036F,X
2AFC  CA                 .    DEX
2AFD  10 FA              ..   BPL &2AF9
2AFF  CD 6E 03           .n.  CMP &036E
2B02  68                 h    PLA
2B03  60                 `    RTS
.addr2B04
2B04  AC AD 03           ...  LDY &03AD
2B07  B9 6F 03           .o.  LDA &036F,Y
2B0A  C9 C8              ..   CMP #&C8
2B0C  68                 h    PLA
2B0D  60                 `    RTS
.addr2B0E
2B0E  20 11 2B            .+  JSR &2B11
.addr2B11
2B11  20 14 2B            .+  JSR &2B14
.addr2B14
2B14  A5 6C              .l   LDA &6C
2B16  18                 .    CLC
2B17  65 6E              en   ADC &6E
2B19  AA                 .    TAX
2B1A  A5 6D              .m   LDA &6D
2B1C  65 6F              eo   ADC &6F
2B1E  A8                 .    TAY
2B1F  A5 6E              .n   LDA &6E
2B21  85 6C              .l   STA &6C
2B23  A5 6F              .o   LDA &6F
2B25  85 6D              .m   STA &6D
2B27  A5 71              .q   LDA &71
2B29  85 6F              .o   STA &6F
2B2B  A5 70              .p   LDA &70
2B2D  85 6E              .n   STA &6E
2B2F  18                 .    CLC
2B30  8A                 .    TXA
2B31  65 6E              en   ADC &6E
2B33  85 70              .p   STA &70
2B35  98                 .    TYA
2B36  65 6F              eo   ADC &6F
2B38  85 71              .q   STA &71
2B3A  60                 `    RTS
.addr2B3B
2B3B  AD BF 03           ...  LDA &03BF
2B3E  0D C0 03           ...  ORA &03C0
2B41  D0 03              ..   BNE &2B46
2B43  E6 2D              .-   INC &2D
2B45  60                 `    RTS
.addr2B46
2B46  A9 BF              ..   LDA #&BF
2B48  20 95 33            .3  JSR &3395
2B4B  AE BF 03           ...  LDX &03BF
2B4E  AC C0 03           ...  LDY &03C0
2B51  38                 8    SEC
2B52  20 B4 30            .0  JSR &30B4
2B55  A9 C3              ..   LDA #&C3
.addr2B57
2B57  20 9A 33            .3  JSR &339A
.addr2B5A
2B5A  E6 2D              .-   INC &2D
.addr2B5C
2B5C  A9 80              ..   LDA #&80
2B5E  85 72              .r   STA &72
.addr2B60
2B60  A9 0C              ..   LDA #&0C
2B62  4C 9A 33           L.3  JMP &339A
.addr2B65
2B65  A9 AD              ..   LDA #&AD
2B67  20 9A 33            .3  JSR &339A
2B6A  4C A9 2B           L.+  JMP &2BA9
.addr2B6D
2B6D  20 9A 33            .3  JSR &339A
2B70  4C 42 31           LB1  JMP &3142
.addr2B73
2B73  A9 01              ..   LDA #&01
2B75  20 C8 54            .T  JSR &54C8
2B78  A9 09              ..   LDA #&09
2B7A  85 2C              .,   STA &2C
2B7C  A9 A3              ..   LDA #&A3
2B7E  20 9A 33            .3  JSR &339A
2B81  20 4E 18            N.  JSR &184E
2B84  20 5A 2B            Z+  JSR &2B5A
2B87  E6 2D              .-   INC &2D
2B89  20 3B 2B            ;+  JSR &2B3B
2B8C  A9 C2              ..   LDA #&C2
2B8E  20 95 33            .3  JSR &3395
2B91  AD B8 03           ...  LDA &03B8
2B94  18                 .    CLC
2B95  69 01              i.   ADC #&01
2B97  4A                 J    LSR A
2B98  C9 02              ..   CMP #&02
2B9A  F0 C9              ..   BEQ &2B65
2B9C  AD B8 03           ...  LDA &03B8
2B9F  90 03              ..   BCC &2BA4
2BA1  E9 05              ..   SBC #&05
2BA3  18                 .    CLC
.addr2BA4
2BA4  69 AA              i.   ADC #&AA
2BA6  20 9A 33            .3  JSR &339A
.addr2BA9
2BA9  AD B8 03           ...  LDA &03B8
2BAC  4A                 J    LSR A
2BAD  4A                 J    LSR A
2BAE  18                 .    CLC
2BAF  69 A8              i.   ADC #&A8
2BB1  20 57 2B            W+  JSR &2B57
2BB4  A9 A2              ..   LDA #&A2
2BB6  20 95 33            .3  JSR &3395
2BB9  AD B9 03           ...  LDA &03B9
2BBC  18                 .    CLC
2BBD  69 B1              i.   ADC #&B1
2BBF  20 57 2B            W+  JSR &2B57
2BC2  A9 C4              ..   LDA #&C4
2BC4  20 95 33            .3  JSR &3395
2BC7  AE BA 03           ...  LDX &03BA
2BCA  E8                 .    INX
2BCB  18                 .    CLC
2BCC  20 38 1E            8.  JSR &1E38
2BCF  20 5A 2B            Z+  JSR &2B5A
2BD2  A9 C0              ..   LDA #&C0
2BD4  20 95 33            .3  JSR &3395
2BD7  38                 8    SEC
2BD8  AE BB 03           ...  LDX &03BB
2BDB  20 38 1E            8.  JSR &1E38
2BDE  A9 C6              ..   LDA #&C6
2BE0  20 57 2B            W+  JSR &2B57
2BE3  A9 28              .(   LDA #&28
2BE5  20 9A 33            .3  JSR &339A
2BE8  A5 70              .p   LDA &70
2BEA  30 08              0.   BMI &2BF4
2BEC  A9 BC              ..   LDA #&BC
2BEE  20 9A 33            .3  JSR &339A
2BF1  4C 30 2C           L0,  JMP &2C30
.addr2BF4
2BF4  A5 71              .q   LDA &71
2BF6  4A                 J    LSR A
2BF7  4A                 J    LSR A
2BF8  48                 H    PHA
2BF9  29 07              ).   AND #&07
2BFB  C9 03              ..   CMP #&03
2BFD  B0 05              ..   BCS &2C04
2BFF  69 E3              i.   ADC #&E3
2C01  20 6D 2B            m+  JSR &2B6D
.addr2C04
2C04  68                 h    PLA
2C05  4A                 J    LSR A
2C06  4A                 J    LSR A
2C07  4A                 J    LSR A
2C08  C9 06              ..   CMP #&06
2C0A  B0 05              ..   BCS &2C11
2C0C  69 E6              i.   ADC #&E6
2C0E  20 6D 2B            m+  JSR &2B6D
.addr2C11
2C11  A5 6F              .o   LDA &6F
2C13  45 6D              Em   EOR &6D
2C15  29 07              ).   AND #&07
2C17  85 73              .s   STA &73
2C19  C9 06              ..   CMP #&06
2C1B  B0 05              ..   BCS &2C22
2C1D  69 EC              i.   ADC #&EC
2C1F  20 6D 2B            m+  JSR &2B6D
.addr2C22
2C22  A5 71              .q   LDA &71
2C24  29 03              ).   AND #&03
2C26  18                 .    CLC
2C27  65 73              es   ADC &73
2C29  29 07              ).   AND #&07
2C2B  69 F2              i.   ADC #&F2
2C2D  20 9A 33            .3  JSR &339A
.addr2C30
2C30  A9 53              .S   LDA #&53
2C32  20 9A 33            .3  JSR &339A
2C35  A9 29              .)   LDA #&29
2C37  20 57 2B            W+  JSR &2B57
2C3A  A9 C1              ..   LDA #&C1
2C3C  20 95 33            .3  JSR &3395
2C3F  AE BD 03           ...  LDX &03BD
2C42  AC BE 03           ...  LDY &03BE
2C45  20 B3 30            .0  JSR &30B3
2C48  20 42 31            B1  JSR &3142
2C4B  A9 00              ..   LDA #&00
2C4D  85 72              .r   STA &72
2C4F  A9 4D              .M   LDA #&4D
2C51  20 9A 33            .3  JSR &339A
2C54  A9 E2              ..   LDA #&E2
2C56  20 57 2B            W+  JSR &2B57
2C59  A9 FA              ..   LDA #&FA
2C5B  20 95 33            .3  JSR &3395
2C5E  A5 71              .q   LDA &71
2C60  A6 6F              .o   LDX &6F
2C62  29 0F              ).   AND #&0F
2C64  18                 .    CLC
2C65  69 0B              i.   ADC #&0B
2C67  A8                 .    TAY
2C68  20 B4 30            .0  JSR &30B4
2C6B  20 42 31            B1  JSR &3142
2C6E  A9 6B              .k   LDA #&6B
2C70  20 FC 1E            ..  JSR &1EFC
2C73  A9 6D              .m   LDA #&6D
2C75  4C FC 1E           L..  JMP &1EFC
.addr2C78
2C78  A5 6D              .m   LDA &6D
2C7A  29 07              ).   AND #&07
2C7C  8D B8 03           ...  STA &03B8
2C7F  A5 6E              .n   LDA &6E
2C81  4A                 J    LSR A
2C82  4A                 J    LSR A
2C83  4A                 J    LSR A
2C84  29 07              ).   AND #&07
2C86  8D B9 03           ...  STA &03B9
2C89  4A                 J    LSR A
2C8A  D0 08              ..   BNE &2C94
2C8C  AD B8 03           ...  LDA &03B8
2C8F  09 02              ..   ORA #&02
2C91  8D B8 03           ...  STA &03B8
.addr2C94
2C94  AD B8 03           ...  LDA &03B8
2C97  49 07              I.   EOR #&07
2C99  18                 .    CLC
2C9A  8D BA 03           ...  STA &03BA
2C9D  A5 6F              .o   LDA &6F
2C9F  29 03              ).   AND #&03
2CA1  6D BA 03           m..  ADC &03BA
2CA4  8D BA 03           ...  STA &03BA
2CA7  AD B9 03           ...  LDA &03B9
2CAA  4A                 J    LSR A
2CAB  6D BA 03           m..  ADC &03BA
2CAE  8D BA 03           ...  STA &03BA
2CB1  0A                 .    ASL A
2CB2  0A                 .    ASL A
2CB3  6D B8 03           m..  ADC &03B8
2CB6  6D B9 03           m..  ADC &03B9
2CB9  69 01              i.   ADC #&01
2CBB  8D BB 03           ...  STA &03BB
2CBE  AD B8 03           ...  LDA &03B8
2CC1  49 07              I.   EOR #&07
2CC3  69 03              i.   ADC #&03
2CC5  85 1B              ..   STA &1B
2CC7  AD B9 03           ...  LDA &03B9
2CCA  69 04              i.   ADC #&04
2CCC  85 81              ..   STA &81
2CCE  20 20 28             (  JSR &2820
2CD1  AD BB 03           ...  LDA &03BB
2CD4  85 81              ..   STA &81
2CD6  20 20 28             (  JSR &2820
2CD9  06 1B              ..   ASL &1B
2CDB  2A                 *    ROL A
2CDC  06 1B              ..   ASL &1B
2CDE  2A                 *    ROL A
2CDF  06 1B              ..   ASL &1B
2CE1  2A                 *    ROL A
2CE2  8D BE 03           ...  STA &03BE
2CE5  A5 1B              ..   LDA &1B
2CE7  8D BD 03           ...  STA &03BD
2CEA  60                 `    RTS
.addr2CEB
2CEB  A9 40              .@   LDA #&40
2CED  20 C8 54            .T  JSR &54C8
2CF0  A9 07              ..   LDA #&07
2CF2  85 2C              .,   STA &2C
2CF4  20 6A 2F            j/  JSR &2F6A
2CF7  A9 C7              ..   LDA #&C7
2CF9  20 9A 33            .3  JSR &339A
2CFC  20 4E 18            N.  JSR &184E
2CFF  A9 98              ..   LDA #&98
2D01  20 52 18            R.  JSR &1852
2D04  20 A1 2D            .-  JSR &2DA1
2D07  A2 00              ..   LDX #&00
.addr2D09
2D09  86 84              ..   STX &84
2D0B  A6 6F              .o   LDX &6F
2D0D  A4 70              .p   LDY &70
2D0F  98                 .    TYA
2D10  09 50              .P   ORA #&50
2D12  85 88              ..   STA &88
2D14  A5 6D              .m   LDA &6D
2D16  4A                 J    LSR A
2D17  18                 .    CLC
2D18  69 18              i.   ADC #&18
2D1A  85 35              .5   STA &35
2D1C  20 32 19            2.  JSR &1932
2D1F  20 0E 2B            .+  JSR &2B0E
2D22  A6 84              ..   LDX &84
2D24  E8                 .    INX
2D25  D0 E2              ..   BNE &2D09
2D27  AD C1 03           ...  LDA &03C1
2D2A  85 73              .s   STA &73
2D2C  AD C2 03           ...  LDA &03C2
2D2F  4A                 J    LSR A
2D30  85 74              .t   STA &74
2D32  A9 04              ..   LDA #&04
2D34  85 75              .u   STA &75
.addr2D36
2D36  A9 18              ..   LDA #&18
2D38  A6 87              ..   LDX &87
2D3A  10 02              ..   BPL &2D3E
2D3C  A9 00              ..   LDA #&00
.addr2D3E
2D3E  85 78              .x   STA &78
2D40  A5 73              .s   LDA &73
2D42  38                 8    SEC
2D43  E5 75              .u   SBC &75
2D45  B0 02              ..   BCS &2D49
2D47  A9 00              ..   LDA #&00
.addr2D49
2D49  85 34              .4   STA &34
2D4B  A5 73              .s   LDA &73
2D4D  18                 .    CLC
2D4E  65 75              eu   ADC &75
2D50  90 02              ..   BCC &2D54
2D52  A9 FF              ..   LDA #&FF
.addr2D54
2D54  85 36              .6   STA &36
2D56  A5 74              .t   LDA &74
2D58  18                 .    CLC
2D59  65 78              ex   ADC &78
2D5B  85 35              .5   STA &35
2D5D  20 68 18            h.  JSR &1868
2D60  A5 74              .t   LDA &74
2D62  38                 8    SEC
2D63  E5 75              .u   SBC &75
2D65  B0 02              ..   BCS &2D69
2D67  A9 00              ..   LDA #&00
.addr2D69
2D69  18                 .    CLC
2D6A  65 78              ex   ADC &78
2D6C  85 35              .5   STA &35
2D6E  A5 74              .t   LDA &74
2D70  18                 .    CLC
2D71  65 75              eu   ADC &75
2D73  65 78              ex   ADC &78
2D75  C9 98              ..   CMP #&98
2D77  90 06              ..   BCC &2D7F
2D79  A6 87              ..   LDX &87
2D7B  30 02              0.   BMI &2D7F
2D7D  A9 97              ..   LDA #&97
.addr2D7F
2D7F  85 37              .7   STA &37
2D81  A5 73              .s   LDA &73
2D83  85 34              .4   STA &34
2D85  85 36              .6   STA &36
2D87  4C C4 16           L..  JMP &16C4
.addr2D8A
2D8A  A9 68              .h   LDA #&68
2D8C  85 73              .s   STA &73
2D8E  A9 5A              .Z   LDA #&5A
2D90  85 74              .t   STA &74
2D92  A9 10              ..   LDA #&10
2D94  85 75              .u   STA &75
2D96  20 36 2D            6-  JSR &2D36
2D99  AD 65 03           .e.  LDA &0365
2D9C  85 40              .@   STA &40
2D9E  4C C5 2D           L.-  JMP &2DC5
.addr2DA1
2DA1  A5 87              ..   LDA &87
2DA3  30 E5              0.   BMI &2D8A
2DA5  AD 65 03           .e.  LDA &0365
2DA8  4A                 J    LSR A
2DA9  4A                 J    LSR A
2DAA  85 40              .@   STA &40
2DAC  AD 59 03           .Y.  LDA &0359
2DAF  85 73              .s   STA &73
2DB1  AD 5A 03           .Z.  LDA &035A
2DB4  4A                 J    LSR A
2DB5  85 74              .t   STA &74
2DB7  A9 07              ..   LDA #&07
2DB9  85 75              .u   STA &75
2DBB  20 36 2D            6-  JSR &2D36
2DBE  A5 74              .t   LDA &74
2DC0  18                 .    CLC
2DC1  69 18              i.   ADC #&18
2DC3  85 74              .t   STA &74
.addr2DC5
2DC5  A5 73              .s   LDA &73
2DC7  85 D2              ..   STA &D2
2DC9  A5 74              .t   LDA &74
2DCB  85 E0              ..   STA &E0
2DCD  A2 00              ..   LDX #&00
2DCF  86 E1              ..   STX &E1
2DD1  86 D3              ..   STX &D3
2DD3  E8                 .    INX
2DD4  86 6B              .k   STX &6B
2DD6  A2 02              ..   LDX #&02
2DD8  86 95              ..   STX &95
2DDA  20 90 3B            .;  JSR &3B90
2DDD  60                 `    RTS
.addr2DDE
2DDE  A0 00              ..   LDY #&00
.addr2DE0
2DE0  8C AD 03           ...  STY &03AD
2DE3  BE 6F 03           .o.  LDX &036F,Y
2DE6  F0 24              .$   BEQ &2E0C
2DE8  98                 .    TYA
2DE9  0A                 .    ASL A
2DEA  0A                 .    ASL A
2DEB  A8                 .    TAY
2DEC  B9 1A 46           ..F  LDA &461A,Y
2DEF  85 74              .t   STA &74
2DF1  8A                 .    TXA
2DF2  48                 H    PHA
2DF3  20 5C 2B            \+  JSR &2B5C
2DF6  18                 .    CLC
2DF7  AD AD 03           ...  LDA &03AD
2DFA  69 D0              i.   ADC #&D0
2DFC  20 9A 33            .3  JSR &339A
2DFF  A9 0E              ..   LDA #&0E
2E01  85 2C              .,   STA &2C
2E03  68                 h    PLA
2E04  AA                 .    TAX
2E05  18                 .    CLC
2E06  20 38 1E            8.  JSR &1E38
2E09  20 35 31            51  JSR &3135
.addr2E0C
2E0C  AC AD 03           ...  LDY &03AD
2E0F  C8                 .    INY
2E10  C0 11              ..   CPY #&11
2E12  90 CC              ..   BCC &2DE0
2E14  60                 `    RTS
.addr2E15
2E15  A9 08              ..   LDA #&08
2E17  20 C8 54            .T  JSR &54C8
2E1A  A9 0B              ..   LDA #&0B
2E1C  85 2C              .,   STA &2C
2E1E  A9 A4              ..   LDA #&A4
2E20  20 57 2B            W+  JSR &2B57
2E23  20 4A 18            J.  JSR &184A
2E26  20 66 33            f3  JSR &3366
2E29  AD 6E 03           .n.  LDA &036E
2E2C  C9 1A              ..   CMP #&1A
2E2E  90 05              ..   BCC &2E35
2E30  A9 6B              .k   LDA #&6B
2E32  20 9A 33            .3  JSR &339A
.addr2E35
2E35  4C DE 2D           L.-  JMP &2DDE
.addr2E38
2E38  8A                 .    TXA
2E39  48                 H    PHA
2E3A  88                 .    DEY
2E3B  98                 .    TYA
2E3C  49 FF              I.   EOR #&FF
2E3E  48                 H    PHA
2E3F  20 F7 55            .U  JSR &55F7
2E42  20 65 2E            e.  JSR &2E65
2E45  68                 h    PLA
2E46  85 76              .v   STA &76
2E48  AD C2 03           ...  LDA &03C2
2E4B  20 7B 2E            {.  JSR &2E7B
2E4E  A5 77              .w   LDA &77
2E50  8D C2 03           ...  STA &03C2
2E53  85 74              .t   STA &74
2E55  68                 h    PLA
2E56  85 76              .v   STA &76
2E58  AD C1 03           ...  LDA &03C1
2E5B  20 7B 2E            {.  JSR &2E7B
2E5E  A5 77              .w   LDA &77
2E60  8D C1 03           ...  STA &03C1
2E63  85 73              .s   STA &73
.addr2E65
2E65  A5 87              ..   LDA &87
2E67  30 23              0#   BMI &2E8C
2E69  AD C1 03           ...  LDA &03C1
2E6C  85 73              .s   STA &73
2E6E  AD C2 03           ...  LDA &03C2
2E71  4A                 J    LSR A
2E72  85 74              .t   STA &74
2E74  A9 04              ..   LDA #&04
2E76  85 75              .u   STA &75
2E78  4C 36 2D           L6-  JMP &2D36
.addr2E7B
2E7B  85 77              .w   STA &77
2E7D  18                 .    CLC
2E7E  65 76              ev   ADC &76
2E80  A6 76              .v   LDX &76
2E82  30 03              0.   BMI &2E87
2E84  90 03              ..   BCC &2E89
2E86  60                 `    RTS
.addr2E87
2E87  90 02              ..   BCC &2E8B
.addr2E89
2E89  85 77              .w   STA &77
.addr2E8B
2E8B  60                 `    RTS
.addr2E8C
2E8C  AD C1 03           ...  LDA &03C1
2E8F  38                 8    SEC
2E90  ED 59 03           .Y.  SBC &0359
2E93  C9 26              .&   CMP #&26
2E95  90 04              ..   BCC &2E9B
2E97  C9 E6              ..   CMP #&E6
2E99  90 F0              ..   BCC &2E8B
.addr2E9B
2E9B  0A                 .    ASL A
2E9C  0A                 .    ASL A
2E9D  18                 .    CLC
2E9E  69 68              ih   ADC #&68
2EA0  85 73              .s   STA &73
2EA2  AD C2 03           ...  LDA &03C2
2EA5  38                 8    SEC
2EA6  ED 5A 03           .Z.  SBC &035A
2EA9  C9 26              .&   CMP #&26
2EAB  90 04              ..   BCC &2EB1
2EAD  C9 DC              ..   CMP #&DC
2EAF  90 DA              ..   BCC &2E8B
.addr2EB1
2EB1  0A                 .    ASL A
2EB2  18                 .    CLC
2EB3  69 5A              iZ   ADC #&5A
2EB5  85 74              .t   STA &74
2EB7  A9 08              ..   LDA #&08
2EB9  85 75              .u   STA &75
2EBB  4C 36 2D           L6-  JMP &2D36
.addr2EBE
2EBE  A9 80              ..   LDA #&80
2EC0  20 C8 54            .T  JSR &54C8
2EC3  A9 07              ..   LDA #&07
2EC5  85 2C              .,   STA &2C
2EC7  A9 BE              ..   LDA #&BE
2EC9  20 47 18            G.  JSR &1847
2ECC  20 A1 2D            .-  JSR &2DA1
2ECF  20 65 2E            e.  JSR &2E65
2ED2  20 6A 2F            j/  JSR &2F6A
2ED5  A9 00              ..   LDA #&00
2ED7  85 97              ..   STA &97
2ED9  A2 18              ..   LDX #&18
.addr2EDB
2EDB  95 46              .F   STA &46,X
2EDD  CA                 .    DEX
2EDE  10 FB              ..   BPL &2EDB
.addr2EE0
2EE0  A5 6F              .o   LDA &6F
2EE2  38                 8    SEC
2EE3  ED 59 03           .Y.  SBC &0359
2EE6  B0 04              ..   BCS &2EEC
2EE8  49 FF              I.   EOR #&FF
2EEA  69 01              i.   ADC #&01
.addr2EEC
2EEC  C9 14              ..   CMP #&14
2EEE  B0 70              .p   BCS &2F60
2EF0  A5 6D              .m   LDA &6D
2EF2  38                 8    SEC
2EF3  ED 5A 03           .Z.  SBC &035A
2EF6  B0 04              ..   BCS &2EFC
2EF8  49 FF              I.   EOR #&FF
2EFA  69 01              i.   ADC #&01
.addr2EFC
2EFC  C9 26              .&   CMP #&26
2EFE  B0 60              .`   BCS &2F60
2F00  A5 6F              .o   LDA &6F
2F02  38                 8    SEC
2F03  ED 59 03           .Y.  SBC &0359
2F06  0A                 .    ASL A
2F07  0A                 .    ASL A
2F08  69 68              ih   ADC #&68
2F0A  85 3A              .:   STA &3A
2F0C  4A                 J    LSR A
2F0D  4A                 J    LSR A
2F0E  4A                 J    LSR A
2F0F  85 2C              .,   STA &2C
2F11  E6 2C              .,   INC &2C
2F13  A5 6D              .m   LDA &6D
2F15  38                 8    SEC
2F16  ED 5A 03           .Z.  SBC &035A
2F19  0A                 .    ASL A
2F1A  69 5A              iZ   ADC #&5A
2F1C  85 E0              ..   STA &E0
2F1E  4A                 J    LSR A
2F1F  4A                 J    LSR A
2F20  4A                 J    LSR A
2F21  A8                 .    TAY
2F22  B6 46              .F   LDX &46,Y
2F24  F0 0B              ..   BEQ &2F31
2F26  C8                 .    INY
2F27  B6 46              .F   LDX &46,Y
2F29  F0 06              ..   BEQ &2F31
2F2B  88                 .    DEY
2F2C  88                 .    DEY
2F2D  B6 46              .F   LDX &46,Y
2F2F  D0 12              ..   BNE &2F43
.addr2F31
2F31  84 2D              .-   STY &2D
2F33  C0 03              ..   CPY #&03
2F35  90 29              .)   BCC &2F60
2F37  A9 FF              ..   LDA #&FF
2F39  99 46 00           .F.  STA &0046,Y
2F3C  A9 80              ..   LDA #&80
2F3E  85 72              .r   STA &72
2F40  20 0A 33            .3  JSR &330A
.addr2F43
2F43  A9 00              ..   LDA #&00
2F45  85 D3              ..   STA &D3
2F47  85 E1              ..   STA &E1
2F49  85 41              .A   STA &41
2F4B  A5 3A              .:   LDA &3A
2F4D  85 D2              ..   STA &D2
2F4F  A5 71              .q   LDA &71
2F51  29 01              ).   AND #&01
2F53  69 02              i.   ADC #&02
2F55  85 40              .@   STA &40
2F57  20 0A 36            .6  JSR &360A
2F5A  20 54 3A            T:  JSR &3A54
2F5D  20 0A 36            .6  JSR &360A
.addr2F60
2F60  20 0E 2B            .+  JSR &2B0E
2F63  E6 97              ..   INC &97
2F65  F0 0D              ..   BEQ &2F74
2F67  4C E0 2E           L..  JMP &2EE0
.addr2F6A
2F6A  A2 05              ..   LDX #&05
.addr2F6C
2F6C  BD 5B 03           .[.  LDA &035B,X
2F6F  95 6C              .l   STA &6C,X
2F71  CA                 .    DEX
2F72  10 F8              ..   BPL &2F6C
.addr2F74
2F74  60                 `    RTS
.addr2F75
2F75  20 6A 2F            j/  JSR &2F6A
2F78  A0 7F              .   LDY #&7F
2F7A  84 D1              ..   STY &D1
2F7C  A9 00              ..   LDA #&00
2F7E  85 80              ..   STA &80
.addr2F80
2F80  A5 6F              .o   LDA &6F
2F82  38                 8    SEC
2F83  ED C1 03           ...  SBC &03C1
2F86  B0 04              ..   BCS &2F8C
2F88  49 FF              I.   EOR #&FF
2F8A  69 01              i.   ADC #&01
.addr2F8C
2F8C  4A                 J    LSR A
2F8D  85 83              ..   STA &83
2F8F  A5 6D              .m   LDA &6D
2F91  38                 8    SEC
2F92  ED C2 03           ...  SBC &03C2
2F95  B0 04              ..   BCS &2F9B
2F97  49 FF              I.   EOR #&FF
2F99  69 01              i.   ADC #&01
.addr2F9B
2F9B  4A                 J    LSR A
2F9C  18                 .    CLC
2F9D  65 83              e.   ADC &83
2F9F  C5 D1              ..   CMP &D1
2FA1  B0 0B              ..   BCS &2FAE
2FA3  85 D1              ..   STA &D1
2FA5  A2 05              ..   LDX #&05
.addr2FA7
2FA7  B5 6C              .l   LDA &6C,X
2FA9  95 73              .s   STA &73,X
2FAB  CA                 .    DEX
2FAC  10 F9              ..   BPL &2FA7
.addr2FAE
2FAE  20 0E 2B            .+  JSR &2B0E
2FB1  E6 80              ..   INC &80
2FB3  D0 CB              ..   BNE &2F80
2FB5  A2 05              ..   LDX #&05
.addr2FB7
2FB7  B5 73              .s   LDA &73,X
2FB9  95 6C              .l   STA &6C,X
2FBB  CA                 .    DEX
2FBC  10 F9              ..   BPL &2FB7
2FBE  A5 6D              .m   LDA &6D
2FC0  8D C2 03           ...  STA &03C2
2FC3  A5 6F              .o   LDA &6F
2FC5  8D C1 03           ...  STA &03C1
2FC8  38                 8    SEC
2FC9  ED 59 03           .Y.  SBC &0359
2FCC  B0 04              ..   BCS &2FD2
2FCE  49 FF              I.   EOR #&FF
2FD0  69 01              i.   ADC #&01
.addr2FD2
2FD2  20 0D 28            .(  JSR &280D
2FD5  85 41              .A   STA &41
2FD7  A5 1B              ..   LDA &1B
2FD9  85 40              .@   STA &40
2FDB  AD C2 03           ...  LDA &03C2
2FDE  38                 8    SEC
2FDF  ED 5A 03           .Z.  SBC &035A
2FE2  B0 04              ..   BCS &2FE8
2FE4  49 FF              I.   EOR #&FF
2FE6  69 01              i.   ADC #&01
.addr2FE8
2FE8  4A                 J    LSR A
2FE9  20 0D 28            .(  JSR &280D
2FEC  48                 H    PHA
2FED  A5 1B              ..   LDA &1B
2FEF  18                 .    CLC
2FF0  65 40              e@   ADC &40
2FF2  85 81              ..   STA &81
2FF4  68                 h    PLA
2FF5  65 41              eA   ADC &41
2FF7  85 82              ..   STA &82
2FF9  20 B8 47            .G  JSR &47B8
2FFC  A5 81              ..   LDA &81
2FFE  0A                 .    ASL A
2FFF  A2 00              ..   LDX #&00
3001  8E C0 03           ...  STX &03C0
3004  2E C0 03           ...  ROL &03C0
3007  0A                 .    ASL A
3008  2E C0 03           ...  ROL &03C0
300B  8D BF 03           ...  STA &03BF
300E  4C 78 2C           Lx,  JMP &2C78
.addr3011
3011  A5 2F              ./   LDA &2F
3013  05 8E              ..   ORA &8E
3015  D0 6E              .n   BNE &3085
3017  20 37 44            7D  JSR &4437
301A  30 42              0B   BMI &305E
301C  A5 87              ..   LDA &87
301E  D0 03              ..   BNE &3023
3020  4C C3 30           L.0  JMP &30C3
.addr3023
3023  20 FE 32            .2  JSR &32FE
.addr3026
3026  AD BF 03           ...  LDA &03BF
3029  0D C0 03           ...  ORA &03C0
302C  F0 57              .W   BEQ &3085
302E  A9 07              ..   LDA #&07
3030  85 2C              .,   STA &2C
3032  A9 17              ..   LDA #&17
3034  85 2D              .-   STA &2D
3036  A9 00              ..   LDA #&00
3038  85 72              .r   STA &72
303A  A9 BD              ..   LDA #&BD
303C  20 9A 33            .3  JSR &339A
303F  AD C0 03           ...  LDA &03C0
3042  D0 75              .u   BNE &30B9
3044  AD 65 03           .e.  LDA &0365
3047  CD BF 03           ...  CMP &03BF
304A  90 6D              .m   BCC &30B9
304C  A9 2D              .-   LDA #&2D
304E  20 9A 33            .3  JSR &339A
3051  20 0A 33            .3  JSR &330A
.addr3054
3054  A9 0F              ..   LDA #&0F
3056  85 2F              ./   STA &2F
3058  85 2E              ..   STA &2E
305A  AA                 .    TAX
305B  4C AC 30           L.0  JMP &30AC
.addr305E
305E  AE 85 03           ...  LDX &0385
3061  F0 22              ."   BEQ &3085
3063  E8                 .    INX
3064  8E 85 03           ...  STX &0385
3067  8E 8C 03           ...  STX &038C
306A  20 54 30            T0  JSR &3054
306D  A2 05              ..   LDX #&05
306F  EE 67 03           .g.  INC &0367
3072  AD 67 03           .g.  LDA &0367
3075  29 07              ).   AND #&07
3077  8D 67 03           .g.  STA &0367
.addr307A
307A  BD 5B 03           .[.  LDA &035B,X
307D  0A                 .    ASL A
307E  3E 5B 03           >[.  ROL &035B,X
3081  CA                 .    DEX
3082  10 F6              ..   BPL &307A
3084  A9 60              .`   LDA #&60
3086  8D C1 03           ...  STA &03C1
3089  8D C2 03           ...  STA &03C2
308C  20 92 32            .2  JSR &3292
308F  20 75 2F            u/  JSR &2F75
3092  A2 00              ..   LDX #&00
3094  8E BF 03           ...  STX &03BF
3097  8E C0 03           ...  STX &03C0
309A  A9 74              .t   LDA #&74
309C  20 C6 45            .E  JSR &45C6
.addr309F
309F  AD C1 03           ...  LDA &03C1
30A2  8D 59 03           .Y.  STA &0359
30A5  AD C2 03           ...  LDA &03C2
30A8  8D 5A 03           .Z.  STA &035A
30AB  60                 `    RTS
.addr30AC
30AC  A0 01              ..   LDY #&01
30AE  84 2C              .,   STY &2C
30B0  84 2D              .-   STY &2D
30B2  88                 .    DEY
.addr30B3
30B3  18                 .    CLC
.addr30B4
30B4  A9 05              ..   LDA #&05
30B6  4C 3C 1E           L<.  JMP &1E3C
.addr30B9
30B9  A9 CA              ..   LDA #&CA
30BB  20 9A 33            .3  JSR &339A
30BE  A9 3F              .?   LDA #&3F
30C0  4C 9A 33           L.3  JMP &339A
.addr30C3
30C3  20 75 2F            u/  JSR &2F75
30C6  4C 26 30           L&0  JMP &3026
.addr30C9
30C9  48                 H    PHA
30CA  85 77              .w   STA &77
30CC  0A                 .    ASL A
30CD  0A                 .    ASL A
30CE  85 73              .s   STA &73
30D0  A9 01              ..   LDA #&01
30D2  85 2C              .,   STA &2C
30D4  68                 h    PLA
30D5  69 D0              i.   ADC #&D0
30D7  20 9A 33            .3  JSR &339A
30DA  A9 0E              ..   LDA #&0E
30DC  85 2C              .,   STA &2C
30DE  A6 73              .s   LDX &73
30E0  BD 1A 46           ..F  LDA &461A,X
30E3  85 74              .t   STA &74
30E5  AD 9E 03           ...  LDA &039E
30E8  3D 1C 46           =.F  AND &461C,X
30EB  18                 .    CLC
30EC  7D 19 46           }.F  ADC &4619,X
30EF  8D AA 03           ...  STA &03AA
30F2  20 35 31            51  JSR &3135
30F5  20 8E 31            .1  JSR &318E
30F8  A5 74              .t   LDA &74
30FA  30 08              0.   BMI &3104
30FC  AD AA 03           ...  LDA &03AA
30FF  65 76              ev   ADC &76
3101  4C 0A 31           L.1  JMP &310A
.addr3104
3104  AD AA 03           ...  LDA &03AA
3107  38                 8    SEC
3108  E5 76              .v   SBC &76
.addr310A
310A  8D AA 03           ...  STA &03AA
310D  85 1B              ..   STA &1B
310F  A9 00              ..   LDA #&00
3111  20 F4 32            .2  JSR &32F4
3114  38                 8    SEC
3115  20 B4 30            .0  JSR &30B4
3118  A4 77              .w   LDY &77
311A  A9 05              ..   LDA #&05
311C  BE 8D 03           ...  LDX &038D,Y
311F  8E AB 03           ...  STX &03AB
3122  18                 .    CLC
3123  F0 06              ..   BEQ &312B
3125  20 3A 1E            :.  JSR &1E3A
3128  4C 35 31           L51  JMP &3135
.addr312B
312B  A5 2C              .,   LDA &2C
312D  69 04              i.   ADC #&04
312F  85 2C              .,   STA &2C
3131  A9 2D              .-   LDA #&2D
3133  D0 0F              ..   BNE &3144
.addr3135
3135  A5 74              .t   LDA &74
3137  29 60              )`   AND #&60
3139  F0 0C              ..   BEQ &3147
313B  C9 20              .    CMP #&20
313D  F0 0F              ..   BEQ &314E
313F  20 53 31            S1  JSR &3153
.addr3142
3142  A9 20              .    LDA #&20
.addr3144
3144  4C 9A 33           L.3  JMP &339A
.addr3147
3147  A9 74              .t   LDA #&74
3149  20 FC 1E            ..  JSR &1EFC
314C  90 F4              ..   BCC &3142
.addr314E
314E  A9 6B              .k   LDA #&6B
3150  20 FC 1E            ..  JSR &1EFC
.addr3153
3153  A9 67              .g   LDA #&67
3155  4C FC 1E           L..  JMP &1EFC
.addr3158
3158  A9 11              ..   LDA #&11
315A  85 2C              .,   STA &2C
315C  A9 FF              ..   LDA #&FF
315E  D0 E4              ..   BNE &3144
.addr3160
3160  A9 10              ..   LDA #&10
3162  20 C8 54            .T  JSR &54C8
3165  A9 05              ..   LDA #&05
3167  85 2C              .,   STA &2C
3169  A9 A7              ..   LDA #&A7
316B  20 47 18            G.  JSR &1847
316E  A9 03              ..   LDA #&03
3170  85 2D              .-   STA &2D
3172  20 58 31            X1  JSR &3158
3175  A9 00              ..   LDA #&00
3177  8D AD 03           ...  STA &03AD
.addr317A
317A  A2 80              ..   LDX #&80
317C  86 72              .r   STX &72
317E  20 C9 30            .0  JSR &30C9
3181  E6 2D              .-   INC &2D
3183  EE AD 03           ...  INC &03AD
3186  AD AD 03           ...  LDA &03AD
3189  C9 11              ..   CMP #&11
318B  90 ED              ..   BCC &317A
318D  60                 `    RTS
.addr318E
318E  A5 74              .t   LDA &74
3190  29 1F              ).   AND #&1F
3192  AC AC 03           ...  LDY &03AC
3195  85 75              .u   STA &75
3197  18                 .    CLC
3198  A9 00              ..   LDA #&00
319A  8D 9D 03           ...  STA &039D
.addr319D
319D  88                 .    DEY
319E  30 05              0.   BMI &31A5
31A0  65 75              eu   ADC &75
31A2  4C 9D 31           L.1  JMP &319D
.addr31A5
31A5  85 76              .v   STA &76
31A7  60                 `    RTS
31A8  20 75 2F            u/  JSR &2F75
.addr31AB
31AB  20 9F 30            .0  JSR &309F
31AE  A2 05              ..   LDX #&05
.addr31B0
31B0  B5 6C              .l   LDA &6C,X
31B2  9D B2 03           ...  STA &03B2,X
31B5  CA                 .    DEX
31B6  10 F8              ..   BPL &31B0
31B8  E8                 .    INX
31B9  8E 49 03           .I.  STX &0349
31BC  AD B8 03           ...  LDA &03B8
31BF  8D AC 03           ...  STA &03AC
31C2  AD BA 03           ...  LDA &03BA
31C5  8D AF 03           ...  STA &03AF
31C8  AD B9 03           ...  LDA &03B9
31CB  8D AE 03           ...  STA &03AE
31CE  20 86 3F            .?  JSR &3F86
31D1  8D 9E 03           ...  STA &039E
31D4  A2 00              ..   LDX #&00
31D6  86 96              ..   STX &96
.addr31D8
31D8  BD 1A 46           ..F  LDA &461A,X
31DB  85 74              .t   STA &74
31DD  20 8E 31            .1  JSR &318E
31E0  BD 1C 46           ..F  LDA &461C,X
31E3  2D 9E 03           -..  AND &039E
31E6  18                 .    CLC
31E7  7D 1B 46           }.F  ADC &461B,X
31EA  A4 74              .t   LDY &74
31EC  30 06              0.   BMI &31F4
31EE  38                 8    SEC
31EF  E5 76              .v   SBC &76
31F1  4C F7 31           L.1  JMP &31F7
.addr31F4
31F4  18                 .    CLC
31F5  65 76              ev   ADC &76
.addr31F7
31F7  10 02              ..   BPL &31FB
31F9  A9 00              ..   LDA #&00
.addr31FB
31FB  A4 96              ..   LDY &96
31FD  29 3F              )?   AND #&3F
31FF  99 8D 03           ...  STA &038D,Y
3202  C8                 .    INY
3203  98                 .    TYA
3204  85 96              ..   STA &96
3206  0A                 .    ASL A
3207  0A                 .    ASL A
3208  AA                 .    TAX
3209  C9 3F              .?   CMP #&3F
320B  90 CB              ..   BCC &31D8
320D  60                 `    RTS
.addr320E
320E  20 62 3F            b?  JSR &3F62
3211  A9 FF              ..   LDA #&FF
3213  85 66              .f   STA &66
3215  A9 1D              ..   LDA #&1D
3217  20 68 37            h7  JSR &3768
321A  A9 1E              ..   LDA #&1E
321C  4C 68 37           Lh7  JMP &3768
.addr321F
321F  4E 66 03           Nf.  LSR &0366
3222  38                 8    SEC
3223  2E 66 03           .f.  ROL &0366
.addr3226
3226  A9 03              ..   LDA #&03
3228  20 7E 42            ~B  JSR &427E
322B  A9 03              ..   LDA #&03
322D  20 C8 54            .T  JSR &54C8
3230  20 23 26            #&  JSR &2623
3233  20 E1 3E            .>  JSR &3EE1
3236  8C 41 03           .A.  STY &0341
.addr3239
3239  20 0E 32            .2  JSR &320E
323C  A9 03              ..   LDA #&03
323E  CD 3B 03           .;.  CMP &033B
3241  B0 F6              ..   BCS &3239
3243  8D C3 03           ...  STA &03C3
3246  A2 00              ..   LDX #&00
3248  20 93 54            .T  JSR &5493
324B  AD 5A 03           .Z.  LDA &035A
324E  49 1F              I.   EOR #&1F
3250  8D 5A 03           .Z.  STA &035A
3253  60                 `    RTS
.addr3254
3254  AD 65 03           .e.  LDA &0365
3257  38                 8    SEC
3258  ED BF 03           ...  SBC &03BF
325B  8D 65 03           .e.  STA &0365
325E  A5 87              ..   LDA &87
3260  D0 06              ..   BNE &3268
3262  20 C8 54            .T  JSR &54C8
3265  20 23 26            #&  JSR &2623
.addr3268
3268  20 37 44            7D  JSR &4437
326B  2D C9 03           -..  AND &03C9
326E  30 AF              0.   BMI &321F
3270  20 86 3F            .?  JSR &3F86
3273  C9 FD              ..   CMP #&FD
3275  B0 AF              ..   BCS &3226
3277  20 AB 31            .1  JSR &31AB
327A  20 E1 3E            .>  JSR &3EE1
327D  20 80 35            .5  JSR &3580
3280  20 55 42            UB  JSR &4255
3283  A5 87              ..   LDA &87
3285  29 3F              )?   AND #&3F
3287  D0 67              .g   BNE &32F0
3289  20 CA 54            .T  JSR &54CA
328C  A5 87              ..   LDA &87
328E  D0 38              .8   BNE &32C8
3290  E6 87              ..   INC &87
.addr3292
3292  A6 8E              ..   LDX &8E
3294  F0 2B              .+   BEQ &32C1
3296  20 36 26            6&  JSR &2636
3299  20 E1 3E            .>  JSR &3EE1
329C  20 75 2F            u/  JSR &2F75
329F  E6 4E              .N   INC &4E
32A1  20 6D 35            m5  JSR &356D
32A4  A9 80              ..   LDA #&80
32A6  85 4E              .N   STA &4E
32A8  E6 4D              .M   INC &4D
32AA  20 40 37            @7  JSR &3740
32AD  A9 0C              ..   LDA #&0C
32AF  85 7D              .}   STA &7D
32B1  20 A6 41            .A  JSR &41A6
32B4  0D 8C 03           ...  ORA &038C
32B7  8D 8C 03           ...  STA &038C
32BA  A9 FF              ..   LDA #&FF
32BC  85 87              ..   STA &87
32BE  20 42 26            B&  JSR &2642
.addr32C1
32C1  A2 00              ..   LDX #&00
32C3  86 8E              ..   STX &8E
32C5  4C 93 54           L.T  JMP &5493
.addr32C8
32C8  30 03              0.   BMI &32CD
32CA  4C EB 2C           L.,  JMP &2CEB
.addr32CD
32CD  4C BE 2E           L..  JMP &2EBE
.addr32D0
32D0  8A                 .    TXA
32D1  18                 .    CLC
32D2  6D 64 03           md.  ADC &0364
32D5  8D 64 03           .d.  STA &0364
32D8  98                 .    TYA
32D9  6D 63 03           mc.  ADC &0363
32DC  8D 63 03           .c.  STA &0363
32DF  AD 62 03           .b.  LDA &0362
32E2  69 00              i.   ADC #&00
32E4  8D 62 03           .b.  STA &0362
32E7  AD 61 03           .a.  LDA &0361
32EA  69 00              i.   ADC #&00
32EC  8D 61 03           .a.  STA &0361
32EF  18                 .    CLC
.addr32F0
32F0  60                 `    RTS
32F1  20 20 28             (  JSR &2820
.addr32F4
32F4  06 1B              ..   ASL &1B
32F6  2A                 *    ROL A
32F7  06 1B              ..   ASL &1B
32F9  2A                 *    ROL A
32FA  A8                 .    TAY
32FB  A6 1B              ..   LDX &1B
32FD  60                 `    RTS
.addr32FE
32FE  20 65 2E            e.  JSR &2E65
3301  20 75 2F            u/  JSR &2F75
3304  20 65 2E            e.  JSR &2E65
3307  4C 37 55           L7U  JMP &5537
.addr330A
330A  A2 05              ..   LDX #&05
.addr330C
330C  B5 6C              .l   LDA &6C,X
330E  95 73              .s   STA &73,X
3310  CA                 .    DEX
3311  10 F9              ..   BPL &330C
3313  A0 03              ..   LDY #&03
3315  24 6C              $l   BIT &6C
3317  70 01              p.   BVS &331A
3319  88                 .    DEY
.addr331A
331A  84 D1              ..   STY &D1
.addr331C
331C  A5 71              .q   LDA &71
331E  29 1F              ).   AND #&1F
3320  F0 05              ..   BEQ &3327
3322  09 80              ..   ORA #&80
3324  20 9A 33            .3  JSR &339A
.addr3327
3327  20 14 2B            .+  JSR &2B14
332A  C6 D1              ..   DEC &D1
332C  10 EE              ..   BPL &331C
332E  A2 05              ..   LDX #&05
.addr3330
3330  B5 73              .s   LDA &73,X
3332  95 6C              .l   STA &6C,X
3334  CA                 .    DEX
3335  10 F9              ..   BPL &3330
3337  60                 `    RTS
.addr3338
3338  A0 00              ..   LDY #&00
.addr333A
333A  B9 50 03           .P.  LDA &0350,Y
333D  C9 0D              ..   CMP #&0D
333F  F0 06              ..   BEQ &3347
3341  20 FC 1E            ..  JSR &1EFC
3344  C8                 .    INY
3345  D0 F3              ..   BNE &333A
.addr3347
3347  60                 `    RTS
.addr3348
3348  20 4E 33            N3  JSR &334E
334B  20 0A 33            .3  JSR &330A
.addr334E
334E  A2 05              ..   LDX #&05
.addr3350
3350  B5 6C              .l   LDA &6C,X
3352  BC B2 03           ...  LDY &03B2,X
3355  9D B2 03           ...  STA &03B2,X
3358  94 6C              .l   STY &6C
335A  CA                 .    DEX
335B  10 F3              ..   BPL &3350
335D  60                 `    RTS
.addr335E
335E  18                 .    CLC
335F  AE 67 03           .g.  LDX &0367
3362  E8                 .    INX
3363  4C 38 1E           L8.  JMP &1E38
.addr3366
3366  A9 69              .i   LDA #&69
3368  20 95 33            .3  JSR &3395
336B  AE 65 03           .e.  LDX &0365
336E  38                 8    SEC
336F  20 38 1E            8.  JSR &1E38
3372  A9 C3              ..   LDA #&C3
3374  20 8F 33            .3  JSR &338F
3377  A9 77              .w   LDA #&77
3379  D0 1F              ..   BNE &339A
.addr337B
337B  A2 03              ..   LDX #&03
.addr337D
337D  BD 61 03           .a.  LDA &0361,X
3380  95 40              .@   STA &40,X
3382  CA                 .    DEX
3383  10 F8              ..   BPL &337D
3385  A9 09              ..   LDA #&09
3387  85 80              ..   STA &80
3389  38                 8    SEC
338A  20 48 1E            H.  JSR &1E48
338D  A9 E2              ..   LDA #&E2
.addr338F
338F  20 9A 33            .3  JSR &339A
3392  4C 60 2B           L`+  JMP &2B60
.addr3395
3395  20 9A 33            .3  JSR &339A
.addr3398
3398  A9 3A              .:   LDA #&3A
.addr339A
339A  AA                 .    TAX
339B  F0 DE              ..   BEQ &337B
339D  30 74              0t   BMI &3413
339F  CA                 .    DEX
33A0  F0 BC              ..   BEQ &335E
33A2  CA                 .    DEX
33A3  F0 A3              ..   BEQ &3348
33A5  CA                 .    DEX
33A6  D0 03              ..   BNE &33AB
33A8  4C 0A 33           L.3  JMP &330A
.addr33AB
33AB  CA                 .    DEX
33AC  F0 8A              ..   BEQ &3338
33AE  CA                 .    DEX
33AF  F0 B5              ..   BEQ &3366
33B1  CA                 .    DEX
33B2  D0 05              ..   BNE &33B9
33B4  A9 80              ..   LDA #&80
33B6  85 72              .r   STA &72
33B8  60                 `    RTS
.addr33B9
33B9  CA                 .    DEX
33BA  CA                 .    DEX
33BB  D0 03              ..   BNE &33C0
33BD  86 72              .r   STX &72
33BF  60                 `    RTS
.addr33C0
33C0  CA                 .    DEX
33C1  F0 38              .8   BEQ &33FB
33C3  C9 60              .`   CMP #&60
33C5  B0 66              .f   BCS &342D
33C7  C9 0E              ..   CMP #&0E
33C9  90 04              ..   BCC &33CF
33CB  C9 20              .    CMP #&20
33CD  90 28              .(   BCC &33F7
.addr33CF
33CF  A6 72              .r   LDX &72
33D1  F0 3D              .=   BEQ &3410
33D3  30 11              0.   BMI &33E6
33D5  24 72              $r   BIT &72
33D7  70 30              p0   BVS &3409
.addr33D9
33D9  C9 41              .A   CMP #&41
33DB  90 06              ..   BCC &33E3
33DD  C9 5B              .[   CMP #&5B
33DF  B0 02              ..   BCS &33E3
33E1  69 20              i    ADC #&20
.addr33E3
33E3  4C FC 1E           L..  JMP &1EFC
.addr33E6
33E6  24 72              $r   BIT &72
33E8  70 17              p.   BVS &3401
33EA  C9 41              .A   CMP #&41
33EC  90 22              ."   BCC &3410
33EE  48                 H    PHA
33EF  8A                 .    TXA
33F0  09 40              .@   ORA #&40
33F2  85 72              .r   STA &72
33F4  68                 h    PLA
33F5  D0 EC              ..   BNE &33E3
.addr33F7
33F7  69 72              ir   ADC #&72
33F9  D0 32              .2   BNE &342D
.addr33FB
33FB  A9 15              ..   LDA #&15
33FD  85 2C              .,   STA &2C
33FF  D0 97              ..   BNE &3398
.addr3401
3401  E0 FF              ..   CPX #&FF
3403  F0 63              .c   BEQ &3468
3405  C9 41              .A   CMP #&41
3407  B0 D0              ..   BCS &33D9
.addr3409
3409  48                 H    PHA
340A  8A                 .    TXA
340B  29 BF              ).   AND #&BF
340D  85 72              .r   STA &72
340F  68                 h    PLA
.addr3410
3410  4C FC 1E           L..  JMP &1EFC
.addr3413
3413  C9 A0              ..   CMP #&A0
3415  B0 14              ..   BCS &342B
3417  29 7F              )   AND #&7F
3419  0A                 .    ASL A
341A  A8                 .    TAY
341B  B9 80 08           ...  LDA &0880,Y
341E  20 9A 33            .3  JSR &339A
3421  B9 81 08           ...  LDA &0881,Y
3424  C9 3F              .?   CMP #&3F
3426  F0 40              .@   BEQ &3468
3428  4C 9A 33           L.3  JMP &339A
.addr342B
342B  E9 A0              ..   SBC #&A0
.addr342D
342D  AA                 .    TAX
342E  A9 00              ..   LDA #&00
3430  85 22              ."   STA &22
3432  A9 04              ..   LDA #&04
3434  85 23              .#   STA &23
3436  A0 00              ..   LDY #&00
3438  8A                 .    TXA
3439  F0 13              ..   BEQ &344E
.addr343B
343B  B1 22              ."   LDA (&22),Y
343D  F0 07              ..   BEQ &3446
343F  C8                 .    INY
3440  D0 F9              ..   BNE &343B
3442  E6 23              .#   INC &23
3444  D0 F5              ..   BNE &343B
.addr3446
3446  C8                 .    INY
3447  D0 02              ..   BNE &344B
3449  E6 23              .#   INC &23
.addr344B
344B  CA                 .    DEX
344C  D0 ED              ..   BNE &343B
.addr344E
344E  98                 .    TYA
344F  48                 H    PHA
3450  A5 23              .#   LDA &23
3452  48                 H    PHA
3453  B1 22              ."   LDA (&22),Y
3455  49 23              I#   EOR #&23
3457  20 9A 33            .3  JSR &339A
345A  68                 h    PLA
345B  85 23              .#   STA &23
345D  68                 h    PLA
345E  A8                 .    TAY
345F  C8                 .    INY
3460  D0 02              ..   BNE &3464
3462  E6 23              .#   INC &23
.addr3464
3464  B1 22              ."   LDA (&22),Y
3466  D0 E6              ..   BNE &344E
.addr3468
3468  60                 `    RTS
.addr3469
3469  A5 65              .e   LDA &65
346B  09 A0              ..   ORA #&A0
346D  85 65              .e   STA &65
346F  60                 `    RTS
.addr3470
3470  A5 65              .e   LDA &65
3472  29 40              )@   AND #&40
3474  F0 03              ..   BEQ &3479
3476  20 D3 34            .4  JSR &34D3
.addr3479
3479  A5 4C              .L   LDA &4C
347B  85 D1              ..   STA &D1
347D  A5 4D              .M   LDA &4D
347F  C9 20              .    CMP #&20
3481  90 04              ..   BCC &3487
3483  A9 FE              ..   LDA #&FE
3485  D0 08              ..   BNE &348F
.addr3487
3487  06 D1              ..   ASL &D1
3489  2A                 *    ROL A
348A  06 D1              ..   ASL &D1
348C  2A                 *    ROL A
348D  38                 8    SEC
348E  2A                 *    ROL A
.addr348F
348F  85 81              ..   STA &81
3491  A0 01              ..   LDY #&01
3493  B1 67              .g   LDA (&67),Y
3495  69 04              i.   ADC #&04
3497  B0 D0              ..   BCS &3469
3499  91 67              .g   STA (&67),Y
349B  20 65 29            e)  JSR &2965
349E  A5 1B              ..   LDA &1B
34A0  C9 1C              ..   CMP #&1C
34A2  90 04              ..   BCC &34A8
34A4  A9 FE              ..   LDA #&FE
34A6  D0 09              ..   BNE &34B1
.addr34A8
34A8  06 82              ..   ASL &82
34AA  2A                 *    ROL A
34AB  06 82              ..   ASL &82
34AD  2A                 *    ROL A
34AE  06 82              ..   ASL &82
34B0  2A                 *    ROL A
.addr34B1
34B1  88                 .    DEY
34B2  91 67              .g   STA (&67),Y
34B4  A5 65              .e   LDA &65
34B6  29 BF              ).   AND #&BF
34B8  85 65              .e   STA &65
34BA  29 08              ).   AND #&08
34BC  F0 AA              ..   BEQ &3468
34BE  A0 02              ..   LDY #&02
34C0  B1 67              .g   LDA (&67),Y
34C2  A8                 .    TAY
.addr34C3
34C3  B9 F9 00           ...  LDA &00F9,Y
34C6  91 67              .g   STA (&67),Y
34C8  88                 .    DEY
34C9  C0 06              ..   CPY #&06
34CB  D0 F6              ..   BNE &34C3
34CD  A5 65              .e   LDA &65
34CF  09 40              .@   ORA #&40
34D1  85 65              .e   STA &65
.addr34D3
34D3  A0 00              ..   LDY #&00
34D5  B1 67              .g   LDA (&67),Y
34D7  85 81              ..   STA &81
34D9  C8                 .    INY
34DA  B1 67              .g   LDA (&67),Y
34DC  10 02              ..   BPL &34E0
34DE  49 FF              I.   EOR #&FF
.addr34E0
34E0  4A                 J    LSR A
34E1  4A                 J    LSR A
34E2  4A                 J    LSR A
34E3  09 01              ..   ORA #&01
34E5  85 80              ..   STA &80
34E7  C8                 .    INY
34E8  B1 67              .g   LDA (&67),Y
34EA  85 8F              ..   STA &8F
34EC  A5 01              ..   LDA &01
34EE  48                 H    PHA
34EF  A0 06              ..   LDY #&06
.addr34F1
34F1  A2 03              ..   LDX #&03
.addr34F3
34F3  C8                 .    INY
34F4  B1 67              .g   LDA (&67),Y
34F6  95 D2              ..   STA &D2,X
34F8  CA                 .    DEX
34F9  10 F8              ..   BPL &34F3
34FB  84 93              ..   STY &93
34FD  A0 02              ..   LDY #&02
.addr34FF
34FF  C8                 .    INY
3500  B1 67              .g   LDA (&67),Y
3502  45 93              E.   EOR &93
3504  99 FD FF           ...  STA &FFFD,Y
3507  C0 06              ..   CPY #&06
3509  D0 F4              ..   BNE &34FF
350B  A4 80              ..   LDY &80
.addr350D
350D  20 85 3F            .?  JSR &3F85
3510  85 88              ..   STA &88
3512  A5 D3              ..   LDA &D3
3514  85 82              ..   STA &82
3516  A5 D2              ..   LDA &D2
3518  20 4B 35            K5  JSR &354B
351B  D0 28              .(   BNE &3545
351D  E0 BF              ..   CPX #&BF
351F  B0 24              .$   BCS &3545
3521  86 35              .5   STX &35
3523  A5 D5              ..   LDA &D5
3525  85 82              ..   STA &82
3527  A5 D4              ..   LDA &D4
3529  20 4B 35            K5  JSR &354B
352C  D0 05              ..   BNE &3533
352E  A5 35              .5   LDA &35
3530  20 32 19            2.  JSR &1932
.addr3533
3533  88                 .    DEY
3534  10 D7              ..   BPL &350D
3536  A4 93              ..   LDY &93
3538  C4 8F              ..   CPY &8F
353A  90 B5              ..   BCC &34F1
353C  68                 h    PLA
353D  85 01              ..   STA &01
353F  AD 06 09           ...  LDA &0906
3542  85 03              ..   STA &03
3544  60                 `    RTS
.addr3545
3545  20 85 3F            .?  JSR &3F85
3548  4C 33 35           L35  JMP &3533
.addr354B
354B  85 83              ..   STA &83
354D  20 85 3F            .?  JSR &3F85
3550  2A                 *    ROL A
3551  B0 0B              ..   BCS &355E
3553  20 47 28            G(  JSR &2847
3556  65 82              e.   ADC &82
3558  AA                 .    TAX
3559  A5 83              ..   LDA &83
355B  69 00              i.   ADC #&00
355D  60                 `    RTS
.addr355E
355E  20 47 28            G(  JSR &2847
3561  85 D1              ..   STA &D1
3563  A5 82              ..   LDA &82
3565  E5 D1              ..   SBC &D1
3567  AA                 .    TAX
3568  A5 83              ..   LDA &83
356A  E9 00              ..   SBC #&00
356C  60                 `    RTS
.addr356D
356D  20 3B 3F            ;?  JSR &3F3B
3570  A9 7F              .   LDA #&7F
3572  85 63              .c   STA &63
3574  85 64              .d   STA &64
3576  AD AF 03           ...  LDA &03AF
3579  29 02              ).   AND #&02
357B  09 80              ..   ORA #&80
357D  4C 68 37           Lh7  JMP &3768
.addr3580
3580  4E 8C 03           N..  LSR &038C
3583  20 26 3F            &?  JSR &3F26
3586  A5 6D              .m   LDA &6D
3588  29 03              ).   AND #&03
358A  69 03              i.   ADC #&03
358C  85 4E              .N   STA &4E
358E  6A                 j    ROR A
358F  85 48              .H   STA &48
3591  85 4B              .K   STA &4B
3593  20 6D 35            m5  JSR &356D
3596  A5 6F              .o   LDA &6F
3598  29 07              ).   AND #&07
359A  09 81              ..   ORA #&81
359C  85 4E              .N   STA &4E
359E  A5 71              .q   LDA &71
35A0  29 03              ).   AND #&03
35A2  85 48              .H   STA &48
35A4  85 47              .G   STA &47
35A6  A9 00              ..   LDA #&00
35A8  85 63              .c   STA &63
35AA  85 64              .d   STA &64
35AC  A9 81              ..   LDA #&81
35AE  20 68 37            h7  JSR &3768
.addr35B1
35B1  A5 87              ..   LDA &87
35B3  D0 23              .#   BNE &35D8
.addr35B5
35B5  AC C3 03           ...  LDY &03C3
.addr35B8
35B8  20 86 3F            .?  JSR &3F86
35BB  09 08              ..   ORA #&08
35BD  99 A8 0F           ...  STA &0FA8,Y
35C0  85 88              ..   STA &88
35C2  20 86 3F            .?  JSR &3F86
35C5  99 5C 0F           .\.  STA &0F5C,Y
35C8  85 34              .4   STA &34
35CA  20 86 3F            .?  JSR &3F86
35CD  99 82 0F           ...  STA &0F82,Y
35D0  85 35              .5   STA &35
35D2  20 10 19            ..  JSR &1910
35D5  88                 .    DEY
35D6  D0 E0              ..   BNE &35B8
.addr35D8
35D8  A2 00              ..   LDX #&00
.addr35DA
35DA  BD 11 03           ...  LDA &0311,X
35DD  F0 23              .#   BEQ &3602
35DF  30 1E              0.   BMI &35FF
35E1  85 8C              ..   STA &8C
35E3  20 32 37            27  JSR &3732
35E6  A0 1F              ..   LDY #&1F
.addr35E8
35E8  B1 20              .    LDA (&20),Y
35EA  99 46 00           .F.  STA &0046,Y
35ED  88                 .    DEY
35EE  10 F8              ..   BPL &35E8
35F0  86 84              ..   STX &84
35F2  20 58 55            XU  JSR &5558
35F5  A6 84              ..   LDX &84
35F7  A0 1F              ..   LDY #&1F
35F9  B1 20              .    LDA (&20),Y
35FB  29 A7              ).   AND #&A7
35FD  91 20              .    STA (&20),Y
.addr35FF
35FF  E8                 .    INX
3600  D0 D8              ..   BNE &35DA
.addr3602
3602  A2 FF              ..   LDX #&FF
3604  8E C0 0E           ...  STX &0EC0
3607  8E 0E 0F           ...  STX &0F0E
.addr360A
360A  A0 BF              ..   LDY #&BF
360C  A9 00              ..   LDA #&00
.addr360E
360E  99 00 0E           ...  STA &0E00,Y
3611  88                 .    DEY
3612  D0 FA              ..   BNE &360E
3614  88                 .    DEY
3615  8C 00 0E           ...  STY &0E00
3618  60                 `    RTS
.addr3619
3619  A9 06              ..   LDA #&06
361B  78                 x    SEI
361C  8D 00 FE           ...  STA &FE00
361F  8E 01 FE           ...  STX &FE01
3622  58                 X    CLI
3623  60                 `    RTS
.addr3624
3624  CA                 .    DEX
3625  60                 `    RTS
.addr3626
3626  E8                 .    INX
3627  F0 FB              ..   BEQ &3624
.addr3629
3629  CE A7 03           ...  DEC &03A7
362C  08                 .    PHP
362D  D0 03              ..   BNE &3632
362F  EE A7 03           ...  INC &03A7
.addr3632
3632  28                 (    PLP
3633  60                 `    RTS
.addr3634
3634  20 94 36            .6  JSR &3694
3637  AD 20 03           . .  LDA &0320
363A  D0 31              .1   BNE &366D
363C  20 AE 42            .B  JSR &42AE
363F  4C 70 36           Lp6  JMP &3670
.addr3642
3642  0A                 .    ASL A
3643  AA                 .    TAX
3644  A9 00              ..   LDA #&00
3646  6A                 j    ROR A
3647  A8                 .    TAY
3648  A9 14              ..   LDA #&14
364A  85 81              ..   STA &81
364C  8A                 .    TXA
364D  20 65 29            e)  JSR &2965
3650  A6 1B              ..   LDX &1B
3652  98                 .    TYA
3653  30 03              0.   BMI &3658
3655  A0 00              ..   LDY #&00
3657  60                 `    RTS
.addr3658
3658  A0 FF              ..   LDY #&FF
365A  8A                 .    TXA
365B  49 FF              I.   EOR #&FF
365D  AA                 .    TAX
365E  E8                 .    INX
365F  60                 `    RTS
.addr3660
3660  A2 08              ..   LDX #&08
.addr3662
3662  BD 25 09           .%.  LDA &0925,X
3665  95 D2              ..   STA &D2,X
3667  CA                 .    DEX
3668  10 F8              ..   BPL &3662
366A  4C BD 42           L.B  JMP &42BD
.addr366D
366D  20 60 36            `6  JSR &3660
.addr3670
3670  A5 34              .4   LDA &34
3672  20 42 36            B6  JSR &3642
3675  8A                 .    TXA
3676  69 C3              i.   ADC #&C3
3678  8D A8 03           ...  STA &03A8
367B  A5 35              .5   LDA &35
367D  20 42 36            B6  JSR &3642
3680  86 D1              ..   STX &D1
3682  A9 CC              ..   LDA #&CC
3684  E5 D1              ..   SBC &D1
3686  8D A9 03           ...  STA &03A9
3689  A9 F0              ..   LDA #&F0
368B  A6 36              .6   LDX &36
368D  10 02              ..   BPL &3691
368F  A9 FF              ..   LDA #&FF
.addr3691
3691  8D C5 03           ...  STA &03C5
.addr3694
3694  AD A9 03           ...  LDA &03A9
3697  85 35              .5   STA &35
3699  AD A8 03           ...  LDA &03A8
369C  85 34              .4   STA &34
369E  AD C5 03           ...  LDA &03C5
36A1  85 91              ..   STA &91
36A3  C9 F0              ..   CMP #&F0
36A5  D0 05              ..   BNE &36AC
.addr36A7
36A7  20 AC 36            .6  JSR &36AC
36AA  C6 35              .5   DEC &35
.addr36AC
36AC  A5 35              .5   LDA &35
36AE  A8                 .    TAY
36AF  4A                 J    LSR A
36B0  4A                 J    LSR A
36B1  4A                 J    LSR A
36B2  09 60              .`   ORA #&60
36B4  85 08              ..   STA &08
36B6  A5 34              .4   LDA &34
36B8  29 F8              ).   AND #&F8
36BA  85 07              ..   STA &07
36BC  98                 .    TYA
36BD  29 07              ).   AND #&07
36BF  A8                 .    TAY
36C0  A5 34              .4   LDA &34
36C2  29 06              ).   AND #&06
36C4  4A                 J    LSR A
36C5  AA                 .    TAX
36C6  BD BF 16           ...  LDA &16BF,X
36C9  25 91              %.   AND &91
36CB  51 07              Q.   EOR (&07),Y
36CD  91 07              ..   STA (&07),Y
36CF  BD C0 16           ...  LDA &16C0,X
36D2  10 09              ..   BPL &36DD
36D4  A5 07              ..   LDA &07
36D6  69 08              i.   ADC #&08
36D8  85 07              ..   STA &07
36DA  BD C0 16           ...  LDA &16C0,X
.addr36DD
36DD  25 91              %.   AND &91
36DF  51 07              Q.   EOR (&07),Y
36E1  91 07              ..   STA (&07),Y
36E3  60                 `    RTS
.addr36E4
36E4  85 D1              ..   STA &D1
36E6  A2 00              ..   LDX #&00
36E8  A0 08              ..   LDY #&08
36EA  B1 20              .    LDA (&20),Y
36EC  30 10              0.   BMI &36FE
36EE  AD A5 03           ...  LDA &03A5
36F1  E5 D1              ..   SBC &D1
36F3  90 04              ..   BCC &36F9
36F5  8D A5 03           ...  STA &03A5
36F8  60                 `    RTS
.addr36F9
36F9  8E A5 03           ...  STX &03A5
36FC  90 0E              ..   BCC &370C
.addr36FE
36FE  AD A6 03           ...  LDA &03A6
3701  E5 D1              ..   SBC &D1
3703  90 04              ..   BCC &3709
3705  8D A6 03           ...  STA &03A6
3708  60                 `    RTS
.addr3709
3709  8E A6 03           ...  STX &03A6
.addr370C
370C  6D A7 03           m..  ADC &03A7
370F  8D A7 03           ...  STA &03A7
3712  F0 02              ..   BEQ &3716
3714  B0 03              ..   BCS &3719
.addr3716
3716  4C C6 41           L.A  JMP &41C6
.addr3719
3719  20 B1 43            .C  JSR &43B1
371C  4C EA 45           L.E  JMP &45EA
.addr371F
371F  BD 01 09           ...  LDA &0901,X
3722  95 D2              ..   STA &D2,X
3724  BD 02 09           ...  LDA &0902,X
3727  A8                 .    TAY
3728  29 7F              )   AND #&7F
372A  95 D3              ..   STA &D3,X
372C  98                 .    TYA
372D  29 80              ).   AND #&80
372F  95 D4              ..   STA &D4,X
3731  60                 `    RTS
.addr3732
3732  8A                 .    TXA
3733  0A                 .    ASL A
3734  A8                 .    TAY
3735  B9 95 16           ...  LDA &1695,Y
3738  85 20              .    STA &20
373A  B9 96 16           ...  LDA &1696,Y
373D  85 21              .!   STA &21
373F  60                 `    RTS
.addr3740
3740  20 21 38            !8  JSR &3821
3743  A2 81              ..   LDX #&81
3745  86 66              .f   STX &66
3747  A2 00              ..   LDX #&00
3749  86 64              .d   STX &64
374B  86 6A              .j   STX &6A
374D  8E 12 03           ...  STX &0312
3750  CA                 .    DEX
3751  86 63              .c   STX &63
3753  A2 0A              ..   LDX #&0A
3755  20 FC 37            .7  JSR &37FC
3758  20 FC 37            .7  JSR &37FC
375B  20 FC 37            .7  JSR &37FC
375E  A9 00              ..   LDA #&00
3760  85 67              .g   STA &67
3762  A9 0E              ..   LDA #&0E
3764  85 68              .h   STA &68
3766  A9 02              ..   LDA #&02
.addr3768
3768  85 D1              ..   STA &D1
376A  A2 00              ..   LDX #&00
.addr376C
376C  BD 11 03           ...  LDA &0311,X
376F  F0 07              ..   BEQ &3778
3771  E8                 .    INX
3772  E0 0C              ..   CPX #&0C
3774  90 F6              ..   BCC &376C
.addr3776
3776  18                 .    CLC
.addr3777
3777  60                 `    RTS
.addr3778
3778  20 32 37            27  JSR &3732
377B  A5 D1              ..   LDA &D1
377D  30 52              0R   BMI &37D1
377F  0A                 .    ASL A
3780  A8                 .    TAY
3781  B9 FF 55           ..U  LDA &55FF,Y
3784  F0 F0              ..   BEQ &3776
3786  85 1F              ..   STA &1F
3788  B9 FE 55           ..U  LDA &55FE,Y
378B  85 1E              ..   STA &1E
378D  C0 04              ..   CPY #&04
378F  F0 30              .0   BEQ &37C1
3791  A0 05              ..   LDY #&05
3793  B1 1E              ..   LDA (&1E),Y
3795  85 06              ..   STA &06
3797  AD B0 03           ...  LDA &03B0
379A  38                 8    SEC
379B  E5 06              ..   SBC &06
379D  85 67              .g   STA &67
379F  AD B1 03           ...  LDA &03B1
37A2  E9 00              ..   SBC #&00
37A4  85 68              .h   STA &68
37A6  A5 67              .g   LDA &67
37A8  E5 20              .    SBC &20
37AA  A8                 .    TAY
37AB  A5 68              .h   LDA &68
37AD  E5 21              .!   SBC &21
37AF  90 C6              ..   BCC &3777
37B1  D0 04              ..   BNE &37B7
37B3  C0 25              .%   CPY #&25
37B5  90 C0              ..   BCC &3777
.addr37B7
37B7  A5 67              .g   LDA &67
37B9  8D B0 03           ...  STA &03B0
37BC  A5 68              .h   LDA &68
37BE  8D B1 03           ...  STA &03B1
.addr37C1
37C1  A0 0E              ..   LDY #&0E
37C3  B1 1E              ..   LDA (&1E),Y
37C5  85 69              .i   STA &69
37C7  A0 13              ..   LDY #&13
37C9  B1 1E              ..   LDA (&1E),Y
37CB  29 07              ).   AND #&07
37CD  85 65              .e   STA &65
37CF  A5 D1              ..   LDA &D1
.addr37D1
37D1  9D 11 03           ...  STA &0311,X
37D4  AA                 .    TAX
37D5  30 0E              0.   BMI &37E5
37D7  E0 03              ..   CPX #&03
37D9  90 07              ..   BCC &37E2
37DB  E0 0B              ..   CPX #&0B
37DD  B0 03              ..   BCS &37E2
37DF  EE 3E 03           .>.  INC &033E
.addr37E2
37E2  FE 1E 03           ...  INC &031E,X
.addr37E5
37E5  A4 D1              ..   LDY &D1
37E7  B9 3D 56           .=V  LDA &563D,Y
37EA  29 6F              )o   AND #&6F
37EC  05 6A              .j   ORA &6A
37EE  85 6A              .j   STA &6A
37F0  A0 24              .$   LDY #&24
.addr37F2
37F2  B9 46 00           .F.  LDA &0046,Y
37F5  91 20              .    STA (&20),Y
37F7  88                 .    DEY
37F8  10 F8              ..   BPL &37F2
37FA  38                 8    SEC
37FB  60                 `    RTS
.addr37FC
37FC  B5 46              .F   LDA &46,X
37FE  49 80              I.   EOR #&80
3800  95 46              .F   STA &46,X
3802  E8                 .    INX
3803  E8                 .    INX
3804  60                 `    RTS
.addr3805
3805  A2 FF              ..   LDX #&FF
.addr3807
3807  86 45              .E   STX &45
3809  AE 8B 03           ...  LDX &038B
380C  20 3D 38            =8  JSR &383D
380F  8C 44 03           .D.  STY &0344
3812  60                 `    RTS
.addr3813
3813  A9 20              .    LDA #&20
3815  85 30              .0   STA &30
3817  0A                 .    ASL A
3818  20 F3 43            .C  JSR &43F3
.addr381B
381B  A9 38              .8   LDA #&38
381D  A2 32              .2   LDX #&32
381F  D0 04              ..   BNE &3825
.addr3821
3821  A9 C0              ..   LDA #&C0
3823  A2 35              .5   LDX #&35
.addr3825
3825  A0 38              .8   LDY #&38
3827  85 07              ..   STA &07
3829  86 1C              ..   STX &1C
382B  84 1D              ..   STY &1D
382D  A9 7D              .}   LDA #&7D
382F  4C 45 1F           LE.  JMP &1F45
3832  E0 E0              ..   CPX #&E0
3834  80                 .    ...
3835  E0 E0              ..   CPX #&E0
3837  80                 .    ...
3838  E0 E0              ..   CPX #&E0
383A  20 E0 E0            ..  JSR &E0E0
.addr383D
383D  8A                 .    TXA
383E  0A                 .    ASL A
383F  0A                 .    ASL A
3840  0A                 .    ASL A
3841  85 D1              ..   STA &D1
3843  A9 31              .1   LDA #&31
3845  E5 D1              ..   SBC &D1
3847  85 07              ..   STA &07
3849  A9 7E              .~   LDA #&7E
384B  85 08              ..   STA &08
384D  98                 .    TYA
384E  A0 05              ..   LDY #&05
.addr3850
3850  91 07              ..   STA (&07),Y
3852  88                 .    DEY
3853  D0 FB              ..   BNE &3850
3855  60                 `    RTS
.addr3856
3856  A5 46              .F   LDA &46
3858  85 1B              ..   STA &1B
385A  A5 47              .G   LDA &47
385C  85 1C              ..   STA &1C
385E  A5 48              .H   LDA &48
3860  20 FA 3C            .<  JSR &3CFA
3863  B0 28              .(   BCS &388D
3865  A5 40              .@   LDA &40
3867  69 80              i.   ADC #&80
3869  85 D2              ..   STA &D2
386B  8A                 .    TXA
386C  69 00              i.   ADC #&00
386E  85 D3              ..   STA &D3
3870  A5 49              .I   LDA &49
3872  85 1B              ..   STA &1B
3874  A5 4A              .J   LDA &4A
3876  85 1C              ..   STA &1C
3878  A5 4B              .K   LDA &4B
387A  49 80              I.   EOR #&80
387C  20 FA 3C            .<  JSR &3CFA
387F  B0 0C              ..   BCS &388D
3881  A5 40              .@   LDA &40
3883  69 60              i`   ADC #&60
3885  85 E0              ..   STA &E0
3887  8A                 .    TXA
3888  69 00              i.   ADC #&00
388A  85 E1              ..   STA &E1
388C  18                 .    CLC
.addr388D
388D  60                 `    RTS
.addr388E
388E  A5 8C              ..   LDA &8C
3890  4A                 J    LSR A
3891  B0 03              ..   BCS &3896
3893  4C ED 3B           L.;  JMP &3BED
.addr3896
3896  4C 30 3C           L0<  JMP &3C30
.addr3899
3899  A5 4E              .N   LDA &4E
389B  30 F1              0.   BMI &388E
389D  C9 30              .0   CMP #&30
389F  B0 ED              ..   BCS &388E
38A1  05 4D              .M   ORA &4D
38A3  F0 E9              ..   BEQ &388E
38A5  20 56 38            V8  JSR &3856
38A8  B0 E4              ..   BCS &388E
38AA  A9 60              .`   LDA #&60
38AC  85 1C              ..   STA &1C
38AE  A9 00              ..   LDA #&00
38B0  85 1B              ..   STA &1B
38B2  20 7E 29            ~)  JSR &297E
38B5  A5 41              .A   LDA &41
38B7  F0 04              ..   BEQ &38BD
38B9  A9 F8              ..   LDA #&F8
38BB  85 40              .@   STA &40
.addr38BD
38BD  A5 8C              ..   LDA &8C
38BF  4A                 J    LSR A
38C0  90 03              ..   BCC &38C5
38C2  4C 54 3A           LT:  JMP &3A54
.addr38C5
38C5  20 ED 3B            .;  JSR &3BED
38C8  20 76 3B            v;  JSR &3B76
38CB  B0 04              ..   BCS &38D1
38CD  A5 41              .A   LDA &41
38CF  F0 01              ..   BEQ &38D2
.addr38D1
38D1  60                 `    RTS
.addr38D2
38D2  A5 8C              ..   LDA &8C
38D4  C9 80              ..   CMP #&80
38D6  D0 3C              .<   BNE &3914
38D8  A5 40              .@   LDA &40
38DA  C9 06              ..   CMP #&06
38DC  90 F3              ..   BCC &38D1
38DE  A5 54              .T   LDA &54
38E0  49 80              I.   EOR #&80
38E2  85 1B              ..   STA &1B
38E4  A5 5A              .Z   LDA &5A
38E6  20 DB 3C            .<  JSR &3CDB
38E9  A2 09              ..   LDX #&09
38EB  20 69 39            i9  JSR &3969
38EE  85 9B              ..   STA &9B
38F0  84 09              ..   STY &09
38F2  20 69 39            i9  JSR &3969
38F5  85 9C              ..   STA &9C
38F7  84 0A              ..   STY &0A
38F9  A2 0F              ..   LDX #&0F
38FB  20 EB 3C            .<  JSR &3CEB
38FE  20 87 39            .9  JSR &3987
3901  A5 54              .T   LDA &54
3903  49 80              I.   EOR #&80
3905  85 1B              ..   STA &1B
3907  A5 60              .`   LDA &60
3909  20 DB 3C            .<  JSR &3CDB
390C  A2 15              ..   LDX #&15
390E  20 EB 3C            .<  JSR &3CEB
3911  4C 87 39           L.9  JMP &3987
.addr3914
3914  A5 5A              .Z   LDA &5A
3916  30 B9              0.   BMI &38D1
3918  A2 0F              ..   LDX #&0F
391A  20 BA 3C            .<  JSR &3CBA
391D  18                 .    CLC
391E  65 D2              e.   ADC &D2
3920  85 D2              ..   STA &D2
3922  98                 .    TYA
3923  65 D3              e.   ADC &D3
3925  85 D3              ..   STA &D3
3927  20 BA 3C            .<  JSR &3CBA
392A  85 1B              ..   STA &1B
392C  A5 E0              ..   LDA &E0
392E  38                 8    SEC
392F  E5 1B              ..   SBC &1B
3931  85 E0              ..   STA &E0
3933  84 1B              ..   STY &1B
3935  A5 E1              ..   LDA &E1
3937  E5 1B              ..   SBC &1B
3939  85 E1              ..   STA &E1
393B  A2 09              ..   LDX #&09
393D  20 69 39            i9  JSR &3969
3940  4A                 J    LSR A
3941  85 9B              ..   STA &9B
3943  84 09              ..   STY &09
3945  20 69 39            i9  JSR &3969
3948  4A                 J    LSR A
3949  85 9C              ..   STA &9C
394B  84 0A              ..   STY &0A
394D  A2 15              ..   LDX #&15
394F  20 69 39            i9  JSR &3969
3952  4A                 J    LSR A
3953  85 9D              ..   STA &9D
3955  84 0B              ..   STY &0B
3957  20 69 39            i9  JSR &3969
395A  4A                 J    LSR A
395B  85 9E              ..   STA &9E
395D  84 0C              ..   STY &0C
395F  A9 40              .@   LDA #&40
3961  85 8F              ..   STA &8F
3963  A9 00              ..   LDA #&00
3965  85 94              ..   STA &94
3967  F0 22              ."   BEQ &398B
.addr3969
3969  B5 46              .F   LDA &46,X
396B  85 1B              ..   STA &1B
396D  B5 47              .G   LDA &47,X
396F  29 7F              )   AND #&7F
3971  85 1C              ..   STA &1C
3973  B5 47              .G   LDA &47,X
3975  29 80              ).   AND #&80
3977  20 7E 29            ~)  JSR &297E
397A  A5 40              .@   LDA &40
397C  A4 41              .A   LDY &41
397E  F0 02              ..   BEQ &3982
3980  A9 FE              ..   LDA #&FE
.addr3982
3982  A4 43              .C   LDY &43
3984  E8                 .    INX
3985  E8                 .    INX
3986  60                 `    RTS
.addr3987
3987  A9 1F              ..   LDA #&1F
3989  85 8F              ..   STA &8F
.addr398B
398B  A2 00              ..   LDX #&00
398D  86 93              ..   STX &93
398F  CA                 .    DEX
3990  86 92              ..   STX &92
.addr3992
3992  A5 94              ..   LDA &94
3994  29 1F              ).   AND #&1F
3996  AA                 .    TAX
3997  BD C0 07           ...  LDA &07C0,X
399A  85 81              ..   STA &81
399C  A5 9D              ..   LDA &9D
399E  20 47 28            G(  JSR &2847
39A1  85 82              ..   STA &82
39A3  A5 9E              ..   LDA &9E
39A5  20 47 28            G(  JSR &2847
39A8  85 40              .@   STA &40
39AA  A6 94              ..   LDX &94
39AC  E0 21              .!   CPX #&21
39AE  A9 00              ..   LDA #&00
39B0  6A                 j    ROR A
39B1  85 0E              ..   STA &0E
39B3  A5 94              ..   LDA &94
39B5  18                 .    CLC
39B6  69 10              i.   ADC #&10
39B8  29 1F              ).   AND #&1F
39BA  AA                 .    TAX
39BB  BD C0 07           ...  LDA &07C0,X
39BE  85 81              ..   STA &81
39C0  A5 9C              ..   LDA &9C
39C2  20 47 28            G(  JSR &2847
39C5  85 42              .B   STA &42
39C7  A5 9B              ..   LDA &9B
39C9  20 47 28            G(  JSR &2847
39CC  85 1B              ..   STA &1B
39CE  A5 94              ..   LDA &94
39D0  69 0F              i.   ADC #&0F
39D2  29 3F              )?   AND #&3F
39D4  C9 21              .!   CMP #&21
39D6  A9 00              ..   LDA #&00
39D8  6A                 j    ROR A
39D9  85 0D              ..   STA &0D
39DB  A5 0E              ..   LDA &0E
39DD  45 0B              E.   EOR &0B
39DF  85 83              ..   STA &83
39E1  A5 0D              ..   LDA &0D
39E3  45 09              E.   EOR &09
39E5  20 FF 28            .(  JSR &28FF
39E8  85 D1              ..   STA &D1
39EA  10 0F              ..   BPL &39FB
39EC  8A                 .    TXA
39ED  49 FF              I.   EOR #&FF
39EF  18                 .    CLC
39F0  69 01              i.   ADC #&01
39F2  AA                 .    TAX
39F3  A5 D1              ..   LDA &D1
39F5  49 7F              I   EOR #&7F
39F7  69 00              i.   ADC #&00
39F9  85 D1              ..   STA &D1
.addr39FB
39FB  8A                 .    TXA
39FC  65 D2              e.   ADC &D2
39FE  85 76              .v   STA &76
3A00  A5 D1              ..   LDA &D1
3A02  65 D3              e.   ADC &D3
3A04  85 77              .w   STA &77
3A06  A5 40              .@   LDA &40
3A08  85 82              ..   STA &82
3A0A  A5 0E              ..   LDA &0E
3A0C  45 0C              E.   EOR &0C
3A0E  85 83              ..   STA &83
3A10  A5 42              .B   LDA &42
3A12  85 1B              ..   STA &1B
3A14  A5 0D              ..   LDA &0D
3A16  45 0A              E.   EOR &0A
3A18  20 FF 28            .(  JSR &28FF
3A1B  49 80              I.   EOR #&80
3A1D  85 D1              ..   STA &D1
3A1F  10 0F              ..   BPL &3A30
3A21  8A                 .    TXA
3A22  49 FF              I.   EOR #&FF
3A24  18                 .    CLC
3A25  69 01              i.   ADC #&01
3A27  AA                 .    TAX
3A28  A5 D1              ..   LDA &D1
3A2A  49 7F              I   EOR #&7F
3A2C  69 00              i.   ADC #&00
3A2E  85 D1              ..   STA &D1
.addr3A30
3A30  20 6B 19            k.  JSR &196B
3A33  C5 8F              ..   CMP &8F
3A35  F0 02              ..   BEQ &3A39
3A37  B0 0C              ..   BCS &3A45
.addr3A39
3A39  A5 94              ..   LDA &94
3A3B  18                 .    CLC
3A3C  65 95              e.   ADC &95
3A3E  29 3F              )?   AND #&3F
3A40  85 94              ..   STA &94
3A42  4C 92 39           L.9  JMP &3992
.addr3A45
3A45  60                 `    RTS
.addr3A46
3A46  4C 30 3C           L0<  JMP &3C30
.addr3A49
3A49  8A                 .    TXA
3A4A  49 FF              I.   EOR #&FF
3A4C  18                 .    CLC
3A4D  69 01              i.   ADC #&01
3A4F  AA                 .    TAX
.addr3A50
3A50  A9 FF              ..   LDA #&FF
3A52  D0 45              .E   BNE &3A99
.addr3A54
3A54  A9 01              ..   LDA #&01
3A56  8D 00 0E           ...  STA &0E00
3A59  20 80 3C            .<  JSR &3C80
3A5C  B0 E8              ..   BCS &3A46
3A5E  A9 00              ..   LDA #&00
3A60  A6 40              .@   LDX &40
3A62  E0 60              .`   CPX #&60
3A64  2A                 *    ROL A
3A65  E0 28              .(   CPX #&28
3A67  2A                 *    ROL A
3A68  E0 10              ..   CPX #&10
3A6A  2A                 *    ROL A
3A6B  85 93              ..   STA &93
3A6D  A9 BF              ..   LDA #&BF
3A6F  A6 1D              ..   LDX &1D
3A71  D0 0A              ..   BNE &3A7D
3A73  C5 1C              ..   CMP &1C
3A75  90 06              ..   BCC &3A7D
3A77  A5 1C              ..   LDA &1C
3A79  D0 02              ..   BNE &3A7D
3A7B  A9 01              ..   LDA #&01
.addr3A7D
3A7D  85 8F              ..   STA &8F
3A7F  A9 BF              ..   LDA #&BF
3A81  38                 8    SEC
3A82  E5 E0              ..   SBC &E0
3A84  AA                 .    TAX
3A85  A9 00              ..   LDA #&00
3A87  E5 E1              ..   SBC &E1
3A89  30 BE              0.   BMI &3A49
3A8B  D0 08              ..   BNE &3A95
3A8D  E8                 .    INX
3A8E  CA                 .    DEX
3A8F  F0 BF              ..   BEQ &3A50
3A91  E4 40              .@   CPX &40
3A93  90 04              ..   BCC &3A99
.addr3A95
3A95  A6 40              .@   LDX &40
3A97  A9 00              ..   LDA #&00
.addr3A99
3A99  86 22              ."   STX &22
3A9B  85 23              .#   STA &23
3A9D  A5 40              .@   LDA &40
3A9F  20 0D 28            .(  JSR &280D
3AA2  85 9C              ..   STA &9C
3AA4  A5 1B              ..   LDA &1B
3AA6  85 9B              ..   STA &9B
3AA8  A0 BF              ..   LDY #&BF
3AAA  A5 28              .(   LDA &28
3AAC  85 26              .&   STA &26
3AAE  A5 29              .)   LDA &29
3AB0  85 27              .'   STA &27
.addr3AB2
3AB2  C4 8F              ..   CPY &8F
3AB4  F0 0B              ..   BEQ &3AC1
3AB6  B9 00 0E           ...  LDA &0E00,Y
3AB9  F0 03              ..   BEQ &3ABE
3ABB  20 5E 18            ^.  JSR &185E
.addr3ABE
3ABE  88                 .    DEY
3ABF  D0 F1              ..   BNE &3AB2
.addr3AC1
3AC1  A5 22              ."   LDA &22
3AC3  20 0D 28            .(  JSR &280D
3AC6  85 D1              ..   STA &D1
3AC8  A5 9B              ..   LDA &9B
3ACA  38                 8    SEC
3ACB  E5 1B              ..   SBC &1B
3ACD  85 81              ..   STA &81
3ACF  A5 9C              ..   LDA &9C
3AD1  E5 D1              ..   SBC &D1
3AD3  85 82              ..   STA &82
3AD5  84 35              .5   STY &35
3AD7  20 B8 47            .G  JSR &47B8
3ADA  A4 35              .5   LDY &35
3ADC  20 86 3F            .?  JSR &3F86
3ADF  25 93              %.   AND &93
3AE1  18                 .    CLC
3AE2  65 81              e.   ADC &81
3AE4  90 02              ..   BCC &3AE8
3AE6  A9 FF              ..   LDA #&FF
.addr3AE8
3AE8  BE 00 0E           ...  LDX &0E00,Y
3AEB  99 00 0E           ...  STA &0E00,Y
3AEE  F0 4A              .J   BEQ &3B3A
3AF0  A5 28              .(   LDA &28
3AF2  85 26              .&   STA &26
3AF4  A5 29              .)   LDA &29
3AF6  85 27              .'   STA &27
3AF8  8A                 .    TXA
3AF9  20 4F 3C            O<  JSR &3C4F
3AFC  A5 34              .4   LDA &34
3AFE  85 24              .$   STA &24
3B00  A5 36              .6   LDA &36
3B02  85 25              .%   STA &25
3B04  A5 D2              ..   LDA &D2
3B06  85 26              .&   STA &26
3B08  A5 D3              ..   LDA &D3
3B0A  85 27              .'   STA &27
3B0C  B9 00 0E           ...  LDA &0E00,Y
3B0F  20 4F 3C            O<  JSR &3C4F
3B12  B0 0B              ..   BCS &3B1F
3B14  A5 36              .6   LDA &36
3B16  A6 24              .$   LDX &24
3B18  86 36              .6   STX &36
3B1A  85 24              .$   STA &24
3B1C  20 68 18            h.  JSR &1868
.addr3B1F
3B1F  A5 24              .$   LDA &24
3B21  85 34              .4   STA &34
3B23  A5 25              .%   LDA &25
3B25  85 36              .6   STA &36
.addr3B27
3B27  20 68 18            h.  JSR &1868
.addr3B2A
3B2A  88                 .    DEY
3B2B  F0 3F              .?   BEQ &3B6C
3B2D  A5 23              .#   LDA &23
3B2F  D0 1D              ..   BNE &3B4E
3B31  C6 22              ."   DEC &22
3B33  D0 8C              ..   BNE &3AC1
3B35  C6 23              .#   DEC &23
.addr3B37
3B37  4C C1 3A           L.:  JMP &3AC1
.addr3B3A
3B3A  A6 D2              ..   LDX &D2
3B3C  86 26              .&   STX &26
3B3E  A6 D3              ..   LDX &D3
3B40  86 27              .'   STX &27
3B42  20 4F 3C            O<  JSR &3C4F
3B45  90 E0              ..   BCC &3B27
3B47  A9 00              ..   LDA #&00
3B49  99 00 0E           ...  STA &0E00,Y
3B4C  F0 DC              ..   BEQ &3B2A
.addr3B4E
3B4E  A6 22              ."   LDX &22
3B50  E8                 .    INX
3B51  86 22              ."   STX &22
3B53  E4 40              .@   CPX &40
3B55  90 E0              ..   BCC &3B37
3B57  F0 DE              ..   BEQ &3B37
3B59  A5 28              .(   LDA &28
3B5B  85 26              .&   STA &26
3B5D  A5 29              .)   LDA &29
3B5F  85 27              .'   STA &27
.addr3B61
3B61  B9 00 0E           ...  LDA &0E00,Y
3B64  F0 03              ..   BEQ &3B69
3B66  20 5E 18            ^.  JSR &185E
.addr3B69
3B69  88                 .    DEY
3B6A  D0 F5              ..   BNE &3B61
.addr3B6C
3B6C  18                 .    CLC
3B6D  A5 D2              ..   LDA &D2
3B6F  85 28              .(   STA &28
3B71  A5 D3              ..   LDA &D3
3B73  85 29              .)   STA &29
.addr3B75
3B75  60                 `    RTS
.addr3B76
3B76  20 80 3C            .<  JSR &3C80
3B79  B0 FA              ..   BCS &3B75
3B7B  A9 00              ..   LDA #&00
3B7D  8D C0 0E           ...  STA &0EC0
3B80  A6 40              .@   LDX &40
3B82  A9 08              ..   LDA #&08
3B84  E0 08              ..   CPX #&08
3B86  90 06              ..   BCC &3B8E
3B88  4A                 J    LSR A
3B89  E0 3C              .<   CPX #&3C
3B8B  90 01              ..   BCC &3B8E
3B8D  4A                 J    LSR A
.addr3B8E
3B8E  85 95              ..   STA &95
.addr3B90
3B90  A2 FF              ..   LDX #&FF
3B92  86 92              ..   STX &92
3B94  E8                 .    INX
3B95  86 93              ..   STX &93
.addr3B97
3B97  A5 93              ..   LDA &93
3B99  20 3D 28            =(  JSR &283D
3B9C  A2 00              ..   LDX #&00
3B9E  86 D1              ..   STX &D1
3BA0  A6 93              ..   LDX &93
3BA2  E0 21              .!   CPX #&21
3BA4  90 0D              ..   BCC &3BB3
3BA6  49 FF              I.   EOR #&FF
3BA8  69 00              i.   ADC #&00
3BAA  AA                 .    TAX
3BAB  A9 FF              ..   LDA #&FF
3BAD  69 00              i.   ADC #&00
3BAF  85 D1              ..   STA &D1
3BB1  8A                 .    TXA
3BB2  18                 .    CLC
.addr3BB3
3BB3  65 D2              e.   ADC &D2
3BB5  85 76              .v   STA &76
3BB7  A5 D3              ..   LDA &D3
3BB9  65 D1              e.   ADC &D1
3BBB  85 77              .w   STA &77
3BBD  A5 93              ..   LDA &93
3BBF  18                 .    CLC
3BC0  69 10              i.   ADC #&10
3BC2  20 3D 28            =(  JSR &283D
3BC5  AA                 .    TAX
3BC6  A9 00              ..   LDA #&00
3BC8  85 D1              ..   STA &D1
3BCA  A5 93              ..   LDA &93
3BCC  69 0F              i.   ADC #&0F
3BCE  29 3F              )?   AND #&3F
3BD0  C9 21              .!   CMP #&21
3BD2  90 0D              ..   BCC &3BE1
3BD4  8A                 .    TXA
3BD5  49 FF              I.   EOR #&FF
3BD7  69 00              i.   ADC #&00
3BD9  AA                 .    TAX
3BDA  A9 FF              ..   LDA #&FF
3BDC  69 00              i.   ADC #&00
3BDE  85 D1              ..   STA &D1
3BE0  18                 .    CLC
.addr3BE1
3BE1  20 6B 19            k.  JSR &196B
3BE4  C9 41              .A   CMP #&41
3BE6  B0 03              ..   BCS &3BEB
3BE8  4C 97 3B           L.;  JMP &3B97
.addr3BEB
3BEB  18                 .    CLC
3BEC  60                 `    RTS
.addr3BED
3BED  AC C0 0E           ...  LDY &0EC0
3BF0  D0 34              .4   BNE &3C26
.addr3BF2
3BF2  C4 6B              .k   CPY &6B
3BF4  B0 30              .0   BCS &3C26
3BF6  B9 0E 0F           ...  LDA &0F0E,Y
3BF9  C9 FF              ..   CMP #&FF
3BFB  F0 1A              ..   BEQ &3C17
3BFD  85 37              .7   STA &37
3BFF  B9 C0 0E           ...  LDA &0EC0,Y
3C02  85 36              .6   STA &36
3C04  20 C4 16            ..  JSR &16C4
3C07  C8                 .    INY
3C08  A5 90              ..   LDA &90
3C0A  D0 E6              ..   BNE &3BF2
3C0C  A5 36              .6   LDA &36
3C0E  85 34              .4   STA &34
3C10  A5 37              .7   LDA &37
3C12  85 35              .5   STA &35
3C14  4C F2 3B           L.;  JMP &3BF2
.addr3C17
3C17  C8                 .    INY
3C18  B9 C0 0E           ...  LDA &0EC0,Y
3C1B  85 34              .4   STA &34
3C1D  B9 0E 0F           ...  LDA &0F0E,Y
3C20  85 35              .5   STA &35
3C22  C8                 .    INY
3C23  4C F2 3B           L.;  JMP &3BF2
.addr3C26
3C26  A9 01              ..   LDA #&01
3C28  85 6B              .k   STA &6B
3C2A  A9 FF              ..   LDA #&FF
3C2C  8D C0 0E           ...  STA &0EC0
.addr3C2F
3C2F  60                 `    RTS
.addr3C30
3C30  AD 00 0E           ...  LDA &0E00
3C33  30 FA              0.   BMI &3C2F
3C35  A5 28              .(   LDA &28
3C37  85 26              .&   STA &26
3C39  A5 29              .)   LDA &29
3C3B  85 27              .'   STA &27
3C3D  A0 BF              ..   LDY #&BF
.addr3C3F
3C3F  B9 00 0E           ...  LDA &0E00,Y
3C42  F0 03              ..   BEQ &3C47
3C44  20 5E 18            ^.  JSR &185E
.addr3C47
3C47  88                 .    DEY
3C48  D0 F5              ..   BNE &3C3F
3C4A  88                 .    DEY
3C4B  8C 00 0E           ...  STY &0E00
3C4E  60                 `    RTS
.addr3C4F
3C4F  85 D1              ..   STA &D1
3C51  18                 .    CLC
3C52  65 26              e&   ADC &26
3C54  85 36              .6   STA &36
3C56  A5 27              .'   LDA &27
3C58  69 00              i.   ADC #&00
3C5A  30 1D              0.   BMI &3C79
3C5C  F0 04              ..   BEQ &3C62
3C5E  A9 FE              ..   LDA #&FE
3C60  85 36              .6   STA &36
.addr3C62
3C62  A5 26              .&   LDA &26
3C64  38                 8    SEC
3C65  E5 D1              ..   SBC &D1
3C67  85 34              .4   STA &34
3C69  A5 27              .'   LDA &27
3C6B  E9 00              ..   SBC #&00
3C6D  D0 02              ..   BNE &3C71
3C6F  18                 .    CLC
3C70  60                 `    RTS
.addr3C71
3C71  10 06              ..   BPL &3C79
3C73  A9 02              ..   LDA #&02
3C75  85 34              .4   STA &34
3C77  18                 .    CLC
3C78  60                 `    RTS
.addr3C79
3C79  A9 00              ..   LDA #&00
3C7B  99 00 0E           ...  STA &0E00,Y
3C7E  38                 8    SEC
3C7F  60                 `    RTS
.addr3C80
3C80  A5 D2              ..   LDA &D2
3C82  18                 .    CLC
3C83  65 40              e@   ADC &40
3C85  A5 D3              ..   LDA &D3
3C87  69 00              i.   ADC #&00
3C89  30 2D              0-   BMI &3CB8
3C8B  A5 D2              ..   LDA &D2
3C8D  38                 8    SEC
3C8E  E5 40              .@   SBC &40
3C90  A5 D3              ..   LDA &D3
3C92  E9 00              ..   SBC #&00
3C94  30 02              0.   BMI &3C98
3C96  D0 20              .    BNE &3CB8
.addr3C98
3C98  A5 E0              ..   LDA &E0
3C9A  18                 .    CLC
3C9B  65 40              e@   ADC &40
3C9D  85 1C              ..   STA &1C
3C9F  A5 E1              ..   LDA &E1
3CA1  69 00              i.   ADC #&00
3CA3  30 13              0.   BMI &3CB8
3CA5  85 1D              ..   STA &1D
3CA7  A5 E0              ..   LDA &E0
3CA9  38                 8    SEC
3CAA  E5 40              .@   SBC &40
3CAC  AA                 .    TAX
3CAD  A5 E1              ..   LDA &E1
3CAF  E9 00              ..   SBC #&00
3CB1  30 6A              0j   BMI &3D1D
3CB3  D0 03              ..   BNE &3CB8
3CB5  E0 BF              ..   CPX #&BF
3CB7  60                 `    RTS
.addr3CB8
3CB8  38                 8    SEC
3CB9  60                 `    RTS
.addr3CBA
3CBA  20 69 39            i9  JSR &3969
3CBD  85 1B              ..   STA &1B
3CBF  A9 DE              ..   LDA #&DE
3CC1  85 81              ..   STA &81
3CC3  86 80              ..   STX &80
3CC5  20 20 28             (  JSR &2820
3CC8  A6 80              ..   LDX &80
3CCA  A4 43              .C   LDY &43
3CCC  10 0A              ..   BPL &3CD8
3CCE  49 FF              I.   EOR #&FF
3CD0  18                 .    CLC
3CD1  69 01              i.   ADC #&01
3CD3  F0 03              ..   BEQ &3CD8
3CD5  A0 FF              ..   LDY #&FF
3CD7  60                 `    RTS
.addr3CD8
3CD8  A0 00              ..   LDY #&00
3CDA  60                 `    RTS
.addr3CDB
3CDB  85 81              ..   STA &81
3CDD  20 3C 2A            <*  JSR &2A3C
3CE0  A6 54              .T   LDX &54
3CE2  30 02              0.   BMI &3CE6
3CE4  49 80              I.   EOR #&80
.addr3CE6
3CE6  4A                 J    LSR A
3CE7  4A                 J    LSR A
3CE8  85 94              ..   STA &94
3CEA  60                 `    RTS
.addr3CEB
3CEB  20 69 39            i9  JSR &3969
3CEE  85 9D              ..   STA &9D
3CF0  84 0B              ..   STY &0B
3CF2  20 69 39            i9  JSR &3969
3CF5  85 9E              ..   STA &9E
3CF7  84 0C              ..   STY &0C
3CF9  60                 `    RTS
.addr3CFA
3CFA  20 7E 29            ~)  JSR &297E
3CFD  A5 43              .C   LDA &43
3CFF  29 7F              )   AND #&7F
3D01  05 42              .B   ORA &42
3D03  D0 B3              ..   BNE &3CB8
3D05  A6 41              .A   LDX &41
3D07  E0 04              ..   CPX #&04
3D09  B0 13              ..   BCS &3D1E
3D0B  A5 43              .C   LDA &43
3D0D  10 0F              ..   BPL &3D1E
3D0F  A5 40              .@   LDA &40
3D11  49 FF              I.   EOR #&FF
3D13  69 01              i.   ADC #&01
3D15  85 40              .@   STA &40
3D17  8A                 .    TXA
3D18  49 FF              I.   EOR #&FF
3D1A  69 00              i.   ADC #&00
3D1C  AA                 .    TAX
.addr3D1D
3D1D  18                 .    CLC
.addr3D1E
3D1E  60                 `    RTS
.addr3D1F
3D1F  20 AF 44            .D  JSR &44AF
3D22  AD CD 03           ...  LDA &03CD
3D25  F0 25              .%   BEQ &3D4C
3D27  AD 4C 03           .L.  LDA &034C
3D2A  49 FF              I.   EOR #&FF
3D2C  20 34 3D            4=  JSR &3D34
3D2F  98                 .    TYA
3D30  AA                 .    TAX
3D31  AD 4D 03           .M.  LDA &034D
.addr3D34
3D34  A8                 .    TAY
3D35  A9 00              ..   LDA #&00
3D37  C0 10              ..   CPY #&10
3D39  E9 00              ..   SBC #&00
3D3B  C0 40              .@   CPY #&40
3D3D  E9 00              ..   SBC #&00
3D3F  C0 C0              ..   CPY #&C0
3D41  69 00              i.   ADC #&00
3D43  C0 E0              ..   CPY #&E0
3D45  69 00              i.   ADC #&00
3D47  A8                 .    TAY
3D48  AD 00 03           ...  LDA &0300
3D4B  60                 `    RTS
.addr3D4C
3D4C  AD 00 03           ...  LDA &0300
3D4F  A2 00              ..   LDX #&00
3D51  A0 00              ..   LDY #&00
3D53  C9 19              ..   CMP #&19
3D55  D0 01              ..   BNE &3D58
3D57  CA                 .    DEX
.addr3D58
3D58  C9 79              .y   CMP #&79
3D5A  D0 01              ..   BNE &3D5D
3D5C  E8                 .    INX
.addr3D5D
3D5D  C9 39              .9   CMP #&39
3D5F  D0 01              ..   BNE &3D62
3D61  C8                 .    INY
.addr3D62
3D62  C9 29              .)   CMP #&29
3D64  D0 01              ..   BNE &3D67
3D66  88                 .    DEY
.addr3D67
3D67  60                 `    RTS
.addr3D68
3D68  A2 01              ..   LDX #&01
.addr3D6A
3D6A  BD 59 03           .Y.  LDA &0359,X
3D6D  9D C1 03           ...  STA &03C1,X
3D70  CA                 .    DEX
3D71  10 F7              ..   BPL &3D6A
3D73  60                 `    RTS
.addr3D74
3D74  A5 1B              ..   LDA &1B
3D76  8D B0 03           ...  STA &03B0
3D79  A5 1C              ..   LDA &1C
3D7B  8D B1 03           ...  STA &03B1
3D7E  60                 `    RTS
.addr3D7F
3D7F  A6 84              ..   LDX &84
3D81  20 D8 3D            .=  JSR &3DD8
3D84  A6 84              ..   LDX &84
3D86  4C 76 13           Lv.  JMP &1376
.addr3D89
3D89  20 26 3F            &?  JSR &3F26
3D8C  20 0A 36            .6  JSR &360A
3D8F  8D 12 03           ...  STA &0312
3D92  8D 20 03           . .  STA &0320
3D95  20 21 38            !8  JSR &3821
3D98  A9 06              ..   LDA #&06
3D9A  85 4B              .K   STA &4B
3D9C  A9 81              ..   LDA #&81
3D9E  4C 68 37           Lh7  JMP &3768
.addr3DA1
3DA1  A2 FF              ..   LDX #&FF
.addr3DA3
3DA3  E8                 .    INX
3DA4  BD 11 03           ...  LDA &0311,X
3DA7  F0 CB              ..   BEQ &3D74
3DA9  C9 01              ..   CMP #&01
3DAB  D0 F6              ..   BNE &3DA3
3DAD  8A                 .    TXA
3DAE  0A                 .    ASL A
3DAF  A8                 .    TAY
3DB0  B9 95 16           ...  LDA &1695,Y
3DB3  85 07              ..   STA &07
3DB5  B9 96 16           ...  LDA &1696,Y
3DB8  85 08              ..   STA &08
3DBA  A0 20              .    LDY #&20
3DBC  B1 07              ..   LDA (&07),Y
3DBE  10 E3              ..   BPL &3DA3
3DC0  29 7F              )   AND #&7F
3DC2  4A                 J    LSR A
3DC3  C5 96              ..   CMP &96
3DC5  90 DC              ..   BCC &3DA3
3DC7  F0 09              ..   BEQ &3DD2
3DC9  E9 01              ..   SBC #&01
3DCB  0A                 .    ASL A
3DCC  09 80              ..   ORA #&80
3DCE  91 07              ..   STA (&07),Y
3DD0  D0 D1              ..   BNE &3DA3
.addr3DD2
3DD2  A9 00              ..   LDA #&00
3DD4  91 07              ..   STA (&07),Y
3DD6  F0 CB              ..   BEQ &3DA3
.addr3DD8
3DD8  86 96              ..   STX &96
3DDA  E4 45              .E   CPX &45
3DDC  D0 0A              ..   BNE &3DE8
3DDE  A0 EE              ..   LDY #&EE
3DE0  20 05 38            .8  JSR &3805
3DE3  A9 C8              ..   LDA #&C8
3DE5  20 C6 45            .E  JSR &45C6
.addr3DE8
3DE8  A4 96              ..   LDY &96
3DEA  BE 11 03           ...  LDX &0311,Y
3DED  E0 02              ..   CPX #&02
3DEF  F0 98              ..   BEQ &3D89
3DF1  E0 1F              ..   CPX #&1F
3DF3  D0 08              ..   BNE &3DFD
3DF5  AD 58 03           .X.  LDA &0358
3DF8  09 02              ..   ORA #&02
3DFA  8D 58 03           .X.  STA &0358
.addr3DFD
3DFD  E0 03              ..   CPX #&03
3DFF  90 07              ..   BCC &3E08
3E01  E0 0B              ..   CPX #&0B
3E03  B0 03              ..   BCS &3E08
3E05  CE 3E 03           .>.  DEC &033E
.addr3E08
3E08  DE 1E 03           ...  DEC &031E,X
3E0B  A6 96              ..   LDX &96
3E0D  A0 05              ..   LDY #&05
3E0F  B1 1E              ..   LDA (&1E),Y
3E11  A0 21              .!   LDY #&21
3E13  18                 .    CLC
3E14  71 20              q    ADC (&20),Y
3E16  85 1B              ..   STA &1B
3E18  C8                 .    INY
3E19  B1 20              .    LDA (&20),Y
3E1B  69 00              i.   ADC #&00
3E1D  85 1C              ..   STA &1C
.addr3E1F
3E1F  E8                 .    INX
3E20  BD 11 03           ...  LDA &0311,X
3E23  9D 10 03           ...  STA &0310,X
3E26  D0 03              ..   BNE &3E2B
3E28  4C A1 3D           L.=  JMP &3DA1
.addr3E2B
3E2B  0A                 .    ASL A
3E2C  A8                 .    TAY
3E2D  B9 FE 55           ..U  LDA &55FE,Y
3E30  85 07              ..   STA &07
3E32  B9 FF 55           ..U  LDA &55FF,Y
3E35  85 08              ..   STA &08
3E37  A0 05              ..   LDY #&05
3E39  B1 07              ..   LDA (&07),Y
3E3B  85 D1              ..   STA &D1
3E3D  A5 1B              ..   LDA &1B
3E3F  38                 8    SEC
3E40  E5 D1              ..   SBC &D1
3E42  85 1B              ..   STA &1B
3E44  A5 1C              ..   LDA &1C
3E46  E9 00              ..   SBC #&00
3E48  85 1C              ..   STA &1C
3E4A  8A                 .    TXA
3E4B  0A                 .    ASL A
3E4C  A8                 .    TAY
3E4D  B9 95 16           ...  LDA &1695,Y
3E50  85 07              ..   STA &07
3E52  B9 96 16           ...  LDA &1696,Y
3E55  85 08              ..   STA &08
3E57  A0 24              .$   LDY #&24
3E59  B1 07              ..   LDA (&07),Y
3E5B  91 20              .    STA (&20),Y
3E5D  88                 .    DEY
3E5E  B1 07              ..   LDA (&07),Y
3E60  91 20              .    STA (&20),Y
3E62  88                 .    DEY
3E63  B1 07              ..   LDA (&07),Y
3E65  85 41              .A   STA &41
3E67  A5 1C              ..   LDA &1C
3E69  91 20              .    STA (&20),Y
3E6B  88                 .    DEY
3E6C  B1 07              ..   LDA (&07),Y
3E6E  85 40              .@   STA &40
3E70  A5 1B              ..   LDA &1B
3E72  91 20              .    STA (&20),Y
3E74  88                 .    DEY
.addr3E75
3E75  B1 07              ..   LDA (&07),Y
3E77  91 20              .    STA (&20),Y
3E79  88                 .    DEY
3E7A  10 F9              ..   BPL &3E75
3E7C  A5 07              ..   LDA &07
3E7E  85 20              .    STA &20
3E80  A5 08              ..   LDA &08
3E82  85 21              .!   STA &21
3E84  A4 D1              ..   LDY &D1
.addr3E86
3E86  88                 .    DEY
3E87  B1 40              .@   LDA (&40),Y
3E89  91 1B              ..   STA (&1B),Y
3E8B  98                 .    TYA
3E8C  D0 F8              ..   BNE &3E86
3E8E  F0 8F              ..   BEQ &3E1F
3E90  12                 .    ...
3E91  01 00              ..   ORA (&00,X)
3E93  10 12              ..   BPL &3EA7
3E95  02                 .    ...
3E96  2C 08 11           ,..  BIT &1108
3E99  03                 .    ...
3E9A  F0 18              ..   BEQ &3EB4
3E9C  10 F1              ..   BPL &3E8F
3E9E  07                 .    ...
3E9F  1A                 .    ...
3EA0  03                 .    ...
3EA1  F1 BC              ..   SBC (&BC),Y
3EA3  01 13              ..   ORA (&13,X)
3EA5  F4                 .    ...
3EA6  0C                 .    ...
.addr3EA7
3EA7  08                 .    PHP
3EA8  10 F1              ..   BPL &3E9B
3EAA  06 0C              ..   ASL &0C
3EAC  10 02              ..   BPL &3EB0
3EAE  60                 `    RTS
3EAF  10 13              ..   BPL &3EC4
3EB1  04                 .    ...
3EB2  C2                 .    ...
3EB3  FF                 .    ...
.addr3EB4
3EB4  13                 .    ...
3EB5  00                 .    BRK
3EB6  00                 .    BRK
3EB7  00                 .    BRK
.addr3EB8
3EB8  AE 67 03           .g.  LDX &0367
3EBB  CA                 .    DEX
3EBC  D0 0E              ..   BNE &3ECC
3EBE  AD 59 03           .Y.  LDA &0359
3EC1  C9 90              ..   CMP #&90
3EC3  D0 07              ..   BNE &3ECC
3EC5  AD 5A 03           .Z.  LDA &035A
3EC8  C9 21              .!   CMP #&21
3ECA  F0 01              ..   BEQ &3ECD
.addr3ECC
3ECC  18                 .    CLC
.addr3ECD
3ECD  60                 `    RTS
.addr3ECE
3ECE  20 96 42            .B  JSR &4296
3ED1  A2 08              ..   LDX #&08
.addr3ED3
3ED3  95 2A              .*   STA &2A,X
3ED5  CA                 .    DEX
3ED6  10 FB              ..   BPL &3ED3
3ED8  8A                 .    TXA
3ED9  A2 02              ..   LDX #&02
.addr3EDB
3EDB  9D A5 03           ...  STA &03A5,X
3EDE  CA                 .    DEX
3EDF  10 FA              ..   BPL &3EDB
.addr3EE1
3EE1  A9 12              ..   LDA #&12
3EE3  8D C3 03           ...  STA &03C3
3EE6  A2 FF              ..   LDX #&FF
3EE8  8E C0 0E           ...  STX &0EC0
3EEB  8E 0E 0F           ...  STX &0F0E
3EEE  86 45              .E   STX &45
3EF0  A9 80              ..   LDA #&80
3EF2  8D 4C 03           .L.  STA &034C
3EF5  8D 4D 03           .M.  STA &034D
3EF8  0A                 .    ASL A
3EF9  85 8A              ..   STA &8A
3EFB  85 2F              ./   STA &2F
3EFD  A9 03              ..   LDA #&03
3EFF  85 7D              .}   STA &7D
3F01  AD 20 03           . .  LDA &0320
3F04  F0 03              ..   BEQ &3F09
3F06  20 21 38            !8  JSR &3821
.addr3F09
3F09  A5 30              .0   LDA &30
3F0B  F0 03              ..   BEQ &3F10
3F0D  20 A3 43            .C  JSR &43A3
.addr3F10
3F10  20 D8 35            .5  JSR &35D8
3F13  20 96 42            .B  JSR &4296
3F16  A9 FF              ..   LDA #&FF
3F18  8D B0 03           ...  STA &03B0
3F1B  A9 0C              ..   LDA #&0C
3F1D  8D B1 03           ...  STA &03B1
3F20  20 62 1F            b.  JSR &1F62
3F23  20 A4 44            .D  JSR &44A4
.addr3F26
3F26  A0 24              .$   LDY #&24
3F28  A9 00              ..   LDA #&00
.addr3F2A
3F2A  99 46 00           .F.  STA &0046,Y
3F2D  88                 .    DEY
3F2E  10 FA              ..   BPL &3F2A
3F30  A9 60              .`   LDA #&60
3F32  85 58              .X   STA &58
3F34  85 5C              .\   STA &5C
3F36  09 80              ..   ORA #&80
3F38  85 54              .T   STA &54
3F3A  60                 `    RTS
.addr3F3B
3F3B  A2 04              ..   LDX #&04
.addr3F3D
3F3D  EC 8B 03           ...  CPX &038B
3F40  F0 09              ..   BEQ &3F4B
3F42  A0 00              ..   LDY #&00
3F44  20 3D 38            =8  JSR &383D
3F47  CA                 .    DEX
3F48  D0 F3              ..   BNE &3F3D
3F4A  60                 `    RTS
.addr3F4B
3F4B  A0 EE              ..   LDY #&EE
3F4D  20 3D 38            =8  JSR &383D
3F50  CA                 .    DEX
3F51  D0 F8              ..   BNE &3F4B
3F53  60                 `    RTS
.addr3F54
3F54  AD A4 03           ...  LDA &03A4
3F57  20 C6 45            .E  JSR &45C6
3F5A  A9 00              ..   LDA #&00
3F5C  8D 4A 03           .J.  STA &034A
3F5F  4C CD 3F           L.?  JMP &3FCD
.addr3F62
3F62  20 26 3F            &?  JSR &3F26
3F65  20 86 3F            .?  JSR &3F86
3F68  85 06              ..   STA &06
3F6A  29 80              ).   AND #&80
3F6C  85 48              .H   STA &48
3F6E  8A                 .    TXA
3F6F  29 80              ).   AND #&80
3F71  85 4B              .K   STA &4B
3F73  A9 19              ..   LDA #&19
3F75  85 47              .G   STA &47
3F77  85 4A              .J   STA &4A
3F79  85 4D              .M   STA &4D
3F7B  20 86 3F            .?  JSR &3F86
3F7E  C9 F5              ..   CMP #&F5
3F80  2A                 *    ROL A
3F81  09 C0              ..   ORA #&C0
3F83  85 66              .f   STA &66
.addr3F85
3F85  18                 .    CLC
.addr3F86
3F86  A5 00              ..   LDA &00
3F88  2A                 *    ROL A
3F89  AA                 .    TAX
3F8A  65 02              e.   ADC &02
3F8C  85 00              ..   STA &00
3F8E  86 02              ..   STX &02
3F90  A5 01              ..   LDA &01
3F92  AA                 .    TAX
3F93  65 03              e.   ADC &03
3F95  85 01              ..   STA &01
3F97  86 03              ..   STX &03
3F99  60                 `    RTS
.addr3F9A
3F9A  20 86 3F            .?  JSR &3F86
3F9D  4A                 J    LSR A
3F9E  85 66              .f   STA &66
3FA0  85 63              .c   STA &63
3FA2  26 65              &e   ROL &65
3FA4  29 0F              ).   AND #&0F
3FA6  09 10              ..   ORA #&10
3FA8  85 61              .a   STA &61
3FAA  20 86 3F            .?  JSR &3F86
3FAD  30 0A              0.   BMI &3FB9
3FAF  A5 66              .f   LDA &66
3FB1  09 C0              ..   ORA #&C0
3FB3  85 66              .f   STA &66
3FB5  A2 10              ..   LDX #&10
3FB7  86 6A              .j   STX &6A
.addr3FB9
3FB9  29 02              ).   AND #&02
3FBB  69 0B              i.   ADC #&0B
3FBD  20 68 37            h7  JSR &3768
.addr3FC0
3FC0  20 28 12            (.  JSR &1228
3FC3  CE 4A 03           .J.  DEC &034A
3FC6  F0 8C              ..   BEQ &3F54
3FC8  10 03              ..   BPL &3FCD
3FCA  EE 4A 03           .J.  INC &034A
.addr3FCD
3FCD  C6 8A              ..   DEC &8A
3FCF  F0 03              ..   BEQ &3FD4
.addr3FD1
3FD1  4C DB 40           L.@  JMP &40DB
.addr3FD4
3FD4  AD 41 03           .A.  LDA &0341
3FD7  D0 F8              ..   BNE &3FD1
3FD9  20 86 3F            .?  JSR &3F86
3FDC  C9 23              .#   CMP #&23
3FDE  B0 4E              .N   BCS &402E
3FE0  AD 3E 03           .>.  LDA &033E
3FE3  C9 03              ..   CMP #&03
3FE5  B0 47              .G   BCS &402E
3FE7  20 26 3F            &?  JSR &3F26
3FEA  A9 26              .&   LDA #&26
3FEC  85 4D              .M   STA &4D
3FEE  20 86 3F            .?  JSR &3F86
3FF1  85 46              .F   STA &46
3FF3  86 49              .I   STX &49
3FF5  29 80              ).   AND #&80
3FF7  85 48              .H   STA &48
3FF9  8A                 .    TXA
3FFA  29 80              ).   AND #&80
3FFC  85 4B              .K   STA &4B
3FFE  26 47              &G   ROL &47
4000  26 47              &G   ROL &47
4002  20 86 3F            .?  JSR &3F86
4005  70 93              p.   BVS &3F9A
4007  4C 9A 3F           L.?  JMP &3F9A
400A  09 6F              .o   ORA #&6F
400C  85 63              .c   STA &63
400E  AD 20 03           . .  LDA &0320
4011  D0 1B              ..   BNE &402E
4013  8A                 .    TXA
4014  B0 08              ..   BCS &401E
4016  29 1F              ).   AND #&1F
4018  09 10              ..   ORA #&10
401A  85 61              .a   STA &61
401C  90 04              ..   BCC &4022
.addr401E
401E  09 7F              .   ORA #&7F
4020  85 64              .d   STA &64
.addr4022
4022  20 86 3F            .?  JSR &3F86
4025  C9 0A              ..   CMP #&0A
4027  29 01              ).   AND #&01
4029  69 05              i.   ADC #&05
402B  20 68 37            h7  JSR &3768
.addr402E
402E  AD 20 03           . .  LDA &0320
4031  F0 03              ..   BEQ &4036
.addr4033
4033  4C DB 40           L.@  JMP &40DB
.addr4036
4036  20 A6 41            .A  JSR &41A6
4039  0A                 .    ASL A
403A  AE 2E 03           ...  LDX &032E
403D  F0 03              ..   BEQ &4042
403F  0D 8C 03           ...  ORA &038C
.addr4042
4042  85 D1              ..   STA &D1
4044  20 62 3F            b?  JSR &3F62
4047  C5 D1              ..   CMP &D1
4049  B0 05              ..   BCS &4050
404B  A9 10              ..   LDA #&10
404D  20 68 37            h7  JSR &3768
.addr4050
4050  AD 2E 03           ...  LDA &032E
4053  D0 DE              ..   BNE &4033
4055  CE 49 03           .I.  DEC &0349
4058  10 D9              ..   BPL &4033
405A  EE 49 03           .I.  INC &0349
405D  AD 58 03           .X.  LDA &0358
4060  29 0C              ).   AND #&0C
4062  C9 08              ..   CMP #&08
4064  D0 0A              ..   BNE &4070
4066  20 86 3F            .?  JSR &3F86
4069  C9 C8              ..   CMP #&C8
406B  90 03              ..   BCC &4070
406D  20 0E 32            .2  JSR &320E
.addr4070
4070  20 86 3F            .?  JSR &3F86
4073  AC AE 03           ...  LDY &03AE
4076  F0 0B              ..   BEQ &4083
4078  C9 78              .x   CMP #&78
407A  B0 B7              ..   BCS &4033
407C  29 07              ).   AND #&07
407E  CD AE 03           ...  CMP &03AE
4081  90 B0              ..   BCC &4033
.addr4083
4083  20 62 3F            b?  JSR &3F62
4086  C9 64              .d   CMP #&64
4088  B0 28              .(   BCS &40B2
408A  EE 49 03           .I.  INC &0349
408D  29 03              ).   AND #&03
408F  69 18              i.   ADC #&18
4091  A8                 .    TAY
4092  20 B8 3E            .>  JSR &3EB8
4095  90 11              ..   BCC &40A8
4097  A9 F9              ..   LDA #&F9
4099  85 66              .f   STA &66
409B  AD 58 03           .X.  LDA &0358
409E  29 03              ).   AND #&03
40A0  4A                 J    LSR A
40A1  90 05              ..   BCC &40A8
40A3  0D 3D 03           .=.  ORA &033D
40A6  F0 02              ..   BEQ &40AA
.addr40A8
40A8  98                 .    TYA
40A9  2C A9 1F           ,..  BIT &1FA9
40AC  20 68 37            h7  JSR &3768
40AF  4C DB 40           L.@  JMP &40DB
.addr40B2
40B2  29 03              ).   AND #&03
40B4  8D 49 03           .I.  STA &0349
40B7  85 89              ..   STA &89
.addr40B9
40B9  20 86 3F            .?  JSR &3F86
40BC  85 D1              ..   STA &D1
40BE  20 86 3F            .?  JSR &3F86
40C1  25 D1              %.   AND &D1
40C3  29 07              ).   AND #&07
40C5  8D D2 0F           ...  STA &0FD2
.addr40C8
40C8  AD D2 0F           ...  LDA &0FD2
40CB  69 11              i.   ADC #&11
40CD  20 68 37            h7  JSR &3768
40D0  B0 05              ..   BCS &40D7
40D2  CE D2 0F           ...  DEC &0FD2
40D5  10 F1              ..   BPL &40C8
.addr40D7
40D7  C6 89              ..   DEC &89
40D9  10 DE              ..   BPL &40B9
.addr40DB
40DB  A2 FF              ..   LDX #&FF
40DD  9A                 .    TXS
40DE  AE 47 03           .G.  LDX &0347
40E1  F0 03              ..   BEQ &40E6
40E3  CE 47 03           .G.  DEC &0347
.addr40E6
40E6  20 62 1F            b.  JSR &1F62
40E9  A5 87              ..   LDA &87
40EB  F0 0B              ..   BEQ &40F8
40ED  2D C9 03           -..  AND &03C9
40F0  4A                 J    LSR A
40F1  B0 05              ..   BCS &40F8
40F3  A0 02              ..   LDY #&02
40F5  20 30 55            0U  JSR &5530
.addr40F8
40F8  20 1F 3D            .=  JSR &3D1F
.addr40FB
40FB  20 01 41            .A  JSR &4101
40FE  4C C0 3F           L.?  JMP &3FC0
.addr4101
4101  C9 76              .v   CMP #&76
4103  D0 03              ..   BNE &4108
4105  4C 83 1C           L..  JMP &1C83
.addr4108
4108  C9 14              ..   CMP #&14
410A  D0 03              ..   BNE &410F
410C  4C EB 2C           L.,  JMP &2CEB
.addr410F
410F  C9 74              .t   CMP #&74
4111  D0 03              ..   BNE &4116
4113  4C BE 2E           L..  JMP &2EBE
.addr4116
4116  C9 75              .u   CMP #&75
4118  D0 06              ..   BNE &4120
411A  20 75 2F            u/  JSR &2F75
411D  4C 73 2B           Ls+  JMP &2B73
.addr4120
4120  C9 77              .w   CMP #&77
4122  D0 03              ..   BNE &4127
4124  4C 15 2E           L..  JMP &2E15
.addr4127
4127  C9 16              ..   CMP #&16
4129  D0 03              ..   BNE &412E
412B  4C 60 31           L`1  JMP &3160
.addr412E
412E  C9 20              .    CMP #&20
4130  D0 03              ..   BNE &4135
4132  4C 92 32           L.2  JMP &3292
.addr4135
4135  C9 71              .q   CMP #&71
4137  90 0A              ..   BCC &4143
4139  C9 74              .t   CMP #&74
413B  B0 06              ..   BCS &4143
413D  29 03              ).   AND #&03
413F  AA                 .    TAX
4140  4C 93 54           L.T  JMP &5493
.addr4143
4143  C9 54              .T   CMP #&54
4145  D0 03              ..   BNE &414A
4147  4C 11 30           L.0  JMP &3011
.addr414A
414A  C9 32              .2   CMP #&32
414C  F0 3D              .=   BEQ &418B
414E  85 06              ..   STA &06
4150  A5 87              ..   LDA &87
4152  29 C0              ).   AND #&C0
4154  F0 16              ..   BEQ &416C
4156  A5 2F              ./   LDA &2F
4158  D0 12              ..   BNE &416C
415A  A5 06              ..   LDA &06
415C  C9 36              .6   CMP #&36
415E  D0 09              ..   BNE &4169
4160  20 65 2E            e.  JSR &2E65
4163  20 68 3D            h=  JSR &3D68
4166  20 65 2E            e.  JSR &2E65
.addr4169
4169  20 38 2E            8.  JSR &2E38
.addr416C
416C  A5 2F              ./   LDA &2F
416E  F0 1A              ..   BEQ &418A
4170  C6 2E              ..   DEC &2E
4172  D0 16              ..   BNE &418A
4174  A6 2F              ./   LDX &2F
4176  CA                 .    DEX
4177  20 AC 30            .0  JSR &30AC
417A  A9 05              ..   LDA #&05
417C  85 2E              ..   STA &2E
417E  A6 2F              ./   LDX &2F
4180  20 AC 30            .0  JSR &30AC
4183  C6 2F              ./   DEC &2F
4185  D0 03              ..   BNE &418A
4187  4C 54 32           LT2  JMP &3254
.addr418A
418A  60                 `    RTS
.addr418B
418B  A5 87              ..   LDA &87
418D  29 C0              ).   AND #&C0
418F  F0 F9              ..   BEQ &418A
4191  20 FE 32            .2  JSR &32FE
4194  85 72              .r   STA &72
4196  20 0A 33            .3  JSR &330A
4199  A9 80              ..   LDA #&80
419B  85 72              .r   STA &72
419D  A9 01              ..   LDA #&01
419F  85 2C              .,   STA &2C
41A1  E6 2D              .-   INC &2D
41A3  4C 3B 2B           L;+  JMP &2B3B
.addr41A6
41A6  AD 72 03           .r.  LDA &0372
41A9  18                 .    CLC
41AA  6D 75 03           mu.  ADC &0375
41AD  0A                 .    ASL A
41AE  6D 79 03           my.  ADC &0379
41B1  60                 `    RTS
.addr41B2
41B2  A9 E0              ..   LDA #&E0
.addr41B4
41B4  C5 47              .G   CMP &47
41B6  90 06              ..   BCC &41BE
41B8  C5 4A              .J   CMP &4A
41BA  90 02              ..   BCC &41BE
41BC  C5 4D              .M   CMP &4D
.addr41BE
41BE  60                 `    RTS
.addr41BF
41BF  05 47              .G   ORA &47
41C1  05 4A              .J   ORA &4A
41C3  05 4D              .M   ORA &4D
41C5  60                 `    RTS
.addr41C6
41C6  20 B1 43            .C  JSR &43B1
41C9  20 E1 3E            .>  JSR &3EE1
41CC  06 7D              .}   ASL &7D
41CE  06 7D              .}   ASL &7D
41D0  A2 18              ..   LDX #&18
41D2  20 19 36            .6  JSR &3619
41D5  20 C8 54            .T  JSR &54C8
41D8  20 EB 54            .T  JSR &54EB
41DB  20 B5 35            .5  JSR &35B5
41DE  A9 0C              ..   LDA #&0C
41E0  85 2D              .-   STA &2D
41E2  85 2C              .,   STA &2C
41E4  A9 92              ..   LDA #&92
41E6  20 2D 34            -4  JSR &342D
.addr41E9
41E9  20 62 3F            b?  JSR &3F62
41EC  4A                 J    LSR A
41ED  4A                 J    LSR A
41EE  85 46              .F   STA &46
41F0  A0 00              ..   LDY #&00
41F2  84 87              ..   STY &87
41F4  84 47              .G   STY &47
41F6  84 4A              .J   STY &4A
41F8  84 4D              .M   STY &4D
41FA  84 66              .f   STY &66
41FC  88                 .    DEY
41FD  84 8A              ..   STY &8A
41FF  8C 46 03           .F.  STY &0346
4202  49 2A              I*   EOR #&2A
4204  85 49              .I   STA &49
4206  09 50              .P   ORA #&50
4208  85 4C              .L   STA &4C
420A  8A                 .    TXA
420B  29 8F              ).   AND #&8F
420D  85 63              .c   STA &63
420F  6A                 j    ROR A
4210  29 87              ).   AND #&87
4212  85 64              .d   STA &64
4214  A2 05              ..   LDX #&05
4216  AD 07 56           ..V  LDA &5607
4219  F0 03              ..   BEQ &421E
421B  90 01              ..   BCC &421E
421D  CA                 .    DEX
.addr421E
421E  20 1D 25            .%  JSR &251D
4221  20 86 3F            .?  JSR &3F86
4224  29 80              ).   AND #&80
4226  A0 1F              ..   LDY #&1F
4228  91 20              .    STA (&20),Y
422A  AD 15 03           ...  LDA &0315
422D  F0 BA              ..   BEQ &41E9
422F  20 A4 44            .D  JSR &44A4
4232  85 7D              .}   STA &7D
.addr4234
4234  20 28 12            (.  JSR &1228
4237  AD 46 03           .F.  LDA &0346
423A  D0 F8              ..   BNE &4234
423C  A2 1F              ..   LDX #&1F
423E  20 19 36            .6  JSR &3619
4241  4C 20 12           L .  JMP &1220
.addr4244
4244  20 55 42            UB  JSR &4255
4247  20 CE 3E            .>  JSR &3ECE
424A  A9 FF              ..   LDA #&FF
424C  85 8E              ..   STA &8E
424E  85 87              ..   STA &87
4250  A9 20              .    LDA #&20
4252  4C FB 40           L.@  JMP &40FB
.addr4255
4255  20 B8 3E            .>  JSR &3EB8
4258  A9 06              ..   LDA #&06
425A  B0 22              ."   BCS &427E
425C  20 86 3F            .?  JSR &3F86
425F  29 03              ).   AND #&03
4261  AE AE 03           ...  LDX &03AE
4264  E0 03              ..   CPX #&03
4266  2A                 *    ROL A
4267  AE AF 03           ...  LDX &03AF
426A  E0 0A              ..   CPX #&0A
426C  2A                 *    ROL A
426D  AA                 .    TAX
426E  AD 58 03           .X.  LDA &0358
4271  29 0C              ).   AND #&0C
4273  C9 08              ..   CMP #&08
4275  D0 06              ..   BNE &427D
4277  8A                 .    TXA
4278  29 01              ).   AND #&01
427A  09 02              ..   ORA #&02
427C  AA                 .    TAX
.addr427D
427D  8A                 .    TXA
.addr427E
427E  18                 .    CLC
427F  69 41              iA   ADC #&41
4281  8D 94 42           ..B  STA &4294
4284  20 7A 0D            z.  JSR &0D7A
4287  A2 8E              ..   LDX #&8E
4289  A0 42              .B   LDY #&42
428B  4C F7 FF           L..  JMP &FFF7
428E  4C 2E 44           L.D  JMP &442E
4291  2E 4D 4F           .MO  ROL &4F4D
4294  30 0D              0.   BMI &42A3
.addr4296
4296  A2 3A              .:   LDX #&3A
4298  A9 00              ..   LDA #&00
.addr429A
429A  9D 11 03           ...  STA &0311,X
429D  CA                 .    DEX
429E  10 FA              ..   BPL &429A
42A0  60                 `    RTS
.addr42A1
42A1  86 08              ..   STX &08
.addr42A3
42A3  A9 00              ..   LDA #&00
42A5  85 07              ..   STA &07
42A7  A8                 .    TAY
.addr42A8
42A8  91 07              ..   STA (&07),Y
42AA  88                 .    DEY
42AB  D0 FB              ..   BNE &42A8
42AD  60                 `    RTS
.addr42AE
42AE  A2 00              ..   LDX #&00
42B0  20 1F 37            .7  JSR &371F
42B3  A2 03              ..   LDX #&03
42B5  20 1F 37            .7  JSR &371F
42B8  A2 06              ..   LDX #&06
42BA  20 1F 37            .7  JSR &371F
.addr42BD
42BD  A5 D2              ..   LDA &D2
42BF  05 D5              ..   ORA &D5
42C1  05 D8              ..   ORA &D8
42C3  09 01              ..   ORA #&01
42C5  85 DB              ..   STA &DB
42C7  A5 D3              ..   LDA &D3
42C9  05 D6              ..   ORA &D6
42CB  05 D9              ..   ORA &D9
.addr42CD
42CD  06 DB              ..   ASL &DB
42CF  2A                 *    ROL A
42D0  B0 0E              ..   BCS &42E0
42D2  06 D2              ..   ASL &D2
42D4  26 D3              &.   ROL &D3
42D6  06 D5              ..   ASL &D5
42D8  26 D6              &.   ROL &D6
42DA  06 D8              ..   ASL &D8
42DC  26 D9              &.   ROL &D9
42DE  90 ED              ..   BCC &42CD
.addr42E0
42E0  A5 D3              ..   LDA &D3
42E2  4A                 J    LSR A
42E3  05 D4              ..   ORA &D4
42E5  85 34              .4   STA &34
42E7  A5 D6              ..   LDA &D6
42E9  4A                 J    LSR A
42EA  05 D7              ..   ORA &D7
42EC  85 35              .5   STA &35
42EE  A5 D9              ..   LDA &D9
42F0  4A                 J    LSR A
42F1  05 DA              ..   ORA &DA
42F3  85 36              .6   STA &36
.addr42F5
42F5  A5 34              .4   LDA &34
42F7  20 0B 28            .(  JSR &280B
42FA  85 82              ..   STA &82
42FC  A5 1B              ..   LDA &1B
42FE  85 81              ..   STA &81
4300  A5 35              .5   LDA &35
4302  20 0B 28            .(  JSR &280B
4305  85 D1              ..   STA &D1
4307  A5 1B              ..   LDA &1B
4309  65 81              e.   ADC &81
430B  85 81              ..   STA &81
430D  A5 D1              ..   LDA &D1
430F  65 82              e.   ADC &82
4311  85 82              ..   STA &82
4313  A5 36              .6   LDA &36
4315  20 0B 28            .(  JSR &280B
4318  85 D1              ..   STA &D1
431A  A5 1B              ..   LDA &1B
431C  65 81              e.   ADC &81
431E  85 81              ..   STA &81
4320  A5 D1              ..   LDA &D1
4322  65 82              e.   ADC &82
4324  85 82              ..   STA &82
4326  20 B8 47            .G  JSR &47B8
4329  A5 34              .4   LDA &34
432B  20 FF 46            .F  JSR &46FF
432E  85 34              .4   STA &34
4330  A5 35              .5   LDA &35
4332  20 FF 46            .F  JSR &46FF
4335  85 35              .5   STA &35
4337  A5 36              .6   LDA &36
4339  20 FF 46            .F  JSR &46FF
433C  85 36              .6   STA &36
433E  60                 `    RTS
.addr433F
433F  A2 10              ..   LDX #&10
.addr4341
4341  20 39 44            9D  JSR &4439
4344  30 04              0.   BMI &434A
4346  E8                 .    INX
4347  10 F8              ..   BPL &4341
4349  8A                 .    TXA
.addr434A
434A  49 80              I.   EOR #&80
434C  AA                 .    TAX
434D  60                 `    RTS
.addr434E
434E  AE 3E 03           .>.  LDX &033E
4351  BD 13 03           ...  LDA &0313,X
4354  0D 20 03           . .  ORA &0320
4357  0D 41 03           .A.  ORA &0341
435A  D0 43              .C   BNE &439F
435C  AC 08 09           ...  LDY &0908
435F  30 07              0.   BMI &4368
4361  A8                 .    TAY
4362  20 43 1C            C.  JSR &1C43
4365  4A                 J    LSR A
4366  F0 37              .7   BEQ &439F
.addr4368
4368  AC 2D 09           .-.  LDY &092D
436B  30 08              0.   BMI &4375
436D  A0 25              .%   LDY #&25
436F  20 41 1C            A.  JSR &1C41
4372  4A                 J    LSR A
4373  F0 2A              .*   BEQ &439F
.addr4375
4375  A9 81              ..   LDA #&81
4377  85 83              ..   STA &83
4379  85 82              ..   STA &82
437B  85 1B              ..   STA &1B
437D  AD 08 09           ...  LDA &0908
4380  20 FF 28            .(  JSR &28FF
4383  8D 08 09           ...  STA &0908
4386  AD 2D 09           .-.  LDA &092D
4389  20 FF 28            .(  JSR &28FF
438C  8D 2D 09           .-.  STA &092D
438F  A9 01              ..   LDA #&01
4391  85 87              ..   STA &87
4393  85 8A              ..   STA &8A
4395  4A                 J    LSR A
4396  8D 49 03           .I.  STA &0349
4399  AE 45 03           .E.  LDX &0345
439C  4C 93 54           L.T  JMP &5493
.addr439F
439F  A9 28              .(   LDA #&28
43A1  D0 50              .P   BNE &43F3
.addr43A3
43A3  A9 00              ..   LDA #&00
43A5  85 30              .0   STA &30
43A7  8D 40 03           .@.  STA &0340
43AA  20 1B 38            .8  JSR &381B
43AD  A9 48              .H   LDA #&48
43AF  D0 42              .B   BNE &43F3
.addr43B1
43B1  A9 10              ..   LDA #&10
43B3  20 F3 43            .C  JSR &43F3
43B6  A9 18              ..   LDA #&18
43B8  D0 39              .9   BNE &43F3
.addr43BA
43BA  A9 20              .    LDA #&20
43BC  D0 35              .5   BNE &43F3
.addr43BE
43BE  A2 01              ..   LDX #&01
43C0  20 90 25            .%  JSR &2590
43C3  90 53              .S   BCC &4418
43C5  A9 78              .x   LDA #&78
43C7  20 C6 45            .E  JSR &45C6
43CA  A9 30              .0   LDA #&30
43CC  D0 25              .%   BNE &43F3
.addr43CE
43CE  EE 9F 03           ...  INC &039F
43D1  D0 08              ..   BNE &43DB
43D3  EE A0 03           ...  INC &03A0
43D6  A9 65              .e   LDA #&65
43D8  20 C6 45            .E  JSR &45C6
.addr43DB
43DB  A2 07              ..   LDX #&07
.addr43DD
43DD  86 D1              ..   STX &D1
43DF  A9 18              ..   LDA #&18
43E1  20 04 44            .D  JSR &4404
43E4  A5 4D              .M   LDA &4D
43E6  4A                 J    LSR A
43E7  4A                 J    LSR A
43E8  25 D1              %.   AND &D1
43EA  09 F1              ..   ORA #&F1
43EC  85 0B              ..   STA &0B
43EE  20 F6 43            .C  JSR &43F6
43F1  A9 10              ..   LDA #&10
.addr43F3
43F3  20 04 44            .D  JSR &4404
.addr43F6
43F6  AE C6 03           ...  LDX &03C6
43F9  D0 1D              ..   BNE &4418
43FB  A2 09              ..   LDX #&09
43FD  A0 00              ..   LDY #&00
43FF  A9 07              ..   LDA #&07
4401  4C F1 FF           L..  JMP &FFF1
.addr4404
4404  4A                 J    LSR A
4405  69 03              i.   ADC #&03
4407  A8                 .    TAY
4408  A2 07              ..   LDX #&07
.addr440A
440A  A9 00              ..   LDA #&00
440C  95 09              ..   STA &09,X
440E  CA                 .    DEX
440F  B9 90 3E           ..>  LDA &3E90,Y
4412  95 09              ..   STA &09,X
4414  88                 .    DEY
4415  CA                 .    DEX
4416  10 F2              ..   BPL &440A
.addr4418
4418  60                 `    RTS
4419  E8                 .    INX
441A  E2                 .    ...
441B  E6 E7              ..   INC &E7
441D  C2                 .    ...
441E  D1 C1              ..   CMP (&C1),Y
4420  60                 `    RTS
4421  70 23              p#   BVS &4446
4423  35 65              5e   AND &65,X
4425  22                 "    ...
4426  45 52              ER   EOR &52
4428  37                 7    ...
.addr4429
4429  BE 18 44           ..D  LDX &4418,Y
442C  20 39 44            9D  JSR &4439
442F  10 20              .    BPL &4451
4431  A9 FF              ..   LDA #&FF
4433  99 00 03           ...  STA &0300,Y
4436  60                 `    RTS
.addr4437
4437  A2 01              ..   LDX #&01
.addr4439
4439  A9 03              ..   LDA #&03
443B  78                 x    SEI
443C  8D 40 FE           .@.  STA &FE40
443F  A9 7F              .   LDA #&7F
4441  8D 43 FE           .C.  STA &FE43
4444  8E 4F FE           .O.  STX &FE4F
4447  AE 4F FE           .O.  LDX &FE4F
444A  A9 0B              ..   LDA #&0B
444C  8D 40 FE           .@.  STA &FE40
444F  58                 X    CLI
4450  8A                 .    TXA
.addr4451
4451  60                 `    RTS
.addr4452
4452  A9 80              ..   LDA #&80
4454  20 F4 FF            ..  JSR &FFF4
4457  98                 .    TYA
4458  4D CC 03           M..  EOR &03CC
445B  60                 `    RTS
.addr445C
445C  84 D1              ..   STY &D1
445E  E4 D1              ..   CPX &D1
4460  D0 10              ..   BNE &4472
4462  BD 87 03           ...  LDA &0387,X
4465  49 FF              I.   EOR #&FF
4467  9D 87 03           ...  STA &0387,X
446A  20 FA 1E            ..  JSR &1EFA
446D  20 30 55            0U  JSR &5530
4470  A4 D1              ..   LDY &D1
.addr4472
4472  60                 `    RTS
.addr4473
4473  AD 3F 03           .?.  LDA &033F
4476  D0 4F              .O   BNE &44C7
4478  A0 01              ..   LDY #&01
447A  20 29 44            )D  JSR &4429
447D  C8                 .    INY
447E  20 29 44            )D  JSR &4429
4481  AD 40 FE           .@.  LDA &FE40
4484  AA                 .    TAX
4485  29 10              ).   AND #&10
4487  49 10              I.   EOR #&10
4489  8D 07 03           ...  STA &0307
448C  A2 01              ..   LDX #&01
448E  20 52 44            RD  JSR &4452
4491  09 01              ..   ORA #&01
4493  8D 4C 03           .L.  STA &034C
4496  A2 02              ..   LDX #&02
4498  20 52 44            RD  JSR &4452
449B  4D CB 03           M..  EOR &03CB
449E  8D 4D 03           .M.  STA &034D
44A1  4C 55 45           LUE  JMP &4555
.addr44A4
44A4  A9 00              ..   LDA #&00
44A6  A0 10              ..   LDY #&10
.addr44A8
44A8  99 00 03           ...  STA &0300,Y
44AB  88                 .    DEY
44AC  D0 FA              ..   BNE &44A8
44AE  60                 `    RTS
.addr44AF
44AF  20 A4 44            .D  JSR &44A4
44B2  AD CD 03           ...  LDA &03CD
44B5  D0 BC              ..   BNE &4473
44B7  8D CE 03           ...  STA &03CE
44BA  A0 07              ..   LDY #&07
.addr44BC
44BC  20 29 44            )D  JSR &4429
44BF  88                 .    DEY
44C0  D0 FA              ..   BNE &44BC
44C2  AD 3F 03           .?.  LDA &033F
44C5  F0 5F              ._   BEQ &4526
.addr44C7
44C7  20 26 3F            &?  JSR &3F26
44CA  A9 60              .`   LDA #&60
44CC  85 54              .T   STA &54
44CE  09 80              ..   ORA #&80
44D0  85 5C              .\   STA &5C
44D2  85 8C              ..   STA &8C
44D4  A5 7D              .}   LDA &7D
44D6  85 61              .a   STA &61
44D8  20 46 23            F#  JSR &2346
44DB  A5 61              .a   LDA &61
44DD  C9 16              ..   CMP #&16
44DF  90 02              ..   BCC &44E3
44E1  A9 16              ..   LDA #&16
.addr44E3
44E3  85 7D              .}   STA &7D
44E5  A9 FF              ..   LDA #&FF
44E7  A2 00              ..   LDX #&00
44E9  A4 62              .b   LDY &62
44EB  F0 06              ..   BEQ &44F3
44ED  30 01              0.   BMI &44F0
44EF  E8                 .    INX
.addr44F0
44F0  9D 01 03           ...  STA &0301,X
.addr44F3
44F3  A9 80              ..   LDA #&80
44F5  A2 00              ..   LDX #&00
44F7  06 63              .c   ASL &63
44F9  F0 14              ..   BEQ &450F
44FB  90 01              ..   BCC &44FE
44FD  E8                 .    INX
.addr44FE
44FE  24 63              $c   BIT &63
4500  10 07              ..   BPL &4509
4502  A9 40              .@   LDA #&40
4504  8D 4C 03           .L.  STA &034C
4507  A9 00              ..   LDA #&00
.addr4509
4509  9D 03 03           ...  STA &0303,X
450C  AD 4C 03           .L.  LDA &034C
.addr450F
450F  8D 4C 03           .L.  STA &034C
4512  A9 80              ..   LDA #&80
4514  A2 00              ..   LDX #&00
4516  06 64              .d   ASL &64
4518  F0 09              ..   BEQ &4523
451A  B0 01              ..   BCS &451D
451C  E8                 .    INX
.addr451D
451D  9D 05 03           ...  STA &0305,X
4520  AD 4D 03           .M.  LDA &034D
.addr4523
4523  8D 4D 03           .M.  STA &034D
.addr4526
4526  AE 4C 03           .L.  LDX &034C
4529  A9 07              ..   LDA #&07
452B  AC 03 03           ...  LDY &0303
452E  F0 03              ..   BEQ &4533
4530  20 16 2A            .*  JSR &2A16
.addr4533
4533  AC 04 03           ...  LDY &0304
4536  F0 03              ..   BEQ &453B
4538  20 26 2A            &*  JSR &2A26
.addr453B
453B  8E 4C 03           .L.  STX &034C
453E  0A                 .    ASL A
453F  AE 4D 03           .M.  LDX &034D
4542  AC 05 03           ...  LDY &0305
4545  F0 03              ..   BEQ &454A
4547  20 26 2A            &*  JSR &2A26
.addr454A
454A  AC 06 03           ...  LDY &0306
454D  F0 03              ..   BEQ &4552
454F  20 16 2A            .*  JSR &2A16
.addr4552
4552  8E 4D 03           .M.  STX &034D
.addr4555
4555  20 3F 43            ?C  JSR &433F
4558  8E 00 03           ...  STX &0300
455B  E0 69              .i   CPX #&69
455D  D0 3D              .=   BNE &459C
.addr455F
455F  20 F7 55            .U  JSR &55F7
4562  20 3F 43            ?C  JSR &433F
4565  E0 51              .Q   CPX #&51
4567  D0 05              ..   BNE &456E
4569  A9 00              ..   LDA #&00
456B  8D C6 03           ...  STA &03C6
.addr456E
456E  A0 40              .@   LDY #&40
.addr4570
4570  20 5C 44            \D  JSR &445C
4573  C8                 .    INY
4574  C0 47              .G   CPY #&47
4576  D0 F8              ..   BNE &4570
4578  E0 10              ..   CPX #&10
457A  D0 03              ..   BNE &457F
457C  8E C6 03           ...  STX &03C6
.addr457F
457F  E0 70              .p   CPX #&70
4581  D0 03              ..   BNE &4586
4583  4C 20 12           L .  JMP &1220
.addr4586
4586  E0 64              .d   CPX #&64
4588  D0 0E              ..   BNE &4598
458A  AD CE 03           ...  LDA &03CE
458D  49 FF              I.   EOR #&FF
458F  8D CE 03           ...  STA &03CE
4592  8D CD 03           ...  STA &03CD
4595  8D CC 03           ...  STA &03CC
.addr4598
4598  E0 59              .Y   CPX #&59
459A  D0 C3              ..   BNE &455F
.addr459C
459C  A5 87              ..   LDA &87
459E  D0 14              ..   BNE &45B4
45A0  A0 10              ..   LDY #&10
45A2  A9 FF              ..   LDA #&FF
.addr45A4
45A4  BE 18 44           ..D  LDX &4418,Y
45A7  EC 00 03           ...  CPX &0300
45AA  D0 03              ..   BNE &45AF
45AC  99 00 03           ...  STA &0300,Y
.addr45AF
45AF  88                 .    DEY
45B0  C0 07              ..   CPY #&07
45B2  D0 F0              ..   BNE &45A4
.addr45B4
45B4  60                 `    RTS
.addr45B5
45B5  8E 4A 03           .J.  STX &034A
45B8  48                 H    PHA
45B9  AD A4 03           ...  LDA &03A4
45BC  20 DD 45            .E  JSR &45DD
45BF  68                 h    PLA
45C0  2C A9 6C           ,.l  BIT &6CA9
45C3  2C A9 6F           ,.o  BIT &6FA9
.addr45C6
45C6  A2 00              ..   LDX #&00
45C8  86 72              .r   STX &72
45CA  A0 09              ..   LDY #&09
45CC  84 2C              .,   STY &2C
45CE  A0 16              ..   LDY #&16
.addr45D0
45D0  84 2D              .-   STY &2D
45D2  EC 4A 03           .J.  CPX &034A
45D5  D0 DE              ..   BNE &45B5
45D7  8C 4A 03           .J.  STY &034A
45DA  8D A4 03           ...  STA &03A4
.addr45DD
45DD  20 9A 33            .3  JSR &339A
45E0  4E 4B 03           NK.  LSR &034B
45E3  90 CF              ..   BCC &45B4
45E5  A9 FD              ..   LDA #&FD
45E7  4C 9A 33           L.3  JMP &339A
.addr45EA
45EA  20 86 3F            .?  JSR &3F86
45ED  30 C5              0.   BMI &45B4
45EF  E0 16              ..   CPX #&16
45F1  B0 C1              ..   BCS &45B4
45F3  BD 6F 03           .o.  LDA &036F,X
45F6  F0 BC              ..   BEQ &45B4
45F8  AD 4A 03           .J.  LDA &034A
45FB  D0 B7              ..   BNE &45B4
45FD  A0 03              ..   LDY #&03
45FF  8C 4B 03           .K.  STY &034B
4602  9D 6F 03           .o.  STA &036F,X
4605  E0 11              ..   CPX #&11
4607  B0 05              ..   BCS &460E
4609  8A                 .    TXA
460A  69 D0              i.   ADC #&D0
460C  D0 B8              ..   BNE &45C6
.addr460E
460E  F0 B1              ..   BEQ &45C1
4610  E0 12              ..   CPX #&12
4612  F0 B0              ..   BEQ &45C4
4614  8A                 .    TXA
4615  69 5D              i]   ADC #&5D
4617  D0 AD              ..   BNE &45C6
4619  13                 .    ...
461A  82                 .    ...
461B  06 01              ..   ASL &01
461D  14                 .    ...
461E  81 0A              ..   STA (&0A,X)
4620  03                 .    ...
4621  41 83              A.   EOR (&83,X)
4623  02                 .    ...
4624  07                 .    ...
4625  28                 (    PLP
4626  85 E2              ..   STA &E2
4628  1F                 .    ...
4629  53                 S    ...
462A  85 FB              ..   STA &FB
462C  0F                 .    ...
462D  C4 08              ..   CPY &08
462F  36 03              6.   ROL &03,X
4631  EB                 .    ...
4632  1D 08 78           ..x  ORA &7808,X
4635  9A                 .    TXS
4636  0E 38 03           .8.  ASL &0338
4639  75 06              u.   ADC &06,X
463B  28                 (    PLP
463C  07                 .    ...
463D  4E 01 11           N..  LSR &1101
4640  1F                 .    ...
4641  7C                 |    ...
4642  0D 1D 07           ...  ORA &071D
4645  B0 89              ..   BCS &45D0
4647  DC                 .    ...
4648  3F                 ?    ...
4649  20 81 35            .5  JSR &3581
464C  03                 .    ...
464D  61 A1              a.   ADC (&A1,X)
464F  42                 B    ...
4650  07                 .    ...
4651  AB                 .    ...
4652  A2 37              .7   LDX #&37
4654  1F                 .    ...
4655  2D C1 FA           -..  AND &FAC1
4658  0F                 .    ...
4659  35 0F              5.   AND &0F,X
465B  C0 07              ..   CPY #&07
.addr465D
465D  98                 .    TYA
465E  A0 02              ..   LDY #&02
4660  20 2C 47            ,G  JSR &472C
4663  85 5A              .Z   STA &5A
4665  4C A5 46           L.F  JMP &46A5
.addr4668
4668  AA                 .    TAX
4669  A5 35              .5   LDA &35
466B  29 60              )`   AND #&60
466D  F0 EE              ..   BEQ &465D
466F  A9 02              ..   LDA #&02
4671  20 2C 47            ,G  JSR &472C
4674  85 58              .X   STA &58
4676  4C A5 46           L.F  JMP &46A5
.addr4679
4679  A5 50              .P   LDA &50
467B  85 34              .4   STA &34
467D  A5 52              .R   LDA &52
467F  85 35              .5   STA &35
4681  A5 54              .T   LDA &54
4683  85 36              .6   STA &36
4685  20 F5 42            .B  JSR &42F5
4688  A5 34              .4   LDA &34
468A  85 50              .P   STA &50
468C  A5 35              .5   LDA &35
468E  85 52              .R   STA &52
4690  A5 36              .6   LDA &36
4692  85 54              .T   STA &54
4694  A0 04              ..   LDY #&04
4696  A5 34              .4   LDA &34
4698  29 60              )`   AND #&60
469A  F0 CC              ..   BEQ &4668
469C  A2 02              ..   LDX #&02
469E  A9 00              ..   LDA #&00
46A0  20 2C 47            ,G  JSR &472C
46A3  85 56              .V   STA &56
.addr46A5
46A5  A5 56              .V   LDA &56
46A7  85 34              .4   STA &34
46A9  A5 58              .X   LDA &58
46AB  85 35              .5   STA &35
46AD  A5 5A              .Z   LDA &5A
46AF  85 36              .6   STA &36
46B1  20 F5 42            .B  JSR &42F5
46B4  A5 34              .4   LDA &34
46B6  85 56              .V   STA &56
46B8  A5 35              .5   LDA &35
46BA  85 58              .X   STA &58
46BC  A5 36              .6   LDA &36
46BE  85 5A              .Z   STA &5A
46C0  A5 52              .R   LDA &52
46C2  85 81              ..   STA &81
46C4  A5 5A              .Z   LDA &5A
46C6  20 D4 28            .(  JSR &28D4
46C9  A6 54              .T   LDX &54
46CB  A5 58              .X   LDA &58
46CD  20 3B 29            ;)  JSR &293B
46D0  49 80              I.   EOR #&80
46D2  85 5C              .\   STA &5C
46D4  A5 56              .V   LDA &56
46D6  20 D4 28            .(  JSR &28D4
46D9  A6 50              .P   LDX &50
46DB  A5 5A              .Z   LDA &5A
46DD  20 3B 29            ;)  JSR &293B
46E0  49 80              I.   EOR #&80
46E2  85 5E              .^   STA &5E
46E4  A5 58              .X   LDA &58
46E6  20 D4 28            .(  JSR &28D4
46E9  A6 52              .R   LDX &52
46EB  A5 56              .V   LDA &56
46ED  20 3B 29            ;)  JSR &293B
46F0  49 80              I.   EOR #&80
46F2  85 60              .`   STA &60
46F4  A9 00              ..   LDA #&00
46F6  A2 0E              ..   LDX #&0E
.addr46F8
46F8  95 4F              .O   STA &4F,X
46FA  CA                 .    DEX
46FB  CA                 .    DEX
46FC  10 FA              ..   BPL &46F8
46FE  60                 `    RTS
.addr46FF
46FF  A8                 .    TAY
4700  29 7F              )   AND #&7F
4702  C5 81              ..   CMP &81
4704  B0 20              .    BCS &4726
4706  A2 FE              ..   LDX #&FE
4708  86 D1              ..   STX &D1
.addr470A
470A  0A                 .    ASL A
470B  C5 81              ..   CMP &81
470D  90 02              ..   BCC &4711
470F  E5 81              ..   SBC &81
.addr4711
4711  26 D1              &.   ROL &D1
4713  B0 F5              ..   BCS &470A
4715  A5 D1              ..   LDA &D1
4717  4A                 J    LSR A
4718  4A                 J    LSR A
4719  85 D1              ..   STA &D1
471B  4A                 J    LSR A
471C  65 D1              e.   ADC &D1
471E  85 D1              ..   STA &D1
4720  98                 .    TYA
4721  29 80              ).   AND #&80
4723  05 D1              ..   ORA &D1
4725  60                 `    RTS
.addr4726
4726  98                 .    TYA
4727  29 80              ).   AND #&80
4729  09 60              .`   ORA #&60
472B  60                 `    RTS
.addr472C
472C  85 1D              ..   STA &1D
472E  B5 50              .P   LDA &50,X
4730  85 81              ..   STA &81
4732  B5 56              .V   LDA &56,X
4734  20 D4 28            .(  JSR &28D4
4737  B6 50              .P   LDX &50,Y
4739  86 81              ..   STX &81
473B  B9 56 00           .V.  LDA &0056,Y
473E  20 FC 28            .(  JSR &28FC
4741  86 1B              ..   STX &1B
4743  A4 1D              ..   LDY &1D
4745  B6 50              .P   LDX &50,Y
4747  86 81              ..   STX &81
4749  49 80              I.   EOR #&80
474B  85 1C              ..   STA &1C
474D  45 81              E.   EOR &81
474F  29 80              ).   AND #&80
4751  85 D1              ..   STA &D1
4753  A9 00              ..   LDA #&00
4755  A2 10              ..   LDX #&10
4757  06 1B              ..   ASL &1B
4759  26 1C              &.   ROL &1C
475B  06 81              ..   ASL &81
475D  46 81              F.   LSR &81
.addr475F
475F  2A                 *    ROL A
4760  C5 81              ..   CMP &81
4762  90 02              ..   BCC &4766
4764  E5 81              ..   SBC &81
.addr4766
4766  26 1B              &.   ROL &1B
4768  26 1C              &.   ROL &1C
476A  CA                 .    DEX
476B  D0 F2              ..   BNE &475F
476D  A5 1B              ..   LDA &1B
476F  05 D1              ..   ORA &D1
4771  60                 `    RTS
.addr4772
4772  20 DE 48            .H  JSR &48DE
4775  20 56 38            V8  JSR &3856
4778  05 D3              ..   ORA &D3
477A  D0 21              .!   BNE &479D
477C  A5 E0              ..   LDA &E0
477E  C9 BE              ..   CMP #&BE
4780  B0 1B              ..   BCS &479D
4782  A0 02              ..   LDY #&02
4784  20 A4 47            .G  JSR &47A4
4787  A0 06              ..   LDY #&06
4789  A5 E0              ..   LDA &E0
478B  69 01              i.   ADC #&01
478D  20 A4 47            .G  JSR &47A4
4790  A9 08              ..   LDA #&08
4792  05 65              .e   ORA &65
4794  85 65              .e   STA &65
4796  A9 08              ..   LDA #&08
4798  4C 74 4F           LtO  JMP &4F74
.addr479B
479B  68                 h    PLA
479C  68                 h    PLA
.addr479D
479D  A9 F7              ..   LDA #&F7
479F  25 65              %e   AND &65
47A1  85 65              .e   STA &65
47A3  60                 `    RTS
.addr47A4
47A4  91 67              .g   STA (&67),Y
47A6  C8                 .    INY
47A7  C8                 .    INY
47A8  91 67              .g   STA (&67),Y
47AA  A5 D2              ..   LDA &D2
47AC  88                 .    DEY
47AD  91 67              .g   STA (&67),Y
47AF  69 03              i.   ADC #&03
47B1  B0 E8              ..   BCS &479B
47B3  88                 .    DEY
47B4  88                 .    DEY
47B5  91 67              .g   STA (&67),Y
47B7  60                 `    RTS
.addr47B8
47B8  A4 82              ..   LDY &82
47BA  A5 81              ..   LDA &81
47BC  85 83              ..   STA &83
47BE  A2 00              ..   LDX #&00
47C0  86 81              ..   STX &81
47C2  A9 08              ..   LDA #&08
47C4  85 D1              ..   STA &D1
.addr47C6
47C6  E4 81              ..   CPX &81
47C8  90 0E              ..   BCC &47D8
47CA  D0 04              ..   BNE &47D0
47CC  C0 40              .@   CPY #&40
47CE  90 08              ..   BCC &47D8
.addr47D0
47D0  98                 .    TYA
47D1  E9 40              .@   SBC #&40
47D3  A8                 .    TAY
47D4  8A                 .    TXA
47D5  E5 81              ..   SBC &81
47D7  AA                 .    TAX
.addr47D8
47D8  26 81              &.   ROL &81
47DA  06 83              ..   ASL &83
47DC  98                 .    TYA
47DD  2A                 *    ROL A
47DE  A8                 .    TAY
47DF  8A                 .    TXA
47E0  2A                 *    ROL A
47E1  AA                 .    TAX
47E2  06 83              ..   ASL &83
47E4  98                 .    TYA
47E5  2A                 *    ROL A
47E6  A8                 .    TAY
47E7  8A                 .    TXA
47E8  2A                 *    ROL A
47E9  AA                 .    TAX
47EA  C6 D1              ..   DEC &D1
47EC  D0 D8              ..   BNE &47C6
47EE  60                 `    RTS
.addr47EF
47EF  C5 81              ..   CMP &81
47F1  B0 1A              ..   BCS &480D
.addr47F3
47F3  A2 FE              ..   LDX #&FE
47F5  86 82              ..   STX &82
.addr47F7
47F7  0A                 .    ASL A
47F8  B0 0B              ..   BCS &4805
47FA  C5 81              ..   CMP &81
47FC  90 02              ..   BCC &4800
47FE  E5 81              ..   SBC &81
.addr4800
4800  26 82              &.   ROL &82
4802  B0 F3              ..   BCS &47F7
4804  60                 `    RTS
.addr4805
4805  E5 81              ..   SBC &81
4807  38                 8    SEC
4808  26 82              &.   ROL &82
480A  B0 EB              ..   BCS &47F7
480C  60                 `    RTS
.addr480D
480D  A9 FF              ..   LDA #&FF
480F  85 82              ..   STA &82
4811  60                 `    RTS
.addr4812
4812  45 83              E.   EOR &83
4814  30 06              0.   BMI &481C
4816  A5 81              ..   LDA &81
4818  18                 .    CLC
4819  65 82              e.   ADC &82
481B  60                 `    RTS
.addr481C
481C  A5 82              ..   LDA &82
481E  38                 8    SEC
481F  E5 81              ..   SBC &81
4821  90 02              ..   BCC &4825
4823  18                 .    CLC
4824  60                 `    RTS
.addr4825
4825  48                 H    PHA
4826  A5 83              ..   LDA &83
4828  49 80              I.   EOR #&80
482A  85 83              ..   STA &83
482C  68                 h    PLA
482D  49 FF              I.   EOR #&FF
482F  69 01              i.   ADC #&01
4831  60                 `    RTS
.addr4832
4832  A2 00              ..   LDX #&00
4834  A0 00              ..   LDY #&00
.addr4836
4836  A5 34              .4   LDA &34
4838  85 81              ..   STA &81
483A  B5 09              ..   LDA &09,X
483C  20 47 28            G(  JSR &2847
483F  85 D1              ..   STA &D1
4841  A5 35              .5   LDA &35
4843  55 0A              U.   EOR &0A,X
4845  85 83              ..   STA &83
4847  A5 36              .6   LDA &36
4849  85 81              ..   STA &81
484B  B5 0B              ..   LDA &0B,X
484D  20 47 28            G(  JSR &2847
4850  85 81              ..   STA &81
4852  A5 D1              ..   LDA &D1
4854  85 82              ..   STA &82
4856  A5 37              .7   LDA &37
4858  55 0C              U.   EOR &0C,X
485A  20 12 48            .H  JSR &4812
485D  85 D1              ..   STA &D1
485F  A5 38              .8   LDA &38
4861  85 81              ..   STA &81
4863  B5 0D              ..   LDA &0D,X
4865  20 47 28            G(  JSR &2847
4868  85 81              ..   STA &81
486A  A5 D1              ..   LDA &D1
486C  85 82              ..   STA &82
486E  A5 39              .9   LDA &39
4870  55 0E              U.   EOR &0E,X
4872  20 12 48            .H  JSR &4812
4875  99 3A 00           .:.  STA &003A,Y
4878  A5 83              ..   LDA &83
487A  99 3B 00           .;.  STA &003B,Y
487D  C8                 .    INY
487E  C8                 .    INY
487F  8A                 .    TXA
4880  18                 .    CLC
4881  69 06              i.   ADC #&06
4883  AA                 .    TAX
4884  C9 11              ..   CMP #&11
4886  90 AE              ..   BCC &4836
4888  60                 `    RTS
.addr4889
4889  4C 99 38           L.8  JMP &3899
.addr488C
488C  A5 8C              ..   LDA &8C
488E  30 F9              0.   BMI &4889
4890  A9 1F              ..   LDA #&1F
4892  85 96              ..   STA &96
4894  A5 6A              .j   LDA &6A
4896  30 46              0F   BMI &48DE
4898  A9 20              .    LDA #&20
489A  24 65              $e   BIT &65
489C  D0 2D              .-   BNE &48CB
489E  10 2B              .+   BPL &48CB
48A0  05 65              .e   ORA &65
48A2  29 3F              )?   AND #&3F
48A4  85 65              .e   STA &65
48A6  A9 00              ..   LDA #&00
48A8  A0 1C              ..   LDY #&1C
48AA  91 20              .    STA (&20),Y
48AC  A0 1E              ..   LDY #&1E
48AE  91 20              .    STA (&20),Y
48B0  20 DE 48            .H  JSR &48DE
48B3  A0 01              ..   LDY #&01
48B5  A9 12              ..   LDA #&12
48B7  91 67              .g   STA (&67),Y
48B9  A0 07              ..   LDY #&07
48BB  B1 1E              ..   LDA (&1E),Y
48BD  A0 02              ..   LDY #&02
48BF  91 67              .g   STA (&67),Y
.addr48C1
48C1  C8                 .    INY
48C2  20 86 3F            .?  JSR &3F86
48C5  91 67              .g   STA (&67),Y
48C7  C0 06              ..   CPY #&06
48C9  D0 F6              ..   BNE &48C1
.addr48CB
48CB  A5 4E              .N   LDA &4E
48CD  10 1D              ..   BPL &48EC
.addr48CF
48CF  A5 65              .e   LDA &65
48D1  29 20              )    AND #&20
48D3  F0 09              ..   BEQ &48DE
48D5  A5 65              .e   LDA &65
48D7  29 F7              ).   AND #&F7
48D9  85 65              .e   STA &65
48DB  4C 70 34           Lp4  JMP &3470
.addr48DE
48DE  A9 08              ..   LDA #&08
48E0  24 65              $e   BIT &65
48E2  F0 07              ..   BEQ &48EB
48E4  45 65              Ee   EOR &65
48E6  85 65              .e   STA &65
48E8  4C 78 4F           LxO  JMP &4F78
.addr48EB
48EB  60                 `    RTS
.addr48EC
48EC  A5 4D              .M   LDA &4D
48EE  C9 C0              ..   CMP #&C0
48F0  B0 DD              ..   BCS &48CF
48F2  A5 46              .F   LDA &46
48F4  C5 4C              .L   CMP &4C
48F6  A5 47              .G   LDA &47
48F8  E5 4D              .M   SBC &4D
48FA  B0 D3              ..   BCS &48CF
48FC  A5 49              .I   LDA &49
48FE  C5 4C              .L   CMP &4C
4900  A5 4A              .J   LDA &4A
4902  E5 4D              .M   SBC &4D
4904  B0 C9              ..   BCS &48CF
4906  A0 06              ..   LDY #&06
4908  B1 1E              ..   LDA (&1E),Y
490A  AA                 .    TAX
490B  A9 FF              ..   LDA #&FF
490D  9D 00 01           ...  STA &0100,X
4910  9D 01 01           ...  STA &0101,X
4913  A5 4C              .L   LDA &4C
4915  85 D1              ..   STA &D1
4917  A5 4D              .M   LDA &4D
4919  4A                 J    LSR A
491A  66 D1              f.   ROR &D1
491C  4A                 J    LSR A
491D  66 D1              f.   ROR &D1
491F  4A                 J    LSR A
4920  66 D1              f.   ROR &D1
4922  4A                 J    LSR A
4923  D0 0A              ..   BNE &492F
4925  A5 D1              ..   LDA &D1
4927  6A                 j    ROR A
4928  4A                 J    LSR A
4929  4A                 J    LSR A
492A  4A                 J    LSR A
492B  85 96              ..   STA &96
492D  10 11              ..   BPL &4940
.addr492F
492F  A0 0D              ..   LDY #&0D
4931  B1 1E              ..   LDA (&1E),Y
4933  C5 4D              .M   CMP &4D
4935  B0 09              ..   BCS &4940
4937  A9 20              .    LDA #&20
4939  25 65              %e   AND &65
493B  D0 03              ..   BNE &4940
493D  4C 72 47           LrG  JMP &4772
.addr4940
4940  A2 05              ..   LDX #&05
.addr4942
4942  B5 5B              .[   LDA &5B,X
4944  95 09              ..   STA &09,X
4946  B5 55              .U   LDA &55,X
4948  95 0F              ..   STA &0F,X
494A  B5 4F              .O   LDA &4F,X
494C  95 15              ..   STA &15,X
494E  CA                 .    DEX
494F  10 F1              ..   BPL &4942
4951  A9 C5              ..   LDA #&C5
4953  85 81              ..   STA &81
4955  A0 10              ..   LDY #&10
.addr4957
4957  B9 09 00           ...  LDA &0009,Y
495A  0A                 .    ASL A
495B  B9 0A 00           ...  LDA &000A,Y
495E  2A                 *    ROL A
495F  20 EF 47            .G  JSR &47EF
4962  A6 82              ..   LDX &82
4964  96 09              ..   STX &09,Y
4966  88                 .    DEY
4967  88                 .    DEY
4968  10 ED              ..   BPL &4957
496A  A2 08              ..   LDX #&08
.addr496C
496C  B5 46              .F   LDA &46,X
496E  95 72              .r   STA &72,X
4970  CA                 .    DEX
4971  10 F9              ..   BPL &496C
4973  A9 FF              ..   LDA #&FF
4975  85 E1              ..   STA &E1
4977  A0 0C              ..   LDY #&0C
4979  A5 65              .e   LDA &65
497B  29 20              )    AND #&20
497D  F0 12              ..   BEQ &4991
497F  B1 1E              ..   LDA (&1E),Y
4981  4A                 J    LSR A
4982  4A                 J    LSR A
4983  AA                 .    TAX
4984  A9 FF              ..   LDA #&FF
.addr4986
4986  95 D2              ..   STA &D2,X
4988  CA                 .    DEX
4989  10 FB              ..   BPL &4986
498B  E8                 .    INX
498C  86 96              ..   STX &96
.addr498E
498E  4C 04 4B           L.K  JMP &4B04
.addr4991
4991  B1 1E              ..   LDA (&1E),Y
4993  F0 F9              ..   BEQ &498E
4995  85 97              ..   STA &97
4997  A0 12              ..   LDY #&12
4999  B1 1E              ..   LDA (&1E),Y
499B  AA                 .    TAX
499C  A5 79              .y   LDA &79
499E  A8                 .    TAY
499F  F0 0F              ..   BEQ &49B0
.addr49A1
49A1  E8                 .    INX
49A2  46 76              Fv   LSR &76
49A4  66 75              fu   ROR &75
49A6  46 73              Fs   LSR &73
49A8  66 72              fr   ROR &72
49AA  4A                 J    LSR A
49AB  66 78              fx   ROR &78
49AD  A8                 .    TAY
49AE  D0 F1              ..   BNE &49A1
.addr49B0
49B0  86 86              ..   STX &86
49B2  A5 7A              .z   LDA &7A
49B4  85 39              .9   STA &39
49B6  A5 72              .r   LDA &72
49B8  85 34              .4   STA &34
49BA  A5 74              .t   LDA &74
49BC  85 35              .5   STA &35
49BE  A5 75              .u   LDA &75
49C0  85 36              .6   STA &36
49C2  A5 77              .w   LDA &77
49C4  85 37              .7   STA &37
49C6  A5 78              .x   LDA &78
49C8  85 38              .8   STA &38
49CA  20 32 48            2H  JSR &4832
49CD  A5 3A              .:   LDA &3A
49CF  85 72              .r   STA &72
49D1  A5 3B              .;   LDA &3B
49D3  85 74              .t   STA &74
49D5  A5 3C              .<   LDA &3C
49D7  85 75              .u   STA &75
49D9  A5 3D              .=   LDA &3D
49DB  85 77              .w   STA &77
49DD  A5 3E              .>   LDA &3E
49DF  85 78              .x   STA &78
49E1  A5 3F              .?   LDA &3F
49E3  85 7A              .z   STA &7A
49E5  A0 04              ..   LDY #&04
49E7  B1 1E              ..   LDA (&1E),Y
49E9  18                 .    CLC
49EA  65 1E              e.   ADC &1E
49EC  85 22              ."   STA &22
49EE  A0 11              ..   LDY #&11
49F0  B1 1E              ..   LDA (&1E),Y
49F2  65 1F              e.   ADC &1F
49F4  85 23              .#   STA &23
49F6  A0 00              ..   LDY #&00
.addr49F8
49F8  B1 22              ."   LDA (&22),Y
49FA  85 3B              .;   STA &3B
49FC  29 1F              ).   AND #&1F
49FE  C5 96              ..   CMP &96
4A00  B0 0F              ..   BCS &4A11
4A02  98                 .    TYA
4A03  4A                 J    LSR A
4A04  4A                 J    LSR A
4A05  AA                 .    TAX
4A06  A9 FF              ..   LDA #&FF
4A08  95 D2              ..   STA &D2,X
4A0A  98                 .    TYA
4A0B  69 04              i.   ADC #&04
4A0D  A8                 .    TAY
4A0E  4C FD 4A           L.J  JMP &4AFD
.addr4A11
4A11  A5 3B              .;   LDA &3B
4A13  0A                 .    ASL A
4A14  85 3D              .=   STA &3D
4A16  0A                 .    ASL A
4A17  85 3F              .?   STA &3F
4A19  C8                 .    INY
4A1A  B1 22              ."   LDA (&22),Y
4A1C  85 3A              .:   STA &3A
4A1E  C8                 .    INY
4A1F  B1 22              ."   LDA (&22),Y
4A21  85 3C              .<   STA &3C
4A23  C8                 .    INY
4A24  B1 22              ."   LDA (&22),Y
4A26  85 3E              .>   STA &3E
4A28  A6 86              ..   LDX &86
4A2A  E0 04              ..   CPX #&04
4A2C  90 23              .#   BCC &4A51
4A2E  A5 72              .r   LDA &72
4A30  85 34              .4   STA &34
4A32  A5 74              .t   LDA &74
4A34  85 35              .5   STA &35
4A36  A5 75              .u   LDA &75
4A38  85 36              .6   STA &36
4A3A  A5 77              .w   LDA &77
4A3C  85 37              .7   STA &37
4A3E  A5 78              .x   LDA &78
4A40  85 38              .8   STA &38
4A42  A5 7A              .z   LDA &7A
4A44  85 39              .9   STA &39
4A46  4C AF 4A           L.J  JMP &4AAF
.addr4A49
4A49  46 72              Fr   LSR &72
4A4B  46 78              Fx   LSR &78
4A4D  46 75              Fu   LSR &75
4A4F  A2 01              ..   LDX #&01
.addr4A51
4A51  A5 3A              .:   LDA &3A
4A53  85 34              .4   STA &34
4A55  A5 3C              .<   LDA &3C
4A57  85 36              .6   STA &36
4A59  A5 3E              .>   LDA &3E
4A5B  CA                 .    DEX
4A5C  30 08              0.   BMI &4A66
.addr4A5E
4A5E  46 34              F4   LSR &34
4A60  46 36              F6   LSR &36
4A62  4A                 J    LSR A
4A63  CA                 .    DEX
4A64  10 F8              ..   BPL &4A5E
.addr4A66
4A66  85 82              ..   STA &82
4A68  A5 3F              .?   LDA &3F
4A6A  85 83              ..   STA &83
4A6C  A5 78              .x   LDA &78
4A6E  85 81              ..   STA &81
4A70  A5 7A              .z   LDA &7A
4A72  20 12 48            .H  JSR &4812
4A75  B0 D2              ..   BCS &4A49
4A77  85 38              .8   STA &38
4A79  A5 83              ..   LDA &83
4A7B  85 39              .9   STA &39
4A7D  A5 34              .4   LDA &34
4A7F  85 82              ..   STA &82
4A81  A5 3B              .;   LDA &3B
4A83  85 83              ..   STA &83
4A85  A5 72              .r   LDA &72
4A87  85 81              ..   STA &81
4A89  A5 74              .t   LDA &74
4A8B  20 12 48            .H  JSR &4812
4A8E  B0 B9              ..   BCS &4A49
4A90  85 34              .4   STA &34
4A92  A5 83              ..   LDA &83
4A94  85 35              .5   STA &35
4A96  A5 36              .6   LDA &36
4A98  85 82              ..   STA &82
4A9A  A5 3D              .=   LDA &3D
4A9C  85 83              ..   STA &83
4A9E  A5 75              .u   LDA &75
4AA0  85 81              ..   STA &81
4AA2  A5 77              .w   LDA &77
4AA4  20 12 48            .H  JSR &4812
4AA7  B0 A0              ..   BCS &4A49
4AA9  85 36              .6   STA &36
4AAB  A5 83              ..   LDA &83
4AAD  85 37              .7   STA &37
.addr4AAF
4AAF  A5 3A              .:   LDA &3A
4AB1  85 81              ..   STA &81
4AB3  A5 34              .4   LDA &34
4AB5  20 47 28            G(  JSR &2847
4AB8  85 D1              ..   STA &D1
4ABA  A5 3B              .;   LDA &3B
4ABC  45 35              E5   EOR &35
4ABE  85 83              ..   STA &83
4AC0  A5 3C              .<   LDA &3C
4AC2  85 81              ..   STA &81
4AC4  A5 36              .6   LDA &36
4AC6  20 47 28            G(  JSR &2847
4AC9  85 81              ..   STA &81
4ACB  A5 D1              ..   LDA &D1
4ACD  85 82              ..   STA &82
4ACF  A5 3D              .=   LDA &3D
4AD1  45 37              E7   EOR &37
4AD3  20 12 48            .H  JSR &4812
4AD6  85 D1              ..   STA &D1
4AD8  A5 3E              .>   LDA &3E
4ADA  85 81              ..   STA &81
4ADC  A5 38              .8   LDA &38
4ADE  20 47 28            G(  JSR &2847
4AE1  85 81              ..   STA &81
4AE3  A5 D1              ..   LDA &D1
4AE5  85 82              ..   STA &82
4AE7  A5 39              .9   LDA &39
4AE9  45 3F              E?   EOR &3F
4AEB  20 12 48            .H  JSR &4812
4AEE  48                 H    PHA
4AEF  98                 .    TYA
4AF0  4A                 J    LSR A
4AF1  4A                 J    LSR A
4AF2  AA                 .    TAX
4AF3  68                 h    PLA
4AF4  24 83              $.   BIT &83
4AF6  30 02              0.   BMI &4AFA
4AF8  A9 00              ..   LDA #&00
.addr4AFA
4AFA  95 D2              ..   STA &D2,X
4AFC  C8                 .    INY
.addr4AFD
4AFD  C4 97              ..   CPY &97
4AFF  B0 03              ..   BCS &4B04
4B01  4C F8 49           L.I  JMP &49F8
.addr4B04
4B04  A4 0B              ..   LDY &0B
4B06  A6 0C              ..   LDX &0C
4B08  A5 0F              ..   LDA &0F
4B0A  85 0B              ..   STA &0B
4B0C  A5 10              ..   LDA &10
4B0E  85 0C              ..   STA &0C
4B10  84 0F              ..   STY &0F
4B12  86 10              ..   STX &10
4B14  A4 0D              ..   LDY &0D
4B16  A6 0E              ..   LDX &0E
4B18  A5 15              ..   LDA &15
4B1A  85 0D              ..   STA &0D
4B1C  A5 16              ..   LDA &16
4B1E  85 0E              ..   STA &0E
4B20  84 15              ..   STY &15
4B22  86 16              ..   STX &16
4B24  A4 13              ..   LDY &13
4B26  A6 14              ..   LDX &14
4B28  A5 17              ..   LDA &17
4B2A  85 13              ..   STA &13
4B2C  A5 18              ..   LDA &18
4B2E  85 14              ..   STA &14
4B30  84 17              ..   STY &17
4B32  86 18              ..   STX &18
4B34  A0 08              ..   LDY #&08
4B36  B1 1E              ..   LDA (&1E),Y
4B38  85 97              ..   STA &97
4B3A  A5 1E              ..   LDA &1E
4B3C  18                 .    CLC
4B3D  69 14              i.   ADC #&14
4B3F  85 22              ."   STA &22
4B41  A5 1F              ..   LDA &1F
4B43  69 00              i.   ADC #&00
4B45  85 23              .#   STA &23
4B47  A0 00              ..   LDY #&00
4B49  84 93              ..   STY &93
.addr4B4B
4B4B  84 86              ..   STY &86
4B4D  B1 22              ."   LDA (&22),Y
4B4F  85 34              .4   STA &34
4B51  C8                 .    INY
4B52  B1 22              ."   LDA (&22),Y
4B54  85 36              .6   STA &36
4B56  C8                 .    INY
4B57  B1 22              ."   LDA (&22),Y
4B59  85 38              .8   STA &38
4B5B  C8                 .    INY
4B5C  B1 22              ."   LDA (&22),Y
4B5E  85 D1              ..   STA &D1
4B60  29 1F              ).   AND #&1F
4B62  C5 96              ..   CMP &96
4B64  90 2E              ..   BCC &4B94
4B66  C8                 .    INY
4B67  B1 22              ."   LDA (&22),Y
4B69  85 1B              ..   STA &1B
4B6B  29 0F              ).   AND #&0F
4B6D  AA                 .    TAX
4B6E  B5 D2              ..   LDA &D2,X
4B70  D0 25              .%   BNE &4B97
4B72  A5 1B              ..   LDA &1B
4B74  4A                 J    LSR A
4B75  4A                 J    LSR A
4B76  4A                 J    LSR A
4B77  4A                 J    LSR A
4B78  AA                 .    TAX
4B79  B5 D2              ..   LDA &D2,X
4B7B  D0 1A              ..   BNE &4B97
4B7D  C8                 .    INY
4B7E  B1 22              ."   LDA (&22),Y
4B80  85 1B              ..   STA &1B
4B82  29 0F              ).   AND #&0F
4B84  AA                 .    TAX
4B85  B5 D2              ..   LDA &D2,X
4B87  D0 0E              ..   BNE &4B97
4B89  A5 1B              ..   LDA &1B
4B8B  4A                 J    LSR A
4B8C  4A                 J    LSR A
4B8D  4A                 J    LSR A
4B8E  4A                 J    LSR A
4B8F  AA                 .    TAX
4B90  B5 D2              ..   LDA &D2,X
4B92  D0 03              ..   BNE &4B97
.addr4B94
4B94  4C 0C 4D           L.M  JMP &4D0C
.addr4B97
4B97  A5 D1              ..   LDA &D1
4B99  85 35              .5   STA &35
4B9B  0A                 .    ASL A
4B9C  85 37              .7   STA &37
4B9E  0A                 .    ASL A
4B9F  85 39              .9   STA &39
4BA1  20 32 48            2H  JSR &4832
4BA4  A5 48              .H   LDA &48
4BA6  85 36              .6   STA &36
4BA8  45 3B              E;   EOR &3B
4BAA  30 10              0.   BMI &4BBC
4BAC  18                 .    CLC
4BAD  A5 3A              .:   LDA &3A
4BAF  65 46              eF   ADC &46
4BB1  85 34              .4   STA &34
4BB3  A5 47              .G   LDA &47
4BB5  69 00              i.   ADC #&00
4BB7  85 35              .5   STA &35
4BB9  4C DF 4B           L.K  JMP &4BDF
.addr4BBC
4BBC  A5 46              .F   LDA &46
4BBE  38                 8    SEC
4BBF  E5 3A              .:   SBC &3A
4BC1  85 34              .4   STA &34
4BC3  A5 47              .G   LDA &47
4BC5  E9 00              ..   SBC #&00
4BC7  85 35              .5   STA &35
4BC9  B0 14              ..   BCS &4BDF
4BCB  49 FF              I.   EOR #&FF
4BCD  85 35              .5   STA &35
4BCF  A9 01              ..   LDA #&01
4BD1  E5 34              .4   SBC &34
4BD3  85 34              .4   STA &34
4BD5  90 02              ..   BCC &4BD9
4BD7  E6 35              .5   INC &35
.addr4BD9
4BD9  A5 36              .6   LDA &36
4BDB  49 80              I.   EOR #&80
4BDD  85 36              .6   STA &36
.addr4BDF
4BDF  A5 4B              .K   LDA &4B
4BE1  85 39              .9   STA &39
4BE3  45 3D              E=   EOR &3D
4BE5  30 10              0.   BMI &4BF7
4BE7  18                 .    CLC
4BE8  A5 3C              .<   LDA &3C
4BEA  65 49              eI   ADC &49
4BEC  85 37              .7   STA &37
4BEE  A5 4A              .J   LDA &4A
4BF0  69 00              i.   ADC #&00
4BF2  85 38              .8   STA &38
4BF4  4C 1C 4C           L.L  JMP &4C1C
.addr4BF7
4BF7  A5 49              .I   LDA &49
4BF9  38                 8    SEC
4BFA  E5 3C              .<   SBC &3C
4BFC  85 37              .7   STA &37
4BFE  A5 4A              .J   LDA &4A
4C00  E9 00              ..   SBC #&00
4C02  85 38              .8   STA &38
4C04  B0 16              ..   BCS &4C1C
4C06  49 FF              I.   EOR #&FF
4C08  85 38              .8   STA &38
4C0A  A5 37              .7   LDA &37
4C0C  49 FF              I.   EOR #&FF
4C0E  69 01              i.   ADC #&01
4C10  85 37              .7   STA &37
4C12  A5 39              .9   LDA &39
4C14  49 80              I.   EOR #&80
4C16  85 39              .9   STA &39
4C18  90 02              ..   BCC &4C1C
4C1A  E6 38              .8   INC &38
.addr4C1C
4C1C  A5 3F              .?   LDA &3F
4C1E  30 4A              0J   BMI &4C6A
4C20  A5 3E              .>   LDA &3E
4C22  18                 .    CLC
4C23  65 4C              eL   ADC &4C
4C25  85 D1              ..   STA &D1
4C27  A5 4D              .M   LDA &4D
4C29  69 00              i.   ADC #&00
4C2B  85 80              ..   STA &80
4C2D  4C 89 4C           L.L  JMP &4C89
.addr4C30
4C30  A6 81              ..   LDX &81
4C32  F0 1C              ..   BEQ &4C50
4C34  A2 00              ..   LDX #&00
.addr4C36
4C36  4A                 J    LSR A
4C37  E8                 .    INX
4C38  C5 81              ..   CMP &81
4C3A  B0 FA              ..   BCS &4C36
4C3C  86 83              ..   STX &83
4C3E  20 EF 47            .G  JSR &47EF
4C41  A6 83              ..   LDX &83
4C43  A5 82              ..   LDA &82
.addr4C45
4C45  0A                 .    ASL A
4C46  26 80              &.   ROL &80
4C48  30 06              0.   BMI &4C50
4C4A  CA                 .    DEX
4C4B  D0 F8              ..   BNE &4C45
4C4D  85 82              ..   STA &82
4C4F  60                 `    RTS
.addr4C50
4C50  A9 32              .2   LDA #&32
4C52  85 82              ..   STA &82
4C54  85 80              ..   STA &80
4C56  60                 `    RTS
.addr4C57
4C57  A9 80              ..   LDA #&80
4C59  38                 8    SEC
4C5A  E5 82              ..   SBC &82
4C5C  9D 00 01           ...  STA &0100,X
4C5F  E8                 .    INX
4C60  A9 00              ..   LDA #&00
4C62  E5 80              ..   SBC &80
4C64  9D 00 01           ...  STA &0100,X
4C67  4C C9 4C           L.L  JMP &4CC9
.addr4C6A
4C6A  A5 4C              .L   LDA &4C
4C6C  38                 8    SEC
4C6D  E5 3E              .>   SBC &3E
4C6F  85 D1              ..   STA &D1
4C71  A5 4D              .M   LDA &4D
4C73  E9 00              ..   SBC #&00
4C75  85 80              ..   STA &80
4C77  90 08              ..   BCC &4C81
4C79  D0 0E              ..   BNE &4C89
4C7B  A5 D1              ..   LDA &D1
4C7D  C9 04              ..   CMP #&04
4C7F  B0 08              ..   BCS &4C89
.addr4C81
4C81  A9 00              ..   LDA #&00
4C83  85 80              ..   STA &80
4C85  A9 04              ..   LDA #&04
4C87  85 D1              ..   STA &D1
.addr4C89
4C89  A5 80              ..   LDA &80
4C8B  05 35              .5   ORA &35
4C8D  05 38              .8   ORA &38
4C8F  F0 0F              ..   BEQ &4CA0
4C91  46 35              F5   LSR &35
4C93  66 34              f4   ROR &34
4C95  46 38              F8   LSR &38
4C97  66 37              f7   ROR &37
4C99  46 80              F.   LSR &80
4C9B  66 D1              f.   ROR &D1
4C9D  4C 89 4C           L.L  JMP &4C89
.addr4CA0
4CA0  A5 D1              ..   LDA &D1
4CA2  85 81              ..   STA &81
4CA4  A5 34              .4   LDA &34
4CA6  C5 81              ..   CMP &81
4CA8  90 06              ..   BCC &4CB0
4CAA  20 30 4C            0L  JSR &4C30
4CAD  4C B3 4C           L.L  JMP &4CB3
.addr4CB0
4CB0  20 EF 47            .G  JSR &47EF
.addr4CB3
4CB3  A6 93              ..   LDX &93
4CB5  A5 36              .6   LDA &36
4CB7  30 9E              0.   BMI &4C57
4CB9  A5 82              ..   LDA &82
4CBB  18                 .    CLC
4CBC  69 80              i.   ADC #&80
4CBE  9D 00 01           ...  STA &0100,X
4CC1  E8                 .    INX
4CC2  A5 80              ..   LDA &80
4CC4  69 00              i.   ADC #&00
4CC6  9D 00 01           ...  STA &0100,X
.addr4CC9
4CC9  8A                 .    TXA
4CCA  48                 H    PHA
4CCB  A9 00              ..   LDA #&00
4CCD  85 80              ..   STA &80
4CCF  A5 D1              ..   LDA &D1
4CD1  85 81              ..   STA &81
4CD3  A5 37              .7   LDA &37
4CD5  C5 81              ..   CMP &81
4CD7  90 19              ..   BCC &4CF2
4CD9  20 30 4C            0L  JSR &4C30
4CDC  4C F5 4C           L.L  JMP &4CF5
.addr4CDF
4CDF  A9 60              .`   LDA #&60
4CE1  18                 .    CLC
4CE2  65 82              e.   ADC &82
4CE4  9D 00 01           ...  STA &0100,X
4CE7  E8                 .    INX
4CE8  A9 00              ..   LDA #&00
4CEA  65 80              e.   ADC &80
4CEC  9D 00 01           ...  STA &0100,X
4CEF  4C 0C 4D           L.M  JMP &4D0C
.addr4CF2
4CF2  20 EF 47            .G  JSR &47EF
.addr4CF5
4CF5  68                 h    PLA
4CF6  AA                 .    TAX
4CF7  E8                 .    INX
4CF8  A5 39              .9   LDA &39
4CFA  30 E3              0.   BMI &4CDF
4CFC  A9 60              .`   LDA #&60
4CFE  38                 8    SEC
4CFF  E5 82              ..   SBC &82
4D01  9D 00 01           ...  STA &0100,X
4D04  E8                 .    INX
4D05  A9 00              ..   LDA #&00
4D07  E5 80              ..   SBC &80
4D09  9D 00 01           ...  STA &0100,X
.addr4D0C
4D0C  18                 .    CLC
4D0D  A5 93              ..   LDA &93
4D0F  69 04              i.   ADC #&04
4D11  85 93              ..   STA &93
4D13  A5 86              ..   LDA &86
4D15  69 06              i.   ADC #&06
4D17  A8                 .    TAY
4D18  B0 07              ..   BCS &4D21
4D1A  C5 97              ..   CMP &97
4D1C  B0 03              ..   BCS &4D21
4D1E  4C 4B 4B           LKK  JMP &4B4B
.addr4D21
4D21  A5 65              .e   LDA &65
4D23  29 20              )    AND #&20
4D25  F0 09              ..   BEQ &4D30
4D27  A5 65              .e   LDA &65
4D29  09 08              ..   ORA #&08
4D2B  85 65              .e   STA &65
4D2D  4C 70 34           Lp4  JMP &3470
.addr4D30
4D30  A9 08              ..   LDA #&08
4D32  24 65              $e   BIT &65
4D34  F0 05              ..   BEQ &4D3B
4D36  20 78 4F            xO  JSR &4F78
4D39  A9 08              ..   LDA #&08
.addr4D3B
4D3B  05 65              .e   ORA &65
4D3D  85 65              .e   STA &65
4D3F  A0 09              ..   LDY #&09
4D41  B1 1E              ..   LDA (&1E),Y
4D43  85 97              ..   STA &97
4D45  A0 00              ..   LDY #&00
4D47  84 80              ..   STY &80
4D49  84 86              ..   STY &86
4D4B  E6 80              ..   INC &80
4D4D  24 65              $e   BIT &65
4D4F  50 54              PT   BVC &4DA5
4D51  A5 65              .e   LDA &65
4D53  29 BF              ).   AND #&BF
4D55  85 65              .e   STA &65
4D57  A0 06              ..   LDY #&06
4D59  B1 1E              ..   LDA (&1E),Y
4D5B  A8                 .    TAY
4D5C  BE 00 01           ...  LDX &0100,Y
4D5F  86 34              .4   STX &34
4D61  E8                 .    INX
4D62  F0 41              .A   BEQ &4DA5
4D64  BE 01 01           ...  LDX &0101,Y
4D67  86 35              .5   STX &35
4D69  E8                 .    INX
4D6A  F0 39              .9   BEQ &4DA5
4D6C  BE 02 01           ...  LDX &0102,Y
4D6F  86 36              .6   STX &36
4D71  BE 03 01           ...  LDX &0103,Y
4D74  86 37              .7   STX &37
4D76  A9 00              ..   LDA #&00
4D78  85 38              .8   STA &38
4D7A  85 39              .9   STA &39
4D7C  85 3B              .;   STA &3B
4D7E  A5 4C              .L   LDA &4C
4D80  85 3A              .:   STA &3A
4D82  A5 48              .H   LDA &48
4D84  10 02              ..   BPL &4D88
4D86  C6 38              .8   DEC &38
.addr4D88
4D88  20 19 4E            .N  JSR &4E19
4D8B  B0 18              ..   BCS &4DA5
4D8D  A4 80              ..   LDY &80
4D8F  A5 34              .4   LDA &34
4D91  91 67              .g   STA (&67),Y
4D93  C8                 .    INY
4D94  A5 35              .5   LDA &35
4D96  91 67              .g   STA (&67),Y
4D98  C8                 .    INY
4D99  A5 36              .6   LDA &36
4D9B  91 67              .g   STA (&67),Y
4D9D  C8                 .    INY
4D9E  A5 37              .7   LDA &37
4DA0  91 67              .g   STA (&67),Y
4DA2  C8                 .    INY
4DA3  84 80              ..   STY &80
.addr4DA5
4DA5  A0 03              ..   LDY #&03
4DA7  18                 .    CLC
4DA8  B1 1E              ..   LDA (&1E),Y
4DAA  65 1E              e.   ADC &1E
4DAC  85 22              ."   STA &22
4DAE  A0 10              ..   LDY #&10
4DB0  B1 1E              ..   LDA (&1E),Y
4DB2  65 1F              e.   ADC &1F
4DB4  85 23              .#   STA &23
4DB6  A0 05              ..   LDY #&05
4DB8  B1 1E              ..   LDA (&1E),Y
4DBA  85 06              ..   STA &06
4DBC  A4 86              ..   LDY &86
.addr4DBE
4DBE  B1 22              ."   LDA (&22),Y
4DC0  C5 96              ..   CMP &96
4DC2  90 18              ..   BCC &4DDC
4DC4  C8                 .    INY
4DC5  B1 22              ."   LDA (&22),Y
4DC7  C8                 .    INY
4DC8  85 1B              ..   STA &1B
4DCA  29 0F              ).   AND #&0F
4DCC  AA                 .    TAX
4DCD  B5 D2              ..   LDA &D2,X
4DCF  D0 0E              ..   BNE &4DDF
4DD1  A5 1B              ..   LDA &1B
4DD3  4A                 J    LSR A
4DD4  4A                 J    LSR A
4DD5  4A                 J    LSR A
4DD6  4A                 J    LSR A
4DD7  AA                 .    TAX
4DD8  B5 D2              ..   LDA &D2,X
4DDA  D0 03              ..   BNE &4DDF
.addr4DDC
4DDC  4C 5B 4F           L[O  JMP &4F5B
.addr4DDF
4DDF  B1 22              ."   LDA (&22),Y
4DE1  AA                 .    TAX
4DE2  C8                 .    INY
4DE3  B1 22              ."   LDA (&22),Y
4DE5  85 81              ..   STA &81
4DE7  BD 01 01           ...  LDA &0101,X
4DEA  85 35              .5   STA &35
4DEC  BD 00 01           ...  LDA &0100,X
4DEF  85 34              .4   STA &34
4DF1  BD 02 01           ...  LDA &0102,X
4DF4  85 36              .6   STA &36
4DF6  BD 03 01           ...  LDA &0103,X
4DF9  85 37              .7   STA &37
4DFB  A6 81              ..   LDX &81
4DFD  BD 00 01           ...  LDA &0100,X
4E00  85 38              .8   STA &38
4E02  BD 03 01           ...  LDA &0103,X
4E05  85 3B              .;   STA &3B
4E07  BD 02 01           ...  LDA &0102,X
4E0A  85 3A              .:   STA &3A
4E0C  BD 01 01           ...  LDA &0101,X
4E0F  85 39              .9   STA &39
4E11  20 1F 4E            .N  JSR &4E1F
4E14  B0 C6              ..   BCS &4DDC
4E16  4C 3F 4F           L?O  JMP &4F3F
.addr4E19
4E19  A9 00              ..   LDA #&00
4E1B  85 90              ..   STA &90
4E1D  A5 39              .9   LDA &39
.addr4E1F
4E1F  A2 BF              ..   LDX #&BF
4E21  05 3B              .;   ORA &3B
4E23  D0 06              ..   BNE &4E2B
4E25  E4 3A              .:   CPX &3A
4E27  90 02              ..   BCC &4E2B
4E29  A2 00              ..   LDX #&00
.addr4E2B
4E2B  86 89              ..   STX &89
4E2D  A5 35              .5   LDA &35
4E2F  05 37              .7   ORA &37
4E31  D0 1C              ..   BNE &4E4F
4E33  A9 BF              ..   LDA #&BF
4E35  C5 36              .6   CMP &36
4E37  90 16              ..   BCC &4E4F
4E39  A5 89              ..   LDA &89
4E3B  D0 10              ..   BNE &4E4D
.addr4E3D
4E3D  A5 36              .6   LDA &36
4E3F  85 35              .5   STA &35
4E41  A5 38              .8   LDA &38
4E43  85 36              .6   STA &36
4E45  A5 3A              .:   LDA &3A
4E47  85 37              .7   STA &37
4E49  18                 .    CLC
4E4A  60                 `    RTS
.addr4E4B
4E4B  38                 8    SEC
4E4C  60                 `    RTS
.addr4E4D
4E4D  46 89              F.   LSR &89
.addr4E4F
4E4F  A5 89              ..   LDA &89
4E51  10 2F              ./   BPL &4E82
4E53  A5 35              .5   LDA &35
4E55  25 39              %9   AND &39
4E57  30 F2              0.   BMI &4E4B
4E59  A5 37              .7   LDA &37
4E5B  25 3B              %;   AND &3B
4E5D  30 EC              0.   BMI &4E4B
4E5F  A6 35              .5   LDX &35
4E61  CA                 .    DEX
4E62  8A                 .    TXA
4E63  A6 39              .9   LDX &39
4E65  CA                 .    DEX
4E66  86 3C              .<   STX &3C
4E68  05 3C              .<   ORA &3C
4E6A  10 DF              ..   BPL &4E4B
4E6C  A5 36              .6   LDA &36
4E6E  C9 C0              ..   CMP #&C0
4E70  A5 37              .7   LDA &37
4E72  E9 00              ..   SBC #&00
4E74  85 3C              .<   STA &3C
4E76  A5 3A              .:   LDA &3A
4E78  C9 C0              ..   CMP #&C0
4E7A  A5 3B              .;   LDA &3B
4E7C  E9 00              ..   SBC #&00
4E7E  05 3C              .<   ORA &3C
4E80  10 C9              ..   BPL &4E4B
.addr4E82
4E82  98                 .    TYA
4E83  48                 H    PHA
4E84  A5 38              .8   LDA &38
4E86  38                 8    SEC
4E87  E5 34              .4   SBC &34
4E89  85 3C              .<   STA &3C
4E8B  A5 39              .9   LDA &39
4E8D  E5 35              .5   SBC &35
4E8F  85 3D              .=   STA &3D
4E91  A5 3A              .:   LDA &3A
4E93  38                 8    SEC
4E94  E5 36              .6   SBC &36
4E96  85 3E              .>   STA &3E
4E98  A5 3B              .;   LDA &3B
4E9A  E5 37              .7   SBC &37
4E9C  85 3F              .?   STA &3F
4E9E  45 3D              E=   EOR &3D
4EA0  85 83              ..   STA &83
4EA2  A5 3F              .?   LDA &3F
4EA4  10 0D              ..   BPL &4EB3
4EA6  A9 00              ..   LDA #&00
4EA8  38                 8    SEC
4EA9  E5 3E              .>   SBC &3E
4EAB  85 3E              .>   STA &3E
4EAD  A9 00              ..   LDA #&00
4EAF  E5 3F              .?   SBC &3F
4EB1  85 3F              .?   STA &3F
.addr4EB3
4EB3  A5 3D              .=   LDA &3D
4EB5  10 0B              ..   BPL &4EC2
4EB7  38                 8    SEC
4EB8  A9 00              ..   LDA #&00
4EBA  E5 3C              .<   SBC &3C
4EBC  85 3C              .<   STA &3C
4EBE  A9 00              ..   LDA #&00
4EC0  E5 3D              .=   SBC &3D
.addr4EC2
4EC2  AA                 .    TAX
4EC3  D0 04              ..   BNE &4EC9
4EC5  A6 3F              .?   LDX &3F
4EC7  F0 0A              ..   BEQ &4ED3
.addr4EC9
4EC9  4A                 J    LSR A
4ECA  66 3C              f<   ROR &3C
4ECC  46 3F              F?   LSR &3F
4ECE  66 3E              f>   ROR &3E
4ED0  4C C2 4E           L.N  JMP &4EC2
.addr4ED3
4ED3  86 D1              ..   STX &D1
4ED5  A5 3C              .<   LDA &3C
4ED7  C5 3E              .>   CMP &3E
4ED9  90 0A              ..   BCC &4EE5
4EDB  85 81              ..   STA &81
4EDD  A5 3E              .>   LDA &3E
4EDF  20 EF 47            .G  JSR &47EF
4EE2  4C F0 4E           L.N  JMP &4EF0
.addr4EE5
4EE5  A5 3E              .>   LDA &3E
4EE7  85 81              ..   STA &81
4EE9  A5 3C              .<   LDA &3C
4EEB  20 EF 47            .G  JSR &47EF
4EEE  C6 D1              ..   DEC &D1
.addr4EF0
4EF0  A5 82              ..   LDA &82
4EF2  85 3C              .<   STA &3C
4EF4  A5 83              ..   LDA &83
4EF6  85 3D              .=   STA &3D
4EF8  A5 89              ..   LDA &89
4EFA  F0 02              ..   BEQ &4EFE
4EFC  10 13              ..   BPL &4F11
.addr4EFE
4EFE  20 9F 4F            .O  JSR &4F9F
4F01  A5 89              ..   LDA &89
4F03  10 31              .1   BPL &4F36
4F05  A5 35              .5   LDA &35
4F07  05 37              .7   ORA &37
4F09  D0 30              .0   BNE &4F3B
4F0B  A5 36              .6   LDA &36
4F0D  C9 C0              ..   CMP #&C0
4F0F  B0 2A              .*   BCS &4F3B
.addr4F11
4F11  A6 34              .4   LDX &34
4F13  A5 38              .8   LDA &38
4F15  85 34              .4   STA &34
4F17  86 38              .8   STX &38
4F19  A5 39              .9   LDA &39
4F1B  A6 35              .5   LDX &35
4F1D  86 39              .9   STX &39
4F1F  85 35              .5   STA &35
4F21  A6 36              .6   LDX &36
4F23  A5 3A              .:   LDA &3A
4F25  85 36              .6   STA &36
4F27  86 3A              .:   STX &3A
4F29  A5 3B              .;   LDA &3B
4F2B  A6 37              .7   LDX &37
4F2D  86 3B              .;   STX &3B
4F2F  85 37              .7   STA &37
4F31  20 9F 4F            .O  JSR &4F9F
4F34  C6 90              ..   DEC &90
.addr4F36
4F36  68                 h    PLA
4F37  A8                 .    TAY
4F38  4C 3D 4E           L=N  JMP &4E3D
.addr4F3B
4F3B  68                 h    PLA
4F3C  A8                 .    TAY
4F3D  38                 8    SEC
4F3E  60                 `    RTS
.addr4F3F
4F3F  A4 80              ..   LDY &80
4F41  A5 34              .4   LDA &34
4F43  91 67              .g   STA (&67),Y
4F45  C8                 .    INY
4F46  A5 35              .5   LDA &35
4F48  91 67              .g   STA (&67),Y
4F4A  C8                 .    INY
4F4B  A5 36              .6   LDA &36
4F4D  91 67              .g   STA (&67),Y
4F4F  C8                 .    INY
4F50  A5 37              .7   LDA &37
4F52  91 67              .g   STA (&67),Y
4F54  C8                 .    INY
4F55  84 80              ..   STY &80
4F57  C4 06              ..   CPY &06
4F59  B0 17              ..   BCS &4F72
.addr4F5B
4F5B  E6 86              ..   INC &86
4F5D  A4 86              ..   LDY &86
4F5F  C4 97              ..   CPY &97
4F61  B0 0F              ..   BCS &4F72
4F63  A0 00              ..   LDY #&00
4F65  A5 22              ."   LDA &22
4F67  69 04              i.   ADC #&04
4F69  85 22              ."   STA &22
4F6B  90 02              ..   BCC &4F6F
4F6D  E6 23              .#   INC &23
.addr4F6F
4F6F  4C BE 4D           L.M  JMP &4DBE
.addr4F72
4F72  A5 80              ..   LDA &80
.addr4F74
4F74  A0 00              ..   LDY #&00
4F76  91 67              .g   STA (&67),Y
.addr4F78
4F78  A0 00              ..   LDY #&00
4F7A  B1 67              .g   LDA (&67),Y
4F7C  85 97              ..   STA &97
4F7E  C9 04              ..   CMP #&04
4F80  90 1C              ..   BCC &4F9E
4F82  C8                 .    INY
.addr4F83
4F83  B1 67              .g   LDA (&67),Y
4F85  85 34              .4   STA &34
4F87  C8                 .    INY
4F88  B1 67              .g   LDA (&67),Y
4F8A  85 35              .5   STA &35
4F8C  C8                 .    INY
4F8D  B1 67              .g   LDA (&67),Y
4F8F  85 36              .6   STA &36
4F91  C8                 .    INY
4F92  B1 67              .g   LDA (&67),Y
4F94  85 37              .7   STA &37
4F96  20 C4 16            ..  JSR &16C4
4F99  C8                 .    INY
4F9A  C4 97              ..   CPY &97
4F9C  90 E5              ..   BCC &4F83
.addr4F9E
4F9E  60                 `    RTS
.addr4F9F
4F9F  A5 35              .5   LDA &35
4FA1  10 17              ..   BPL &4FBA
4FA3  85 83              ..   STA &83
4FA5  20 19 50            .P  JSR &5019
4FA8  8A                 .    TXA
4FA9  18                 .    CLC
4FAA  65 36              e6   ADC &36
4FAC  85 36              .6   STA &36
4FAE  98                 .    TYA
4FAF  65 37              e7   ADC &37
4FB1  85 37              .7   STA &37
4FB3  A9 00              ..   LDA #&00
4FB5  85 34              .4   STA &34
4FB7  85 35              .5   STA &35
4FB9  AA                 .    TAX
.addr4FBA
4FBA  F0 19              ..   BEQ &4FD5
4FBC  85 83              ..   STA &83
4FBE  C6 83              ..   DEC &83
4FC0  20 19 50            .P  JSR &5019
4FC3  8A                 .    TXA
4FC4  18                 .    CLC
4FC5  65 36              e6   ADC &36
4FC7  85 36              .6   STA &36
4FC9  98                 .    TYA
4FCA  65 37              e7   ADC &37
4FCC  85 37              .7   STA &37
4FCE  A2 FF              ..   LDX #&FF
4FD0  86 34              .4   STX &34
4FD2  E8                 .    INX
4FD3  86 35              .5   STX &35
.addr4FD5
4FD5  A5 37              .7   LDA &37
4FD7  10 1A              ..   BPL &4FF3
4FD9  85 83              ..   STA &83
4FDB  A5 36              .6   LDA &36
4FDD  85 82              ..   STA &82
4FDF  20 48 50            HP  JSR &5048
4FE2  8A                 .    TXA
4FE3  18                 .    CLC
4FE4  65 34              e4   ADC &34
4FE6  85 34              .4   STA &34
4FE8  98                 .    TYA
4FE9  65 35              e5   ADC &35
4FEB  85 35              .5   STA &35
4FED  A9 00              ..   LDA #&00
4FEF  85 36              .6   STA &36
4FF1  85 37              .7   STA &37
.addr4FF3
4FF3  A5 36              .6   LDA &36
4FF5  38                 8    SEC
4FF6  E9 C0              ..   SBC #&C0
4FF8  85 82              ..   STA &82
4FFA  A5 37              .7   LDA &37
4FFC  E9 00              ..   SBC #&00
4FFE  85 83              ..   STA &83
5000  90 16              ..   BCC &5018
5002  20 48 50            HP  JSR &5048
5005  8A                 .    TXA
5006  18                 .    CLC
5007  65 34              e4   ADC &34
5009  85 34              .4   STA &34
500B  98                 .    TYA
500C  65 35              e5   ADC &35
500E  85 35              .5   STA &35
5010  A9 BF              ..   LDA #&BF
5012  85 36              .6   STA &36
5014  A9 00              ..   LDA #&00
5016  85 37              .7   STA &37
.addr5018
5018  60                 `    RTS
.addr5019
5019  A5 34              .4   LDA &34
501B  85 82              ..   STA &82
501D  20 84 50            .P  JSR &5084
5020  48                 H    PHA
5021  A6 D1              ..   LDX &D1
5023  D0 2B              .+   BNE &5050
.addr5025
5025  A9 00              ..   LDA #&00
5027  AA                 .    TAX
5028  A8                 .    TAY
5029  46 83              F.   LSR &83
502B  66 82              f.   ROR &82
502D  06 81              ..   ASL &81
502F  90 09              ..   BCC &503A
.addr5031
5031  8A                 .    TXA
5032  18                 .    CLC
5033  65 82              e.   ADC &82
5035  AA                 .    TAX
5036  98                 .    TYA
5037  65 83              e.   ADC &83
5039  A8                 .    TAY
.addr503A
503A  46 83              F.   LSR &83
503C  66 82              f.   ROR &82
503E  06 81              ..   ASL &81
5040  B0 EF              ..   BCS &5031
5042  D0 F6              ..   BNE &503A
5044  68                 h    PLA
5045  10 30              .0   BPL &5077
5047  60                 `    RTS
.addr5048
5048  20 84 50            .P  JSR &5084
504B  48                 H    PHA
504C  A6 D1              ..   LDX &D1
504E  D0 D5              ..   BNE &5025
.addr5050
5050  A9 FF              ..   LDA #&FF
5052  A8                 .    TAY
5053  0A                 .    ASL A
5054  AA                 .    TAX
.addr5055
5055  06 82              ..   ASL &82
5057  26 83              &.   ROL &83
5059  A5 83              ..   LDA &83
505B  B0 04              ..   BCS &5061
505D  C5 81              ..   CMP &81
505F  90 0B              ..   BCC &506C
.addr5061
5061  E5 81              ..   SBC &81
5063  85 83              ..   STA &83
5065  A5 82              ..   LDA &82
5067  E9 00              ..   SBC #&00
5069  85 82              ..   STA &82
506B  38                 8    SEC
.addr506C
506C  8A                 .    TXA
506D  2A                 *    ROL A
506E  AA                 .    TAX
506F  98                 .    TYA
5070  2A                 *    ROL A
5071  A8                 .    TAY
5072  B0 E1              ..   BCS &5055
5074  68                 h    PLA
5075  30 0C              0.   BMI &5083
.addr5077
5077  8A                 .    TXA
5078  49 FF              I.   EOR #&FF
507A  69 01              i.   ADC #&01
507C  AA                 .    TAX
507D  98                 .    TYA
507E  49 FF              I.   EOR #&FF
5080  69 00              i.   ADC #&00
5082  A8                 .    TAY
.addr5083
5083  60                 `    RTS
.addr5084
5084  A6 3C              .<   LDX &3C
5086  86 81              ..   STX &81
5088  A5 83              ..   LDA &83
508A  10 11              ..   BPL &509D
508C  A9 00              ..   LDA #&00
508E  38                 8    SEC
508F  E5 82              ..   SBC &82
5091  85 82              ..   STA &82
5093  A5 83              ..   LDA &83
5095  48                 H    PHA
5096  49 FF              I.   EOR #&FF
5098  69 00              i.   ADC #&00
509A  85 83              ..   STA &83
509C  68                 h    PLA
.addr509D
509D  45 3D              E=   EOR &3D
509F  60                 `    RTS
.addr50A0
50A0  A5 65              .e   LDA &65
50A2  29 A0              ).   AND #&A0
50A4  D0 25              .%   BNE &50CB
50A6  A5 8A              ..   LDA &8A
50A8  45 84              E.   EOR &84
50AA  29 0F              ).   AND #&0F
50AC  D0 03              ..   BNE &50B1
50AE  20 79 46            yF  JSR &4679
.addr50B1
50B1  A6 8C              ..   LDX &8C
50B3  10 03              ..   BPL &50B8
50B5  4C 3D 53           L=S  JMP &533D
.addr50B8
50B8  A5 66              .f   LDA &66
50BA  10 0F              ..   BPL &50CB
50BC  E0 01              ..   CPX #&01
50BE  F0 08              ..   BEQ &50C8
50C0  A5 8A              ..   LDA &8A
50C2  45 84              E.   EOR &84
50C4  29 07              ).   AND #&07
50C6  D0 03              ..   BNE &50CB
.addr50C8
50C8  20 7A 21            z!  JSR &217A
.addr50CB
50CB  20 58 55            XU  JSR &5558
50CE  A5 61              .a   LDA &61
50D0  0A                 .    ASL A
50D1  0A                 .    ASL A
50D2  85 81              ..   STA &81
50D4  A5 50              .P   LDA &50
50D6  29 7F              )   AND #&7F
50D8  20 47 28            G(  JSR &2847
50DB  85 82              ..   STA &82
50DD  A5 50              .P   LDA &50
50DF  A2 00              ..   LDX #&00
50E1  20 4A 52            JR  JSR &524A
50E4  A5 52              .R   LDA &52
50E6  29 7F              )   AND #&7F
50E8  20 47 28            G(  JSR &2847
50EB  85 82              ..   STA &82
50ED  A5 52              .R   LDA &52
50EF  A2 03              ..   LDX #&03
50F1  20 4A 52            JR  JSR &524A
50F4  A5 54              .T   LDA &54
50F6  29 7F              )   AND #&7F
50F8  20 47 28            G(  JSR &2847
50FB  85 82              ..   STA &82
50FD  A5 54              .T   LDA &54
50FF  A2 06              ..   LDX #&06
5101  20 4A 52            JR  JSR &524A
5104  A5 61              .a   LDA &61
5106  18                 .    CLC
5107  65 62              eb   ADC &62
5109  10 02              ..   BPL &510D
510B  A9 00              ..   LDA #&00
.addr510D
510D  A0 0F              ..   LDY #&0F
510F  D1 1E              ..   CMP (&1E),Y
5111  90 02              ..   BCC &5115
5113  B1 1E              ..   LDA (&1E),Y
.addr5115
5115  85 61              .a   STA &61
5117  A9 00              ..   LDA #&00
5119  85 62              .b   STA &62
511B  A6 31              .1   LDX &31
511D  A5 46              .F   LDA &46
511F  49 FF              I.   EOR #&FF
5121  85 1B              ..   STA &1B
5123  A5 47              .G   LDA &47
5125  20 77 28            w(  JSR &2877
5128  85 1D              ..   STA &1D
512A  A5 33              .3   LDA &33
512C  45 48              EH   EOR &48
512E  A2 03              ..   LDX #&03
5130  20 08 53            .S  JSR &5308
5133  85 9E              ..   STA &9E
5135  A5 1C              ..   LDA &1C
5137  85 9C              ..   STA &9C
5139  49 FF              I.   EOR #&FF
513B  85 1B              ..   STA &1B
513D  A5 1D              ..   LDA &1D
513F  85 9D              ..   STA &9D
5141  A6 2B              .+   LDX &2B
5143  20 77 28            w(  JSR &2877
5146  85 1D              ..   STA &1D
5148  A5 9E              ..   LDA &9E
514A  45 7B              E{   EOR &7B
514C  A2 06              ..   LDX #&06
514E  20 08 53            .S  JSR &5308
5151  85 4E              .N   STA &4E
5153  A5 1C              ..   LDA &1C
5155  85 4C              .L   STA &4C
5157  49 FF              I.   EOR #&FF
5159  85 1B              ..   STA &1B
515B  A5 1D              ..   LDA &1D
515D  85 4D              .M   STA &4D
515F  20 79 28            y(  JSR &2879
5162  85 1D              ..   STA &1D
5164  A5 9E              ..   LDA &9E
5166  85 4B              .K   STA &4B
5168  45 7B              E{   EOR &7B
516A  45 4E              EN   EOR &4E
516C  10 0F              ..   BPL &517D
516E  A5 1C              ..   LDA &1C
5170  65 9C              e.   ADC &9C
5172  85 49              .I   STA &49
5174  A5 1D              ..   LDA &1D
5176  65 9D              e.   ADC &9D
5178  85 4A              .J   STA &4A
517A  4C 9D 51           L.Q  JMP &519D
.addr517D
517D  A5 9C              ..   LDA &9C
517F  E5 1C              ..   SBC &1C
5181  85 49              .I   STA &49
5183  A5 9D              ..   LDA &9D
5185  E5 1D              ..   SBC &1D
5187  85 4A              .J   STA &4A
5189  B0 12              ..   BCS &519D
518B  A9 01              ..   LDA #&01
518D  E5 49              .I   SBC &49
518F  85 49              .I   STA &49
5191  A9 00              ..   LDA #&00
5193  E5 4A              .J   SBC &4A
5195  85 4A              .J   STA &4A
5197  A5 4B              .K   LDA &4B
5199  49 80              I.   EOR #&80
519B  85 4B              .K   STA &4B
.addr519D
519D  A6 31              .1   LDX &31
519F  A5 49              .I   LDA &49
51A1  49 FF              I.   EOR #&FF
51A3  85 1B              ..   STA &1B
51A5  A5 4A              .J   LDA &4A
51A7  20 77 28            w(  JSR &2877
51AA  85 1D              ..   STA &1D
51AC  A5 32              .2   LDA &32
51AE  45 4B              EK   EOR &4B
51B0  A2 00              ..   LDX #&00
51B2  20 08 53            .S  JSR &5308
51B5  85 48              .H   STA &48
51B7  A5 1D              ..   LDA &1D
51B9  85 47              .G   STA &47
51BB  A5 1C              ..   LDA &1C
51BD  85 46              .F   STA &46
.addr51BF
51BF  A5 7D              .}   LDA &7D
51C1  85 82              ..   STA &82
51C3  A9 80              ..   LDA #&80
51C5  A2 06              ..   LDX #&06
51C7  20 4C 52            LR  JSR &524C
51CA  A5 8C              ..   LDA &8C
51CC  29 81              ).   AND #&81
51CE  C9 81              ..   CMP #&81
51D0  D0 01              ..   BNE &51D3
51D2  60                 `    RTS
.addr51D3
51D3  A0 09              ..   LDY #&09
51D5  20 A1 52            .R  JSR &52A1
51D8  A0 0F              ..   LDY #&0F
51DA  20 A1 52            .R  JSR &52A1
51DD  A0 15              ..   LDY #&15
51DF  20 A1 52            .R  JSR &52A1
51E2  A5 64              .d   LDA &64
51E4  29 80              ).   AND #&80
51E6  85 9A              ..   STA &9A
51E8  A5 64              .d   LDA &64
51EA  29 7F              )   AND #&7F
51EC  F0 1D              ..   BEQ &520B
51EE  C9 7F              .   CMP #&7F
51F0  E9 00              ..   SBC #&00
51F2  05 9A              ..   ORA &9A
51F4  85 64              .d   STA &64
51F6  A2 0F              ..   LDX #&0F
51F8  A0 09              ..   LDY #&09
51FA  20 A8 1D            ..  JSR &1DA8
51FD  A2 11              ..   LDX #&11
51FF  A0 0B              ..   LDY #&0B
5201  20 A8 1D            ..  JSR &1DA8
5204  A2 13              ..   LDX #&13
5206  A0 0D              ..   LDY #&0D
5208  20 A8 1D            ..  JSR &1DA8
.addr520B
520B  A5 63              .c   LDA &63
520D  29 80              ).   AND #&80
520F  85 9A              ..   STA &9A
5211  A5 63              .c   LDA &63
5213  29 7F              )   AND #&7F
5215  F0 1D              ..   BEQ &5234
5217  C9 7F              .   CMP #&7F
5219  E9 00              ..   SBC #&00
521B  05 9A              ..   ORA &9A
521D  85 63              .c   STA &63
521F  A2 0F              ..   LDX #&0F
5221  A0 15              ..   LDY #&15
5223  20 A8 1D            ..  JSR &1DA8
5226  A2 11              ..   LDX #&11
5228  A0 17              ..   LDY #&17
522A  20 A8 1D            ..  JSR &1DA8
522D  A2 13              ..   LDX #&13
522F  A0 19              ..   LDY #&19
5231  20 A8 1D            ..  JSR &1DA8
.addr5234
5234  A5 65              .e   LDA &65
5236  29 A0              ).   AND #&A0
5238  D0 09              ..   BNE &5243
523A  A5 65              .e   LDA &65
523C  09 10              ..   ORA #&10
523E  85 65              .e   STA &65
5240  4C 58 55           LXU  JMP &5558
.addr5243
5243  A5 65              .e   LDA &65
5245  29 EF              ).   AND #&EF
5247  85 65              .e   STA &65
5249  60                 `    RTS
.addr524A
524A  29 80              ).   AND #&80
.addr524C
524C  0A                 .    ASL A
524D  85 83              ..   STA &83
524F  A9 00              ..   LDA #&00
5251  6A                 j    ROR A
5252  85 D1              ..   STA &D1
5254  46 83              F.   LSR &83
5256  55 48              UH   EOR &48,X
5258  30 15              0.   BMI &526F
525A  A5 82              ..   LDA &82
525C  75 46              uF   ADC &46,X
525E  95 46              .F   STA &46,X
5260  A5 83              ..   LDA &83
5262  75 47              uG   ADC &47,X
5264  95 47              .G   STA &47,X
5266  B5 48              .H   LDA &48,X
5268  69 00              i.   ADC #&00
526A  05 D1              ..   ORA &D1
526C  95 48              .H   STA &48,X
526E  60                 `    RTS
.addr526F
526F  B5 46              .F   LDA &46,X
5271  38                 8    SEC
5272  E5 82              ..   SBC &82
5274  95 46              .F   STA &46,X
5276  B5 47              .G   LDA &47,X
5278  E5 83              ..   SBC &83
527A  95 47              .G   STA &47,X
527C  B5 48              .H   LDA &48,X
527E  29 7F              )   AND #&7F
5280  E9 00              ..   SBC #&00
5282  09 80              ..   ORA #&80
5284  45 D1              E.   EOR &D1
5286  95 48              .H   STA &48,X
5288  B0 16              ..   BCS &52A0
528A  A9 01              ..   LDA #&01
528C  F5 46              .F   SBC &46,X
528E  95 46              .F   STA &46,X
5290  A9 00              ..   LDA #&00
5292  F5 47              .G   SBC &47,X
5294  95 47              .G   STA &47,X
5296  A9 00              ..   LDA #&00
5298  F5 48              .H   SBC &48,X
529A  29 7F              )   AND #&7F
529C  05 D1              ..   ORA &D1
529E  95 48              .H   STA &48,X
.addr52A0
52A0  60                 `    RTS
.addr52A1
52A1  A5 8D              ..   LDA &8D
52A3  85 81              ..   STA &81
52A5  B6 48              .H   LDX &48,Y
52A7  86 82              ..   STX &82
52A9  B6 49              .I   LDX &49,Y
52AB  86 83              ..   STX &83
52AD  B6 46              .F   LDX &46,Y
52AF  86 1B              ..   STX &1B
52B1  B9 47 00           .G.  LDA &0047,Y
52B4  49 80              I.   EOR #&80
52B6  20 FC 28            .(  JSR &28FC
52B9  99 49 00           .I.  STA &0049,Y
52BC  96 48              .H   STX &48,Y
52BE  86 1B              ..   STX &1B
52C0  B6 46              .F   LDX &46,Y
52C2  86 82              ..   STX &82
52C4  B6 47              .G   LDX &47,Y
52C6  86 83              ..   STX &83
52C8  B9 49 00           .I.  LDA &0049,Y
52CB  20 FC 28            .(  JSR &28FC
52CE  99 47 00           .G.  STA &0047,Y
52D1  96 46              .F   STX &46,Y
52D3  86 1B              ..   STX &1B
52D5  A5 2A              .*   LDA &2A
52D7  85 81              ..   STA &81
52D9  B6 48              .H   LDX &48,Y
52DB  86 82              ..   STX &82
52DD  B6 49              .I   LDX &49,Y
52DF  86 83              ..   STX &83
52E1  B6 4A              .J   LDX &4A,Y
52E3  86 1B              ..   STX &1B
52E5  B9 4B 00           .K.  LDA &004B,Y
52E8  49 80              I.   EOR #&80
52EA  20 FC 28            .(  JSR &28FC
52ED  99 49 00           .I.  STA &0049,Y
52F0  96 48              .H   STX &48,Y
52F2  86 1B              ..   STX &1B
52F4  B6 4A              .J   LDX &4A,Y
52F6  86 82              ..   STX &82
52F8  B6 4B              .K   LDX &4B,Y
52FA  86 83              ..   STX &83
52FC  B9 49 00           .I.  LDA &0049,Y
52FF  20 FC 28            .(  JSR &28FC
5302  99 4B 00           .K.  STA &004B,Y
5305  96 4A              .J   STX &4A,Y
5307  60                 `    RTS
.addr5308
5308  A8                 .    TAY
5309  55 48              UH   EOR &48,X
530B  30 0F              0.   BMI &531C
530D  A5 1C              ..   LDA &1C
530F  18                 .    CLC
5310  75 46              uF   ADC &46,X
5312  85 1C              ..   STA &1C
5314  A5 1D              ..   LDA &1D
5316  75 47              uG   ADC &47,X
5318  85 1D              ..   STA &1D
531A  98                 .    TYA
531B  60                 `    RTS
.addr531C
531C  B5 46              .F   LDA &46,X
531E  38                 8    SEC
531F  E5 1C              ..   SBC &1C
5321  85 1C              ..   STA &1C
5323  B5 47              .G   LDA &47,X
5325  E5 1D              ..   SBC &1D
5327  85 1D              ..   STA &1D
5329  90 04              ..   BCC &532F
532B  98                 .    TYA
532C  49 80              I.   EOR #&80
532E  60                 `    RTS
.addr532F
532F  A9 01              ..   LDA #&01
5331  E5 1C              ..   SBC &1C
5333  85 1C              ..   STA &1C
5335  A9 00              ..   LDA #&00
5337  E5 1D              ..   SBC &1D
5339  85 1D              ..   STA &1D
533B  98                 .    TYA
533C  60                 `    RTS
.addr533D
533D  A5 8D              ..   LDA &8D
533F  49 80              I.   EOR #&80
5341  85 81              ..   STA &81
5343  A5 46              .F   LDA &46
5345  85 1B              ..   STA &1B
5347  A5 47              .G   LDA &47
5349  85 1C              ..   STA &1C
534B  A5 48              .H   LDA &48
534D  20 82 27            .'  JSR &2782
5350  A2 03              ..   LDX #&03
5352  20 4C 1D            L.  JSR &1D4C
5355  A5 41              .A   LDA &41
5357  85 9C              ..   STA &9C
5359  85 1B              ..   STA &1B
535B  A5 42              .B   LDA &42
535D  85 9D              ..   STA &9D
535F  85 1C              ..   STA &1C
5361  A5 2A              .*   LDA &2A
5363  85 81              ..   STA &81
5365  A5 43              .C   LDA &43
5367  85 9E              ..   STA &9E
5369  20 82 27            .'  JSR &2782
536C  A2 06              ..   LDX #&06
536E  20 4C 1D            L.  JSR &1D4C
5371  A5 41              .A   LDA &41
5373  85 1B              ..   STA &1B
5375  85 4C              .L   STA &4C
5377  A5 42              .B   LDA &42
5379  85 1C              ..   STA &1C
537B  85 4D              .M   STA &4D
537D  A5 43              .C   LDA &43
537F  85 4E              .N   STA &4E
5381  49 80              I.   EOR #&80
5383  20 82 27            .'  JSR &2782
5386  A5 43              .C   LDA &43
5388  29 80              ).   AND #&80
538A  85 D1              ..   STA &D1
538C  45 9E              E.   EOR &9E
538E  30 18              0.   BMI &53A8
5390  A5 40              .@   LDA &40
5392  18                 .    CLC
5393  65 9B              e.   ADC &9B
5395  A5 41              .A   LDA &41
5397  65 9C              e.   ADC &9C
5399  85 49              .I   STA &49
539B  A5 42              .B   LDA &42
539D  65 9D              e.   ADC &9D
539F  85 4A              .J   STA &4A
53A1  A5 43              .C   LDA &43
53A3  65 9E              e.   ADC &9E
53A5  4C DB 53           L.S  JMP &53DB
.addr53A8
53A8  A5 40              .@   LDA &40
53AA  38                 8    SEC
53AB  E5 9B              ..   SBC &9B
53AD  A5 41              .A   LDA &41
53AF  E5 9C              ..   SBC &9C
53B1  85 49              .I   STA &49
53B3  A5 42              .B   LDA &42
53B5  E5 9D              ..   SBC &9D
53B7  85 4A              .J   STA &4A
53B9  A5 9E              ..   LDA &9E
53BB  29 7F              )   AND #&7F
53BD  85 1B              ..   STA &1B
53BF  A5 43              .C   LDA &43
53C1  29 7F              )   AND #&7F
53C3  E5 1B              ..   SBC &1B
53C5  85 1B              ..   STA &1B
53C7  B0 12              ..   BCS &53DB
53C9  A9 01              ..   LDA #&01
53CB  E5 49              .I   SBC &49
53CD  85 49              .I   STA &49
53CF  A9 00              ..   LDA #&00
53D1  E5 4A              .J   SBC &4A
53D3  85 4A              .J   STA &4A
53D5  A9 00              ..   LDA #&00
53D7  E5 1B              ..   SBC &1B
53D9  09 80              ..   ORA #&80
.addr53DB
53DB  45 D1              E.   EOR &D1
53DD  85 4B              .K   STA &4B
53DF  A5 8D              ..   LDA &8D
53E1  85 81              ..   STA &81
53E3  A5 49              .I   LDA &49
53E5  85 1B              ..   STA &1B
53E7  A5 4A              .J   LDA &4A
53E9  85 1C              ..   STA &1C
53EB  A5 4B              .K   LDA &4B
53ED  20 82 27            .'  JSR &2782
53F0  A2 00              ..   LDX #&00
53F2  20 4C 1D            L.  JSR &1D4C
53F5  A5 41              .A   LDA &41
53F7  85 46              .F   STA &46
53F9  A5 42              .B   LDA &42
53FB  85 47              .G   STA &47
53FD  A5 43              .C   LDA &43
53FF  85 48              .H   STA &48
5401  4C BF 51           L.Q  JMP &51BF
.addr5404
5404  CA                 .    DEX
5405  D0 31              .1   BNE &5438
5407  A5 48              .H   LDA &48
5409  49 80              I.   EOR #&80
540B  85 48              .H   STA &48
540D  A5 4E              .N   LDA &4E
540F  49 80              I.   EOR #&80
5411  85 4E              .N   STA &4E
5413  A5 50              .P   LDA &50
5415  49 80              I.   EOR #&80
5417  85 50              .P   STA &50
5419  A5 54              .T   LDA &54
541B  49 80              I.   EOR #&80
541D  85 54              .T   STA &54
541F  A5 56              .V   LDA &56
5421  49 80              I.   EOR #&80
5423  85 56              .V   STA &56
5425  A5 5A              .Z   LDA &5A
5427  49 80              I.   EOR #&80
5429  85 5A              .Z   STA &5A
542B  A5 5C              .\   LDA &5C
542D  49 80              I.   EOR #&80
542F  85 5C              .\   STA &5C
5431  A5 60              .`   LDA &60
5433  49 80              I.   EOR #&80
5435  85 60              .`   STA &60
5437  60                 `    RTS
.addr5438
5438  A9 00              ..   LDA #&00
543A  E0 02              ..   CPX #&02
543C  6A                 j    ROR A
543D  85 9A              ..   STA &9A
543F  49 80              I.   EOR #&80
5441  85 99              ..   STA &99
5443  A5 46              .F   LDA &46
5445  A6 4C              .L   LDX &4C
5447  85 4C              .L   STA &4C
5449  86 46              .F   STX &46
544B  A5 47              .G   LDA &47
544D  A6 4D              .M   LDX &4D
544F  85 4D              .M   STA &4D
5451  86 47              .G   STX &47
5453  A5 48              .H   LDA &48
5455  45 99              E.   EOR &99
5457  AA                 .    TAX
5458  A5 4E              .N   LDA &4E
545A  45 9A              E.   EOR &9A
545C  85 48              .H   STA &48
545E  86 4E              .N   STX &4E
5460  A0 09              ..   LDY #&09
5462  20 6C 54            lT  JSR &546C
5465  A0 0F              ..   LDY #&0F
5467  20 6C 54            lT  JSR &546C
546A  A0 15              ..   LDY #&15
.addr546C
546C  B9 46 00           .F.  LDA &0046,Y
546F  B6 4A              .J   LDX &4A,Y
5471  99 4A 00           .J.  STA &004A,Y
5474  96 46              .F   STX &46,Y
5476  B9 47 00           .G.  LDA &0047,Y
5479  45 99              E.   EOR &99
547B  AA                 .    TAX
547C  B9 4B 00           .K.  LDA &004B,Y
547F  45 9A              E.   EOR &9A
5481  99 47 00           .G.  STA &0047,Y
5484  96 4B              .K   STX &4B,Y
.addr5486
5486  60                 `    RTS
.addr5487
5487  8E 45 03           .E.  STX &0345
548A  20 C8 54            .T  JSR &54C8
548D  20 AA 54            .T  JSR &54AA
5490  4C B1 35           L.5  JMP &35B1
.addr5493
5493  A9 00              ..   LDA #&00
5495  A4 87              ..   LDY &87
5497  D0 EE              ..   BNE &5487
5499  EC 45 03           .E.  CPX &0345
549C  F0 E8              ..   BEQ &5486
549E  8E 45 03           .E.  STX &0345
54A1  20 C8 54            .T  JSR &54C8
54A4  20 05 1A            ..  JSR &1A05
54A7  20 D8 35            .5  JSR &35D8
.addr54AA
54AA  AC 45 03           .E.  LDY &0345
54AD  B9 68 03           .h.  LDA &0368,Y
54B0  F0 D4              ..   BEQ &5486
54B2  A9 80              ..   LDA #&80
54B4  85 73              .s   STA &73
54B6  A9 48              .H   LDA #&48
54B8  85 74              .t   STA &74
54BA  A9 14              ..   LDA #&14
54BC  85 75              .u   STA &75
54BE  20 36 2D            6-  JSR &2D36
54C1  A9 0A              ..   LDA #&0A
54C3  85 75              .u   STA &75
54C5  4C 36 2D           L6-  JMP &2D36
.addr54C8
54C8  85 87              ..   STA &87
.addr54CA
54CA  A9 80              ..   LDA #&80
54CC  85 72              .r   STA &72
54CE  20 0A 36            .6  JSR &360A
54D1  8D 43 03           .C.  STA &0343
54D4  8D 4A 03           .J.  STA &034A
54D7  8D 4B 03           .K.  STA &034B
54DA  A2 60              .`   LDX #&60
.addr54DC
54DC  20 A1 42            .B  JSR &42A1
54DF  E8                 .    INX
54E0  E0 78              .x   CPX #&78
54E2  D0 F8              ..   BNE &54DC
54E4  A6 2F              ./   LDX &2F
54E6  F0 03              ..   BEQ &54EB
54E8  20 AC 30            .0  JSR &30AC
.addr54EB
54EB  A0 01              ..   LDY #&01
54ED  84 2D              .-   STY &2D
54EF  A5 87              ..   LDA &87
54F1  D0 14              ..   BNE &5507
54F3  A0 0B              ..   LDY #&0B
54F5  84 2C              .,   STY &2C
54F7  AD 45 03           .E.  LDA &0345
54FA  09 60              .`   ORA #&60
54FC  20 9A 33            .3  JSR &339A
54FF  20 42 31            B1  JSR &3142
5502  A9 AF              ..   LDA #&AF
5504  20 9A 33            .3  JSR &339A
.addr5507
5507  A2 00              ..   LDX #&00
5509  86 34              .4   STX &34
550B  86 35              .5   STX &35
550D  86 72              .r   STX &72
550F  CA                 .    DEX
5510  86 36              .6   STX &36
5512  20 68 18            h.  JSR &1868
5515  A9 02              ..   LDA #&02
5517  85 34              .4   STA &34
5519  85 36              .6   STA &36
551B  20 1E 55            .U  JSR &551E
.addr551E
551E  20 21 55            !U  JSR &5521
.addr5521
5521  A9 00              ..   LDA #&00
5523  85 35              .5   STA &35
5525  A9 BF              ..   LDA #&BF
5527  85 37              .7   STA &37
5529  C6 34              .4   DEC &34
552B  C6 36              .6   DEC &36
552D  4C C4 16           L..  JMP &16C4
.addr5530
5530  20 F7 55            .U  JSR &55F7
5533  88                 .    DEY
5534  D0 FA              ..   BNE &5530
5536  60                 `    RTS
.addr5537
5537  A9 14              ..   LDA #&14
5539  85 2D              .-   STA &2D
553B  A9 75              .u   LDA #&75
553D  85 08              ..   STA &08
553F  A9 07              ..   LDA #&07
5541  85 07              ..   STA &07
5543  20 60 2B            `+  JSR &2B60
5546  A9 00              ..   LDA #&00
5548  20 50 55            PU  JSR &5550
554B  E6 08              ..   INC &08
554D  C8                 .    INY
554E  84 2C              .,   STY &2C
.addr5550
5550  A0 E9              ..   LDY #&E9
.addr5552
5552  91 07              ..   STA (&07),Y
5554  88                 .    DEY
5555  D0 FB              ..   BNE &5552
.addr5557
5557  60                 `    RTS
.addr5558
5558  A5 65              .e   LDA &65
555A  29 10              ).   AND #&10
555C  F0 F9              ..   BEQ &5557
555E  A5 8C              ..   LDA &8C
5560  30 F5              0.   BMI &5557
5562  A2 FF              ..   LDX #&FF
5564  C9 01              ..   CMP #&01
5566  D0 02              ..   BNE &556A
5568  A2 F0              ..   LDX #&F0
.addr556A
556A  86 91              ..   STX &91
556C  A5 47              .G   LDA &47
556E  05 4A              .J   ORA &4A
5570  05 4D              .M   ORA &4D
5572  29 C0              ).   AND #&C0
5574  D0 E1              ..   BNE &5557
5576  A5 47              .G   LDA &47
5578  18                 .    CLC
5579  A6 48              .H   LDX &48
557B  10 04              ..   BPL &5581
557D  49 FF              I.   EOR #&FF
557F  69 01              i.   ADC #&01
.addr5581
5581  69 7B              i{   ADC #&7B
5583  85 34              .4   STA &34
5585  A5 4D              .M   LDA &4D
5587  4A                 J    LSR A
5588  4A                 J    LSR A
5589  18                 .    CLC
558A  A6 4E              .N   LDX &4E
558C  10 03              ..   BPL &5591
558E  49 FF              I.   EOR #&FF
5590  38                 8    SEC
.addr5591
5591  69 23              i#   ADC #&23
5593  49 FF              I.   EOR #&FF
5595  85 07              ..   STA &07
5597  A5 4A              .J   LDA &4A
5599  4A                 J    LSR A
559A  18                 .    CLC
559B  A6 4B              .K   LDX &4B
559D  30 03              0.   BMI &55A2
559F  49 FF              I.   EOR #&FF
55A1  38                 8    SEC
.addr55A2
55A2  65 07              e.   ADC &07
55A4  10 0A              ..   BPL &55B0
55A6  C9 C2              ..   CMP #&C2
55A8  B0 02              ..   BCS &55AC
55AA  A9 C2              ..   LDA #&C2
.addr55AC
55AC  C9 F7              ..   CMP #&F7
55AE  90 02              ..   BCC &55B2
.addr55B0
55B0  A9 F6              ..   LDA #&F6
.addr55B2
55B2  85 35              .5   STA &35
55B4  38                 8    SEC
55B5  E5 07              ..   SBC &07
55B7  08                 .    PHP
55B8  48                 H    PHA
55B9  20 A7 36            .6  JSR &36A7
55BC  BD C0 16           ...  LDA &16C0,X
55BF  25 91              %.   AND &91
55C1  85 34              .4   STA &34
55C3  68                 h    PLA
55C4  28                 (    PLP
55C5  AA                 .    TAX
55C6  F0 12              ..   BEQ &55DA
55C8  90 11              ..   BCC &55DB
.addr55CA
55CA  88                 .    DEY
55CB  10 04              ..   BPL &55D1
55CD  A0 07              ..   LDY #&07
55CF  C6 08              ..   DEC &08
.addr55D1
55D1  A5 34              .4   LDA &34
55D3  51 07              Q.   EOR (&07),Y
55D5  91 07              ..   STA (&07),Y
55D7  CA                 .    DEX
55D8  D0 F0              ..   BNE &55CA
.addr55DA
55DA  60                 `    RTS
.addr55DB
55DB  C8                 .    INY
55DC  C0 08              ..   CPY #&08
55DE  D0 04              ..   BNE &55E4
55E0  A0 00              ..   LDY #&00
55E2  E6 08              ..   INC &08
.addr55E4
55E4  C8                 .    INY
55E5  C0 08              ..   CPY #&08
55E7  D0 04              ..   BNE &55ED
55E9  A0 00              ..   LDY #&00
55EB  E6 08              ..   INC &08
.addr55ED
55ED  A5 34              .4   LDA &34
55EF  51 07              Q.   EOR (&07),Y
55F1  91 07              ..   STA (&07),Y
55F3  E8                 .    INX
55F4  D0 EE              ..   BNE &55E4
55F6  60                 `    RTS
.addr55F7
55F7  A9 00              ..   LDA #&00
55F9  85 8B              ..   STA &8B
.addr55FB
55FB  A5 8B              ..   LDA &8B
55FD  F0 FC              ..   BEQ &55FB
55FF  60                 `    RTS
