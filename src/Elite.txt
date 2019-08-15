0REM       ... E L I T E ...
10 
20REM      ...BBC Version 1...
30 
40REM       Acornsoft Limited
50 
60REM       Copyright(C) 1984
70 
80IF INKEY-256<>0 AND INKEY-256<>-1 THEN VDU26,12:PRINT"This program is only suitable for a BBC Microcomputer":END
90IF INKEY-256 A%=&EA:X%=0:Y%=&FF:IF USR(&FFF4) AND&FF00 THEN VDU26,12:PRINT"Please turn your TUBE off, and start    again":END
100*RUN Elite2
