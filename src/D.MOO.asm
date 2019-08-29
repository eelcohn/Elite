; -----------------------------------------------------------------------------
; Elite - Ship data
; written by David Braben and Ian Bell (c) Acornsoft 1984
; Filename       : D.MOO
; Load address   : 00005600
; Exec address   : 00005600
; Length         : 00000A00
; -----------------------------------------------------------------------------

none_start     = &0000
none_attr      = %00000000              ; 7.......: Escape pod present
                                        ; .6......: Galcop police ship
                                        ; ..5.....: Ship is protected by spacestation
                                        ; ...4....: Ship is docking
                                        ; ....3...: Ship is a pirate
                                        ; .....2..: Ship is attacking you
                                        ; ......1.: Ship is a bounty hunter
                                        ; .......0: Ship is a trader
missile_start  = &7F00
missile_attr   = %00000000



ORG &5600

.start

.ship_pointers
	EQUW missile_start              ; Ship type 01: Missile
	EQUW coriolis_start             ; Ship type 02: Space station
	EQUW escape_pod_start           ; Ship type 03: Escape pod
	EQUW alloy_start                ; Ship type 04: Plate/Alloy
	EQUW barrel_start               ; Ship type 05: Barrel
	EQUW none_start                 ; Ship type 06: Boulder
	EQUW asteroid_start             ; Ship type 07: Asteroid
	EQUW splinter_start             ; Ship type 08: Splinter
	EQUW none_start                 ; Ship type 09: Shuttle
	EQUW none_start                 ; Ship type 0A: Transporter
	EQUW cobra_mk3_start            ; Ship type 0B: Cobra MkIII
	EQUW none_start                 ; Ship type 0C: Python
	EQUW none_start                 ; Ship type 0D: Boa
	EQUW none_start                 ; Ship type 0E: Anaconda
	EQUW none_start                 ; Ship type 0F: Ship &0F unknown
	EQUW viper_start                ; Ship type 10: Viper
	EQUW none_start                 ; Ship type 11: Sidewinder
	EQUW mamba_start                ; Ship type 12: Mamba
	EQUW krait_start                ; Ship type 13: Krait
	EQUW none_start                 ; Ship type 14: Adder
	EQUW none_start                 ; Ship type 15: Gecko
	EQUW cobra_mk1_start            ; Ship type 16: Cobra MkI
	EQUW none_start                 ; Ship type 17: Worm
	EQUW none_start                 ; Ship type 18: Cobra MkIII (pirate)
	EQUW none_start                 ; Ship type 19: Asp Mk2
	EQUW python_pirate_start        ; Ship type 1A: Python (pirate)
	EQUW none_start                 ; Ship type 1B: Fer de Lance
	EQUW none_start                 ; Ship type 1C: Moray
	EQUW none_start                 ; Ship type 1D: Thargoid
	EQUW none_start                 ; Ship type 1E: Thargon
	EQUW none_start                 ; Ship type 1F: Constrictor

.ship_attr                              ; Ship attributes:
	EQUB missile_attr               ; Ship type 1: Missile
	EQUB coriolis_attr              ; Ship type 2: Space station
	EQUB escape_pod_attr            ; Ship type 3: Escape pod
	EQUB alloy_attr                 ; Ship type 4: Plate/Alloy
	EQUB barrel_attr                ; Ship type 5: Barrel
	EQUB none_attr                  ; Ship type 6: Boulder
	EQUB asteroid_attr              ; Ship type 7: Asteroid
	EQUB splinter_attr              ; Ship type 8: Splinter
	EQUB none_attr                  ; Ship type 9: Shuttle
	EQUB none_attr                  ; Ship type 10: Transporter
	EQUB cobra_mk3_attr             ; Ship type 11: Cobra MkIII
	EQUB none_attr                  ; Ship type 12: Python
	EQUB none_attr                  ; Ship type 13: Boa
	EQUB none_attr                  ; Ship type 14: Anaconda
	EQUB none_attr                  ; Ship type 15: Ship &0F unknown
	EQUB viper_attr                 ; Ship type 16: Viper
	EQUB none_attr                  ; Ship type 17: Sidewinder
	EQUB mamba_attr                 ; Ship type 18: Mamba
	EQUB krait_attr                 ; Ship type 19: Krait
	EQUB none_attr                  ; Ship type 20: Adder
	EQUB none_attr                  ; Ship type 21: Gecko
	EQUB cobra_mk1_attr             ; Ship type 22: Cobra MkI
	EQUB none_attr                  ; Ship type 23: Worm
	EQUB none_attr                  ; Ship type 24: Cobra MkIII (pirate)
	EQUB none_attr                  ; Ship type 25: Asp Mk2
	EQUB python_pirate_attr         ; Ship type 26: Python (pirate)
	EQUB none_attr                  ; Ship type 27: Fer de Lance
	EQUB none_attr                  ; Ship type 28: Moray
	EQUB none_attr                  ; Ship type 29: Thargoid
	EQUB none_attr                  ; Ship type 30: Thargon
	EQUB none_attr                  ; Ship type 31: Constrictor

.ship_spacestation
	INCLUDE "src/ships/coriolis.asm"

.ship_escape_pod
	INCLUDE "src/ships/escape_pod.asm"

.ship_alloy
	INCLUDE "src/ships/alloy.asm"

.ship_barrel
	INCLUDE "src/ships/barrel.asm"

.ship_asteroid
	INCLUDE "src/ships/asteroid.asm"

.ship_splinter
	INCLUDE "src/ships/splinter.asm"

.ship_cobra_mk3
	INCLUDE "src/ships/cobra_mk3.asm"

.ship_viper
	INCLUDE "src/ships/viper.asm"

.ship_mamba
	INCLUDE "src/ships/mamba.asm"

.ship_krait
	INCLUDE "src/ships/krait.asm"

.ship_cobra_mk1       
	INCLUDE "src/ships/cobra_mk1.asm"

.ship_python_pirate
	INCLUDE "src/ships/python_pirate.asm"

	FOR n, *, (&6000 - P%)
		EQUB &00
	NEXT

.end

SAVE "bin/D.MOO", start, end, start, start
