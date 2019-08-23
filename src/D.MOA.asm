; -----------------------------------------------------------------------------
; Elite - Ship data
; written by David Braben and Ian Bell (c) Acornsoft 1984
; Filename       : D.MOA
; Load address   : 00005600
; Exec address   : 00005600
; Length         : 00000A00
; -----------------------------------------------------------------------------

ship_none    = &0000
ship_missile = &7F00

ORG &5600

.start

.ship_pointers
	EQUW ship_missile               ; Ship type 01: Missile
	EQUW ship_coriolis              ; Ship type 02: Space station
	EQUW ship_escape_pod            ; Ship type 03: Esacape pod
	EQUW ship_alloy                 ; Ship type 04: Plate/Alloy
	EQUW ship_barrel                ; Ship type 05: Barrel
	EQUW ship_none                  ; Ship type 06: Boulder
	EQUW ship_none                  ; Ship type 07: Asteroid
	EQUW ship_none                  ; Ship type 08: Splinter
	EQUW ship_none                  ; Ship type 09: Shuttle
	EQUW ship_none                  ; Ship type 10: Transporter
	EQUW ship_none                  ; Ship type 11: Cobra MkIII
	EQUW ship_python                ; Ship type 12: Python
	EQUW ship_none                  ; Ship type 13: Boa
	EQUW ship_none                  ; Ship type 14: Anaconda
	EQUW ship_none                  ; Ship type 15: 
	EQUW ship_viper                 ; Ship type 16: Viper
	EQUW ship_sidewinder            ; Ship type 17: Sidewinder
	EQUW ship_mamba                 ; Ship type 18: Mamba
	EQUW ship_krait                 ; Ship type 19: Krait
	EQUW ship_none                  ; Ship type 20: Adder
	EQUW ship_none                  ; Ship type 21: Gecko
	EQUW ship_none                  ; Ship type 22: Cobra MkI
	EQUW ship_none                  ; Ship type 23: Worm
	EQUW ship_cobra_mk3_pirate      ; Ship type 24: Cobra MkIII (pirate)
	EQUW ship_none                  ; Ship type 25: Asp MkII
	EQUW ship_none                  ; Ship type 26: Python (pirate)
	EQUW ship_fer_de_lance          ; Ship type 27: Fer de Lance
	EQUW ship_none                  ; Ship type 28: Moray
	EQUW ship_none                  ; Ship type 29: Thargoid
	EQUW ship_none                  ; Ship type 30: Thargon
	EQUW ship_none                  ; Ship type 31: Constrictor

.ship_attributes                    ; Ship attributes:
                                        ; x....... bit 7: Escape pod present
                                        ; .x...... bit 6: Galcop police ship
                                        ; ..x.....: Ship is protected by spacestation
                                        ; ...x....: Ship is docking
                                        ; ....x...: Ship is a pirate
                                        ; .....x..: Ship is attacking you
                                        ; ......x.: Ship is a bounty hunter
                                        ; .......x: Ship is a trader
	EQUB %????????                  ; Ship type 01: Missile
	EQUB %00000000                  ; Ship type 02: Space station
	EQUB %00000001                  ; Ship type 03: Escape pod
	EQUB %00000000                  ; Ship type 04: Plate/alloy
	EQUB %00000000                  ; Ship type 05: Barrel
	EQUB %00000000                  ; Ship type 06: Boulder
	EQUB %00000000                  ; Ship type 07: Asteroid
	EQUB %00000000                  ; Ship type 08: Splinter
	EQUB %00000000                  ; Ship type 09: Shuttle
	EQUB %00000000                  ; Ship type 10: Transporter
	EQUB %00000000                  ; Ship type 11: Cobra MkIII
	EQUB %10100000                  ; Ship type 12: Python
	EQUB %00000000                  ; Ship type 13: Boa
	EQUB %00000000                  ; Ship type 14: Anaconda
	EQUB %00000000                  ; Ship type 15: 
	EQUB %11000010                  ; Ship type 16: Viper
	EQUB %00001100                  ; Ship type 17: Sidewinder
	EQUB %10001100                  ; Ship type 18: Mamba
	EQUB %10001100                  ; Ship type 19: Krait
	EQUB %00000000                  ; Ship type 20: Adder
	EQUB %00000000                  ; Ship type 21: Gecko
	EQUB %00000000                  ; Ship type 22: Cobra MkI
	EQUB %00000000                  ; Ship type 23: Worm
	EQUB %10001100                  ; Ship type 24: Cobra MkIII (pirate)
	EQUB %00000000                  ; Ship type 25: Asp MkII
	EQUB %00000000                  ; Ship type 26: Python (pirate)
	EQUB %10000010                  ; Ship type 27: Fer de Lance
	EQUB %00000000                  ; Ship type 28: Moray
	EQUB %00000000                  ; Ship type 29: Thargoid
	EQUB %00000000                  ; Ship type 30: Thargon
	EQUB %00000000                  ; Ship type 31: Constrictor

.ship_coriolis
INCLUDE "src/ships/coriolis.asm"

.ship_escape_pod
INCLUDE "src/ships/escape_pod.asm"

.ship_alloy
INCLUDE "src/ships/alloy.asm"

.ship_barrel
INCLUDE "src/ships/barrel.asm"

.ship_python
INCLUDE "src/ships/python.asm"

.ship_viper
INCLUDE "src/ships/viper.asm"

.ship_sidewinder
INCLUDE "src/ships/sidewinder.asm"

.ship_mamba
INCLUDE "src/ships/mamba.asm"

.ship_krait
INCLUDE "src/ships/krait.asm"

.ship_cobra_mk3_pirate
INCLUDE "src/ships/cobra_mk3.asm"
ORG ship_cobra_mk3_pirate
	EQUB &01
ORG ship_cobra_mk3_pirate+&0A
	EQUB &AF
ORG ship_cobra_mk3_pirate+&13
	EQUB &12

	FOR n, *, (&6000 - P%)
		EQUB &00
	NEXT

.end

SAVE "bin/D.MOA", start, end, start, start
