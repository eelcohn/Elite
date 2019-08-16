; -----------------------------------------------------------------------------
; Elite - Flight code
; written by David Braben and Ian Bell (c) Acornsoft 1984
; Filename       : D.Code
; Load address   : 000011E3
; Exec address   : 000011E3
; Length         : 0000441D
; -----------------------------------------------------------------------------

rand0                    = &00                    ; Random number storage
rand1                    = &01                    ; Random number storage
rand2                    = &02                    ; Random number storage
rand3                    = &03                    ; Random number storage
screen_lo                = &07                    ; Pointer to screen memory LSB
screen_hi                = &08                    ; Pointer to screen memory MSB
hull_pointer_lo          = &1E                    ; Pointer to object's hull data LSB
hull_pointer_hi          = &1F                    ; Pointer to object's hull data MSB
inf_pointer_lo           = &20
inf_pointer_hi           = &21
vertices_ptr_lo          = &22                    ; Pointer to start of object's hull vertices LSB 
vertices_ptr_hi          = &23                    ; Pointer to start of object's hull vertices MSB 
sunx                     = &28                    ; SUNX
sunx1                    = &29                    ; SUNX+1
beta                     = &2A                    ; BETA = pitch
beta1                    = &2B                    ; BET1 = pitch sign/magnitude lower 7 bits
text_cursor_x            = &2C                    ; Text cursor X position
text_cursor_y            = &2D                    ; Text cursor Y position
hyperspace_countdown_lo  = &2E                    ; Hyperspace countdown
hyperspace_countdown_hi  = &2F                    ; Hyperspace countdown
ecm_on                   = &30                    ; Is someone's ECM on? (0 = ECM off)
x                        = &34                    ; xmag / x1_lo
y                        = &35                    ; xsign / x1_hi
x2                       = &36                    ; ymag / y1_lo
y2                       = &37                    ; ysign / y1_hi 
zmag                     = &38                    ; zmag / x2_lo
zsign                    = &39                    ; zsign / x2_hi
xnormal                  = &3A                    ; xnormal lo / y2_lo
xnormal_sign             = &3B                    ; xsign / y2_hi
ynormal                  = &3C                    ; ynormal lo / delta_x lo
ynormal_sign             = &3D                    ; xsign / delta_x hi
znormal                  = &3E                    ; znormal lo / delta_y lo
znormal_sign             = &3F                    ; xsign / delta_y hi
laser_power              = &44                    ; Laser power per pulse
missile_target           = &45                    ; Missile target (&00-&12 = slot number of ship, &FF = no target)
inwk_xlo                 = &46                    ; INWK xlo
inwk_xhi                 = &47                    ; INWK xhi
inwk_xsg                 = &48                    ; INWK xsign xship_sign
inwk_ylo                 = &49                    ; INWK ylo
inwk_yhi                 = &4A                    ; INWK yhi
inwk_ysg                 = &4B                    ; INWK ysign
inwk_zlo                 = &4C                    ; INWK zlo zship_lo
inwk_zhi                 = &4D                    ; INWK zhi
inwk_zsg                 = &4E                    ; INWK zsign
rotmat0x_hi              = &50                    ; INWK rotmat0x hi
rotmat0y_hi              = &52                    ; INWK rotmat0y hi
rotmat0z_hi              = &54                    ; INWK rotmat0z hi
rotmat1x_hi              = &56                    ; INWK rotmat1x hi
rotmat1y_hi              = &58                    ; INWK rotmat1y hi
rotmat1z_hi              = &5A                    ; INWK rotmat1z hi
rotmat2x_hi              = &5C                    ; INWK rotmat2x hi
rotmat2y_hi              = &5E                    ; INWK rotmat2y hi
rotmat2z_hi              = &60                    ; INWK rotmat2z hi
inwk_speed               = &61                    ; INWK Object's speed
inkw_acceleration        = &62                    ; INKW Object's acceleration
inwk_rotation_x          = &63                    ; INWK Object's rotation x: roll
inwk_rotation_z          = &64                    ; INWK Object's rotation z: pitch
inwk_state               = &65                    ; INWK Object's state: bit5=exploding, bit7=kill with debris, bit4=show on scanner
inwk_ai_attack_univ_ecm  = &66                    ; INWK ai_attack_univ_ecm: bit 7=1: ai_active
inwk_line_pointer_lo     = &67                    ; INWK 
inwk_line_pointer_hi     = &68                    ; INWK 
inwk_energy              = &69                    ; INWK Object's energy
w0_h                     = &6C                    ; system seeds w0_l
w0_h                     = &6D                    ; system seeds w0_h Economy
w1_l                     = &6E                    ; system seeds w1_l
w1_h                     = &6F                    ; system seeds w1_h Radius lo / x-coord of star
w2_l                     = &70                    ; system seeds w2_l Star size
w2_h                     = &71                    ; system seeds w2_h
my_speed                 = &7D                    ; Player's speed (1=lowest, &28(40)=max for Cobra MkIII)
edgecounter              = &86                    ; edge counter
shiptype                 = &8D                    ; Ship type (&80=planet_2ring/&82=planet_crater, &81=sun, &E0=autodocking
visibility               = &96                    ; visibility
                         = &97                    ; number of edges
                         = &A9                    ; 
xsublo                   = &D3                    ; xsublo
xsubhi                   = &D4                    ; xsubhi
ysublo                   = &D6                    ; ysublo
ysubhi                   = &D7                    ; ysubhi
zsublo                   = &D9                    ; zsublo
zsubhi                   = &DA                    ; zsubhi

key_
key_question             = &0301                  ; ? key flag (Speed down)
key_spacebar             = &0302                  ; SPACE key flag (Speed up)
key_rotleft              = &0303                  ; < key flag
key_rotright             = &0304                  ; > key flag
key_x                    = &0305                  ; X key (Climb)
key_s                    = &0306                  ; S key (Dive)
key_a                    = &0307                  ; A key flag (Fire laser)
key_tab                  = &0308                  ; TAB key flag (Activate energy bomb)
key_escape               = &0309                  ; ESCAPE key flag (Activate escape pod)
key_t                    = &030A                  ; T key flag (Target missile)
key_u                    = &030B                  ; U key flag (Unarm missile)
key_m                    = &030C                  ; M key flag (Fire missile)
key_e                    = &030D                  ; E key flag (Activate ECM)
key_j                    = &030E                  ; J key flag (Jump)
key_c                    = &030F                  ; C key flag (Activate docking computer)
object01_type            = &0311                  ; Object 1: type (&00=empty, &80=planet, &81=sun, &82=planet)
object02_type            = &0312                  ; Object 1: type (&00=empty)
object03_type            = &0313                  ; Object 1: type (&00=empty)
object04_type            = &0314                  ; Object 1: type (&00=empty)
object05_type            = &0315                  ; Object 1: type (&00=empty)
object06_type            = &0316                  ; Object 1: type (&00=empty)
object07_type            = &0317                  ; Object 1: type (&00=empty)
object08_type            = &0318                  ; Object 1: type (&00=empty)
object09_type            = &0319                  ; Object 1: type (&00=empty)
object10_type            = &031A                  ; Object 1: type (&00=empty)
object11_type            = &031B                  ; Object 1: type (&00=empty)
object12_type            = &031C                  ; Object 1: type (&00=empty)
object13_type            = &031D                  ; Object 1: type (&00=empty)
ship_missile_total       = &031E                  ; Total number of Missile
ship_spacestation_total  = &031F                  ; Total number of Space Station
ship_escapepod_total     = &0320                  ; Total number of Escape Pods
ship_plate_total         = &0321                  ; Total number of Plates
ship_cargo_total         = &0322                  ; Total number of Cargo Containers
ship_boulder_total       = &0323                  ; Total number of Boulders
ship_asteroid_total      = &0324                  ; Total number of Asteroid
ship_rock_total          = &0325                  ; Total number of Rocks
ship_shuttle_total       = &0326                  ; Total number of Shuttles
ship_transporter_total   = &0327                  ; Total number of Transporters
ship_cobramk3_total      = &0328                  ; Total number of Cobra Mk III
ship_python_total        = &0329                  ; Total number of Pythons
ship__total              = &032A                  ; Total number of 
ship_anaconda_total      = &032B                  ; Total number of Anacondas
ship_worm_total          = &032C                  ; Total number of Worms
ship_viper_total         = &032D                  ; Total number of Vipers
ship__total              = &032E                  ; Total number of 
ship__total              = &032F                  ; Total number of 
ship_krait_total         = &0330                  ; Total number of Krait
ship_adder_total         = &0331                  ; Total number of Adders
ship__total              = &0332                  ; Total number of 
ship__total              = &0333                  ; Total number of 
ship__total              = &0334                  ; Total number of 
ship__total              = &0335                  ; Total number of 
ship_asp_mk2_total       = &0336                  ; Total number of Asp Mk2
ship_ferdelance_total    = &0337                  ; Total number of Fer De Lances
ship__total              = &0338                  ; Total number of 
ship__total              = &0339                  ; Total number of 
ship_thargoid_total      = &033A                  ; Total number of Thargoid
ship_thargon_total       = &033B                  ; Total number of Thargons
ship_constrictor_total   = &033C                  ; Total number of Constrictor
constrictor              = &033D                  ; ?? Constrictor flag
junk_total               = &033E                  ; Total number of objects with type between 3 and 11 (esc plate oil boulder asteroid splinter shuttle transporter)
my_dockingcomputerstatus = &033F                  ; Player's DockingComputer status (&00=off, &FF=on)
my_ecmstatus             = &0340                  ; Player's ECM status (&00=off, &FF=on)
my_misjump               = &0341                  ; Player's misjumped into witchspace (&00=
my_cabintemperature      = &0342                  ; Cabin temperature
my_missile_armed         = &0344                  ; The player's missile is armed (&00=disarmed, &FF=armed)
my_view                  = &0345                  ; The player's current view (0=front, 1=back, 2=left, 3=right)
my_pulselaser_counter    = &0346                  ; Pulse laser / mining laser counter: more than 8 shots means it needs to cool down
my_lasertemperature      = &0347                  ; The player's laser temperature
hfx                      = &0348                  ; ?? HFX
extra_vessels            = &0349                  ; ?? (Extra vessels)
delay_printing           = &034A                  ; ?? delay printing
item_destroyed           = &034B                  ; ?? item destroyed
my_x                     = &034C                  ; X-axis of ship's input ()
my_y                     = &034D                  ; Y-axis of joystick input (&00 = climbing, &80 = centered, &FF = decending)
my_name                  = &0350                  ; The player's (commander's) name (8 characters)
my_mission               = &0358                  ; The player's current mission
my_location_x            = &0359                  ; The player's present X location in the current galaxy
my_location_y            = &035A                  ; The player's present Y location in the current galaxy
galaxy_seed              = &035B                  ; (035B-0360)
my_cash0                 = &0361                  ; The player's cash
my_cash1                 = &0362                  ; The player's cash
my_cash2                 = &0363                  ; The player's cash
my_cash3                 = &0364                  ; The player's cash
my_fuel                  = &0365                  ; The player's fuel
my_competition           = &0366                  ; The player's competition number
my_galaxy                = &0367                  ; The player's current galaxy
my_laser_front           = &0368                  ; The player's front laser power
my_laser_rear            = &0369                  ; The player's rear laser power
my_laser_                = &036A                  ; The player's ... laser power
my_laser_                = &036B                  ; The player's ... laser power
my_cargobay_size         = &036E                  ; The player's cargo bay size
my_cargo_food            = &036F                  ; Total ton of food on board
my_cargo_textiles        = &0370                  ; Total ton of textiles on board
my_cargo_radioactives    = &0371                  ; Total ton of radioactives on board
my_cargo_slaves          = &0372                  ; Total ton of slaves on board
my_cargo_liquor_wines    = &0373                  ; Total ton of liquor & wines on board
my_cargo_luxuries        = &0374                  ; Total ton of luxuries on board
my_cargo_narcotics       = &0375                  ; Total ton of narcotics on board
my_cargo_computers       = &0376                  ; Total ton of computers on board
my_cargo_machinery       = &0377                  ; Total ton of machinery on board
my_cargo_alloys          = &0378                  ; Total ton of alloys on board
my_cargo_firearms        = &0379                  ; Total ton of firearms on board
my_cargo_furs            = &037A                  ; Total ton of furs on board
my_cargo_minerals        = &037B                  ; Total ton of minerals on board
my_cargo_gold            = &037C                  ; Total ton of gold on board
my_cargo_platinum        = &037D                  ; Total ton of platinum on board
my_cargo_gemstones       = &037E                  ; Total ton of gem-stones on board
my_cargo_alienitems      = &037F                  ; Total ton of alien items on board
my_ecm                   = &0380                  ; Ship is equipped with ECM flag (00=no, FF=yes)
my_fuelscoops            = &0381                  ; Ship is equipped with fuel scoops (00=no, FF=yes)
my_energybomb            = &0382                  ; Ship is equipped with energy bomb (00=no, FF=yes)
my_energyunit            = &0383                  ; Ship is equipped with an energy unit (00=no, FF=yes)
my_dockingcomputer       = &0384                  ; Ship is equipped with docking computers (00=no, FF=yes)
my_hyperspace            = &0385                  ; Ship is equipped with galactic hyperspace drive (00=no, FF=yes)
my_escapepod             = &0386                  ; Ship is equipped with an escape pod (00=no, FF=yes)
my_dampening             = &0387                  ; 
my_dampening             = &0388                  ; 
my_dampening             = &0389                  ; 
my_dampening             = &038A                  ; 
my_missiles              = &038B                  ; The player's number of missiles on ship
my_fugitivestatus        = &038C                  ; The player's innocent/fugitive status
planet_cargo_food        = &038D                  ; Total ton of food on board
planet_cargo_textiles    = &038E                  ; Total ton of textiles available on this planet
planet_cargo_radioactives= &038F                  ; Total ton of radioactives available on this planet
planet_cargo_slaves      = &0390                  ; Total ton of slaves available on this planet
planet_cargo_liquor_wines= &0391                  ; Total ton of liquor & wines available on this planet
planet_cargo_luxuries    = &0392                  ; Total ton of luxuries available on this planet
planet_cargo_narcotics   = &0393                  ; Total ton of narcotics available on this planet
planet_cargo_computers   = &0394                  ; Total ton of computers available on this planet
planet_cargo_machinery   = &0395                  ; Total ton of machinery available on this planet
planet_cargo_alloys      = &0396                  ; Total ton of alloys available on this planet
planet_cargo_firearms    = &0397                  ; Total ton of firearms available on this planet
planet_cargo_furs        = &0398                  ; Total ton of furs available on this planet
planet_cargo_minerals    = &0399                  ; Total ton of minerals available on this planet
planet_cargo_gold        = &039A                  ; Total ton of gold available on this planet
planet_cargo_platinum    = &039B                  ; Total ton of platinum available on this planet
planet_cargo_gemstones   = &039C                  ; Total ton of gem-stones available on this planet
planet_cargo_alienitems  = &039D                  ; Total ton of alien items available on this planet
planet_marketprices      = &039E                  ; Current market prices in this system (random for each visit)
my_kills_lo              = &039F                  ; The player's number of kills
my_kills_hi              = &03A0                  ; The player's number of kills
my_competition_number    = &03A1                  ; Competition number
                                                  ; &03A1-&03A3 unused
                         = &03A4                  ; Message
my_shield_front          = &03A5                  ; The player's front shield
my_shield_aft            = &03A6                  ; The player's rear shield
my_energy                = &03A7                  ; The player's energy
my_compass_x             = &03A8                  ; The player's space compass x
my_compass_y             = &03A9                  ; The player's space compass y
                         = &03AA                  ; 
                         = &03AB                  ; 
planet_economy           = &03AC                  ; (0=Rich Industrial)
my_cargo_item_index      = &03AD
planet_government        = &03AE                  ; (0=Anarchy)
planet_techlevel         = &03AF                  ; Technology level ()
                         = &03B0                  ; 
                         = &03B1                  ; 
planet_seed0             = &03B2                  ; Seed (6 bytes)
planet_seed1             = &03B3                  ; Seed (6 bytes)
planet_seed2             = &03B4                  ; Seed (6 bytes)
planet_seed3             = &03B5                  ; Seed (6 bytes)
planet_seed4             = &03B6                  ; Seed (6 bytes)
planet_seed5             = &03B7                  ; Seed (6 bytes)
target_economy           = &03B8                  ; (0=Rich Industrial)
target_government        = &03B9                  ; Government (0=Anarchy)
target_techlevel         = &03BA                  ; Technology level ()
planet_population        = &03BB
planet_productivity_lo   = &03BD
planet_productivity_hi   = &03BE
planet_distance_lo       = &03BF                  ; Distance to target planetary system lo
planet_distance_hi       = &03C0                  ; Distance to target planetary system hi
target_location_x        = &03C1                  ; The player's target X location in the current galaxy
target_location_y        = &03C2                  ; The player's target Y location in the current galaxy
stars_n_dust_particles   = &03C3                  ; Number of stars and dust in the starfield (18 for normal space, 3 for witchspace)
compass_colour           = &03C5                  ; Compass colour
enable_sound             = &03C6                  ; &00=Sound enabled, &FF=Sound disabled
enable_damping           = &03C7                  ; &00=Damping enabled, &FF=Damping disabled
enable_kbd_autorecenter  = &03C8                  ; &00=Keyboard auto-recentering disabled, &FF=Keyboard auto-recentering disabled
joystick_y_reversed      = &03CB                  ; &00=Joystick Y channel normal, &FF=Joystick Y channel reversed
joystick_reversed        = &03CC                  ; &00=Joystick all channels normal, &FF=Joystick all channels reversed
enable_yoystick          = &03CD                  ; &00=Joystick disabled, &FF=Joystick enabled
enable_bitstik           = &03CE                  ; &00=Bitstick disabled, &FF=Bitstick enabled
disccat_fail             = &03CF                  ; Disc catalogue fail flag
                                                  ; &03D0-&03FF unused
sine_table               = &07C0                  ; &07C0-&07DF = sine table
                         = &07E0                  ; &07E0-&07FF = ACT???
obj_planet_xlo           = &0900                  ; Planet xlo
obj_planet_xhi           = &0901                  ; Planet xhi
obj_planet_xsg           = &0902                  ; Planet xsign
obj_planet_ylo           = &0903                  ; Planet ylo
obj_planet_yhi           = &0904                  ; Planet yhi
obj_planet_ysg           = &0905                  ; Planet ysign
obj_planet_zlo           = &0906                  ; Planet zlo
obj_planet_zhi           = &0907                  ; Planet zhi
obj_planet_zsg           = &0908                  ; Planet zsign (= distance to planet)
obj_sun_xlo              = &0925                  ; Sun / Space Station xlo
obj_sun_xhi              = &0926                  ; Sun / Space Station xhi
obj_sun_xsg              = &0927                  ; Sun / Space Station xsign
obj_sun_ylo              = &0928                  ; Sun / Space Station ylo
obj_sun_yhi              = &0929                  ; Sun / Space Station yhi
obj_sun_ysg              = &092A                  ; Sun / Space Station ysign
obj_sun_zlo              = &092B                  ; Sun / Space Station zlo
obj_sun_zhi              = &092C                  ; Sun / Space Station zhi
obj_sun_zsg              = &092D                  ; Sun / Space Station zsign
altitude                 = &0DF1                  ; Altitude from planet
stardust_x               = &0F5C                  ; X coord of stardust (0F5C-0F81)
stardust_y               = &0F82                  ; Y coord of stardust (0F82-0FA7)
stardust_z               = &0FA8                  ; Z coord of stardust (0FA8-0FCD)


osword                   = &FFF1
osbyte                   = &FFF4
oscli                    = &FFF7



ORG &11E3

.start
	JMP addr1201
	JMP addr1201
.wrchv
	JMP addr1EFC
.addr11EC
	DW &1148
.brkv
	JMP addr11D5

; -----------------------------------------------------------------------------
; Switch from flight mode to docked mode
; -----------------------------------------------------------------------------
.addr11F1
	LDX #&F8
	LDY #&11
	JSR oscli

.str_load_t_code
	EQUS "L.T.CODE", &0D

; -----------------------------------------------------------------------------
; Descramble main code
; -----------------------------------------------------------------------------
.descramble
	LDY #&00
	STY &07
	LDX #&13
.descramble1
	STX &08
	TYA
	EOR (&07),Y
	EOR #&33
	STA (&07),Y
	DEY
	BNE addr1207
	INX
	CPX #&56
	BNE descramble1
	JMP addr4244

; -----------------------------------------------------------------------------
; Dock the ship
; -----------------------------------------------------------------------------
.addr121B
	LDA #&52
	STA &11F8
.addr1220
	JSR addr3EE1
	JSR addr0D7A
	BNE addr11F1

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr1228
	LDA &0900
	STA &00
	LDX &034C
	JSR addr29FF
	JSR addr29FF
	TXA
	EOR #&80
	TAY
	AND #&80
	STA &32
	STX &034C
	EOR #&80
	STA &33
	TYA
	BPL addr124D
	EOR #&FF
	CLC
	ADC #&01
.addr124D
	LSR A
	LSR A
	CMP #&08
	BCS addr1254
	LSR A
.addr1254
	STA &31
	ORA &32
	STA &8D
	LDX &034D
	JSR addr29FF
	TXA
	EOR #&80
	TAY
	AND #&80
	STX &034D
	STA &7C
	EOR #&80
	STA &7B
	TYA
	BPL addr1274
	EOR #&FF
.addr1274
	ADC #&04
	LSR A
	LSR A
	LSR A
	LSR A
	CMP #&03
	BCS addr127F
	LSR A
.addr127F
	STA &2B
	ORA &7B
	STA &2A
	LDA &03CE
	BEQ addr129E
	LDX #&03
	LDA #&80
	JSR osbyte
	TYA
	LSR A
	LSR A
	CMP #&28
	BCC addr129A
	LDA #&28
.addr129A
	STA &7D
	BNE addr12B6
.addr129E
	LDA &0302
	BEQ addr12AB
	LDA &7D
	CMP #&28
	BCS addr12AB
	INC &7D
.addr12AB
	LDA &0301
	BEQ addr12B6
	DEC &7D
	BNE addr12B6
	INC &7D
.addr12B6
	LDA &030B
	AND &038B
	BEQ addr12CD
	LDY #&EE
	JSR addr3805
	LDA #&28
	JSR addr43F3
	LDA #&00
	STA &0344
.addr12CD
	LDA &45
	BPL addr12E3
	LDA &030A
	BEQ addr12E3
	LDX &038B
	BEQ addr12E3
	STA &0344
	LDY #&E0
	JSR addr383D
.addr12E3
	LDA &030C
	BEQ addr12EF
	LDA &45
	BMI addr1326
	JSR addr252E
.addr12EF
	LDA &0308
	BEQ addr12F7
	ASL &0382
.addr12F7
	LDA &0310
	BEQ addr1301
	LDA #&00
	STA &033F
.addr1301
	LDA &0309
	AND &0386
	BEQ addr130C
	JMP addr20C1
.addr130C
	LDA &030E
	BEQ addr1314
	JSR addr434E
.addr1314
	LDA &030D
	AND &0380
	BEQ addr1326
	LDA &30
	BNE addr1326
	DEC &0340
	JSR addr3813
.addr1326
	LDA &030F
	AND &0384
	BEQ addr1331
	STA &033F
.addr1331
	LDA #&00
	STA &44
	STA &7E
	LDA &7D
	LSR A
	ROR &7E
	LSR A
	ROR &7E
	STA &7F
	LDA &0346
	BNE addr1374
	LDA &0307
	BEQ addr1374
	LDA &0347
	CMP #&F2
	BCS addr1374
	LDX &0345
	LDA &0368,X
	BEQ addr1374
	PHA
	AND #&7F
	STA &44
	STA &0343
	LDA #&00
	JSR addr43F3
	JSR addr2A82
	PLA
	BPL addr136F
	LDA #&00
.addr136F
	AND #&FA
	STA &0346
.addr1374
	LDX #&00
.addr1376
	STX &84
	LDA &0311,X
	BNE addr1380
	JMP addr153F
.addr1380
	STA &8C
	JSR addr3732
	LDY #&24
.addr1387
	LDA (&20),Y
	STA &0046,Y
	DEY
	BPL addr1387
	LDA &8C
	BMI addr13B6                    ; Jump if object type is PLANET or SUN
	ASL A
	TAY
	LDA &55FE,Y
	STA &1E
	LDA &55FF,Y
	STA &1F
	LDA &0382                       ; Has the player used the energy bomb?
	BPL addr13B6                    ; No? Then branch
	CPY #&04
	BEQ addr13B6
	LDA &65
	AND #&20
	BNE addr13B6
	ASL &65
	SEC
	ROR &65
	JSR addr43CE
.addr13B6
	JSR addr50A0
	LDY #&24
.addr13BB
	LDA &0046,Y
	STA (&20),Y
	DEY
	BPL addr13BB
	LDA &65
	AND #&A0
	JSR addr41BF
	BNE addr141D
	LDA &46
	ORA &49
	ORA &4C
	BMI addr141D
	LDX &8C
	BMI addr141D
	CPX #&02
	BEQ addr1420
	AND #&C0
	BNE addr141D
	CPX #&01
	BEQ addr141D
	LDA &0381
	AND &4B
	BPL addr1464
	CPX #&05
	BEQ addr13FD
	LDY #&00
	LDA (&1E),Y
	LSR A
	LSR A
	LSR A
	LSR A
	BEQ addr1464
	ADC #&01
	BNE addr1402
.addr13FD
	JSR addr3F86
	AND #&07
.addr1402
	JSR addr2AEC
	LDY #&4E
	BCS addr1452
	LDY &03AD
	ADC &036F,Y
	STA &036F,Y
	TYA
	ADC #&D0
	JSR addr45C6
	ASL &6A
	SEC
	ROR &6A
.addr141D
	JMP addr1473
.addr1420
	LDA &0949
	AND #&04
	BNE addr1449
	LDA &54
	CMP #&D6
	BCC addr1449
	JSR addr42AE
	LDA &36
	CMP #&56
	BCC addr1449
	LDA &56
	AND #&7F
	CMP #&50
	BCC addr1449
.addr143E
	JSR addr3EE1
	LDA #&08
	JSR addr263D
	JMP addr121B
.addr1449
	LDA &7D
	CMP #&05
	BCC addr145C
	JMP addr41C6
.addr1452
	JSR addr43B1
	ASL &65
	SEC
	ROR &65
	BNE addr1473
.addr145C
	LDA #&01
	STA &7D
	LDA #&05
	BNE addr146D
.addr1464
	ASL &65
	SEC
	ROR &65
	LDA &69
	SEC
	ROR A
.addr146D
	JSR addr36E4
	JSR addr43B1
.addr1473
	LDA &6A
	BPL addr147A
	JSR addr5558
.addr147A
	LDA &87
	BNE addr14F0
	LDX &0345
	BEQ addr1486
	JSR addr5404
.addr1486
	JSR addr24C7
	BCC addr14ED
	LDA &0344
	BEQ addr149A
	JSR addr43BA
	LDX &84
	LDY #&0E
	JSR addr3807
.addr149A
	LDA &44
	BEQ addr14ED
	LDX #&0F
	JSR addr43DD
	LDA &8C
	CMP #&02
	BEQ addr14E8
	CMP #&1F
	BNE addr14B7
	LDA &44
	CMP #&17
	BNE addr14ED
	LSR &44
	LSR &44
.addr14B7
	LDA &69
	SEC
	SBC &44
	BCS addr14E6
	ASL &65
	SEC
	ROR &65
	LDA &8C
	CMP #&07
	BNE addr14D9
	LDA &44
	CMP #&32
	BNE addr14D9
	JSR addr3F86
	LDX #&08
	AND #&03
	JSR addr1687
.addr14D9
	LDY #&04
	JSR addr1678
	LDY #&05
	JSR addr1678
	JSR addr43CE
.addr14E6
	STA &69
.addr14E8
	LDA &8C
	JSR addr254D
.addr14ED
	JSR addr488C
.addr14F0
	LDY #&23
	LDA &69
	STA (&20),Y
	LDA &6A
	BMI addr1527
	LDA &65
	BPL addr152A
	AND #&20
	BEQ addr152A
	LDA &6A
	AND #&40
	ORA &038C
	STA &038C
	LDA &034A
	ORA &0341
	BNE addr1527
	LDY #&0A
	LDA (&1E),Y
	BEQ addr1527
	TAX
	INY
	LDA (&1E),Y
	TAY
	JSR addr32D0
	LDA #&00
	JSR addr45C6
.addr1527
	JMP addr3D7F
.addr152A
	LDA &8C
	BMI addr1533
	JSR addr41B2
	BCC addr1527
.addr1533
	LDY #&1F
	LDA &65
	STA (&20),Y
	LDX &84
	INX
	JMP addr1376
.addr153F
	LDA &0382
	BPL addr154F
	ASL &0382
	JSR addr55F7
	LDA #&30
	STA &FE21
.addr154F
	LDA &8A
	AND #&07
	BNE addr15C2
	LDX &03A7
	BPL addr156C
	LDX &03A6
	JSR addr3626
	STX &03A6
	LDX &03A5
	JSR addr3626
	STX &03A5
.addr156C
	SEC
	LDA &0383
	ADC &03A7
	BCS addr1578
	STA &03A7
.addr1578
	LDA &0341
	BNE addr15BF
	LDA &8A
	AND #&1F
	BNE addr15CB
	LDA &0320
	BNE addr15BF
	TAY
	JSR addr1C43
	BNE addr15BF
	LDX #&1C
.addr1590
	LDA &0900,X
	STA &46,X
	DEX
	BPL addr1590
	INX
	LDY #&09
	JSR addr1C20
	BNE addr15BF
	LDX #&03
	LDY #&0B
	JSR addr1C20
	BNE addr15BF
	LDX #&06
	LDY #&0D
	JSR addr1C20
	BNE addr15BF
	LDA #&C0
	JSR addr41B4
	BCC addr15BF
	JSR addr3C30
	JSR addr3740
.addr15BF
	JMP addr1648
.addr15C2
	LDA &0341
	BNE addr15BF
	LDA &8A
	AND #&1F
.addr15CB
	CMP #&0A
	BNE addr15FD
	LDA #&32
	CMP &03A7
	BCC addr15DA
	ASL A
	JSR addr45C6
.addr15DA
	LDY #&FF
	STY &0FD1
	INY
	JSR addr1C41
	BNE addr1648
	JSR addr1C4F
	BCS addr1648
	SBC #&24
	BCC addr15FA
	STA &82
	JSR addr47B8
	LDA &81
	STA &0FD1
	BNE addr1648
.addr15FA
	JMP addr41C6
.addr15FD
	CMP #&0F
	BNE addr160A
	LDA &033F
	BEQ addr1648
	LDA #&7B
	BNE addr1645
.addr160A
	CMP #&14
	BNE addr1648
	LDA #&1E
	STA &0342
	LDA &0320
	BNE addr1648
	LDY #&25
	JSR addr1C43
	BNE addr1648
	JSR addr1C4F
	EOR #&FF
	ADC #&1E
	STA &0342
	BCS addr15FA
	CMP #&E0
	BCC addr1648
	LDA &0381
	BEQ addr1648
	LDA &7F
	LSR A
	ADC &0365
	CMP #&46
	BCC addr1640
	LDA #&46
.addr1640
	STA &0365
	LDA #&A0
.addr1645
	JSR addr45C6
.addr1648
	LDA &0343
	BEQ addr165C
	LDA &0346
	CMP #&08
	BCS addr165C
	JSR addr2AA1
	LDA #&00
	STA &0343
.addr165C
	LDA &0340
	BEQ addr1666
	JSR addr3629
	BEQ addr166E
.addr1666
	LDA &30
	BEQ addr1671
	DEC &30
	BNE addr1671
.addr166E
	JSR addr43A3
.addr1671
	LDA &87
	BNE addr1694
	JMP addr1A25
.addr1678
	JSR addr3F86
	BPL addr1694
	PHA
	TYA
	TAX
	PLA
	LDY #&00
	AND (&1E),Y
	AND #&0F
.addr1687
	STA &93
	BEQ addr1694
.addr168B
	LDA #&00
	JSR addr2592
	DEC &93
	BNE addr168B
.addr1694
	RTS

.addr1695
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
.addr16AF
	EQUB &80, &40, &20, &10, &08, &04, &02, &01
.addr16B7
	EQUB &C0, &60, &30, &18, &0C, &06, &03, &03
.addr16BF
	EQUB &88, &44, &22, &11, &88

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr16C4
	STY &85
	LDA #&80
	STA &83
	ASL A
	STA &90
	LDA &36
	SBC &34
	BCS addr16D8
.addr16D3
	EOR #&FF
	ADC #&01
	SEC
.addr16D8
	STA &1B
	LDA &37
	SBC &35
	BCS addr16E4
	EOR #&FF
	ADC #&01
.addr16E4
	STA &81
	CMP &1B
	BCC addr16ED
	JMP addr1797
.addr16ED
	LDX &34
	CPX &36
	BCC addr1704
	DEC &90
	LDA &36
	STA &34
	STX &36
	TAX
	LDA &37
	LDY &35
	STA &35
	STY &37
.addr1704
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
	LDA addr16AF,X
	STA &82
	LDA &81
	LDX #&FE
	STX &81
.addr1726
	ASL A
	BCS addr172D
	CMP &1B
	BCC addr1730
.addr172D
	SBC &1B
	SEC
.addr1730
	ROL &81
	BCS addr1726
	LDX &1B
	INX
	LDA &37
	SBC &35
	BCS addr1769
	LDA &90
	BNE addr1748
	DEX
.addr1742
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr1748
	LSR &82
	BCC addr1754
	ROR &82
	LDA &07
	ADC #&08
	STA &07
.addr1754
	LDA &83
	ADC &81
	STA &83
	BCC addr1763
	DEY
	BPL addr1763
	DEC &08
	LDY #&07
.addr1763
	DEX
	BNE addr1742
	LDY &85
	RTS
.addr1769
	LDA &90
	BEQ addr1774
	DEX
.addr176E
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr1774
	LSR &82
	BCC addr1780
	ROR &82
	LDA &07
	ADC #&08
	STA &07
.addr1780
	LDA &83
	ADC &81
	STA &83
	BCC addr1791
	INY
	CPY #&08
	BNE addr1791
	INC &08
	LDY #&00
.addr1791
	DEX
	BNE addr176E
	LDY &85
	RTS
.addr1797
	LDY &35
	TYA
	LDX &34
	CPY &37
	BCS addr17B0
	DEC &90
	LDA &36
	STA &34
	STX &36
	TAX
	LDA &37
	STA &35
	STY &37
	TAY
.addr17B0
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
	LDA addr16AF,X
	STA &82
	LDA &35
	AND #&07
	TAY
	LDA &1B
	LDX #&01
	STX &1B
.addr17D0
	ASL A
	BCS addr17D7
	CMP &81
	BCC addr17DA
.addr17D7
	SBC &81
	SEC
.addr17DA
	ROL &1B
	BCC addr17D0
	LDX &81
	INX
	LDA &36
	SBC &34
	BCC addr1814
	CLC
	LDA &90
	BEQ addr17F3
	DEX
.addr17ED
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr17F3
	DEY
	BPL addr17FA
	DEC &08
	LDY #&07
.addr17FA
	LDA &83
	ADC &1B
	STA &83
	BCC addr180E
	LSR &82
	BCC addr180E
	ROR &82
	LDA &07
	ADC #&08
	STA &07
.addr180E
	DEX
	BNE addr17ED
	LDY &85
	RTS
.addr1814
	LDA &90
	BEQ addr181F
	DEX
.addr1819
	LDA &82
	EOR (&07),Y
	STA (&07),Y
.addr181F
	DEY
	BPL addr1826
	DEC &08
	LDY #&07
.addr1826
	LDA &83
	ADC &1B
	STA &83
	BCC addr183B
	ASL &82
	BCC addr183B
	ROL &82
	LDA &07
	SBC #&07
	STA &07
	CLC
.addr183B
	DEX
	BNE addr1819
	LDY &85
.addr1840
	RTS
	LDA #&0F
	TAX
	JMP osbyte
.addr1847
	JSR addr339A
.addr184A
	LDA #&13
	BNE addr1852
.addr184E
	LDA #&17
	INC &2D
.addr1852
	STA &35
	LDX #&02
	STX &34
	LDX #&FE
	STX &36
	BNE addr1868
.addr185E
	JSR addr3C4F
	STY &35
	LDA #&00
	STA &0E00,Y
.addr1868
	STY &85
	LDX &34
	CPX &36
	BEQ addr1840
	BCC addr1879
	LDA &36
	STA &34
	STX &36
	TAX
.addr1879
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
	BEQ addr18D3
	LSR A
	LSR A
	LSR A
	STA &82
	LDA &34
	AND #&07
	TAX
	LDA addr18F5,X
	EOR (&07),Y
	STA (&07),Y
	TYA
	ADC #&08
	TAY
	LDX &82
	DEX
	BEQ addr18C4
	CLC
.addr18B7
	LDA #&FF
	EOR (&07),Y
	STA (&07),Y
	TYA
	ADC #&08
	TAY
	DEX
	BNE addr18B7
.addr18C4
	LDA &36
	AND #&07
	TAX
	LDA addr18EE,X
	EOR (&07),Y
	STA (&07),Y
	LDY &85
	RTS
.addr18D3
	LDA &34
	AND #&07
	TAX
	LDA addr18F5,X
	STA &D1
	LDA &36
	AND #&07
	TAX
	LDA addr18EE,X
	AND &D1
	EOR (&07),Y
	STA (&07),Y
.addr18EB
	LDY &85
	RTS

.addr18EE
	EQUB &80, &C0, &E0, &F0, &F8, &FC, &FE
.addr18F5
	EQUB &FF, &7F, &3F, &1F, &0F, &07, &03, &01

.addr18FD 
	LDA addr16AF,X
	EOR (&07),Y
	STA (&07),Y
	LDY &06
	RTS

.addr1907
	JSR addr28FF
	STA &27
	TXA
	STA &0F95,Y
.addr1910
	LDA &34
	BPL addr1919
	EOR #&7F
	CLC
	ADC #&01
.addr1919
	EOR #&80
	TAX
	LDA &35
	AND #&7F
	CMP #&60
	BCS addr196A
	LDA &35
	BPL addr192C
	EOR #&7F
	ADC #&01
.addr192C
	STA &D1
	LDA #&61
	SBC &D1
.addr1932
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
	BCS addr18FD
	LDA addr16B7,X
	EOR (&07),Y
	STA (&07),Y
	LDA &88
	CMP #&50
	BCS addr1968
	DEY
	BPL addr1961
	LDY #&01
.addr1961
	LDA addr16B7,X
	EOR (&07),Y
	STA (&07),Y
.addr1968
	LDY &06
.addr196A
	RTS
.addr196B
	TXA
	ADC &E0
	STA &78
	LDA &E1
	ADC &D1
	STA &79
	LDA &92
	BEQ addr198C
	INC &92
.addr197C
	LDY &6B
	LDA #&FF
	CMP &0F0D,Y
	BEQ addr19ED
	STA &0F0E,Y
	INC &6B
	BNE addr19ED
.addr198C
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
	JSR addr4E19
	BCS addr197C
	LDA &90
	BEQ addr19C5
	LDA &34
	LDY &36
	STA &36
	STY &34
	LDA &35
	LDY &37
	STA &37
	STY &35
.addr19C5
	LDY &6B
	LDA &0F0D,Y
	CMP #&FF
	BNE addr19D9
	LDA &34
	STA &0EC0,Y
	LDA &35
	STA &0F0E,Y
	INY
.addr19D9
	LDA &36
	STA &0EC0,Y
	LDA &37
	STA &0F0E,Y
	INY
	STY &6B
	JSR addr16C4
	LDA &89
	BNE addr197C
.addr19ED
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
	ADC &95
	STA &93
	RTS
.addr1A05
	LDY &03C3
.addr1A08
	LDX &0F82,Y
	LDA &0F5C,Y
	STA &35
	STA &0F82,Y
	TXA
	STA &34
	STA &0F5C,Y
	LDA &0FA8,Y
	STA &88
	JSR addr1910
	DEY
	BNE addr1A08
	RTS
.addr1A25
	LDX &0345
	BEQ addr1A33
	DEX
	BNE addr1A30
	JMP addr1B20
.addr1A30
	JMP addr2679
.addr1A33
	LDY &03C3
.addr1A36
	JSR addr295E
	LDA &82
	LSR &1B
	ROR A
	LSR &1B
	ROR A
	ORA #&01
	STA &81
	LDA &0FBB,Y
	SBC &7E
	STA &0FBB,Y
	LDA &0FA8,Y
	STA &88
	SBC &7F
	STA &0FA8,Y
	JSR addr2817
	STA &27
	LDA &1B
	ADC &0F95,Y
	STA &26
	STA &82
	LDA &35
	ADC &27
	STA &27
	STA &83
	LDA &0F5C,Y
	STA &34
	JSR addr281C
	STA &25
	LDA &1B
	ADC &0F6F,Y
	STA &24
	LDA &34
	ADC &25
	STA &25
	EOR &33
	JSR addr27C6
	JSR addr28FF
	STA &27
	STX &26
	EOR &32
	JSR addr27BE
	JSR addr28FF
	STA &25
	STX &24
	LDX &2B
	LDA &27
	EOR &7C
	JSR addr27C8
	STA &81
	JSR addr289E
	ASL &1B
	ROL A
	STA &D1
	LDA #&00
	ROR A
	ORA &D1
	JSR addr28FF
	STA &25
	TXA
	STA &0F6F,Y
	LDA &26
	STA &82
	LDA &27
	STA &83
	LDA #&00
	STA &1B
	LDA &2A
	EOR #&80
	JSR addr1907
	LDA &25
	STA &34
	STA &0F5C,Y
	AND #&7F
	CMP #&78
	BCS addr1AFD
	LDA &27
	STA &0F82,Y
	STA &35
	AND #&7F
	CMP #&78
	BCS addr1AFD
	LDA &0FA8,Y
	CMP #&10
	BCC addr1AFD
	STA &88
.addr1AF3
	JSR addr1910
	DEY
	BEQ addr1AFC
	JMP addr1A36
.addr1AFC
	RTS
.addr1AFD
	JSR addr3F86
	ORA #&04
	STA &35
	STA &0F82,Y
	JSR addr3F86
	ORA #&08
	STA &34
	STA &0F5C,Y
	JSR addr3F86
	ORA #&90
	STA &0FA8,Y
	STA &88
	LDA &35
	JMP addr1AF3
.addr1B20
	LDY &03C3
.addr1B23
	JSR addr295E
	LDA &82
	LSR &1B
	ROR A
	LSR &1B
	ROR A
	ORA #&01
	STA &81
	LDA &0F5C,Y
	STA &34
	JSR addr281C
	STA &25
	LDA &0F6F,Y
	SBC &1B
	STA &24
	LDA &34
	SBC &25
	STA &25
	JSR addr2817
	STA &27
	LDA &0F95,Y
	SBC &1B
	STA &26
	STA &82
	LDA &35
	SBC &27
	STA &27
	STA &83
	LDA &0FBB,Y
	ADC &7E
	STA &0FBB,Y
	LDA &0FA8,Y
	STA &88
	ADC &7F
	STA &0FA8,Y
	LDA &25
	EOR &32
	JSR addr27C6
	JSR addr28FF
	STA &27
	STX &26
	EOR &33
	JSR addr27BE
	JSR addr28FF
	STA &25
	STX &24
	LDA &27
	EOR &7C
	LDX &2B
	JSR addr27C8
	STA &81
	LDA &25
	STA &83
	EOR #&80
	JSR addr28A2
	ASL &1B
	ROL A
	STA &D1
	LDA #&00
	ROR A
	ORA &D1
	JSR addr28FF
	STA &25
	TXA
	STA &0F6F,Y
	LDA &26
	STA &82
	LDA &27
	STA &83
	LDA #&00
	STA &1B
	LDA &2A
	JSR addr1907
	LDA &25
	STA &34
	STA &0F5C,Y
	LDA &27
	STA &0F82,Y
	STA &35
	AND #&7F
	CMP #&6E
	BCS addr1BEA
	LDA &0FA8,Y
	CMP #&A0
	BCS addr1BEA
	STA &88
.addr1BE0
	JSR addr1910
	DEY
	BEQ addr1BE9
	JMP addr1B23
.addr1BE9
	RTS
.addr1BEA
	JSR addr3F86
	AND #&7F
	ADC #&0A
	STA &0FA8,Y
	STA &88
	LSR A
	BCS addr1C0D
	LSR A
	LDA #&FC
	ROR A
	STA &34
	STA &0F5C,Y
	JSR addr3F86
	STA &35
	STA &0F82,Y
	JMP addr1BE0
.addr1C0D
	JSR addr3F86
	STA &34
	STA &0F5C,Y
	LSR A
	LDA #&E6
	ROR A
	STA &35
	STA &0F82,Y
	BNE addr1BE0
.addr1C20
	LDA &0046,Y
	ASL A
	STA &41
	LDA &0047,Y
	ROL A
	STA &42
	LDA #&00
	ROR A
	STA &43
	JSR addr1D4C
	STA &48,X
	LDY &41
	STY &46
	LDY &42
	STY &47
	AND #&7F
	RTS
.addr1C41
	LDA #&00
.addr1C43
	ORA &0902,Y
	ORA &0905,Y
	ORA &0908,Y
	AND #&7F
	RTS
.addr1C4F
	LDA &0901,Y
	JSR addr280D
	STA &82
	LDA &0904,Y
	JSR addr280D
	ADC &82
	BCS addr1C6D
	STA &82
	LDA &0907,Y
	JSR addr280D
	ADC &82
	BCC addr1C6F
.addr1C6D
	LDA #&FF
.addr1C6F
	RTS
.addr1C70
	LDX #&09
	CMP #&19
	BCS addr1CCF
	DEX
	CMP #&0A
	BCS addr1CCF
	DEX
	CMP #&02
	BCS addr1CCF
	DEX
	BNE addr1CCF
.addr1C83
	LDA #&08
	JSR addr54C8
	JSR addr2F75
	LDA #&07
	STA &2C
	LDA #&7E
	JSR addr1847
	LDA #&E6
	LDY &033E
	LDX &0313,Y
	BEQ addr1CA5
	LDY &03A7
	CPY #&80
	ADC #&01
.addr1CA5
	JSR addr338F
	LDA #&7D
	JSR addr2B6D
	LDA #&13
	LDY &038C
	BEQ addr1CB8
	CPY #&32
	ADC #&01
.addr1CB8
	JSR addr338F
	LDA #&10
	JSR addr2B6D
	LDA &03A0
	BNE addr1C70
	TAX
	LDA &039F
	LSR A
	LSR A
.addr1CCB
	INX
	LSR A
	BNE addr1CCB
.addr1CCF
	TXA
	CLC
	ADC #&15
	JSR addr338F
	LDA #&12
	JSR addr1D44
	LDA &036E
	CMP #&1A
	BCC addr1CE7
	LDA #&6B
	JSR addr1D44
.addr1CE7
	LDA &0381
	BEQ addr1CF1
	LDA #&6F
	JSR addr1D44
.addr1CF1
	LDA &0380
	BEQ addr1CFB
	LDA #&6C
	JSR addr1D44
.addr1CFB
	LDA #&71
	STA &96
.addr1CFF
	TAY
	LDX &0311,Y
	BEQ addr1D08
	JSR addr1D44
.addr1D08
	INC &96
	LDA &96
	CMP #&75
	BCC addr1CFF
	LDX #&00
.addr1D12
	STX &93
	LDY &0368,X
	BEQ addr1D3C
	TXA
	CLC
	ADC #&60
	JSR addr2B6D
	LDA #&67
	LDX &93
	LDY &0368,X
	CPY #&8F
	BNE addr1D2D
	LDA #&68
.addr1D2D
	CPY #&97
	BNE addr1D33
	LDA #&75
.addr1D33
	CPY #&32
	BNE addr1D39
	LDA #&76
.addr1D39
	JSR addr1D44
.addr1D3C
	LDX &93
	INX
	CPX #&04
	BCC addr1D12
	RTS
.addr1D44
	JSR addr338F
	LDX #&06
	STX &2C
	RTS
.addr1D4C
	LDA &43
	STA &83
	AND #&80
	STA &D1
	EOR &48,X
	BMI addr1D70
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
.addr1D70
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
	BCS addr1DA7
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
.addr1DA7
	RTS
.addr1DA8
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
	JSR addr28FF
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
	JSR addr28FF
	STA &0047,Y
	STX &46,Y
	LDX &81
	LDA &40
	STA &46,X
	LDA &41
	STA &47,X
	RTS
	PHA
	ROR &E8,X
	BRK
.addr1E38
	LDA #&03
.addr1E3A
	LDY #&00
.addr1E3C
	STA &80
	LDA #&00
	STA &40
	STA &41
	STY &42
	STX &43
.addr1E48
	LDX #&0B
	STX &D1
	PHP
	BCC addr1E53
	DEC &D1
	DEC &80
.addr1E53
	LDA #&0B
	SEC
	STA &86
	SBC &80
	STA &80
	INC &80
	LDY #&00
	STY &83
	JMP addr1EA4
.addr1E65
	ASL &43
	ROL &42
	ROL &41
	ROL &40
	ROL &83
	LDX #&03
.addr1E71
	LDA &40,X
	STA &34,X
	DEX
	BPL addr1E71
	LDA &83
	STA &38
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
.addr1E93
	LDA &40,X
	ADC &34,X
	STA &40,X
	DEX
	BPL addr1E93
	LDA &38
	ADC &83
	STA &83
	LDY #&00
.addr1EA4
	LDX #&03
	SEC
.addr1EA7
	LDA &40,X
	SBC &1E34,X
	STA &34,X
	DEX
	BPL addr1EA7
	LDA &83
	SBC #&17
	STA &38
	BCC addr1ECA
	LDX #&03
.addr1EBB
	LDA &34,X
	STA &40,X
	DEX
	BPL addr1EBB
	LDA &38
	STA &83
	INY
	JMP addr1EA4
.addr1ECA
	TYA
	BNE addr1ED9
	LDA &D1
	BEQ addr1ED9
	DEC &80
	BPL addr1EE3
	LDA #&20
	BNE addr1EE0
.addr1ED9
	LDY #&00
	STY &D1
	CLC
	ADC #&30
.addr1EE0
	JSR addr1EFC
.addr1EE3
	DEC &D1
	BPL addr1EE9
	INC &D1
.addr1EE9
	DEC &86
	BMI addr1F5B
	BNE addr1EF7
	PLP
	BCC addr1EF7
	LDA #&2E
	JSR addr1EFC
.addr1EF7
	JMP addr1E65
.addr1EFA
	LDA #&07
.addr1EFC
	STA &D2
	STY &034F
	STX &034E
	LDY &72
	CPY #&FF
	BEQ addr1F52
	CMP #&07
	BEQ addr1F5C
	CMP #&20
	BCS addr1F1E
	CMP #&0A
	BEQ addr1F1A
	LDX #&01
	STX &2C
.addr1F1A
	INC &2D
	BNE addr1F52
.addr1F1E
	LDX #&BF
	ASL A
	ASL A
	BCC addr1F26
	LDX #&C1
.addr1F26
	ASL A
	BCC addr1F2A
	INX
.addr1F2A
	STA &1C
	STX &1D
	LDA &2C
	ASL A
	ASL A
	ASL A
	STA &07
	INC &2C
	LDA &2D
	CMP #&18
	BCC addr1F43
	JSR addr54C8
	JMP addr1F52
.addr1F43
	ORA #&60
.addr1F45
	STA &08
	LDY #&07
.addr1F49
	LDA (&1C),Y
	EOR (&07),Y
	STA (&07),Y
	DEY
	BPL addr1F49
.addr1F52
	LDY &034F
	LDX &034E
	LDA &D2
	CLC
.addr1F5B
	RTS
.addr1F5C
	JSR addr43BA
	JMP addr1F52
.addr1F62
	LDA #&D0
	STA &07
	LDA #&78
	STA &08
	JSR addr2026
	STX &41
	STA &40
	LDA #&0E
	STA &06
	LDA &7D
	JSR addr2039
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
	JSR addr28FF
	JSR addr208D
	LDA &2A
	LDX &2B
	BEQ addr1F9A
	SBC #&01
.addr1F9A
	JSR addr28FF
	JSR addr208D
	LDA &8A
	AND #&03
	BNE addr1F5B
	LDY #&00
	JSR addr2026
	STX &40
	STA &41
	LDX #&03
	STX &06
.addr1FB3
	STY &3A
	DEX
	BPL addr1FB3
	LDX #&03
	LDA &03A7
	LSR A
	LSR A
	STA &81
.addr1FC1
	SEC
	SBC #&10
	BCC addr1FD3
	STA &81
	LDA #&10
	STA &3A,X
	LDA &81
	DEX
	BPL addr1FC1
	BMI addr1FD7
.addr1FD3
	LDA &81
	STA &3A,X
.addr1FD7
	LDA &003A,Y
	STY &1B
	JSR addr203A
	LDY &1B
	INY
	CPY #&04
	BNE addr1FD7
	LDA #&78
	STA &08
	LDA #&10
	STA &07
	LDA &03A5
	JSR addr2036
	LDA &03A6
	JSR addr2036
	LDA &0365
	JSR addr2038
	JSR addr2026
	STX &41
	STA &40
	LDX #&0B
	STX &06
	LDA &0342
	JSR addr2036
	LDA &0347
	JSR addr2036
	LDA #&F0
	STA &06
	STA &41
	LDA &0FD1
	JSR addr2036
	JMP addr3634
.addr2026
	LDX #&F0
	LDA &8A
	AND #&08
	AND &03CA
	BEQ addr2033
	TXA
	BIT &0FA9
	RTS
.addr2036
	LSR A
	LSR A
.addr2038
	LSR A
.addr2039
	LSR A
.addr203A
	STA &81
	LDX #&FF
	STX &82
	CMP &06
	BCS addr2048
	LDA &41
	BNE addr204A
.addr2048
	LDA &40
.addr204A
	STA &91
	LDY #&02
	LDX #&03
.addr2050
	LDA &81
	CMP #&04
	BCC addr2070
	SBC #&04
	STA &81
	LDA &82
.addr205C
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
	BMI addr208A
	BPL addr2050
.addr2070
	EOR #&03
	STA &81
	LDA &82
.addr2076
	ASL A
	AND #&EF
	DEC &81
	BPL addr2076
	PHA
	LDA #&00
	STA &82
	LDA #&63
	STA &81
	PLA
	JMP addr205C
.addr208A
	INC &08
	RTS
.addr208D
	LDY #&01
	STA &81
.addr2091
	SEC
	LDA &81
	SBC #&04
	BCS addr20A6
	LDA #&FF
	LDX &81
	STA &81
	LDA addr16BF,X
	AND #&F0
	JMP addr20AA
.addr20A6
	STA &81
	LDA #&00
.addr20AA
	STA (&07),Y
	INY
	STA (&07),Y
	INY
	STA (&07),Y
	INY
	STA (&07),Y
	TYA
	CLC
	ADC #&05
	TAY
	CPY #&1E
	BCC addr2091
	INC &08
	RTS
.addr20C1
	JSR addr3EE1
	LDX #&0B
	STX &8C
	JSR addr2508
	BCS addr20D2
	LDX #&18
	JSR addr2508
.addr20D2
	LDA #&08
	STA &61
	LDA #&C2
	STA &64
	LSR A
	STA &66
.addr20DD
	JSR addr50A0
	JSR addr488C
	DEC &66
	BNE addr20DD
	JSR addr5558
	LDA #&00
	LDX #&10
.addr20EE
	STA &036F,X
	DEX
	BPL addr20EE
	STA &038C
	STA &0386
	LDA #&46
	STA &0365
	JMP addr143E
.addr2102
	LDA #&00
	JSR addr41BF
	BEQ addr210C
	JMP addr21C5
.addr210C
	JSR addr2160
	JSR addr43B1
	LDA #&FA
	JMP addr36E4
.addr2117
	LDA &30
	BNE addr2150
	LDA &66
	ASL A
	BMI addr2102
	LSR A
	TAX
	LDA addr1695,X
	STA &22
	LDA addr1695+1,X
	JSR addr2409
	LDA &D4
	ORA &D7
	ORA &DA
	AND #&7F
	ORA &D3
	ORA &D6
	ORA &D9
	BNE addr2166
	LDA &66
	CMP #&82
	BEQ addr2150
	LDY #&1F
	LDA (&22),Y
	BIT &216E
	BNE addr2150
	ORA #&80
	STA (&22),Y
.addr2150
	LDA &46
	ORA &49
	ORA &4C
	BNE addr215D
	LDA #&50
	JSR addr36E4
.addr215D
	JSR addr43CE
.addr2160
	ASL &65
	SEC
	ROR &65
.addr2165
	RTS
.addr2166
	JSR addr3F86
	CMP #&10
	BCS addr2174
	LDY #&20
	LDA (&22),Y
	LSR A
	BCS addr2177
.addr2174
	JMP addr221A
.addr2177
	JMP addr3813
.addr217A
	LDY #&03
	STY &99
	INY
	STY &9A
	LDA #&16
	STA &94
	CPX #&01
	BEQ addr2117
	CPX #&02
	BNE addr21BB
	LDA &6A
	AND #&04
	BNE addr21A6
	LDA &0328
	BNE addr2165
	JSR addr3F86
	CMP #&FD
	BCC addr2165
	AND #&01
	ADC #&08
	TAX
	BNE addr21B6
.addr21A6
	JSR addr3F86
	CMP #&F0
	BCC addr2165
	LDA &032E
	CMP #&04
	BCS addr21D4
	LDX #&10
.addr21B6
	LDA #&F1
	JMP addr2592
.addr21BB
	LDY #&0E
	LDA &69
	CMP (&1E),Y
	BCS addr21C5
	INC &69
.addr21C5
	CPX #&1E
	BNE addr21D5
	LDA &033B
	BNE addr21D5
	LSR &66
	ASL &66
	LSR &61
.addr21D4
	RTS
.addr21D5
	JSR addr3F86
	LDA &6A
	LSR A
	BCC addr21E1
	CPX #&64
	BCS addr21D4
.addr21E1
	LSR A
	BCC addr21F3
	LDX &038C
	CPX #&28
	BCC addr21F3
	LDA &6A
	ORA #&04
	STA &6A
	LSR A
	LSR A
.addr21F3
	LSR A
	BCS addr2203
	LSR A
	LSR A
	BCC addr21FD
	JMP addr2346
.addr21FD
	JSR addr42AE
	JMP addr2324
.addr2203
	LSR A
	BCC addr2211
	LDA &0320
	BEQ addr2211
	LDA &66
	AND #&81
	STA &66
.addr2211
	LDX #&08
.addr2213
	LDA &46,X
	STA &D2,X
	DEX
	BPL addr2213
.addr221A
	JSR addr42BD
	JSR addr28DE
	STA &93
	LDA &8C
	CMP #&01
	BNE addr222B
	JMP addr22DD
.addr222B
	CMP #&0E
	BNE addr223B
	JSR addr3F86
	CMP #&C8
	BCC addr223B
	LDX #&17
	JMP addr21B6
.addr223B
	JSR addr3F86
	CMP #&FA
	BCC addr2249
	JSR addr3F86
	ORA #&68
	STA &63
.addr2249
	LDY #&0E
	LDA (&1E),Y
	LSR A
	CMP &69
	BCC addr2294
	LSR A
	LSR A
	CMP &69
	BCC addr226D
	JSR addr3F86
	CMP #&E6
	BCC addr226D
	LDX &8C
	LDA &563D,X
	BPL addr226D
	LDA #&00
	STA &66
	JMP addr258E
.addr226D
	LDA &65
	AND #&07
	BEQ addr2294
	STA &D1
	JSR addr3F86
	AND #&1F
	CMP &D1
	BCS addr2294
	LDA &30
	BNE addr2294
	DEC &65
	LDA &8C
	CMP #&1D
	BNE addr2291
	LDX #&1E
	LDA &66
	JMP addr2592
.addr2291
	JMP addr43BE
.addr2294
	LDA #&00
	JSR addr41BF
	AND #&E0
	BNE addr22C6
	LDX &93
	CPX #&A0
	BCC addr22C6
	LDY #&13
	LDA (&1E),Y
	AND #&F8
	BEQ addr22C6
	LDA &65
	ORA #&40
	STA &65
	CPX #&A3
	BCC addr22C6
	LDA (&1E),Y
	LSR A
	JSR addr36E4
	DEC &62
	LDA &30
	BNE addr2311
	LDA #&08
	JMP addr43F3
.addr22C6
	LDA &4D
	CMP #&03
	BCS addr22D4
	LDA &47
	ORA &4A
	AND #&FE
	BEQ addr22E6
.addr22D4
	JSR addr3F86
	ORA #&80
	CMP &66
	BCS addr22E6
.addr22DD
	JSR addr245D
	LDA &93
	EOR #&80
.addr22E4
	STA &93
.addr22E6
	LDY #&10
	JSR addr28E0
	TAX
	JSR addr2332
	STA &64
	LDA &63
	ASL A
	CMP #&20
	BCS addr2305
	LDY #&16
	JSR addr28E0
	TAX
	EOR &64
	JSR addr2332
	STA &63
.addr2305
	LDA &93
	BMI addr2312
	CMP &94
	BCC addr2312
	LDA #&03
	STA &62
.addr2311
	RTS
.addr2312
	AND #&7F
	CMP #&12
	BCC addr2323
	LDA #&FF
	LDX &8C
	CPX #&01
	BNE addr2321
	ASL A
.addr2321
	STA &62
.addr2323
	RTS
.addr2324
	JSR addr28DE
	CMP #&98
	BCC addr232F
	LDX #&00
	STX &9A
.addr232F
	JMP addr22E4
.addr2332
	EOR #&80
	AND #&80
	STA &D1
	TXA
	ASL A
	CMP &9A
	BCC addr2343
	LDA &99
	ORA &D1
	RTS
.addr2343
	LDA &D1
	RTS
.addr2346
	LDA #&06
	STA &9A
	LSR A
	STA &99
	LDA #&1D
	STA &94
	LDA &0320
	BNE addr2359
.addr2356
	JMP addr21FD
.addr2359
	JSR addr2403
	LDA &D4
	ORA &D7
	ORA &DA
	AND #&7F
	BNE addr2356
	JSR addr42E0
	LDA &81
	STA &40
	JSR addr42BD
	LDY #&0A
	JSR addr243B
	BMI addr239A
	CMP #&23
	BCC addr239A
	JSR addr28DE
	CMP #&A2
	BCS addr23B4
	LDA &40
	CMP #&9D
	BCC addr238C
	LDA &8C
	BMI addr23B4
.addr238C
	JSR addr245D
	JSR addr2324
.addr2392
	LDX #&00
	STX &62
	INX
	STX &61
	RTS
.addr239A
	JSR addr2403
	JSR addr2470
	JSR addr2470
	JSR addr42BD
	JSR addr245D
	JMP addr2324
.addr23AC
	INC &62
	LDA #&7F
	STA &63
	BNE addr23F9
.addr23B4
	LDX #&00
	STX &9A
	STX &64
	LDA &8C
	BPL addr23DE
	EOR &34
	EOR &35
	ASL A
	LDA #&02
	ROR A
	STA &63
	LDA &34
	ASL A
	CMP #&0C
	BCS addr2392
	LDA &35
	ASL A
	LDA #&02
	ROR A
	STA &64
	LDA &35
	ASL A
	CMP #&0C
	BCS addr2392
.addr23DE
	STX &63
	LDA &5C
	STA &34
	LDA &5E
	STA &35
	LDA &60
	STA &36
	LDY #&10
	JSR addr243B
	ASL A
	CMP #&42
	BCS addr23AC
	JSR addr2392
.addr23F9
	LDA &DC
	BNE addr2402
	ASL &6A
	SEC
	ROR &6A
.addr2402
	RTS
.addr2403
	LDA #&25
	STA &22
	LDA #&09
.addr2409
	STA &23
	LDY #&02
	JSR addr2417
	LDY #&05
	JSR addr2417
	LDY #&08
.addr2417
	LDA (&22),Y
	EOR #&80
	STA &43
	DEY
	LDA (&22),Y
	STA &42
	DEY
	LDA (&22),Y
	STA &41
	STY &80
	LDX &80
	JSR addr1D4C
	LDY &80
	STA &D4,X
	LDA &42
	STA &D3,X
	LDA &41
	STA &D2,X
	RTS
.addr243B
	LDX &0925,Y
	STX &81
	LDA &34
	JSR addr28D4
	LDX &0927,Y
	STX &81
	LDA &35
	JSR addr28FC
	STA &83
	STX &82
	LDX &0929,Y
	STX &81
	LDA &36
	JMP addr28FC
.addr245D
	LDA &34
	EOR #&80
	STA &34
	LDA &35
	EOR #&80
	STA &35
	LDA &36
	EOR #&80
	STA &36
	RTS
.addr2470
	JSR addr2473
.addr2473
	LDA &092F
	LDX #&00
	JSR addr2488
	LDA &0931
	LDX #&03
	JSR addr2488
	LDA &0933
	LDX #&06
.addr2488
	ASL A
	STA &82
	LDA #&00
	ROR A
	EOR #&80
	EOR &D4,X
	BMI addr249F
	LDA &82
	ADC &D2,X
	STA &D2,X
	BCC addr249E
	INC &D3,X
.addr249E
	RTS
.addr249F
	LDA &D2,X
	SEC
	SBC &82
	STA &D2,X
	LDA &D3,X
	SBC #&00
	STA &D3,X
	BCS addr249E
	LDA &D2,X
	EOR #&FF
	ADC #&01
	STA &D2,X
	LDA &D3,X
	EOR #&FF
	ADC #&00
	STA &D3,X
	LDA &D4,X
	EOR #&80
	STA &D4,X
	JMP addr249E
.addr24C7
	CLC
	LDA &4E
	BNE addr2505
	LDA &8C
	BMI addr2505
	LDA &65
	AND #&20
	ORA &47
	ORA &4A
	BNE addr2505
	LDA &46
	JSR addr280D
	STA &83
	LDA &1B
	STA &82
	LDA &49
	JSR addr280D
	TAX
	LDA &1B
	ADC &82
	STA &82
	TXA
	ADC &83
	BCS addr2506
	STA &83
	LDY #&02
	LDA (&1E),Y
	CMP &83
	BNE addr2505
	DEY
	LDA (&1E),Y
	CMP &82
.addr2505
	RTS
.addr2506
	CLC
	RTS
.addr2508
	JSR addr3F26
	LDA #&1C
	STA &49
	LSR A
	STA &4C
	LDA #&80
	STA &4B
	LDA &45
	ASL A
	ORA #&80
	STA &66
.addr251D
	LDA #&60
	STA &54
	ORA #&80
	STA &5C
	LDA &7D
	ROL A
	STA &61
	TXA
	JMP addr3768
.addr252E
	LDX #&01
	JSR addr2508
	BCC addr2589
	LDX &45
	JSR addr3732
	LDA &0311,X
	JSR addr254D
	LDY #&00
	JSR addr3805
	DEC &038B
	LDA #&30
	JMP addr43F3
.addr254D
	CMP #&02
	BEQ addr2580
	LDY #&24
	LDA (&20),Y
	AND #&20
	BEQ addr255C
	JSR addr2580
.addr255C
	LDY #&20
	LDA (&20),Y
	BEQ addr2505
	ORA #&80
	STA (&20),Y
	LDY #&1C
	LDA #&02
	STA (&20),Y
	ASL A
	LDY #&1E
	STA (&20),Y
	LDA &8C
	CMP #&0B
	BCC addr257F
	LDY #&24
	LDA (&20),Y
	ORA #&04
	STA (&20),Y
.addr257F
	RTS
.addr2580
	LDA &0949
	ORA #&04
	STA &0949
	RTS
.addr2589
	LDA #&C9
	JMP addr45C6
.addr258E
	LDX #&03
.addr2590
	LDA #&FE
.addr2592
	STA &06
	TXA
	PHA
	LDA &1E
	PHA
	LDA &1F
	PHA
	LDA &20
	PHA
	LDA &21
	PHA
	LDY #&24
.addr25A4
	LDA &0046,Y
	STA &0100,Y
	LDA (&20),Y
	STA &0046,Y
	DEY
	BPL addr25A4
	LDA &6A
	AND #&1C
	STA &6A
	LDA &8C
	CMP #&02
	BNE addr25DB
	TXA
	PHA
	LDA #&20
	STA &61
	LDX #&00
	LDA &50
	JSR addr261A
	LDX #&03
	LDA &52
	JSR addr261A
	LDX #&06
	LDA &54
	JSR addr261A
	PLA
	TAX
.addr25DB
	LDA &06
	STA &66
	LSR &63
	ASL &63
	TXA
	CMP #&09
	BCS addr25FE
	CMP #&04
	BCC addr25FE
	PHA
	JSR addr3F86
	ASL A
	STA &64
	TXA
	AND #&0F
	STA &61
	LDA #&FF
	ROR A
	STA &63
	PLA
.addr25FE
	JSR addr3768
	PLA
	STA &21
	PLA
	STA &20
	LDX #&24
.addr2609
	LDA &0100,X
	STA &46,X
	DEX
	BPL addr2609
	PLA
	STA &1F
	PLA
	STA &1E
	PLA
	TAX
	RTS
.addr261A
	ASL A
	STA &82
	LDA #&00
	ROR A
	JMP addr524C
.addr2623
	LDA #&38
	JSR addr43F3
	LDA #&01
	STA &0348
	LDA #&04
	JSR addr263D
	DEC &0348
	RTS
.addr2636
	LDA #&30
	JSR addr43F3
	LDA #&08
.addr263D
	STA &95
	JSR addr54CA
.addr2642
	LDX #&80
	STX &D2
	LDX #&60
	STX &E0
	LDX #&00
	STX &96
	STX &D3
	STX &E1
.addr2652
	JSR addr265E
	INC &96
	LDX &96
	CPX #&08
	BNE addr2652
	RTS
.addr265E
	LDA &96
	AND #&07
	CLC
	ADC #&08
	STA &40
.addr2667
	LDA #&01
	STA &6B
	JSR addr3B90
	ASL &40
	BCS addr2678
	LDA &40
	CMP #&A0
	BCC addr2667
.addr2678
	RTS
.addr2679
	LDA #&00
	CPX #&02
	ROR A
	STA &99
	EOR #&80
	STA &9A
	JSR addr272D
	LDY &03C3
.addr268A
	LDA &0FA8,Y
	STA &88
	LSR A
	LSR A
	LSR A
	JSR addr2961
	LDA &1B
	EOR &9A
	STA &83
	LDA &0F6F,Y
	STA &1B
	LDA &0F5C,Y
	STA &34
	JSR addr28FF
	STA &83
	STX &82
	LDA &0F82,Y
	STA &35
	EOR &7B
	LDX &2B
	JSR addr27C8
	JSR addr28FF
	STX &24
	STA &25
	LDX &0F95,Y
	STX &82
	LDX &35
	STX &83
	LDX &2B
	EOR &7C
	JSR addr27C8
	JSR addr28FF
	STX &26
	STA &27
	LDX &31
	EOR &32
	JSR addr27C8
	STA &81
	LDA &24
	STA &82
	LDA &25
	STA &83
	EOR #&80
	JSR addr28FC
	STA &25
	TXA
	STA &0F6F,Y
	LDA &26
	STA &82
	LDA &27
	STA &83
	JSR addr28FC
	STA &83
	STX &82
	LDA #&00
	STA &1B
	LDA &8D
	JSR addr1907
	LDA &25
	STA &0F5C,Y
	STA &34
	AND #&7F
	CMP #&74
	BCS addr2748
	LDA &27
	STA &0F82,Y
	STA &35
	AND #&7F
	CMP #&74
	BCS addr275B
.addr2724
	JSR addr1910
	DEY
	BEQ addr272D
	JMP addr268A
.addr272D
	LDA &8D
	EOR &99
	STA &8D
	LDA &32
	EOR &99
	STA &32
	EOR #&80
	STA &33
	LDA &7B
	EOR &99
	STA &7B
	EOR #&80
	STA &7C
	RTS
.addr2748
	JSR addr3F86
	STA &35
	STA &0F82,Y
	LDA #&73
	ORA &99
	STA &34
	STA &0F5C,Y
	BNE addr276C
.addr275B
	JSR addr3F86
	STA &34
	STA &0F5C,Y
	LDA #&6E
	ORA &33
	STA &35
	STA &0F82,Y
.addr276C
	JSR addr3F86
	ORA #&08
	STA &88
	STA &0FA8,Y
	BNE addr2724
.addr2778
	STA &40
	STA &41
	STA &42
	STA &43
	CLC
	RTS
.addr2782
	STA &82
	AND #&7F
	STA &42
	LDA &81
	AND #&7F
	BEQ addr2778
	SEC
	SBC #&01
	STA &D1
	LDA &1C
	LSR &42
	ROR A
	STA &41
	LDA &1B
	ROR A
	STA &40
	LDA #&00
	LDX #&18
.addr27A3
	BCC addr27A7
	ADC &D1
.addr27A7
	ROR A
	ROR &42
	ROR &41
	ROR &40
	DEX
	BNE addr27A3
	STA &D1
	LDA &82
	EOR &81
	AND #&80
	ORA &D1
	STA &43
	RTS
.addr27BE
	LDX &24
	STX &82
	LDX &25
	STX &83
.addr27C6
	LDX &31
.addr27C8
	STX &1B
	TAX
	AND #&80
	STA &D1
	TXA
	AND #&7F
	BEQ addr2838
	TAX
	DEX
	STX &06
	LDA #&00
	LSR &1B
	BCC addr27E0
	ADC &06
.addr27E0
	ROR A
	ROR &1B
	BCC addr27E7
	ADC &06
.addr27E7
	ROR A
	ROR &1B
	BCC addr27EE
	ADC &06
.addr27EE
	ROR A
	ROR &1B
	BCC addr27F5
	ADC &06
.addr27F5
	ROR A
	ROR &1B
	BCC addr27FC
	ADC &06
.addr27FC
	ROR A
	ROR &1B
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	LSR A
	ROR &1B
	ORA &D1
	RTS
.addr280B
	AND #&7F
.addr280D
	STA &1B
	TAX
	BNE addr2824
.addr2812
	CLC
	STX &1B
	TXA
	RTS
.addr2817
	LDA &0F82,Y
	STA &35
.addr281C
	AND #&7F
	STA &1B
.addr2820
	LDX &81
	BEQ addr2812
.addr2824
	DEX
	STX &D1
	LDA #&00
	LDX #&08
	LSR &1B
.addr282D
	BCC addr2831
	ADC &D1
.addr2831
	ROR A
	ROR &1B
	DEX
	BNE addr282D
	RTS
.addr2838
	STA &1C
	STA &1B
	RTS
.addr283D
	AND #&1F
	TAX
	LDA &07C0,X
	STA &81
	LDA &40
.addr2847
	EOR #&FF
	SEC
	ROR A
	STA &1B
	LDA #&00
.addr284F
	BCS addr2859
	ADC &81
	ROR A
	LSR &1B
	BNE addr284F
	RTS
.addr2859
	LSR A
	LSR &1B
	BNE addr284F
	RTS
	LDX &81
	BEQ addr2812
	DEX
	STX &D1
	LDA #&00
	LDX #&08
	LSR &1B
.addr286C
	BCC addr2870
	ADC &D1
.addr2870
	ROR A
	ROR &1B
	DEX
	BNE addr286C
	RTS
.addr2877
	STX &81
.addr2879
	EOR #&FF
	LSR A
	STA &1C
	LDA #&00
	LDX #&10
	ROR &1B
.addr2884
	BCS addr2891
	ADC &81
	ROR A
	ROR &1C
	ROR &1B
	DEX
	BNE addr2884
	RTS
.addr2891
	LSR A
	ROR &1C
	ROR &1B
	DEX
	BNE addr2884
	RTS
	LDX &31
	STX &1B
.addr289E
	LDX &25
	STX &83
.addr28A2
	LDX &24
	STX &82
.addr28A6
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
	BEQ addr28D1
	TAX
	DEX
	STX &06
	LDA #&00
	LDX #&07
.addr28C1
	BCC addr28C5
	ADC &06
.addr28C5
	ROR A
	ROR &1B
	DEX
	BNE addr28C1
	LSR A
	ROR &1B
	ORA &D1
	RTS
.addr28D1
	STA &1B
	RTS
.addr28D4
	JSR addr28A6
	STA &83
	LDA &1B
	STA &82
	RTS
.addr28DE
	LDY #&0A
.addr28E0
	LDX &46,Y
	STX &81
	LDA &34
	JSR addr28D4
	LDX &48,Y
	STX &81
	LDA &35
	JSR addr28FC
	STA &83
	STX &82
	LDX &4A,Y
	STX &81
	LDA &36
.addr28FC
	JSR addr28A6
.addr28FF
	STA &06
	AND #&80
	STA &D1
	EOR &83
	BMI addr2916
	LDA &82
	CLC
	ADC &1B
	TAX
	LDA &83
	ADC &06
	ORA &D1
	RTS
.addr2916
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
	BCS addr2938
	STA &80
	TXA
	EOR #&FF
	ADC #&01
	TAX
	LDA #&00
	SBC &80
	ORA #&80
.addr2938
	EOR &D1
	RTS
.addr293B
	STX &81
	EOR #&80
	JSR addr28FC
	TAX
	AND #&80
	STA &D1
	TXA
	AND #&7F
	LDX #&FE
	STX &06
.addr294E
	ASL A
	CMP #&60
	BCC addr2955
	SBC #&60
.addr2955
	ROL &06
	BCS addr294E
	LDA &06
	ORA &D1
	RTS
.addr295E
	LDA &0FA8,Y
.addr2961
	STA &81
	LDA &7D
.addr2965
	LDX #&08
	ASL A
	STA &1B
	LDA #&00
.addr296C
	ROL A
	BCS addr2973
	CMP &81
	BCC addr2976
.addr2973
	SBC &81
	SEC
.addr2976
	ROL &1B
	DEX
	BNE addr296C
	JMP addr47F3
.addr297E
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
.addr29A0
	CMP #&40
	BCS addr29AC
	ASL &1B
	ROL &1C
	ROL A
	INY
	BNE addr29A0
.addr29AC
	STA &1D
	LDA &83
	AND #&7F
	BMI addr29BC
.addr29B4
	DEY
	ASL &81
	ROL &82
	ROL A
	BPL addr29B4
.addr29BC
	STA &81
	LDA #&FE
	STA &82
	LDA &1D
	JSR addr47F7
	LDA #&00
	STA &41
	STA &42
	STA &43
	TYA
	BPL addr29F0
	LDA &82
.addr29D4
	ASL A
	ROL &41
	ROL &42
	ROL &43
	INY
	BNE addr29D4
	STA &40
	LDA &43
	ORA &D1
	STA &43
	RTS
.addr29E7
	LDA &82
	STA &40
	LDA &D1
	STA &43
	RTS
.addr29F0
	BEQ addr29E7
	LDA &82
.addr29F4
	LSR A
	DEY
	BNE addr29F4
	STA &40
	LDA &D1
	STA &43
	RTS
.addr29FF
	LDA &033F
	BNE addr2A09
	LDA &03C7
	BNE addr2A15
.addr2A09
	TXA
	BPL addr2A0F
	DEX
	BMI addr2A15
.addr2A0F
	INX
	BNE addr2A15
	DEX
	BEQ addr2A0F
.addr2A15
	RTS
.addr2A16
	STA &D1
	TXA
	CLC
	ADC &D1
	TAX
	BCC addr2A21
	LDX #&FF
.addr2A21
	BPL addr2A33
.addr2A23
	LDA &D1
	RTS
.addr2A26
	STA &D1
	TXA
	SEC
	SBC &D1
	TAX
	BCS addr2A31
	LDX #&01
.addr2A31
	BPL addr2A23
.addr2A33
	LDA &03C8
	BNE addr2A23
	LDX #&80
	BMI addr2A23
.addr2A3C
	LDA &1B
	EOR &81
	STA &06
	LDA &81
	BEQ addr2A6B
	ASL A
	STA &81
	LDA &1B
	ASL A
	CMP &81
	BCS addr2A59
	JSR addr2A75
	SEC
.addr2A54
	LDX &06
	BMI addr2A6E
	RTS
.addr2A59
	LDX &81
	STA &81
	STX &1B
	TXA
	JSR addr2A75
	STA &D1
	LDA #&40
	SBC &D1
	BCS addr2A54
.addr2A6B
	LDA #&3F
	RTS
.addr2A6E
	STA &D1
	LDA #&80
	SBC &D1
	RTS
.addr2A75
	JSR addr47EF
	LDA &82
	LSR A
	LSR A
	LSR A
	TAX
	LDA &07E0,X
.addr2A81
	RTS
.addr2A82
	JSR addr3F86
	AND #&07
	ADC #&5C
	STA &0FCF
	JSR addr3F86
	AND #&07
	ADC #&7C
	STA &0FCE
	LDA &0347
	ADC #&08
	STA &0347
	JSR addr3629
.addr2AA1
	LDA &87
	BNE addr2A81
	LDA #&20
	LDY #&E0
	JSR addr2AB0
	LDA #&30
	LDY #&D0
.addr2AB0
	STA &36
	LDA &0FCE
	STA &34
	LDA &0FCF
	STA &35
	LDA #&BF
	STA &37
	JSR addr16C4
	LDA &0FCE
	STA &34
	LDA &0FCF
	STA &35
	STY &36
	LDA #&BF
	STA &37
	JMP addr16C4

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
2AF7  90 0B              ..   BCC addr2B04
.addr2AF9
2AF9  7D 6F 03           }o.  ADC &036F,X
2AFC  CA                 .    DEX
2AFD  10 FA              ..   BPL addr2AF9
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
2B0E  20 11 2B            .+  JSR addr2B11
.addr2B11
2B11  20 14 2B            .+  JSR addr2B14
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
2B41  D0 03              ..   BNE addr2B46
2B43  E6 2D              .-   INC &2D
2B45  60                 `    RTS
.addr2B46
2B46  A9 BF              ..   LDA #&BF
2B48  20 95 33            .3  JSR addr3395
2B4B  AE BF 03           ...  LDX &03BF
2B4E  AC C0 03           ...  LDY &03C0
2B51  38                 8    SEC
2B52  20 B4 30            .0  JSR addr30B4
2B55  A9 C3              ..   LDA #&C3
.addr2B57
2B57  20 9A 33            .3  JSR addr339A
.addr2B5A
2B5A  E6 2D              .-   INC &2D
.addr2B5C
2B5C  A9 80              ..   LDA #&80
2B5E  85 72              .r   STA &72
.addr2B60
2B60  A9 0C              ..   LDA #&0C
2B62  4C 9A 33           L.3  JMP addr339A
.addr2B65
2B65  A9 AD              ..   LDA #&AD
2B67  20 9A 33            .3  JSR addr339A
2B6A  4C A9 2B           L.+  JMP addr2BA9
.addr2B6D
2B6D  20 9A 33            .3  JSR addr339A
2B70  4C 42 31           LB1  JMP addr3142
.addr2B73
2B73  A9 01              ..   LDA #&01
2B75  20 C8 54            .T  JSR addr54C8
2B78  A9 09              ..   LDA #&09
2B7A  85 2C              .,   STA &2C
2B7C  A9 A3              ..   LDA #&A3
2B7E  20 9A 33            .3  JSR addr339A
2B81  20 4E 18            N.  JSR addr184E
2B84  20 5A 2B            Z+  JSR addr2B5A
2B87  E6 2D              .-   INC &2D
2B89  20 3B 2B            ;+  JSR addr2B3B
2B8C  A9 C2              ..   LDA #&C2
2B8E  20 95 33            .3  JSR addr3395
2B91  AD B8 03           ...  LDA &03B8
2B94  18                 .    CLC
2B95  69 01              i.   ADC #&01
2B97  4A                 J    LSR A
2B98  C9 02              ..   CMP #&02
2B9A  F0 C9              ..   BEQ addr2B65
2B9C  AD B8 03           ...  LDA &03B8
2B9F  90 03              ..   BCC addr2BA4
2BA1  E9 05              ..   SBC #&05
2BA3  18                 .    CLC
.addr2BA4
2BA4  69 AA              i.   ADC #&AA
2BA6  20 9A 33            .3  JSR addr339A
.addr2BA9
2BA9  AD B8 03           ...  LDA &03B8
2BAC  4A                 J    LSR A
2BAD  4A                 J    LSR A
2BAE  18                 .    CLC
2BAF  69 A8              i.   ADC #&A8
2BB1  20 57 2B            W+  JSR addr2B57
2BB4  A9 A2              ..   LDA #&A2
2BB6  20 95 33            .3  JSR addr3395
2BB9  AD B9 03           ...  LDA &03B9
2BBC  18                 .    CLC
2BBD  69 B1              i.   ADC #&B1
2BBF  20 57 2B            W+  JSR addr2B57
2BC2  A9 C4              ..   LDA #&C4
2BC4  20 95 33            .3  JSR addr3395
2BC7  AE BA 03           ...  LDX &03BA
2BCA  E8                 .    INX
2BCB  18                 .    CLC
2BCC  20 38 1E            8.  JSR addr1E38
2BCF  20 5A 2B            Z+  JSR addr2B5A
2BD2  A9 C0              ..   LDA #&C0
2BD4  20 95 33            .3  JSR addr3395
2BD7  38                 8    SEC
2BD8  AE BB 03           ...  LDX &03BB
2BDB  20 38 1E            8.  JSR addr1E38
2BDE  A9 C6              ..   LDA #&C6
2BE0  20 57 2B            W+  JSR addr2B57
2BE3  A9 28              .(   LDA #&28
2BE5  20 9A 33            .3  JSR addr339A
2BE8  A5 70              .p   LDA &70
2BEA  30 08              0.   BMI addr2BF4
2BEC  A9 BC              ..   LDA #&BC
2BEE  20 9A 33            .3  JSR addr339A
2BF1  4C 30 2C           L0,  JMP addr2C30
.addr2BF4
2BF4  A5 71              .q   LDA &71
2BF6  4A                 J    LSR A
2BF7  4A                 J    LSR A
2BF8  48                 H    PHA
2BF9  29 07              ).   AND #&07
2BFB  C9 03              ..   CMP #&03
2BFD  B0 05              ..   BCS addr2C04
2BFF  69 E3              i.   ADC #&E3
2C01  20 6D 2B            m+  JSR addr2B6D
.addr2C04
2C04  68                 h    PLA
2C05  4A                 J    LSR A
2C06  4A                 J    LSR A
2C07  4A                 J    LSR A
2C08  C9 06              ..   CMP #&06
2C0A  B0 05              ..   BCS addr2C11
2C0C  69 E6              i.   ADC #&E6
2C0E  20 6D 2B            m+  JSR addr2B6D
.addr2C11
2C11  A5 6F              .o   LDA &6F
2C13  45 6D              Em   EOR &6D
2C15  29 07              ).   AND #&07
2C17  85 73              .s   STA &73
2C19  C9 06              ..   CMP #&06
2C1B  B0 05              ..   BCS addr2C22
2C1D  69 EC              i.   ADC #&EC
2C1F  20 6D 2B            m+  JSR addr2B6D
.addr2C22
2C22  A5 71              .q   LDA &71
2C24  29 03              ).   AND #&03
2C26  18                 .    CLC
2C27  65 73              es   ADC &73
2C29  29 07              ).   AND #&07
2C2B  69 F2              i.   ADC #&F2
2C2D  20 9A 33            .3  JSR addr339A
.addr2C30
2C30  A9 53              .S   LDA #&53
2C32  20 9A 33            .3  JSR addr339A
2C35  A9 29              .)   LDA #&29
2C37  20 57 2B            W+  JSR addr2B57
2C3A  A9 C1              ..   LDA #&C1
2C3C  20 95 33            .3  JSR addr3395
2C3F  AE BD 03           ...  LDX &03BD
2C42  AC BE 03           ...  LDY &03BE
2C45  20 B3 30            .0  JSR addr30B3
2C48  20 42 31            B1  JSR addr3142
2C4B  A9 00              ..   LDA #&00
2C4D  85 72              .r   STA &72
2C4F  A9 4D              .M   LDA #&4D
2C51  20 9A 33            .3  JSR addr339A
2C54  A9 E2              ..   LDA #&E2
2C56  20 57 2B            W+  JSR addr2B57
2C59  A9 FA              ..   LDA #&FA
2C5B  20 95 33            .3  JSR addr3395
2C5E  A5 71              .q   LDA &71
2C60  A6 6F              .o   LDX &6F
2C62  29 0F              ).   AND #&0F
2C64  18                 .    CLC
2C65  69 0B              i.   ADC #&0B
2C67  A8                 .    TAY
2C68  20 B4 30            .0  JSR addr30B4
2C6B  20 42 31            B1  JSR addr3142
2C6E  A9 6B              .k   LDA #&6B
2C70  20 FC 1E            ..  JSR addr1EFC
2C73  A9 6D              .m   LDA #&6D
2C75  4C FC 1E           L..  JMP addr1EFC
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
2C8A  D0 08              ..   BNE addr2C94
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
2CCE  20 20 28             (  JSR addr2820
2CD1  AD BB 03           ...  LDA &03BB
2CD4  85 81              ..   STA &81
2CD6  20 20 28             (  JSR addr2820
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
2CED  20 C8 54            .T  JSR addr54C8
2CF0  A9 07              ..   LDA #&07
2CF2  85 2C              .,   STA &2C
2CF4  20 6A 2F            j/  JSR addr2F6A
2CF7  A9 C7              ..   LDA #&C7
2CF9  20 9A 33            .3  JSR addr339A
2CFC  20 4E 18            N.  JSR addr184E
2CFF  A9 98              ..   LDA #&98
2D01  20 52 18            R.  JSR addr1852
2D04  20 A1 2D            .-  JSR addr2DA1
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
2D1C  20 32 19            2.  JSR addr1932
2D1F  20 0E 2B            .+  JSR addr2B0E
2D22  A6 84              ..   LDX &84
2D24  E8                 .    INX
2D25  D0 E2              ..   BNE addr2D09
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
2D3A  10 02              ..   BPL addr2D3E
2D3C  A9 00              ..   LDA #&00
.addr2D3E
2D3E  85 78              .x   STA &78
2D40  A5 73              .s   LDA &73
2D42  38                 8    SEC
2D43  E5 75              .u   SBC &75
2D45  B0 02              ..   BCS addr2D49
2D47  A9 00              ..   LDA #&00
.addr2D49
2D49  85 34              .4   STA &34
2D4B  A5 73              .s   LDA &73
2D4D  18                 .    CLC
2D4E  65 75              eu   ADC &75
2D50  90 02              ..   BCC addr2D54
2D52  A9 FF              ..   LDA #&FF
.addr2D54
2D54  85 36              .6   STA &36
2D56  A5 74              .t   LDA &74
2D58  18                 .    CLC
2D59  65 78              ex   ADC &78
2D5B  85 35              .5   STA &35
2D5D  20 68 18            h.  JSR addr1868
2D60  A5 74              .t   LDA &74
2D62  38                 8    SEC
2D63  E5 75              .u   SBC &75
2D65  B0 02              ..   BCS addr2D69
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
2D77  90 06              ..   BCC addr2D7F
2D79  A6 87              ..   LDX &87
2D7B  30 02              0.   BMI addr2D7F
2D7D  A9 97              ..   LDA #&97
.addr2D7F
2D7F  85 37              .7   STA &37
2D81  A5 73              .s   LDA &73
2D83  85 34              .4   STA &34
2D85  85 36              .6   STA &36
2D87  4C C4 16           L..  JMP addr16C4
.addr2D8A
2D8A  A9 68              .h   LDA #&68
2D8C  85 73              .s   STA &73
2D8E  A9 5A              .Z   LDA #&5A
2D90  85 74              .t   STA &74
2D92  A9 10              ..   LDA #&10
2D94  85 75              .u   STA &75
2D96  20 36 2D            6-  JSR addr2D36
2D99  AD 65 03           .e.  LDA &0365
2D9C  85 40              .@   STA &40
2D9E  4C C5 2D           L.-  JMP addr2DC5
.addr2DA1
2DA1  A5 87              ..   LDA &87
2DA3  30 E5              0.   BMI addr2D8A
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
2DBB  20 36 2D            6-  JSR addr2D36
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
2DDA  20 90 3B            .;  JSR addr3B90
2DDD  60                 `    RTS
.addr2DDE
2DDE  A0 00              ..   LDY #&00
.addr2DE0
2DE0  8C AD 03           ...  STY &03AD
2DE3  BE 6F 03           .o.  LDX &036F,Y
2DE6  F0 24              .$   BEQ addr2E0C
2DE8  98                 .    TYA
2DE9  0A                 .    ASL A
2DEA  0A                 .    ASL A
2DEB  A8                 .    TAY
2DEC  B9 1A 46           ..F  LDA &461A,Y
2DEF  85 74              .t   STA &74
2DF1  8A                 .    TXA
2DF2  48                 H    PHA
2DF3  20 5C 2B            \+  JSR addr2B5C
2DF6  18                 .    CLC
2DF7  AD AD 03           ...  LDA &03AD
2DFA  69 D0              i.   ADC #&D0
2DFC  20 9A 33            .3  JSR addr339A
2DFF  A9 0E              ..   LDA #&0E
2E01  85 2C              .,   STA &2C
2E03  68                 h    PLA
2E04  AA                 .    TAX
2E05  18                 .    CLC
2E06  20 38 1E            8.  JSR addr1E38
2E09  20 35 31            51  JSR addr3135
.addr2E0C
2E0C  AC AD 03           ...  LDY &03AD
2E0F  C8                 .    INY
2E10  C0 11              ..   CPY #&11
2E12  90 CC              ..   BCC addr2DE0
2E14  60                 `    RTS
.addr2E15
2E15  A9 08              ..   LDA #&08
2E17  20 C8 54            .T  JSR addr54C8
2E1A  A9 0B              ..   LDA #&0B
2E1C  85 2C              .,   STA &2C
2E1E  A9 A4              ..   LDA #&A4
2E20  20 57 2B            W+  JSR addr2B57
2E23  20 4A 18            J.  JSR addr184A
2E26  20 66 33            f3  JSR addr3366
2E29  AD 6E 03           .n.  LDA &036E
2E2C  C9 1A              ..   CMP #&1A
2E2E  90 05              ..   BCC addr2E35
2E30  A9 6B              .k   LDA #&6B
2E32  20 9A 33            .3  JSR addr339A
.addr2E35
2E35  4C DE 2D           L.-  JMP addr2DDE
.addr2E38
2E38  8A                 .    TXA
2E39  48                 H    PHA
2E3A  88                 .    DEY
2E3B  98                 .    TYA
2E3C  49 FF              I.   EOR #&FF
2E3E  48                 H    PHA
2E3F  20 F7 55            .U  JSR addr55F7
2E42  20 65 2E            e.  JSR addr2E65
2E45  68                 h    PLA
2E46  85 76              .v   STA &76
2E48  AD C2 03           ...  LDA &03C2
2E4B  20 7B 2E            {.  JSR addr2E7B
2E4E  A5 77              .w   LDA &77
2E50  8D C2 03           ...  STA &03C2
2E53  85 74              .t   STA &74
2E55  68                 h    PLA
2E56  85 76              .v   STA &76
2E58  AD C1 03           ...  LDA &03C1
2E5B  20 7B 2E            {.  JSR addr2E7B
2E5E  A5 77              .w   LDA &77
2E60  8D C1 03           ...  STA &03C1
2E63  85 73              .s   STA &73
.addr2E65
2E65  A5 87              ..   LDA &87
2E67  30 23              0#   BMI addr2E8C
2E69  AD C1 03           ...  LDA &03C1
2E6C  85 73              .s   STA &73
2E6E  AD C2 03           ...  LDA &03C2
2E71  4A                 J    LSR A
2E72  85 74              .t   STA &74
2E74  A9 04              ..   LDA #&04
2E76  85 75              .u   STA &75
2E78  4C 36 2D           L6-  JMP addr2D36
.addr2E7B
2E7B  85 77              .w   STA &77
2E7D  18                 .    CLC
2E7E  65 76              ev   ADC &76
2E80  A6 76              .v   LDX &76
2E82  30 03              0.   BMI addr2E87
2E84  90 03              ..   BCC addr2E89
2E86  60                 `    RTS
.addr2E87
2E87  90 02              ..   BCC addr2E8B
.addr2E89
2E89  85 77              .w   STA &77
.addr2E8B
2E8B  60                 `    RTS
.addr2E8C
2E8C  AD C1 03           ...  LDA &03C1
2E8F  38                 8    SEC
2E90  ED 59 03           .Y.  SBC &0359
2E93  C9 26              .&   CMP #&26
2E95  90 04              ..   BCC addr2E9B
2E97  C9 E6              ..   CMP #&E6
2E99  90 F0              ..   BCC addr2E8B
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
2EAB  90 04              ..   BCC addr2EB1
2EAD  C9 DC              ..   CMP #&DC
2EAF  90 DA              ..   BCC addr2E8B
.addr2EB1
2EB1  0A                 .    ASL A
2EB2  18                 .    CLC
2EB3  69 5A              iZ   ADC #&5A
2EB5  85 74              .t   STA &74
2EB7  A9 08              ..   LDA #&08
2EB9  85 75              .u   STA &75
2EBB  4C 36 2D           L6-  JMP addr2D36
.addr2EBE
2EBE  A9 80              ..   LDA #&80
2EC0  20 C8 54            .T  JSR addr54C8
2EC3  A9 07              ..   LDA #&07
2EC5  85 2C              .,   STA &2C
2EC7  A9 BE              ..   LDA #&BE
2EC9  20 47 18            G.  JSR addr1847
2ECC  20 A1 2D            .-  JSR addr2DA1
2ECF  20 65 2E            e.  JSR addr2E65
2ED2  20 6A 2F            j/  JSR addr2F6A
2ED5  A9 00              ..   LDA #&00
2ED7  85 97              ..   STA &97
2ED9  A2 18              ..   LDX #&18
.addr2EDB
2EDB  95 46              .F   STA &46,X
2EDD  CA                 .    DEX
2EDE  10 FB              ..   BPL addr2EDB
.addr2EE0
2EE0  A5 6F              .o   LDA &6F
2EE2  38                 8    SEC
2EE3  ED 59 03           .Y.  SBC &0359
2EE6  B0 04              ..   BCS addr2EEC
2EE8  49 FF              I.   EOR #&FF
2EEA  69 01              i.   ADC #&01
.addr2EEC
2EEC  C9 14              ..   CMP #&14
2EEE  B0 70              .p   BCS addr2F60
2EF0  A5 6D              .m   LDA &6D
2EF2  38                 8    SEC
2EF3  ED 5A 03           .Z.  SBC &035A
2EF6  B0 04              ..   BCS addr2EFC
2EF8  49 FF              I.   EOR #&FF
2EFA  69 01              i.   ADC #&01
.addr2EFC
2EFC  C9 26              .&   CMP #&26
2EFE  B0 60              .`   BCS addr2F60
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
2F24  F0 0B              ..   BEQ addr2F31
2F26  C8                 .    INY
2F27  B6 46              .F   LDX &46,Y
2F29  F0 06              ..   BEQ addr2F31
2F2B  88                 .    DEY
2F2C  88                 .    DEY
2F2D  B6 46              .F   LDX &46,Y
2F2F  D0 12              ..   BNE addr2F43
.addr2F31
2F31  84 2D              .-   STY &2D
2F33  C0 03              ..   CPY #&03
2F35  90 29              .)   BCC addr2F60
2F37  A9 FF              ..   LDA #&FF
2F39  99 46 00           .F.  STA &0046,Y
2F3C  A9 80              ..   LDA #&80
2F3E  85 72              .r   STA &72
2F40  20 0A 33            .3  JSR addr330A
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
2F57  20 0A 36            .6  JSR addr360A
2F5A  20 54 3A            T:  JSR addr3A54
2F5D  20 0A 36            .6  JSR addr360A
.addr2F60
2F60  20 0E 2B            .+  JSR addr2B0E
2F63  E6 97              ..   INC &97
2F65  F0 0D              ..   BEQ addr2F74
2F67  4C E0 2E           L..  JMP addr2EE0
.addr2F6A
2F6A  A2 05              ..   LDX #&05
.addr2F6C
2F6C  BD 5B 03           .[.  LDA &035B,X
2F6F  95 6C              .l   STA &6C,X
2F71  CA                 .    DEX
2F72  10 F8              ..   BPL addr2F6C
.addr2F74
2F74  60                 `    RTS
.addr2F75
2F75  20 6A 2F            j/  JSR addr2F6A
2F78  A0 7F              .   LDY #&7F
2F7A  84 D1              ..   STY &D1
2F7C  A9 00              ..   LDA #&00
2F7E  85 80              ..   STA &80
.addr2F80
2F80  A5 6F              .o   LDA &6F
2F82  38                 8    SEC
2F83  ED C1 03           ...  SBC &03C1
2F86  B0 04              ..   BCS addr2F8C
2F88  49 FF              I.   EOR #&FF
2F8A  69 01              i.   ADC #&01
.addr2F8C
2F8C  4A                 J    LSR A
2F8D  85 83              ..   STA &83
2F8F  A5 6D              .m   LDA &6D
2F91  38                 8    SEC
2F92  ED C2 03           ...  SBC &03C2
2F95  B0 04              ..   BCS addr2F9B
2F97  49 FF              I.   EOR #&FF
2F99  69 01              i.   ADC #&01
.addr2F9B
2F9B  4A                 J    LSR A
2F9C  18                 .    CLC
2F9D  65 83              e.   ADC &83
2F9F  C5 D1              ..   CMP &D1
2FA1  B0 0B              ..   BCS addr2FAE
2FA3  85 D1              ..   STA &D1
2FA5  A2 05              ..   LDX #&05
.addr2FA7
2FA7  B5 6C              .l   LDA &6C,X
2FA9  95 73              .s   STA &73,X
2FAB  CA                 .    DEX
2FAC  10 F9              ..   BPL addr2FA7
.addr2FAE
2FAE  20 0E 2B            .+  JSR addr2B0E
2FB1  E6 80              ..   INC &80
2FB3  D0 CB              ..   BNE addr2F80
2FB5  A2 05              ..   LDX #&05
.addr2FB7
2FB7  B5 73              .s   LDA &73,X
2FB9  95 6C              .l   STA &6C,X
2FBB  CA                 .    DEX
2FBC  10 F9              ..   BPL addr2FB7
2FBE  A5 6D              .m   LDA &6D
2FC0  8D C2 03           ...  STA &03C2
2FC3  A5 6F              .o   LDA &6F
2FC5  8D C1 03           ...  STA &03C1
2FC8  38                 8    SEC
2FC9  ED 59 03           .Y.  SBC &0359
2FCC  B0 04              ..   BCS addr2FD2
2FCE  49 FF              I.   EOR #&FF
2FD0  69 01              i.   ADC #&01
.addr2FD2
2FD2  20 0D 28            .(  JSR addr280D
2FD5  85 41              .A   STA &41
2FD7  A5 1B              ..   LDA &1B
2FD9  85 40              .@   STA &40
2FDB  AD C2 03           ...  LDA &03C2
2FDE  38                 8    SEC
2FDF  ED 5A 03           .Z.  SBC &035A
2FE2  B0 04              ..   BCS addr2FE8
2FE4  49 FF              I.   EOR #&FF
2FE6  69 01              i.   ADC #&01
.addr2FE8
2FE8  4A                 J    LSR A
2FE9  20 0D 28            .(  JSR addr280D
2FEC  48                 H    PHA
2FED  A5 1B              ..   LDA &1B
2FEF  18                 .    CLC
2FF0  65 40              e@   ADC &40
2FF2  85 81              ..   STA &81
2FF4  68                 h    PLA
2FF5  65 41              eA   ADC &41
2FF7  85 82              ..   STA &82
2FF9  20 B8 47            .G  JSR addr47B8
2FFC  A5 81              ..   LDA &81
2FFE  0A                 .    ASL A
2FFF  A2 00              ..   LDX #&00
3001  8E C0 03           ...  STX &03C0
3004  2E C0 03           ...  ROL &03C0
3007  0A                 .    ASL A
3008  2E C0 03           ...  ROL &03C0
300B  8D BF 03           ...  STA &03BF
300E  4C 78 2C           Lx,  JMP addr2C78
.addr3011
3011  A5 2F              ./   LDA &2F
3013  05 8E              ..   ORA &8E
3015  D0 6E              .n   BNE addr3085
3017  20 37 44            7D  JSR addr4437
301A  30 42              0B   BMI addr305E
301C  A5 87              ..   LDA &87
301E  D0 03              ..   BNE addr3023
3020  4C C3 30           L.0  JMP addr30C3
.addr3023
3023  20 FE 32            .2  JSR addr32FE
.addr3026
3026  AD BF 03           ...  LDA &03BF
3029  0D C0 03           ...  ORA &03C0
302C  F0 57              .W   BEQ addr3085
302E  A9 07              ..   LDA #&07
3030  85 2C              .,   STA &2C
3032  A9 17              ..   LDA #&17
3034  85 2D              .-   STA &2D
3036  A9 00              ..   LDA #&00
3038  85 72              .r   STA &72
303A  A9 BD              ..   LDA #&BD
303C  20 9A 33            .3  JSR addr339A
303F  AD C0 03           ...  LDA &03C0
3042  D0 75              .u   BNE addr30B9
3044  AD 65 03           .e.  LDA &0365
3047  CD BF 03           ...  CMP &03BF
304A  90 6D              .m   BCC addr30B9
304C  A9 2D              .-   LDA #&2D
304E  20 9A 33            .3  JSR addr339A
3051  20 0A 33            .3  JSR addr330A
.addr3054
3054  A9 0F              ..   LDA #&0F
3056  85 2F              ./   STA &2F
3058  85 2E              ..   STA &2E
305A  AA                 .    TAX
305B  4C AC 30           L.0  JMP addr30AC
.addr305E
305E  AE 85 03           ...  LDX &0385
3061  F0 22              ."   BEQ addr3085
3063  E8                 .    INX
3064  8E 85 03           ...  STX &0385
3067  8E 8C 03           ...  STX &038C
306A  20 54 30            T0  JSR addr3054
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
3082  10 F6              ..   BPL addr307A
3084  A9 60              .`   LDA #&60
3086  8D C1 03           ...  STA &03C1
3089  8D C2 03           ...  STA &03C2
308C  20 92 32            .2  JSR addr3292
308F  20 75 2F            u/  JSR addr2F75
3092  A2 00              ..   LDX #&00
3094  8E BF 03           ...  STX &03BF
3097  8E C0 03           ...  STX &03C0
309A  A9 74              .t   LDA #&74
309C  20 C6 45            .E  JSR addr45C6
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
30B6  4C 3C 1E           L<.  JMP addr1E3C
.addr30B9
30B9  A9 CA              ..   LDA #&CA
30BB  20 9A 33            .3  JSR addr339A
30BE  A9 3F              .?   LDA #&3F
30C0  4C 9A 33           L.3  JMP addr339A
.addr30C3
30C3  20 75 2F            u/  JSR addr2F75
30C6  4C 26 30           L&0  JMP addr3026
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
30D7  20 9A 33            .3  JSR addr339A
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
30F2  20 35 31            51  JSR addr3135
30F5  20 8E 31            .1  JSR addr318E
30F8  A5 74              .t   LDA &74
30FA  30 08              0.   BMI addr3104
30FC  AD AA 03           ...  LDA &03AA
30FF  65 76              ev   ADC &76
3101  4C 0A 31           L.1  JMP addr310A
.addr3104
3104  AD AA 03           ...  LDA &03AA
3107  38                 8    SEC
3108  E5 76              .v   SBC &76
.addr310A
310A  8D AA 03           ...  STA &03AA
310D  85 1B              ..   STA &1B
310F  A9 00              ..   LDA #&00
3111  20 F4 32            .2  JSR addr32F4
3114  38                 8    SEC
3115  20 B4 30            .0  JSR addr30B4
3118  A4 77              .w   LDY &77
311A  A9 05              ..   LDA #&05
311C  BE 8D 03           ...  LDX &038D,Y
311F  8E AB 03           ...  STX &03AB
3122  18                 .    CLC
3123  F0 06              ..   BEQ addr312B
3125  20 3A 1E            :.  JSR addr1E3A
3128  4C 35 31           L51  JMP addr3135
.addr312B
312B  A5 2C              .,   LDA &2C
312D  69 04              i.   ADC #&04
312F  85 2C              .,   STA &2C
3131  A9 2D              .-   LDA #&2D
3133  D0 0F              ..   BNE addr3144
.addr3135
3135  A5 74              .t   LDA &74
3137  29 60              )`   AND #&60
3139  F0 0C              ..   BEQ addr3147
313B  C9 20              .    CMP #&20
313D  F0 0F              ..   BEQ addr314E
313F  20 53 31            S1  JSR addr3153
.addr3142
3142  A9 20              .    LDA #&20
.addr3144
3144  4C 9A 33           L.3  JMP addr339A
.addr3147
3147  A9 74              .t   LDA #&74
3149  20 FC 1E            ..  JSR addr1EFC
314C  90 F4              ..   BCC addr3142
.addr314E
314E  A9 6B              .k   LDA #&6B
3150  20 FC 1E            ..  JSR addr1EFC
.addr3153
3153  A9 67              .g   LDA #&67
3155  4C FC 1E           L..  JMP addr1EFC
.addr3158
3158  A9 11              ..   LDA #&11
315A  85 2C              .,   STA &2C
315C  A9 FF              ..   LDA #&FF
315E  D0 E4              ..   BNE addr3144
.addr3160
3160  A9 10              ..   LDA #&10
3162  20 C8 54            .T  JSR addr54C8
3165  A9 05              ..   LDA #&05
3167  85 2C              .,   STA &2C
3169  A9 A7              ..   LDA #&A7
316B  20 47 18            G.  JSR addr1847
316E  A9 03              ..   LDA #&03
3170  85 2D              .-   STA &2D
3172  20 58 31            X1  JSR addr3158
3175  A9 00              ..   LDA #&00
3177  8D AD 03           ...  STA &03AD
.addr317A
317A  A2 80              ..   LDX #&80
317C  86 72              .r   STX &72
317E  20 C9 30            .0  JSR addr30C9
3181  E6 2D              .-   INC &2D
3183  EE AD 03           ...  INC &03AD
3186  AD AD 03           ...  LDA &03AD
3189  C9 11              ..   CMP #&11
318B  90 ED              ..   BCC addr317A
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
319E  30 05              0.   BMI addr31A5
31A0  65 75              eu   ADC &75
31A2  4C 9D 31           L.1  JMP addr319D
.addr31A5
31A5  85 76              .v   STA &76
31A7  60                 `    RTS
31A8  20 75 2F            u/  JSR addr2F75
.addr31AB
31AB  20 9F 30            .0  JSR addr309F
31AE  A2 05              ..   LDX #&05
.addr31B0
31B0  B5 6C              .l   LDA &6C,X
31B2  9D B2 03           ...  STA &03B2,X
31B5  CA                 .    DEX
31B6  10 F8              ..   BPL addr31B0
31B8  E8                 .    INX
31B9  8E 49 03           .I.  STX &0349
31BC  AD B8 03           ...  LDA &03B8
31BF  8D AC 03           ...  STA &03AC
31C2  AD BA 03           ...  LDA &03BA
31C5  8D AF 03           ...  STA &03AF
31C8  AD B9 03           ...  LDA &03B9
31CB  8D AE 03           ...  STA &03AE
31CE  20 86 3F            .?  JSR addr3F86
31D1  8D 9E 03           ...  STA &039E
31D4  A2 00              ..   LDX #&00
31D6  86 96              ..   STX &96
.addr31D8
31D8  BD 1A 46           ..F  LDA &461A,X
31DB  85 74              .t   STA &74
31DD  20 8E 31            .1  JSR addr318E
31E0  BD 1C 46           ..F  LDA &461C,X
31E3  2D 9E 03           -..  AND &039E
31E6  18                 .    CLC
31E7  7D 1B 46           }.F  ADC &461B,X
31EA  A4 74              .t   LDY &74
31EC  30 06              0.   BMI addr31F4
31EE  38                 8    SEC
31EF  E5 76              .v   SBC &76
31F1  4C F7 31           L.1  JMP addr31F7
.addr31F4
31F4  18                 .    CLC
31F5  65 76              ev   ADC &76
.addr31F7
31F7  10 02              ..   BPL addr31FB
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
320B  90 CB              ..   BCC addr31D8
320D  60                 `    RTS
.addr320E
320E  20 62 3F            b?  JSR addr3F62
3211  A9 FF              ..   LDA #&FF
3213  85 66              .f   STA &66
3215  A9 1D              ..   LDA #&1D
3217  20 68 37            h7  JSR addr3768
321A  A9 1E              ..   LDA #&1E
321C  4C 68 37           Lh7  JMP addr3768
.addr321F
321F  4E 66 03           Nf.  LSR &0366
3222  38                 8    SEC
3223  2E 66 03           .f.  ROL &0366
.addr3226
3226  A9 03              ..   LDA #&03
3228  20 7E 42            ~B  JSR addr427E
322B  A9 03              ..   LDA #&03
322D  20 C8 54            .T  JSR addr54C8
3230  20 23 26            #&  JSR addr2623
3233  20 E1 3E            .>  JSR addr3EE1
3236  8C 41 03           .A.  STY &0341
.addr3239
3239  20 0E 32            .2  JSR addr320E
323C  A9 03              ..   LDA #&03
323E  CD 3B 03           .;.  CMP &033B
3241  B0 F6              ..   BCS addr3239
3243  8D C3 03           ...  STA &03C3
3246  A2 00              ..   LDX #&00
3248  20 93 54            .T  JSR addr5493
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
3260  D0 06              ..   BNE addr3268
3262  20 C8 54            .T  JSR addr54C8
3265  20 23 26            #&  JSR addr2623
.addr3268
3268  20 37 44            7D  JSR addr4437
326B  2D C9 03           -..  AND &03C9
326E  30 AF              0.   BMI addr321F
3270  20 86 3F            .?  JSR addr3F86
3273  C9 FD              ..   CMP #&FD
3275  B0 AF              ..   BCS addr3226
3277  20 AB 31            .1  JSR addr31AB
327A  20 E1 3E            .>  JSR addr3EE1
327D  20 80 35            .5  JSR addr3580
3280  20 55 42            UB  JSR addr4255
3283  A5 87              ..   LDA &87
3285  29 3F              )?   AND #&3F
3287  D0 67              .g   BNE addr32F0
3289  20 CA 54            .T  JSR addr54CA
328C  A5 87              ..   LDA &87
328E  D0 38              .8   BNE addr32C8
3290  E6 87              ..   INC &87
.addr3292
3292  A6 8E              ..   LDX &8E
3294  F0 2B              .+   BEQ addr32C1
3296  20 36 26            6&  JSR addr2636
3299  20 E1 3E            .>  JSR addr3EE1
329C  20 75 2F            u/  JSR addr2F75
329F  E6 4E              .N   INC &4E
32A1  20 6D 35            m5  JSR addr356D
32A4  A9 80              ..   LDA #&80
32A6  85 4E              .N   STA &4E
32A8  E6 4D              .M   INC &4D
32AA  20 40 37            @7  JSR addr3740
32AD  A9 0C              ..   LDA #&0C
32AF  85 7D              .}   STA &7D
32B1  20 A6 41            .A  JSR addr41A6
32B4  0D 8C 03           ...  ORA &038C
32B7  8D 8C 03           ...  STA &038C
32BA  A9 FF              ..   LDA #&FF
32BC  85 87              ..   STA &87
32BE  20 42 26            B&  JSR addr2642
.addr32C1
32C1  A2 00              ..   LDX #&00
32C3  86 8E              ..   STX &8E
32C5  4C 93 54           L.T  JMP addr5493
.addr32C8
32C8  30 03              0.   BMI addr32CD
32CA  4C EB 2C           L.,  JMP addr2CEB
.addr32CD
32CD  4C BE 2E           L..  JMP addr2EBE
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
32F1  20 20 28             (  JSR addr2820
.addr32F4
32F4  06 1B              ..   ASL &1B
32F6  2A                 *    ROL A
32F7  06 1B              ..   ASL &1B
32F9  2A                 *    ROL A
32FA  A8                 .    TAY
32FB  A6 1B              ..   LDX &1B
32FD  60                 `    RTS
.addr32FE
32FE  20 65 2E            e.  JSR addr2E65
3301  20 75 2F            u/  JSR addr2F75
3304  20 65 2E            e.  JSR addr2E65
3307  4C 37 55           L7U  JMP addr5537
.addr330A
330A  A2 05              ..   LDX #&05
.addr330C
330C  B5 6C              .l   LDA &6C,X
330E  95 73              .s   STA &73,X
3310  CA                 .    DEX
3311  10 F9              ..   BPL addr330C
3313  A0 03              ..   LDY #&03
3315  24 6C              $l   BIT &6C
3317  70 01              p.   BVS addr331A
3319  88                 .    DEY
.addr331A
331A  84 D1              ..   STY &D1
.addr331C
331C  A5 71              .q   LDA &71
331E  29 1F              ).   AND #&1F
3320  F0 05              ..   BEQ addr3327
3322  09 80              ..   ORA #&80
3324  20 9A 33            .3  JSR addr339A
.addr3327
3327  20 14 2B            .+  JSR addr2B14
332A  C6 D1              ..   DEC &D1
332C  10 EE              ..   BPL addr331C
332E  A2 05              ..   LDX #&05
.addr3330
3330  B5 73              .s   LDA &73,X
3332  95 6C              .l   STA &6C,X
3334  CA                 .    DEX
3335  10 F9              ..   BPL addr3330
3337  60                 `    RTS
.addr3338
3338  A0 00              ..   LDY #&00
.addr333A
333A  B9 50 03           .P.  LDA &0350,Y
333D  C9 0D              ..   CMP #&0D
333F  F0 06              ..   BEQ addr3347
3341  20 FC 1E            ..  JSR addr1EFC
3344  C8                 .    INY
3345  D0 F3              ..   BNE addr333A
.addr3347
3347  60                 `    RTS
.addr3348
3348  20 4E 33            N3  JSR addr334E
334B  20 0A 33            .3  JSR addr330A
.addr334E
334E  A2 05              ..   LDX #&05
.addr3350
3350  B5 6C              .l   LDA &6C,X
3352  BC B2 03           ...  LDY &03B2,X
3355  9D B2 03           ...  STA &03B2,X
3358  94 6C              .l   STY &6C
335A  CA                 .    DEX
335B  10 F3              ..   BPL addr3350
335D  60                 `    RTS
.addr335E
335E  18                 .    CLC
335F  AE 67 03           .g.  LDX &0367
3362  E8                 .    INX
3363  4C 38 1E           L8.  JMP addr1E38
.addr3366
3366  A9 69              .i   LDA #&69
3368  20 95 33            .3  JSR addr3395
336B  AE 65 03           .e.  LDX &0365
336E  38                 8    SEC
336F  20 38 1E            8.  JSR addr1E38
3372  A9 C3              ..   LDA #&C3
3374  20 8F 33            .3  JSR addr338F
3377  A9 77              .w   LDA #&77
3379  D0 1F              ..   BNE addr339A
.addr337B
337B  A2 03              ..   LDX #&03
.addr337D
337D  BD 61 03           .a.  LDA &0361,X
3380  95 40              .@   STA &40,X
3382  CA                 .    DEX
3383  10 F8              ..   BPL addr337D
3385  A9 09              ..   LDA #&09
3387  85 80              ..   STA &80
3389  38                 8    SEC
338A  20 48 1E            H.  JSR addr1E48
338D  A9 E2              ..   LDA #&E2
.addr338F
338F  20 9A 33            .3  JSR addr339A
3392  4C 60 2B           L`+  JMP addr2B60
.addr3395
3395  20 9A 33            .3  JSR addr339A
.addr3398
3398  A9 3A              .:   LDA #&3A
.addr339A
339A  AA                 .    TAX
339B  F0 DE              ..   BEQ addr337B
339D  30 74              0t   BMI addr3413
339F  CA                 .    DEX
33A0  F0 BC              ..   BEQ addr335E
33A2  CA                 .    DEX
33A3  F0 A3              ..   BEQ addr3348
33A5  CA                 .    DEX
33A6  D0 03              ..   BNE addr33AB
33A8  4C 0A 33           L.3  JMP addr330A
.addr33AB
33AB  CA                 .    DEX
33AC  F0 8A              ..   BEQ addr3338
33AE  CA                 .    DEX
33AF  F0 B5              ..   BEQ addr3366
33B1  CA                 .    DEX
33B2  D0 05              ..   BNE addr33B9
33B4  A9 80              ..   LDA #&80
33B6  85 72              .r   STA &72
33B8  60                 `    RTS
.addr33B9
33B9  CA                 .    DEX
33BA  CA                 .    DEX
33BB  D0 03              ..   BNE addr33C0
33BD  86 72              .r   STX &72
33BF  60                 `    RTS
.addr33C0
33C0  CA                 .    DEX
33C1  F0 38              .8   BEQ addr33FB
33C3  C9 60              .`   CMP #&60
33C5  B0 66              .f   BCS addr342D
33C7  C9 0E              ..   CMP #&0E
33C9  90 04              ..   BCC addr33CF
33CB  C9 20              .    CMP #&20
33CD  90 28              .(   BCC addr33F7
.addr33CF
33CF  A6 72              .r   LDX &72
33D1  F0 3D              .=   BEQ addr3410
33D3  30 11              0.   BMI addr33E6
33D5  24 72              $r   BIT &72
33D7  70 30              p0   BVS addr3409
.addr33D9
33D9  C9 41              .A   CMP #&41
33DB  90 06              ..   BCC addr33E3
33DD  C9 5B              .[   CMP #&5B
33DF  B0 02              ..   BCS addr33E3
33E1  69 20              i    ADC #&20
.addr33E3
33E3  4C FC 1E           L..  JMP addr1EFC
.addr33E6
33E6  24 72              $r   BIT &72
33E8  70 17              p.   BVS addr3401
33EA  C9 41              .A   CMP #&41
33EC  90 22              ."   BCC addr3410
33EE  48                 H    PHA
33EF  8A                 .    TXA
33F0  09 40              .@   ORA #&40
33F2  85 72              .r   STA &72
33F4  68                 h    PLA
33F5  D0 EC              ..   BNE addr33E3
.addr33F7
33F7  69 72              ir   ADC #&72
33F9  D0 32              .2   BNE addr342D
.addr33FB
33FB  A9 15              ..   LDA #&15
33FD  85 2C              .,   STA &2C
33FF  D0 97              ..   BNE addr3398
.addr3401
3401  E0 FF              ..   CPX #&FF
3403  F0 63              .c   BEQ addr3468
3405  C9 41              .A   CMP #&41
3407  B0 D0              ..   BCS addr33D9
.addr3409
3409  48                 H    PHA
340A  8A                 .    TXA
340B  29 BF              ).   AND #&BF
340D  85 72              .r   STA &72
340F  68                 h    PLA
.addr3410
3410  4C FC 1E           L..  JMP addr1EFC
.addr3413
3413  C9 A0              ..   CMP #&A0
3415  B0 14              ..   BCS addr342B
3417  29 7F              )   AND #&7F
3419  0A                 .    ASL A
341A  A8                 .    TAY
341B  B9 80 08           ...  LDA &0880,Y
341E  20 9A 33            .3  JSR addr339A
3421  B9 81 08           ...  LDA &0881,Y
3424  C9 3F              .?   CMP #&3F
3426  F0 40              .@   BEQ addr3468
3428  4C 9A 33           L.3  JMP addr339A
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
3439  F0 13              ..   BEQ addr344E
.addr343B
343B  B1 22              ."   LDA (&22),Y
343D  F0 07              ..   BEQ addr3446
343F  C8                 .    INY
3440  D0 F9              ..   BNE addr343B
3442  E6 23              .#   INC &23
3444  D0 F5              ..   BNE addr343B
.addr3446
3446  C8                 .    INY
3447  D0 02              ..   BNE addr344B
3449  E6 23              .#   INC &23
.addr344B
344B  CA                 .    DEX
344C  D0 ED              ..   BNE addr343B
.addr344E
344E  98                 .    TYA
344F  48                 H    PHA
3450  A5 23              .#   LDA &23
3452  48                 H    PHA
3453  B1 22              ."   LDA (&22),Y
3455  49 23              I#   EOR #&23
3457  20 9A 33            .3  JSR addr339A
345A  68                 h    PLA
345B  85 23              .#   STA &23
345D  68                 h    PLA
345E  A8                 .    TAY
345F  C8                 .    INY
3460  D0 02              ..   BNE addr3464
3462  E6 23              .#   INC &23
.addr3464
3464  B1 22              ."   LDA (&22),Y
3466  D0 E6              ..   BNE addr344E
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
3474  F0 03              ..   BEQ addr3479
3476  20 D3 34            .4  JSR addr34D3
.addr3479
3479  A5 4C              .L   LDA &4C
347B  85 D1              ..   STA &D1
347D  A5 4D              .M   LDA &4D
347F  C9 20              .    CMP #&20
3481  90 04              ..   BCC addr3487
3483  A9 FE              ..   LDA #&FE
3485  D0 08              ..   BNE addr348F
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
3497  B0 D0              ..   BCS addr3469
3499  91 67              .g   STA (&67),Y
349B  20 65 29            e)  JSR addr2965
349E  A5 1B              ..   LDA &1B
34A0  C9 1C              ..   CMP #&1C
34A2  90 04              ..   BCC addr34A8
34A4  A9 FE              ..   LDA #&FE
34A6  D0 09              ..   BNE addr34B1
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
34BC  F0 AA              ..   BEQ addr3468
34BE  A0 02              ..   LDY #&02
34C0  B1 67              .g   LDA (&67),Y
34C2  A8                 .    TAY
.addr34C3
34C3  B9 F9 00           ...  LDA &00F9,Y
34C6  91 67              .g   STA (&67),Y
34C8  88                 .    DEY
34C9  C0 06              ..   CPY #&06
34CB  D0 F6              ..   BNE addr34C3
34CD  A5 65              .e   LDA &65
34CF  09 40              .@   ORA #&40
34D1  85 65              .e   STA &65
.addr34D3
34D3  A0 00              ..   LDY #&00
34D5  B1 67              .g   LDA (&67),Y
34D7  85 81              ..   STA &81
34D9  C8                 .    INY
34DA  B1 67              .g   LDA (&67),Y
34DC  10 02              ..   BPL addr34E0
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
34F9  10 F8              ..   BPL addr34F3
34FB  84 93              ..   STY &93
34FD  A0 02              ..   LDY #&02
.addr34FF
34FF  C8                 .    INY
3500  B1 67              .g   LDA (&67),Y
3502  45 93              E.   EOR &93
3504  99 FD FF           ...  STA &FFFD,Y
3507  C0 06              ..   CPY #&06
3509  D0 F4              ..   BNE addr34FF
350B  A4 80              ..   LDY &80
.addr350D
350D  20 85 3F            .?  JSR addr3F85
3510  85 88              ..   STA &88
3512  A5 D3              ..   LDA &D3
3514  85 82              ..   STA &82
3516  A5 D2              ..   LDA &D2
3518  20 4B 35            K5  JSR addr354B
351B  D0 28              .(   BNE addr3545
351D  E0 BF              ..   CPX #&BF
351F  B0 24              .$   BCS addr3545
3521  86 35              .5   STX &35
3523  A5 D5              ..   LDA &D5
3525  85 82              ..   STA &82
3527  A5 D4              ..   LDA &D4
3529  20 4B 35            K5  JSR addr354B
352C  D0 05              ..   BNE addr3533
352E  A5 35              .5   LDA &35
3530  20 32 19            2.  JSR addr1932
.addr3533
3533  88                 .    DEY
3534  10 D7              ..   BPL addr350D
3536  A4 93              ..   LDY &93
3538  C4 8F              ..   CPY &8F
353A  90 B5              ..   BCC addr34F1
353C  68                 h    PLA
353D  85 01              ..   STA &01
353F  AD 06 09           ...  LDA &0906
3542  85 03              ..   STA &03
3544  60                 `    RTS
.addr3545
3545  20 85 3F            .?  JSR addr3F85
3548  4C 33 35           L35  JMP addr3533
.addr354B
354B  85 83              ..   STA &83
354D  20 85 3F            .?  JSR addr3F85
3550  2A                 *    ROL A
3551  B0 0B              ..   BCS addr355E
3553  20 47 28            G(  JSR addr2847
3556  65 82              e.   ADC &82
3558  AA                 .    TAX
3559  A5 83              ..   LDA &83
355B  69 00              i.   ADC #&00
355D  60                 `    RTS
.addr355E
355E  20 47 28            G(  JSR addr2847
3561  85 D1              ..   STA &D1
3563  A5 82              ..   LDA &82
3565  E5 D1              ..   SBC &D1
3567  AA                 .    TAX
3568  A5 83              ..   LDA &83
356A  E9 00              ..   SBC #&00
356C  60                 `    RTS
.addr356D
356D  20 3B 3F            ;?  JSR addr3F3B
3570  A9 7F              .   LDA #&7F
3572  85 63              .c   STA &63
3574  85 64              .d   STA &64
3576  AD AF 03           ...  LDA &03AF
3579  29 02              ).   AND #&02
357B  09 80              ..   ORA #&80
357D  4C 68 37           Lh7  JMP addr3768
.addr3580
3580  4E 8C 03           N..  LSR &038C
3583  20 26 3F            &?  JSR addr3F26
3586  A5 6D              .m   LDA &6D
3588  29 03              ).   AND #&03
358A  69 03              i.   ADC #&03
358C  85 4E              .N   STA &4E
358E  6A                 j    ROR A
358F  85 48              .H   STA &48
3591  85 4B              .K   STA &4B
3593  20 6D 35            m5  JSR addr356D
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
35AE  20 68 37            h7  JSR addr3768
.addr35B1
35B1  A5 87              ..   LDA &87
35B3  D0 23              .#   BNE addr35D8
.addr35B5
35B5  AC C3 03           ...  LDY &03C3
.addr35B8
35B8  20 86 3F            .?  JSR addr3F86
35BB  09 08              ..   ORA #&08
35BD  99 A8 0F           ...  STA &0FA8,Y
35C0  85 88              ..   STA &88
35C2  20 86 3F            .?  JSR addr3F86
35C5  99 5C 0F           .\.  STA &0F5C,Y
35C8  85 34              .4   STA &34
35CA  20 86 3F            .?  JSR addr3F86
35CD  99 82 0F           ...  STA &0F82,Y
35D0  85 35              .5   STA &35
35D2  20 10 19            ..  JSR addr1910
35D5  88                 .    DEY
35D6  D0 E0              ..   BNE addr35B8
.addr35D8
35D8  A2 00              ..   LDX #&00
.addr35DA
35DA  BD 11 03           ...  LDA &0311,X
35DD  F0 23              .#   BEQ addr3602
35DF  30 1E              0.   BMI addr35FF
35E1  85 8C              ..   STA &8C
35E3  20 32 37            27  JSR addr3732
35E6  A0 1F              ..   LDY #&1F
.addr35E8
35E8  B1 20              .    LDA (&20),Y
35EA  99 46 00           .F.  STA &0046,Y
35ED  88                 .    DEY
35EE  10 F8              ..   BPL addr35E8
35F0  86 84              ..   STX &84
35F2  20 58 55            XU  JSR addr5558
35F5  A6 84              ..   LDX &84
35F7  A0 1F              ..   LDY #&1F
35F9  B1 20              .    LDA (&20),Y
35FB  29 A7              ).   AND #&A7
35FD  91 20              .    STA (&20),Y
.addr35FF
35FF  E8                 .    INX
3600  D0 D8              ..   BNE addr35DA
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
3612  D0 FA              ..   BNE addr360E
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
3627  F0 FB              ..   BEQ addr3624
.addr3629
3629  CE A7 03           ...  DEC &03A7
362C  08                 .    PHP
362D  D0 03              ..   BNE addr3632
362F  EE A7 03           ...  INC &03A7
.addr3632
3632  28                 (    PLP
3633  60                 `    RTS
.addr3634
3634  20 94 36            .6  JSR addr3694
3637  AD 20 03           . .  LDA &0320
363A  D0 31              .1   BNE addr366D
363C  20 AE 42            .B  JSR addr42AE
363F  4C 70 36           Lp6  JMP addr3670
.addr3642
3642  0A                 .    ASL A
3643  AA                 .    TAX
3644  A9 00              ..   LDA #&00
3646  6A                 j    ROR A
3647  A8                 .    TAY
3648  A9 14              ..   LDA #&14
364A  85 81              ..   STA &81
364C  8A                 .    TXA
364D  20 65 29            e)  JSR addr2965
3650  A6 1B              ..   LDX &1B
3652  98                 .    TYA
3653  30 03              0.   BMI addr3658
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
3668  10 F8              ..   BPL addr3662
366A  4C BD 42           L.B  JMP addr42BD
.addr366D
366D  20 60 36            `6  JSR addr3660
.addr3670
3670  A5 34              .4   LDA &34
3672  20 42 36            B6  JSR addr3642
3675  8A                 .    TXA
3676  69 C3              i.   ADC #&C3
3678  8D A8 03           ...  STA &03A8
367B  A5 35              .5   LDA &35
367D  20 42 36            B6  JSR addr3642
3680  86 D1              ..   STX &D1
3682  A9 CC              ..   LDA #&CC
3684  E5 D1              ..   SBC &D1
3686  8D A9 03           ...  STA &03A9
3689  A9 F0              ..   LDA #&F0
368B  A6 36              .6   LDX &36
368D  10 02              ..   BPL addr3691
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
36A5  D0 05              ..   BNE addr36AC
.addr36A7
36A7  20 AC 36            .6  JSR addr36AC
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
36C6  BD BF 16           ...  LDA addr16BF,X
36C9  25 91              %.   AND &91
36CB  51 07              Q.   EOR (&07),Y
36CD  91 07              ..   STA (&07),Y
36CF  BD C0 16           ...  LDA &16C0,X
36D2  10 09              ..   BPL addr36DD
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
36EC  30 10              0.   BMI addr36FE
36EE  AD A5 03           ...  LDA &03A5
36F1  E5 D1              ..   SBC &D1
36F3  90 04              ..   BCC addr36F9
36F5  8D A5 03           ...  STA &03A5
36F8  60                 `    RTS
.addr36F9
36F9  8E A5 03           ...  STX &03A5
36FC  90 0E              ..   BCC addr370C
.addr36FE
36FE  AD A6 03           ...  LDA &03A6
3701  E5 D1              ..   SBC &D1
3703  90 04              ..   BCC addr3709
3705  8D A6 03           ...  STA &03A6
3708  60                 `    RTS
.addr3709
3709  8E A6 03           ...  STX &03A6
.addr370C
370C  6D A7 03           m..  ADC &03A7
370F  8D A7 03           ...  STA &03A7
3712  F0 02              ..   BEQ addr3716
3714  B0 03              ..   BCS addr3719
.addr3716
3716  4C C6 41           L.A  JMP addr41C6
.addr3719
3719  20 B1 43            .C  JSR addr43B1
371C  4C EA 45           L.E  JMP addr45EA
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
3735  B9 95 16           ...  LDA addr1695,Y
3738  85 20              .    STA &20
373A  B9 96 16           ...  LDA addr1695+1,Y
373D  85 21              .!   STA &21
373F  60                 `    RTS
.addr3740
3740  20 21 38            !8  JSR addr3821
3743  A2 81              ..   LDX #&81
3745  86 66              .f   STX &66
3747  A2 00              ..   LDX #&00
3749  86 64              .d   STX &64
374B  86 6A              .j   STX &6A
374D  8E 12 03           ...  STX &0312
3750  CA                 .    DEX
3751  86 63              .c   STX &63
3753  A2 0A              ..   LDX #&0A
3755  20 FC 37            .7  JSR addr37FC
3758  20 FC 37            .7  JSR addr37FC
375B  20 FC 37            .7  JSR addr37FC
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
376F  F0 07              ..   BEQ addr3778
3771  E8                 .    INX
3772  E0 0C              ..   CPX #&0C
3774  90 F6              ..   BCC addr376C
.addr3776
3776  18                 .    CLC
.addr3777
3777  60                 `    RTS
.addr3778
3778  20 32 37            27  JSR addr3732
377B  A5 D1              ..   LDA &D1
377D  30 52              0R   BMI addr37D1
377F  0A                 .    ASL A
3780  A8                 .    TAY
3781  B9 FF 55           ..U  LDA &55FF,Y
3784  F0 F0              ..   BEQ addr3776
3786  85 1F              ..   STA &1F
3788  B9 FE 55           ..U  LDA &55FE,Y
378B  85 1E              ..   STA &1E
378D  C0 04              ..   CPY #&04
378F  F0 30              .0   BEQ addr37C1
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
37AF  90 C6              ..   BCC addr3777
37B1  D0 04              ..   BNE addr37B7
37B3  C0 25              .%   CPY #&25
37B5  90 C0              ..   BCC addr3777
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
37D5  30 0E              0.   BMI addr37E5
37D7  E0 03              ..   CPX #&03
37D9  90 07              ..   BCC addr37E2
37DB  E0 0B              ..   CPX #&0B
37DD  B0 03              ..   BCS addr37E2
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
37F8  10 F8              ..   BPL addr37F2
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
380C  20 3D 38            =8  JSR addr383D
380F  8C 44 03           .D.  STY &0344
3812  60                 `    RTS
.addr3813
3813  A9 20              .    LDA #&20
3815  85 30              .0   STA &30
3817  0A                 .    ASL A
3818  20 F3 43            .C  JSR addr43F3
.addr381B
381B  A9 38              .8   LDA #&38
381D  A2 32              .2   LDX #&32
381F  D0 04              ..   BNE addr3825
.addr3821
3821  A9 C0              ..   LDA #&C0
3823  A2 35              .5   LDX #&35
.addr3825
3825  A0 38              .8   LDY #&38
3827  85 07              ..   STA &07
3829  86 1C              ..   STX &1C
382B  84 1D              ..   STY &1D
382D  A9 7D              .}   LDA #&7D
382F  4C 45 1F           LE.  JMP addr1F45
3832  E0 E0              ..   CPX #&E0
3834  80                 .    ...
3835  E0 E0              ..   CPX #&E0
3837  80                 .    ...
3838  E0 E0              ..   CPX #&E0
383A  20 E0 E0            ..  JSR addrE0E0
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
3853  D0 FB              ..   BNE addr3850
3855  60                 `    RTS
.addr3856
3856  A5 46              .F   LDA &46
3858  85 1B              ..   STA &1B
385A  A5 47              .G   LDA &47
385C  85 1C              ..   STA &1C
385E  A5 48              .H   LDA &48
3860  20 FA 3C            .<  JSR addr3CFA
3863  B0 28              .(   BCS addr388D
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
387C  20 FA 3C            .<  JSR addr3CFA
387F  B0 0C              ..   BCS addr388D
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
3891  B0 03              ..   BCS addr3896
3893  4C ED 3B           L.;  JMP addr3BED
.addr3896
3896  4C 30 3C           L0<  JMP addr3C30
.addr3899
3899  A5 4E              .N   LDA &4E
389B  30 F1              0.   BMI addr388E
389D  C9 30              .0   CMP #&30
389F  B0 ED              ..   BCS addr388E
38A1  05 4D              .M   ORA &4D
38A3  F0 E9              ..   BEQ addr388E
38A5  20 56 38            V8  JSR addr3856
38A8  B0 E4              ..   BCS addr388E
38AA  A9 60              .`   LDA #&60
38AC  85 1C              ..   STA &1C
38AE  A9 00              ..   LDA #&00
38B0  85 1B              ..   STA &1B
38B2  20 7E 29            ~)  JSR addr297E
38B5  A5 41              .A   LDA &41
38B7  F0 04              ..   BEQ addr38BD
38B9  A9 F8              ..   LDA #&F8
38BB  85 40              .@   STA &40
.addr38BD
38BD  A5 8C              ..   LDA &8C
38BF  4A                 J    LSR A
38C0  90 03              ..   BCC addr38C5
38C2  4C 54 3A           LT:  JMP addr3A54
.addr38C5
38C5  20 ED 3B            .;  JSR addr3BED
38C8  20 76 3B            v;  JSR addr3B76
38CB  B0 04              ..   BCS addr38D1
38CD  A5 41              .A   LDA &41
38CF  F0 01              ..   BEQ addr38D2
.addr38D1
38D1  60                 `    RTS
.addr38D2
38D2  A5 8C              ..   LDA &8C
38D4  C9 80              ..   CMP #&80
38D6  D0 3C              .<   BNE addr3914
38D8  A5 40              .@   LDA &40
38DA  C9 06              ..   CMP #&06
38DC  90 F3              ..   BCC addr38D1
38DE  A5 54              .T   LDA &54
38E0  49 80              I.   EOR #&80
38E2  85 1B              ..   STA &1B
38E4  A5 5A              .Z   LDA &5A
38E6  20 DB 3C            .<  JSR addr3CDB
38E9  A2 09              ..   LDX #&09
38EB  20 69 39            i9  JSR addr3969
38EE  85 9B              ..   STA &9B
38F0  84 09              ..   STY &09
38F2  20 69 39            i9  JSR addr3969
38F5  85 9C              ..   STA &9C
38F7  84 0A              ..   STY &0A
38F9  A2 0F              ..   LDX #&0F
38FB  20 EB 3C            .<  JSR addr3CEB
38FE  20 87 39            .9  JSR addr3987
3901  A5 54              .T   LDA &54
3903  49 80              I.   EOR #&80
3905  85 1B              ..   STA &1B
3907  A5 60              .`   LDA &60
3909  20 DB 3C            .<  JSR addr3CDB
390C  A2 15              ..   LDX #&15
390E  20 EB 3C            .<  JSR addr3CEB
3911  4C 87 39           L.9  JMP addr3987
.addr3914
3914  A5 5A              .Z   LDA &5A
3916  30 B9              0.   BMI addr38D1
3918  A2 0F              ..   LDX #&0F
391A  20 BA 3C            .<  JSR addr3CBA
391D  18                 .    CLC
391E  65 D2              e.   ADC &D2
3920  85 D2              ..   STA &D2
3922  98                 .    TYA
3923  65 D3              e.   ADC &D3
3925  85 D3              ..   STA &D3
3927  20 BA 3C            .<  JSR addr3CBA
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
393D  20 69 39            i9  JSR addr3969
3940  4A                 J    LSR A
3941  85 9B              ..   STA &9B
3943  84 09              ..   STY &09
3945  20 69 39            i9  JSR addr3969
3948  4A                 J    LSR A
3949  85 9C              ..   STA &9C
394B  84 0A              ..   STY &0A
394D  A2 15              ..   LDX #&15
394F  20 69 39            i9  JSR addr3969
3952  4A                 J    LSR A
3953  85 9D              ..   STA &9D
3955  84 0B              ..   STY &0B
3957  20 69 39            i9  JSR addr3969
395A  4A                 J    LSR A
395B  85 9E              ..   STA &9E
395D  84 0C              ..   STY &0C
395F  A9 40              .@   LDA #&40
3961  85 8F              ..   STA &8F
3963  A9 00              ..   LDA #&00
3965  85 94              ..   STA &94
3967  F0 22              ."   BEQ addr398B
.addr3969
3969  B5 46              .F   LDA &46,X
396B  85 1B              ..   STA &1B
396D  B5 47              .G   LDA &47,X
396F  29 7F              )   AND #&7F
3971  85 1C              ..   STA &1C
3973  B5 47              .G   LDA &47,X
3975  29 80              ).   AND #&80
3977  20 7E 29            ~)  JSR addr297E
397A  A5 40              .@   LDA &40
397C  A4 41              .A   LDY &41
397E  F0 02              ..   BEQ addr3982
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
399E  20 47 28            G(  JSR addr2847
39A1  85 82              ..   STA &82
39A3  A5 9E              ..   LDA &9E
39A5  20 47 28            G(  JSR addr2847
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
39C2  20 47 28            G(  JSR addr2847
39C5  85 42              .B   STA &42
39C7  A5 9B              ..   LDA &9B
39C9  20 47 28            G(  JSR addr2847
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
39E5  20 FF 28            .(  JSR addr28FF
39E8  85 D1              ..   STA &D1
39EA  10 0F              ..   BPL addr39FB
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
3A18  20 FF 28            .(  JSR addr28FF
3A1B  49 80              I.   EOR #&80
3A1D  85 D1              ..   STA &D1
3A1F  10 0F              ..   BPL addr3A30
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
3A30  20 6B 19            k.  JSR addr196B
3A33  C5 8F              ..   CMP &8F
3A35  F0 02              ..   BEQ addr3A39
3A37  B0 0C              ..   BCS addr3A45
.addr3A39
3A39  A5 94              ..   LDA &94
3A3B  18                 .    CLC
3A3C  65 95              e.   ADC &95
3A3E  29 3F              )?   AND #&3F
3A40  85 94              ..   STA &94
3A42  4C 92 39           L.9  JMP addr3992
.addr3A45
3A45  60                 `    RTS
.addr3A46
3A46  4C 30 3C           L0<  JMP addr3C30
.addr3A49
3A49  8A                 .    TXA
3A4A  49 FF              I.   EOR #&FF
3A4C  18                 .    CLC
3A4D  69 01              i.   ADC #&01
3A4F  AA                 .    TAX
.addr3A50
3A50  A9 FF              ..   LDA #&FF
3A52  D0 45              .E   BNE addr3A99
.addr3A54
3A54  A9 01              ..   LDA #&01
3A56  8D 00 0E           ...  STA &0E00
3A59  20 80 3C            .<  JSR addr3C80
3A5C  B0 E8              ..   BCS addr3A46
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
3A71  D0 0A              ..   BNE addr3A7D
3A73  C5 1C              ..   CMP &1C
3A75  90 06              ..   BCC addr3A7D
3A77  A5 1C              ..   LDA &1C
3A79  D0 02              ..   BNE addr3A7D
3A7B  A9 01              ..   LDA #&01
.addr3A7D
3A7D  85 8F              ..   STA &8F
3A7F  A9 BF              ..   LDA #&BF
3A81  38                 8    SEC
3A82  E5 E0              ..   SBC &E0
3A84  AA                 .    TAX
3A85  A9 00              ..   LDA #&00
3A87  E5 E1              ..   SBC &E1
3A89  30 BE              0.   BMI addr3A49
3A8B  D0 08              ..   BNE addr3A95
3A8D  E8                 .    INX
3A8E  CA                 .    DEX
3A8F  F0 BF              ..   BEQ addr3A50
3A91  E4 40              .@   CPX &40
3A93  90 04              ..   BCC addr3A99
.addr3A95
3A95  A6 40              .@   LDX &40
3A97  A9 00              ..   LDA #&00
.addr3A99
3A99  86 22              ."   STX &22
3A9B  85 23              .#   STA &23
3A9D  A5 40              .@   LDA &40
3A9F  20 0D 28            .(  JSR addr280D
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
3AB4  F0 0B              ..   BEQ addr3AC1
3AB6  B9 00 0E           ...  LDA &0E00,Y
3AB9  F0 03              ..   BEQ addr3ABE
3ABB  20 5E 18            ^.  JSR addr185E
.addr3ABE
3ABE  88                 .    DEY
3ABF  D0 F1              ..   BNE addr3AB2
.addr3AC1
3AC1  A5 22              ."   LDA &22
3AC3  20 0D 28            .(  JSR addr280D
3AC6  85 D1              ..   STA &D1
3AC8  A5 9B              ..   LDA &9B
3ACA  38                 8    SEC
3ACB  E5 1B              ..   SBC &1B
3ACD  85 81              ..   STA &81
3ACF  A5 9C              ..   LDA &9C
3AD1  E5 D1              ..   SBC &D1
3AD3  85 82              ..   STA &82
3AD5  84 35              .5   STY &35
3AD7  20 B8 47            .G  JSR addr47B8
3ADA  A4 35              .5   LDY &35
3ADC  20 86 3F            .?  JSR addr3F86
3ADF  25 93              %.   AND &93
3AE1  18                 .    CLC
3AE2  65 81              e.   ADC &81
3AE4  90 02              ..   BCC addr3AE8
3AE6  A9 FF              ..   LDA #&FF
.addr3AE8
3AE8  BE 00 0E           ...  LDX &0E00,Y
3AEB  99 00 0E           ...  STA &0E00,Y
3AEE  F0 4A              .J   BEQ addr3B3A
3AF0  A5 28              .(   LDA &28
3AF2  85 26              .&   STA &26
3AF4  A5 29              .)   LDA &29
3AF6  85 27              .'   STA &27
3AF8  8A                 .    TXA
3AF9  20 4F 3C            O<  JSR addr3C4F
3AFC  A5 34              .4   LDA &34
3AFE  85 24              .$   STA &24
3B00  A5 36              .6   LDA &36
3B02  85 25              .%   STA &25
3B04  A5 D2              ..   LDA &D2
3B06  85 26              .&   STA &26
3B08  A5 D3              ..   LDA &D3
3B0A  85 27              .'   STA &27
3B0C  B9 00 0E           ...  LDA &0E00,Y
3B0F  20 4F 3C            O<  JSR addr3C4F
3B12  B0 0B              ..   BCS addr3B1F
3B14  A5 36              .6   LDA &36
3B16  A6 24              .$   LDX &24
3B18  86 36              .6   STX &36
3B1A  85 24              .$   STA &24
3B1C  20 68 18            h.  JSR addr1868
.addr3B1F
3B1F  A5 24              .$   LDA &24
3B21  85 34              .4   STA &34
3B23  A5 25              .%   LDA &25
3B25  85 36              .6   STA &36
.addr3B27
3B27  20 68 18            h.  JSR addr1868
.addr3B2A
3B2A  88                 .    DEY
3B2B  F0 3F              .?   BEQ addr3B6C
3B2D  A5 23              .#   LDA &23
3B2F  D0 1D              ..   BNE addr3B4E
3B31  C6 22              ."   DEC &22
3B33  D0 8C              ..   BNE addr3AC1
3B35  C6 23              .#   DEC &23
.addr3B37
3B37  4C C1 3A           L.:  JMP addr3AC1
.addr3B3A
3B3A  A6 D2              ..   LDX &D2
3B3C  86 26              .&   STX &26
3B3E  A6 D3              ..   LDX &D3
3B40  86 27              .'   STX &27
3B42  20 4F 3C            O<  JSR addr3C4F
3B45  90 E0              ..   BCC addr3B27
3B47  A9 00              ..   LDA #&00
3B49  99 00 0E           ...  STA &0E00,Y
3B4C  F0 DC              ..   BEQ addr3B2A
.addr3B4E
3B4E  A6 22              ."   LDX &22
3B50  E8                 .    INX
3B51  86 22              ."   STX &22
3B53  E4 40              .@   CPX &40
3B55  90 E0              ..   BCC addr3B37
3B57  F0 DE              ..   BEQ addr3B37
3B59  A5 28              .(   LDA &28
3B5B  85 26              .&   STA &26
3B5D  A5 29              .)   LDA &29
3B5F  85 27              .'   STA &27
.addr3B61
3B61  B9 00 0E           ...  LDA &0E00,Y
3B64  F0 03              ..   BEQ addr3B69
3B66  20 5E 18            ^.  JSR addr185E
.addr3B69
3B69  88                 .    DEY
3B6A  D0 F5              ..   BNE addr3B61
.addr3B6C
3B6C  18                 .    CLC
3B6D  A5 D2              ..   LDA &D2
3B6F  85 28              .(   STA &28
3B71  A5 D3              ..   LDA &D3
3B73  85 29              .)   STA &29
.addr3B75
3B75  60                 `    RTS
.addr3B76
3B76  20 80 3C            .<  JSR addr3C80
3B79  B0 FA              ..   BCS addr3B75
3B7B  A9 00              ..   LDA #&00
3B7D  8D C0 0E           ...  STA &0EC0
3B80  A6 40              .@   LDX &40
3B82  A9 08              ..   LDA #&08
3B84  E0 08              ..   CPX #&08
3B86  90 06              ..   BCC addr3B8E
3B88  4A                 J    LSR A
3B89  E0 3C              .<   CPX #&3C
3B8B  90 01              ..   BCC addr3B8E
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
3B99  20 3D 28            =(  JSR addr283D
3B9C  A2 00              ..   LDX #&00
3B9E  86 D1              ..   STX &D1
3BA0  A6 93              ..   LDX &93
3BA2  E0 21              .!   CPX #&21
3BA4  90 0D              ..   BCC addr3BB3
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
3BC2  20 3D 28            =(  JSR addr283D
3BC5  AA                 .    TAX
3BC6  A9 00              ..   LDA #&00
3BC8  85 D1              ..   STA &D1
3BCA  A5 93              ..   LDA &93
3BCC  69 0F              i.   ADC #&0F
3BCE  29 3F              )?   AND #&3F
3BD0  C9 21              .!   CMP #&21
3BD2  90 0D              ..   BCC addr3BE1
3BD4  8A                 .    TXA
3BD5  49 FF              I.   EOR #&FF
3BD7  69 00              i.   ADC #&00
3BD9  AA                 .    TAX
3BDA  A9 FF              ..   LDA #&FF
3BDC  69 00              i.   ADC #&00
3BDE  85 D1              ..   STA &D1
3BE0  18                 .    CLC
.addr3BE1
3BE1  20 6B 19            k.  JSR addr196B
3BE4  C9 41              .A   CMP #&41
3BE6  B0 03              ..   BCS addr3BEB
3BE8  4C 97 3B           L.;  JMP addr3B97
.addr3BEB
3BEB  18                 .    CLC
3BEC  60                 `    RTS
.addr3BED
3BED  AC C0 0E           ...  LDY &0EC0
3BF0  D0 34              .4   BNE addr3C26
.addr3BF2
3BF2  C4 6B              .k   CPY &6B
3BF4  B0 30              .0   BCS addr3C26
3BF6  B9 0E 0F           ...  LDA &0F0E,Y
3BF9  C9 FF              ..   CMP #&FF
3BFB  F0 1A              ..   BEQ addr3C17
3BFD  85 37              .7   STA &37
3BFF  B9 C0 0E           ...  LDA &0EC0,Y
3C02  85 36              .6   STA &36
3C04  20 C4 16            ..  JSR addr16C4
3C07  C8                 .    INY
3C08  A5 90              ..   LDA &90
3C0A  D0 E6              ..   BNE addr3BF2
3C0C  A5 36              .6   LDA &36
3C0E  85 34              .4   STA &34
3C10  A5 37              .7   LDA &37
3C12  85 35              .5   STA &35
3C14  4C F2 3B           L.;  JMP addr3BF2
.addr3C17
3C17  C8                 .    INY
3C18  B9 C0 0E           ...  LDA &0EC0,Y
3C1B  85 34              .4   STA &34
3C1D  B9 0E 0F           ...  LDA &0F0E,Y
3C20  85 35              .5   STA &35
3C22  C8                 .    INY
3C23  4C F2 3B           L.;  JMP addr3BF2
.addr3C26
3C26  A9 01              ..   LDA #&01
3C28  85 6B              .k   STA &6B
3C2A  A9 FF              ..   LDA #&FF
3C2C  8D C0 0E           ...  STA &0EC0
.addr3C2F
3C2F  60                 `    RTS
.addr3C30
3C30  AD 00 0E           ...  LDA &0E00
3C33  30 FA              0.   BMI addr3C2F
3C35  A5 28              .(   LDA &28
3C37  85 26              .&   STA &26
3C39  A5 29              .)   LDA &29
3C3B  85 27              .'   STA &27
3C3D  A0 BF              ..   LDY #&BF
.addr3C3F
3C3F  B9 00 0E           ...  LDA &0E00,Y
3C42  F0 03              ..   BEQ addr3C47
3C44  20 5E 18            ^.  JSR addr185E
.addr3C47
3C47  88                 .    DEY
3C48  D0 F5              ..   BNE addr3C3F
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
3C5A  30 1D              0.   BMI addr3C79
3C5C  F0 04              ..   BEQ addr3C62
3C5E  A9 FE              ..   LDA #&FE
3C60  85 36              .6   STA &36
.addr3C62
3C62  A5 26              .&   LDA &26
3C64  38                 8    SEC
3C65  E5 D1              ..   SBC &D1
3C67  85 34              .4   STA &34
3C69  A5 27              .'   LDA &27
3C6B  E9 00              ..   SBC #&00
3C6D  D0 02              ..   BNE addr3C71
3C6F  18                 .    CLC
3C70  60                 `    RTS
.addr3C71
3C71  10 06              ..   BPL addr3C79
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
3C89  30 2D              0-   BMI addr3CB8
3C8B  A5 D2              ..   LDA &D2
3C8D  38                 8    SEC
3C8E  E5 40              .@   SBC &40
3C90  A5 D3              ..   LDA &D3
3C92  E9 00              ..   SBC #&00
3C94  30 02              0.   BMI addr3C98
3C96  D0 20              .    BNE addr3CB8
.addr3C98
3C98  A5 E0              ..   LDA &E0
3C9A  18                 .    CLC
3C9B  65 40              e@   ADC &40
3C9D  85 1C              ..   STA &1C
3C9F  A5 E1              ..   LDA &E1
3CA1  69 00              i.   ADC #&00
3CA3  30 13              0.   BMI addr3CB8
3CA5  85 1D              ..   STA &1D
3CA7  A5 E0              ..   LDA &E0
3CA9  38                 8    SEC
3CAA  E5 40              .@   SBC &40
3CAC  AA                 .    TAX
3CAD  A5 E1              ..   LDA &E1
3CAF  E9 00              ..   SBC #&00
3CB1  30 6A              0j   BMI addr3D1D
3CB3  D0 03              ..   BNE addr3CB8
3CB5  E0 BF              ..   CPX #&BF
3CB7  60                 `    RTS
.addr3CB8
3CB8  38                 8    SEC
3CB9  60                 `    RTS
.addr3CBA
3CBA  20 69 39            i9  JSR addr3969
3CBD  85 1B              ..   STA &1B
3CBF  A9 DE              ..   LDA #&DE
3CC1  85 81              ..   STA &81
3CC3  86 80              ..   STX &80
3CC5  20 20 28             (  JSR addr2820
3CC8  A6 80              ..   LDX &80
3CCA  A4 43              .C   LDY &43
3CCC  10 0A              ..   BPL addr3CD8
3CCE  49 FF              I.   EOR #&FF
3CD0  18                 .    CLC
3CD1  69 01              i.   ADC #&01
3CD3  F0 03              ..   BEQ addr3CD8
3CD5  A0 FF              ..   LDY #&FF
3CD7  60                 `    RTS
.addr3CD8
3CD8  A0 00              ..   LDY #&00
3CDA  60                 `    RTS
.addr3CDB
3CDB  85 81              ..   STA &81
3CDD  20 3C 2A            <*  JSR addr2A3C
3CE0  A6 54              .T   LDX &54
3CE2  30 02              0.   BMI addr3CE6
3CE4  49 80              I.   EOR #&80
.addr3CE6
3CE6  4A                 J    LSR A
3CE7  4A                 J    LSR A
3CE8  85 94              ..   STA &94
3CEA  60                 `    RTS
.addr3CEB
3CEB  20 69 39            i9  JSR addr3969
3CEE  85 9D              ..   STA &9D
3CF0  84 0B              ..   STY &0B
3CF2  20 69 39            i9  JSR addr3969
3CF5  85 9E              ..   STA &9E
3CF7  84 0C              ..   STY &0C
3CF9  60                 `    RTS
.addr3CFA
3CFA  20 7E 29            ~)  JSR addr297E
3CFD  A5 43              .C   LDA &43
3CFF  29 7F              )   AND #&7F
3D01  05 42              .B   ORA &42
3D03  D0 B3              ..   BNE addr3CB8
3D05  A6 41              .A   LDX &41
3D07  E0 04              ..   CPX #&04
3D09  B0 13              ..   BCS addr3D1E
3D0B  A5 43              .C   LDA &43
3D0D  10 0F              ..   BPL addr3D1E
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
3D1F  20 AF 44            .D  JSR addr44AF
3D22  AD CD 03           ...  LDA &03CD
3D25  F0 25              .%   BEQ addr3D4C
3D27  AD 4C 03           .L.  LDA &034C
3D2A  49 FF              I.   EOR #&FF
3D2C  20 34 3D            4=  JSR addr3D34
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
3D55  D0 01              ..   BNE addr3D58
3D57  CA                 .    DEX
.addr3D58
3D58  C9 79              .y   CMP #&79
3D5A  D0 01              ..   BNE addr3D5D
3D5C  E8                 .    INX
.addr3D5D
3D5D  C9 39              .9   CMP #&39
3D5F  D0 01              ..   BNE addr3D62
3D61  C8                 .    INY
.addr3D62
3D62  C9 29              .)   CMP #&29
3D64  D0 01              ..   BNE addr3D67
3D66  88                 .    DEY
.addr3D67
3D67  60                 `    RTS
.addr3D68
3D68  A2 01              ..   LDX #&01
.addr3D6A
3D6A  BD 59 03           .Y.  LDA &0359,X
3D6D  9D C1 03           ...  STA &03C1,X
3D70  CA                 .    DEX
3D71  10 F7              ..   BPL addr3D6A
3D73  60                 `    RTS
.addr3D74
3D74  A5 1B              ..   LDA &1B
3D76  8D B0 03           ...  STA &03B0
3D79  A5 1C              ..   LDA &1C
3D7B  8D B1 03           ...  STA &03B1
3D7E  60                 `    RTS
.addr3D7F
3D7F  A6 84              ..   LDX &84
3D81  20 D8 3D            .=  JSR addr3DD8
3D84  A6 84              ..   LDX &84
3D86  4C 76 13           Lv.  JMP addr1376
.addr3D89
3D89  20 26 3F            &?  JSR addr3F26
3D8C  20 0A 36            .6  JSR addr360A
3D8F  8D 12 03           ...  STA &0312
3D92  8D 20 03           . .  STA &0320
3D95  20 21 38            !8  JSR addr3821
3D98  A9 06              ..   LDA #&06
3D9A  85 4B              .K   STA &4B
3D9C  A9 81              ..   LDA #&81
3D9E  4C 68 37           Lh7  JMP addr3768
.addr3DA1
3DA1  A2 FF              ..   LDX #&FF
.addr3DA3
3DA3  E8                 .    INX
3DA4  BD 11 03           ...  LDA &0311,X
3DA7  F0 CB              ..   BEQ addr3D74
3DA9  C9 01              ..   CMP #&01
3DAB  D0 F6              ..   BNE addr3DA3
3DAD  8A                 .    TXA
3DAE  0A                 .    ASL A
3DAF  A8                 .    TAY
3DB0  B9 95 16           ...  LDA addr1695,Y
3DB3  85 07              ..   STA &07
3DB5  B9 96 16           ...  LDA addr1695+1,Y
3DB8  85 08              ..   STA &08
3DBA  A0 20              .    LDY #&20
3DBC  B1 07              ..   LDA (&07),Y
3DBE  10 E3              ..   BPL addr3DA3
3DC0  29 7F              )   AND #&7F
3DC2  4A                 J    LSR A
3DC3  C5 96              ..   CMP &96
3DC5  90 DC              ..   BCC addr3DA3
3DC7  F0 09              ..   BEQ addr3DD2
3DC9  E9 01              ..   SBC #&01
3DCB  0A                 .    ASL A
3DCC  09 80              ..   ORA #&80
3DCE  91 07              ..   STA (&07),Y
3DD0  D0 D1              ..   BNE addr3DA3
.addr3DD2
3DD2  A9 00              ..   LDA #&00
3DD4  91 07              ..   STA (&07),Y
3DD6  F0 CB              ..   BEQ addr3DA3
.addr3DD8
3DD8  86 96              ..   STX &96
3DDA  E4 45              .E   CPX &45
3DDC  D0 0A              ..   BNE addr3DE8
3DDE  A0 EE              ..   LDY #&EE
3DE0  20 05 38            .8  JSR addr3805
3DE3  A9 C8              ..   LDA #&C8
3DE5  20 C6 45            .E  JSR addr45C6
.addr3DE8
3DE8  A4 96              ..   LDY &96
3DEA  BE 11 03           ...  LDX &0311,Y
3DED  E0 02              ..   CPX #&02
3DEF  F0 98              ..   BEQ addr3D89
3DF1  E0 1F              ..   CPX #&1F
3DF3  D0 08              ..   BNE addr3DFD
3DF5  AD 58 03           .X.  LDA &0358
3DF8  09 02              ..   ORA #&02
3DFA  8D 58 03           .X.  STA &0358
.addr3DFD
3DFD  E0 03              ..   CPX #&03
3DFF  90 07              ..   BCC addr3E08
3E01  E0 0B              ..   CPX #&0B
3E03  B0 03              ..   BCS addr3E08
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
3E26  D0 03              ..   BNE addr3E2B
3E28  4C A1 3D           L.=  JMP addr3DA1
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
3E4D  B9 95 16           ...  LDA addr1695,Y
3E50  85 07              ..   STA &07
3E52  B9 96 16           ...  LDA addr1695+1,Y
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
3E7A  10 F9              ..   BPL addr3E75
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
3E8C  D0 F8              ..   BNE addr3E86
3E8E  F0 8F              ..   BEQ addr3E1F
3E90  12                 .    ...
3E91  01 00              ..   ORA (&00,X)
3E93  10 12              ..   BPL addr3EA7
3E95  02                 .    ...
3E96  2C 08 11           ,..  BIT &1108
3E99  03                 .    ...
3E9A  F0 18              ..   BEQ addr3EB4
3E9C  10 F1              ..   BPL addr3E8F
3E9E  07                 .    ...
3E9F  1A                 .    ...
3EA0  03                 .    ...
3EA1  F1 BC              ..   SBC (&BC),Y
3EA3  01 13              ..   ORA (&13,X)
3EA5  F4                 .    ...
3EA6  0C                 .    ...
.addr3EA7
3EA7  08                 .    PHP
3EA8  10 F1              ..   BPL addr3E9B
3EAA  06 0C              ..   ASL &0C
3EAC  10 02              ..   BPL addr3EB0
3EAE  60                 `    RTS
3EAF  10 13              ..   BPL addr3EC4
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
3EBC  D0 0E              ..   BNE addr3ECC
3EBE  AD 59 03           .Y.  LDA &0359
3EC1  C9 90              ..   CMP #&90
3EC3  D0 07              ..   BNE addr3ECC
3EC5  AD 5A 03           .Z.  LDA &035A
3EC8  C9 21              .!   CMP #&21
3ECA  F0 01              ..   BEQ addr3ECD
.addr3ECC
3ECC  18                 .    CLC
.addr3ECD
3ECD  60                 `    RTS
.addr3ECE
3ECE  20 96 42            .B  JSR addr4296
3ED1  A2 08              ..   LDX #&08
.addr3ED3
3ED3  95 2A              .*   STA &2A,X
3ED5  CA                 .    DEX
3ED6  10 FB              ..   BPL addr3ED3
3ED8  8A                 .    TXA
3ED9  A2 02              ..   LDX #&02
.addr3EDB
3EDB  9D A5 03           ...  STA &03A5,X
3EDE  CA                 .    DEX
3EDF  10 FA              ..   BPL addr3EDB
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
3F04  F0 03              ..   BEQ addr3F09
3F06  20 21 38            !8  JSR addr3821
.addr3F09
3F09  A5 30              .0   LDA &30
3F0B  F0 03              ..   BEQ addr3F10
3F0D  20 A3 43            .C  JSR addr43A3
.addr3F10
3F10  20 D8 35            .5  JSR addr35D8
3F13  20 96 42            .B  JSR addr4296
3F16  A9 FF              ..   LDA #&FF
3F18  8D B0 03           ...  STA &03B0
3F1B  A9 0C              ..   LDA #&0C
3F1D  8D B1 03           ...  STA &03B1
3F20  20 62 1F            b.  JSR addr1F62
3F23  20 A4 44            .D  JSR addr44A4
.addr3F26
3F26  A0 24              .$   LDY #&24
3F28  A9 00              ..   LDA #&00
.addr3F2A
3F2A  99 46 00           .F.  STA &0046,Y
3F2D  88                 .    DEY
3F2E  10 FA              ..   BPL addr3F2A
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
3F40  F0 09              ..   BEQ addr3F4B
3F42  A0 00              ..   LDY #&00
3F44  20 3D 38            =8  JSR addr383D
3F47  CA                 .    DEX
3F48  D0 F3              ..   BNE addr3F3D
3F4A  60                 `    RTS
.addr3F4B
3F4B  A0 EE              ..   LDY #&EE
3F4D  20 3D 38            =8  JSR addr383D
3F50  CA                 .    DEX
3F51  D0 F8              ..   BNE addr3F4B
3F53  60                 `    RTS
.addr3F54
3F54  AD A4 03           ...  LDA &03A4
3F57  20 C6 45            .E  JSR addr45C6
3F5A  A9 00              ..   LDA #&00
3F5C  8D 4A 03           .J.  STA &034A
3F5F  4C CD 3F           L.?  JMP addr3FCD
.addr3F62
3F62  20 26 3F            &?  JSR addr3F26
3F65  20 86 3F            .?  JSR addr3F86
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
3F7B  20 86 3F            .?  JSR addr3F86
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
3F9A  20 86 3F            .?  JSR addr3F86
3F9D  4A                 J    LSR A
3F9E  85 66              .f   STA &66
3FA0  85 63              .c   STA &63
3FA2  26 65              &e   ROL &65
3FA4  29 0F              ).   AND #&0F
3FA6  09 10              ..   ORA #&10
3FA8  85 61              .a   STA &61
3FAA  20 86 3F            .?  JSR addr3F86
3FAD  30 0A              0.   BMI addr3FB9
3FAF  A5 66              .f   LDA &66
3FB1  09 C0              ..   ORA #&C0
3FB3  85 66              .f   STA &66
3FB5  A2 10              ..   LDX #&10
3FB7  86 6A              .j   STX &6A
.addr3FB9
3FB9  29 02              ).   AND #&02
3FBB  69 0B              i.   ADC #&0B
3FBD  20 68 37            h7  JSR addr3768
.addr3FC0
3FC0  20 28 12            (.  JSR addr1228
3FC3  CE 4A 03           .J.  DEC &034A
3FC6  F0 8C              ..   BEQ addr3F54
3FC8  10 03              ..   BPL addr3FCD
3FCA  EE 4A 03           .J.  INC &034A
.addr3FCD
3FCD  C6 8A              ..   DEC &8A
3FCF  F0 03              ..   BEQ addr3FD4
.addr3FD1
3FD1  4C DB 40           L.@  JMP addr40DB
.addr3FD4
3FD4  AD 41 03           .A.  LDA &0341
3FD7  D0 F8              ..   BNE addr3FD1
3FD9  20 86 3F            .?  JSR addr3F86
3FDC  C9 23              .#   CMP #&23
3FDE  B0 4E              .N   BCS addr402E
3FE0  AD 3E 03           .>.  LDA &033E
3FE3  C9 03              ..   CMP #&03
3FE5  B0 47              .G   BCS addr402E
3FE7  20 26 3F            &?  JSR addr3F26
3FEA  A9 26              .&   LDA #&26
3FEC  85 4D              .M   STA &4D
3FEE  20 86 3F            .?  JSR addr3F86
3FF1  85 46              .F   STA &46
3FF3  86 49              .I   STX &49
3FF5  29 80              ).   AND #&80
3FF7  85 48              .H   STA &48
3FF9  8A                 .    TXA
3FFA  29 80              ).   AND #&80
3FFC  85 4B              .K   STA &4B
3FFE  26 47              &G   ROL &47
4000  26 47              &G   ROL &47
4002  20 86 3F            .?  JSR addr3F86
4005  70 93              p.   BVS addr3F9A
4007  4C 9A 3F           L.?  JMP addr3F9A
400A  09 6F              .o   ORA #&6F
400C  85 63              .c   STA &63
400E  AD 20 03           . .  LDA &0320
4011  D0 1B              ..   BNE addr402E
4013  8A                 .    TXA
4014  B0 08              ..   BCS addr401E
4016  29 1F              ).   AND #&1F
4018  09 10              ..   ORA #&10
401A  85 61              .a   STA &61
401C  90 04              ..   BCC addr4022
.addr401E
401E  09 7F              .   ORA #&7F
4020  85 64              .d   STA &64
.addr4022
4022  20 86 3F            .?  JSR addr3F86
4025  C9 0A              ..   CMP #&0A
4027  29 01              ).   AND #&01
4029  69 05              i.   ADC #&05
402B  20 68 37            h7  JSR addr3768
.addr402E
402E  AD 20 03           . .  LDA &0320
4031  F0 03              ..   BEQ addr4036
.addr4033
4033  4C DB 40           L.@  JMP addr40DB
.addr4036
4036  20 A6 41            .A  JSR addr41A6
4039  0A                 .    ASL A
403A  AE 2E 03           ...  LDX &032E
403D  F0 03              ..   BEQ addr4042
403F  0D 8C 03           ...  ORA &038C
.addr4042
4042  85 D1              ..   STA &D1
4044  20 62 3F            b?  JSR addr3F62
4047  C5 D1              ..   CMP &D1
4049  B0 05              ..   BCS addr4050
404B  A9 10              ..   LDA #&10
404D  20 68 37            h7  JSR addr3768
.addr4050
4050  AD 2E 03           ...  LDA &032E
4053  D0 DE              ..   BNE addr4033
4055  CE 49 03           .I.  DEC &0349
4058  10 D9              ..   BPL addr4033
405A  EE 49 03           .I.  INC &0349
405D  AD 58 03           .X.  LDA &0358
4060  29 0C              ).   AND #&0C
4062  C9 08              ..   CMP #&08
4064  D0 0A              ..   BNE addr4070
4066  20 86 3F            .?  JSR addr3F86
4069  C9 C8              ..   CMP #&C8
406B  90 03              ..   BCC addr4070
406D  20 0E 32            .2  JSR addr320E
.addr4070
4070  20 86 3F            .?  JSR addr3F86
4073  AC AE 03           ...  LDY &03AE
4076  F0 0B              ..   BEQ addr4083
4078  C9 78              .x   CMP #&78
407A  B0 B7              ..   BCS addr4033
407C  29 07              ).   AND #&07
407E  CD AE 03           ...  CMP &03AE
4081  90 B0              ..   BCC addr4033
.addr4083
4083  20 62 3F            b?  JSR addr3F62
4086  C9 64              .d   CMP #&64
4088  B0 28              .(   BCS addr40B2
408A  EE 49 03           .I.  INC &0349
408D  29 03              ).   AND #&03
408F  69 18              i.   ADC #&18
4091  A8                 .    TAY
4092  20 B8 3E            .>  JSR addr3EB8
4095  90 11              ..   BCC addr40A8
4097  A9 F9              ..   LDA #&F9
4099  85 66              .f   STA &66
409B  AD 58 03           .X.  LDA &0358
409E  29 03              ).   AND #&03
40A0  4A                 J    LSR A
40A1  90 05              ..   BCC addr40A8
40A3  0D 3D 03           .=.  ORA &033D
40A6  F0 02              ..   BEQ addr40AA
.addr40A8
40A8  98                 .    TYA
40A9  2C A9 1F           ,..  BIT &1FA9
40AC  20 68 37            h7  JSR addr3768
40AF  4C DB 40           L.@  JMP addr40DB
.addr40B2
40B2  29 03              ).   AND #&03
40B4  8D 49 03           .I.  STA &0349
40B7  85 89              ..   STA &89
.addr40B9
40B9  20 86 3F            .?  JSR addr3F86
40BC  85 D1              ..   STA &D1
40BE  20 86 3F            .?  JSR addr3F86
40C1  25 D1              %.   AND &D1
40C3  29 07              ).   AND #&07
40C5  8D D2 0F           ...  STA &0FD2
.addr40C8
40C8  AD D2 0F           ...  LDA &0FD2
40CB  69 11              i.   ADC #&11
40CD  20 68 37            h7  JSR addr3768
40D0  B0 05              ..   BCS addr40D7
40D2  CE D2 0F           ...  DEC &0FD2
40D5  10 F1              ..   BPL addr40C8
.addr40D7
40D7  C6 89              ..   DEC &89
40D9  10 DE              ..   BPL addr40B9
.addr40DB
40DB  A2 FF              ..   LDX #&FF
40DD  9A                 .    TXS
40DE  AE 47 03           .G.  LDX &0347
40E1  F0 03              ..   BEQ addr40E6
40E3  CE 47 03           .G.  DEC &0347
.addr40E6
40E6  20 62 1F            b.  JSR addr1F62
40E9  A5 87              ..   LDA &87
40EB  F0 0B              ..   BEQ addr40F8
40ED  2D C9 03           -..  AND &03C9
40F0  4A                 J    LSR A
40F1  B0 05              ..   BCS addr40F8
40F3  A0 02              ..   LDY #&02
40F5  20 30 55            0U  JSR addr5530
.addr40F8
40F8  20 1F 3D            .=  JSR addr3D1F
.addr40FB
40FB  20 01 41            .A  JSR addr4101
40FE  4C C0 3F           L.?  JMP addr3FC0
.addr4101
4101  C9 76              .v   CMP #&76
4103  D0 03              ..   BNE addr4108
4105  4C 83 1C           L..  JMP addr1C83
.addr4108
4108  C9 14              ..   CMP #&14
410A  D0 03              ..   BNE addr410F
410C  4C EB 2C           L.,  JMP addr2CEB
.addr410F
410F  C9 74              .t   CMP #&74
4111  D0 03              ..   BNE addr4116
4113  4C BE 2E           L..  JMP addr2EBE
.addr4116
4116  C9 75              .u   CMP #&75
4118  D0 06              ..   BNE addr4120
411A  20 75 2F            u/  JSR addr2F75
411D  4C 73 2B           Ls+  JMP addr2B73
.addr4120
4120  C9 77              .w   CMP #&77
4122  D0 03              ..   BNE addr4127
4124  4C 15 2E           L..  JMP addr2E15
.addr4127
4127  C9 16              ..   CMP #&16
4129  D0 03              ..   BNE addr412E
412B  4C 60 31           L`1  JMP addr3160
.addr412E
412E  C9 20              .    CMP #&20
4130  D0 03              ..   BNE addr4135
4132  4C 92 32           L.2  JMP addr3292
.addr4135
4135  C9 71              .q   CMP #&71
4137  90 0A              ..   BCC addr4143
4139  C9 74              .t   CMP #&74
413B  B0 06              ..   BCS addr4143
413D  29 03              ).   AND #&03
413F  AA                 .    TAX
4140  4C 93 54           L.T  JMP addr5493
.addr4143
4143  C9 54              .T   CMP #&54
4145  D0 03              ..   BNE addr414A
4147  4C 11 30           L.0  JMP addr3011
.addr414A
414A  C9 32              .2   CMP #&32
414C  F0 3D              .=   BEQ addr418B
414E  85 06              ..   STA &06
4150  A5 87              ..   LDA &87
4152  29 C0              ).   AND #&C0
4154  F0 16              ..   BEQ addr416C
4156  A5 2F              ./   LDA &2F
4158  D0 12              ..   BNE addr416C
415A  A5 06              ..   LDA &06
415C  C9 36              .6   CMP #&36
415E  D0 09              ..   BNE addr4169
4160  20 65 2E            e.  JSR addr2E65
4163  20 68 3D            h=  JSR addr3D68
4166  20 65 2E            e.  JSR addr2E65
.addr4169
4169  20 38 2E            8.  JSR addr2E38
.addr416C
416C  A5 2F              ./   LDA &2F
416E  F0 1A              ..   BEQ addr418A
4170  C6 2E              ..   DEC &2E
4172  D0 16              ..   BNE addr418A
4174  A6 2F              ./   LDX &2F
4176  CA                 .    DEX
4177  20 AC 30            .0  JSR addr30AC
417A  A9 05              ..   LDA #&05
417C  85 2E              ..   STA &2E
417E  A6 2F              ./   LDX &2F
4180  20 AC 30            .0  JSR addr30AC
4183  C6 2F              ./   DEC &2F
4185  D0 03              ..   BNE addr418A
4187  4C 54 32           LT2  JMP addr3254
.addr418A
418A  60                 `    RTS
.addr418B
418B  A5 87              ..   LDA &87
418D  29 C0              ).   AND #&C0
418F  F0 F9              ..   BEQ addr418A
4191  20 FE 32            .2  JSR addr32FE
4194  85 72              .r   STA &72
4196  20 0A 33            .3  JSR addr330A
4199  A9 80              ..   LDA #&80
419B  85 72              .r   STA &72
419D  A9 01              ..   LDA #&01
419F  85 2C              .,   STA &2C
41A1  E6 2D              .-   INC &2D
41A3  4C 3B 2B           L;+  JMP addr2B3B
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
41B6  90 06              ..   BCC addr41BE
41B8  C5 4A              .J   CMP &4A
41BA  90 02              ..   BCC addr41BE
41BC  C5 4D              .M   CMP &4D
.addr41BE
41BE  60                 `    RTS
.addr41BF
41BF  05 47              .G   ORA &47
41C1  05 4A              .J   ORA &4A
41C3  05 4D              .M   ORA &4D
41C5  60                 `    RTS
.addr41C6
41C6  20 B1 43            .C  JSR addr43B1
41C9  20 E1 3E            .>  JSR addr3EE1
41CC  06 7D              .}   ASL &7D
41CE  06 7D              .}   ASL &7D
41D0  A2 18              ..   LDX #&18
41D2  20 19 36            .6  JSR addr3619
41D5  20 C8 54            .T  JSR addr54C8
41D8  20 EB 54            .T  JSR addr54EB
41DB  20 B5 35            .5  JSR addr35B5
41DE  A9 0C              ..   LDA #&0C
41E0  85 2D              .-   STA &2D
41E2  85 2C              .,   STA &2C
41E4  A9 92              ..   LDA #&92
41E6  20 2D 34            -4  JSR addr342D
.addr41E9
41E9  20 62 3F            b?  JSR addr3F62
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
4219  F0 03              ..   BEQ addr421E
421B  90 01              ..   BCC addr421E
421D  CA                 .    DEX
.addr421E
421E  20 1D 25            .%  JSR addr251D
4221  20 86 3F            .?  JSR addr3F86
4224  29 80              ).   AND #&80
4226  A0 1F              ..   LDY #&1F
4228  91 20              .    STA (&20),Y
422A  AD 15 03           ...  LDA &0315
422D  F0 BA              ..   BEQ addr41E9
422F  20 A4 44            .D  JSR addr44A4
4232  85 7D              .}   STA &7D
.addr4234
4234  20 28 12            (.  JSR addr1228
4237  AD 46 03           .F.  LDA &0346
423A  D0 F8              ..   BNE addr4234
423C  A2 1F              ..   LDX #&1F
423E  20 19 36            .6  JSR addr3619
4241  4C 20 12           L .  JMP addr1220
.addr4244
4244  20 55 42            UB  JSR addr4255
4247  20 CE 3E            .>  JSR addr3ECE
424A  A9 FF              ..   LDA #&FF
424C  85 8E              ..   STA &8E
424E  85 87              ..   STA &87
4250  A9 20              .    LDA #&20
4252  4C FB 40           L.@  JMP addr40FB
.addr4255
4255  20 B8 3E            .>  JSR addr3EB8
4258  A9 06              ..   LDA #&06
425A  B0 22              ."   BCS addr427E
425C  20 86 3F            .?  JSR addr3F86
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
4275  D0 06              ..   BNE addr427D
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
4284  20 7A 0D            z.  JSR addr0D7A
4287  A2 8E              ..   LDX #&8E
4289  A0 42              .B   LDY #&42
428B  4C F7 FF           L..  JMP oscli
428E  4C 2E 44           L.D  JMP addr442E
4291  2E 4D 4F           .MO  ROL &4F4D
4294  30 0D              0.   BMI addr42A3
.addr4296
4296  A2 3A              .:   LDX #&3A
4298  A9 00              ..   LDA #&00
.addr429A
429A  9D 11 03           ...  STA &0311,X
429D  CA                 .    DEX
429E  10 FA              ..   BPL addr429A
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
42AB  D0 FB              ..   BNE addr42A8
42AD  60                 `    RTS
.addr42AE
42AE  A2 00              ..   LDX #&00
42B0  20 1F 37            .7  JSR addr371F
42B3  A2 03              ..   LDX #&03
42B5  20 1F 37            .7  JSR addr371F
42B8  A2 06              ..   LDX #&06
42BA  20 1F 37            .7  JSR addr371F
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
42D0  B0 0E              ..   BCS addr42E0
42D2  06 D2              ..   ASL &D2
42D4  26 D3              &.   ROL &D3
42D6  06 D5              ..   ASL &D5
42D8  26 D6              &.   ROL &D6
42DA  06 D8              ..   ASL &D8
42DC  26 D9              &.   ROL &D9
42DE  90 ED              ..   BCC addr42CD
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
42F7  20 0B 28            .(  JSR addr280B
42FA  85 82              ..   STA &82
42FC  A5 1B              ..   LDA &1B
42FE  85 81              ..   STA &81
4300  A5 35              .5   LDA &35
4302  20 0B 28            .(  JSR addr280B
4305  85 D1              ..   STA &D1
4307  A5 1B              ..   LDA &1B
4309  65 81              e.   ADC &81
430B  85 81              ..   STA &81
430D  A5 D1              ..   LDA &D1
430F  65 82              e.   ADC &82
4311  85 82              ..   STA &82
4313  A5 36              .6   LDA &36
4315  20 0B 28            .(  JSR addr280B
4318  85 D1              ..   STA &D1
431A  A5 1B              ..   LDA &1B
431C  65 81              e.   ADC &81
431E  85 81              ..   STA &81
4320  A5 D1              ..   LDA &D1
4322  65 82              e.   ADC &82
4324  85 82              ..   STA &82
4326  20 B8 47            .G  JSR addr47B8
4329  A5 34              .4   LDA &34
432B  20 FF 46            .F  JSR addr46FF
432E  85 34              .4   STA &34
4330  A5 35              .5   LDA &35
4332  20 FF 46            .F  JSR addr46FF
4335  85 35              .5   STA &35
4337  A5 36              .6   LDA &36
4339  20 FF 46            .F  JSR addr46FF
433C  85 36              .6   STA &36
433E  60                 `    RTS
.addr433F
433F  A2 10              ..   LDX #&10
.addr4341
4341  20 39 44            9D  JSR addr4439
4344  30 04              0.   BMI addr434A
4346  E8                 .    INX
4347  10 F8              ..   BPL addr4341
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
435A  D0 43              .C   BNE addr439F
435C  AC 08 09           ...  LDY &0908
435F  30 07              0.   BMI addr4368
4361  A8                 .    TAY
4362  20 43 1C            C.  JSR addr1C43
4365  4A                 J    LSR A
4366  F0 37              .7   BEQ addr439F
.addr4368
4368  AC 2D 09           .-.  LDY &092D
436B  30 08              0.   BMI addr4375
436D  A0 25              .%   LDY #&25
436F  20 41 1C            A.  JSR addr1C41
4372  4A                 J    LSR A
4373  F0 2A              .*   BEQ addr439F
.addr4375
4375  A9 81              ..   LDA #&81
4377  85 83              ..   STA &83
4379  85 82              ..   STA &82
437B  85 1B              ..   STA &1B
437D  AD 08 09           ...  LDA &0908
4380  20 FF 28            .(  JSR addr28FF
4383  8D 08 09           ...  STA &0908
4386  AD 2D 09           .-.  LDA &092D
4389  20 FF 28            .(  JSR addr28FF
438C  8D 2D 09           .-.  STA &092D
438F  A9 01              ..   LDA #&01
4391  85 87              ..   STA &87
4393  85 8A              ..   STA &8A
4395  4A                 J    LSR A
4396  8D 49 03           .I.  STA &0349
4399  AE 45 03           .E.  LDX &0345
439C  4C 93 54           L.T  JMP addr5493
.addr439F
439F  A9 28              .(   LDA #&28
43A1  D0 50              .P   BNE addr43F3
.addr43A3
43A3  A9 00              ..   LDA #&00
43A5  85 30              .0   STA &30
43A7  8D 40 03           .@.  STA &0340
43AA  20 1B 38            .8  JSR addr381B
43AD  A9 48              .H   LDA #&48
43AF  D0 42              .B   BNE addr43F3
.addr43B1
43B1  A9 10              ..   LDA #&10
43B3  20 F3 43            .C  JSR addr43F3
43B6  A9 18              ..   LDA #&18
43B8  D0 39              .9   BNE addr43F3
.addr43BA
43BA  A9 20              .    LDA #&20
43BC  D0 35              .5   BNE addr43F3
.addr43BE
43BE  A2 01              ..   LDX #&01
43C0  20 90 25            .%  JSR addr2590
43C3  90 53              .S   BCC addr4418
43C5  A9 78              .x   LDA #&78
43C7  20 C6 45            .E  JSR addr45C6
43CA  A9 30              .0   LDA #&30
43CC  D0 25              .%   BNE addr43F3
.addr43CE
43CE  EE 9F 03           ...  INC &039F
43D1  D0 08              ..   BNE addr43DB
43D3  EE A0 03           ...  INC &03A0
43D6  A9 65              .e   LDA #&65
43D8  20 C6 45            .E  JSR addr45C6
.addr43DB
43DB  A2 07              ..   LDX #&07
.addr43DD
43DD  86 D1              ..   STX &D1
43DF  A9 18              ..   LDA #&18
43E1  20 04 44            .D  JSR addr4404
43E4  A5 4D              .M   LDA &4D
43E6  4A                 J    LSR A
43E7  4A                 J    LSR A
43E8  25 D1              %.   AND &D1
43EA  09 F1              ..   ORA #&F1
43EC  85 0B              ..   STA &0B
43EE  20 F6 43            .C  JSR addr43F6
43F1  A9 10              ..   LDA #&10
.addr43F3
43F3  20 04 44            .D  JSR addr4404
.addr43F6
43F6  AE C6 03           ...  LDX &03C6
43F9  D0 1D              ..   BNE addr4418
43FB  A2 09              ..   LDX #&09
43FD  A0 00              ..   LDY #&00
43FF  A9 07              ..   LDA #&07
4401  4C F1 FF           L..  JMP osword       ; SOUND
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
4416  10 F2              ..   BPL addr440A
.addr4418
4418  60                 `    RTS
4419  E8                 .    INX
441A  E2                 .    ...
441B  E6 E7              ..   INC &E7
441D  C2                 .    ...
441E  D1 C1              ..   CMP (&C1),Y
4420  60                 `    RTS
4421  70 23              p#   BVS addr4446
4423  35 65              5e   AND &65,X
4425  22                 "    ...
4426  45 52              ER   EOR &52
4428  37                 7    ...
.addr4429
4429  BE 18 44           ..D  LDX &4418,Y
442C  20 39 44            9D  JSR addr4439
442F  10 20              .    BPL addr4451
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
4454  20 F4 FF            ..  JSR osbyte
4457  98                 .    TYA
4458  4D CC 03           M..  EOR &03CC
445B  60                 `    RTS
.addr445C
445C  84 D1              ..   STY &D1
445E  E4 D1              ..   CPX &D1
4460  D0 10              ..   BNE addr4472
4462  BD 87 03           ...  LDA &0387,X
4465  49 FF              I.   EOR #&FF
4467  9D 87 03           ...  STA &0387,X
446A  20 FA 1E            ..  JSR addr1EFA
446D  20 30 55            0U  JSR addr5530
4470  A4 D1              ..   LDY &D1
.addr4472
4472  60                 `    RTS
.addr4473
4473  AD 3F 03           .?.  LDA &033F
4476  D0 4F              .O   BNE addr44C7
4478  A0 01              ..   LDY #&01
447A  20 29 44            )D  JSR addr4429
447D  C8                 .    INY
447E  20 29 44            )D  JSR addr4429
4481  AD 40 FE           .@.  LDA &FE40
4484  AA                 .    TAX
4485  29 10              ).   AND #&10
4487  49 10              I.   EOR #&10
4489  8D 07 03           ...  STA &0307
448C  A2 01              ..   LDX #&01
448E  20 52 44            RD  JSR addr4452
4491  09 01              ..   ORA #&01
4493  8D 4C 03           .L.  STA &034C
4496  A2 02              ..   LDX #&02
4498  20 52 44            RD  JSR addr4452
449B  4D CB 03           M..  EOR &03CB
449E  8D 4D 03           .M.  STA &034D
44A1  4C 55 45           LUE  JMP addr4555
.addr44A4
44A4  A9 00              ..   LDA #&00
44A6  A0 10              ..   LDY #&10
.addr44A8
44A8  99 00 03           ...  STA &0300,Y
44AB  88                 .    DEY
44AC  D0 FA              ..   BNE addr44A8
44AE  60                 `    RTS
.addr44AF
44AF  20 A4 44            .D  JSR addr44A4
44B2  AD CD 03           ...  LDA &03CD
44B5  D0 BC              ..   BNE addr4473
44B7  8D CE 03           ...  STA &03CE
44BA  A0 07              ..   LDY #&07
.addr44BC
44BC  20 29 44            )D  JSR addr4429
44BF  88                 .    DEY
44C0  D0 FA              ..   BNE addr44BC
44C2  AD 3F 03           .?.  LDA &033F
44C5  F0 5F              ._   BEQ addr4526
.addr44C7
44C7  20 26 3F            &?  JSR addr3F26
44CA  A9 60              .`   LDA #&60
44CC  85 54              .T   STA &54
44CE  09 80              ..   ORA #&80
44D0  85 5C              .\   STA &5C
44D2  85 8C              ..   STA &8C
44D4  A5 7D              .}   LDA &7D
44D6  85 61              .a   STA &61
44D8  20 46 23            F#  JSR addr2346
44DB  A5 61              .a   LDA &61
44DD  C9 16              ..   CMP #&16
44DF  90 02              ..   BCC addr44E3
44E1  A9 16              ..   LDA #&16
.addr44E3
44E3  85 7D              .}   STA &7D
44E5  A9 FF              ..   LDA #&FF
44E7  A2 00              ..   LDX #&00
44E9  A4 62              .b   LDY &62
44EB  F0 06              ..   BEQ addr44F3
44ED  30 01              0.   BMI addr44F0
44EF  E8                 .    INX
.addr44F0
44F0  9D 01 03           ...  STA &0301,X
.addr44F3
44F3  A9 80              ..   LDA #&80
44F5  A2 00              ..   LDX #&00
44F7  06 63              .c   ASL &63
44F9  F0 14              ..   BEQ addr450F
44FB  90 01              ..   BCC addr44FE
44FD  E8                 .    INX
.addr44FE
44FE  24 63              $c   BIT &63
4500  10 07              ..   BPL addr4509
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
4518  F0 09              ..   BEQ addr4523
451A  B0 01              ..   BCS addr451D
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
452E  F0 03              ..   BEQ addr4533
4530  20 16 2A            .*  JSR addr2A16
.addr4533
4533  AC 04 03           ...  LDY &0304
4536  F0 03              ..   BEQ addr453B
4538  20 26 2A            &*  JSR addr2A26
.addr453B
453B  8E 4C 03           .L.  STX &034C
453E  0A                 .    ASL A
453F  AE 4D 03           .M.  LDX &034D
4542  AC 05 03           ...  LDY &0305
4545  F0 03              ..   BEQ addr454A
4547  20 26 2A            &*  JSR addr2A26
.addr454A
454A  AC 06 03           ...  LDY &0306
454D  F0 03              ..   BEQ addr4552
454F  20 16 2A            .*  JSR addr2A16
.addr4552
4552  8E 4D 03           .M.  STX &034D
.addr4555
4555  20 3F 43            ?C  JSR addr433F
4558  8E 00 03           ...  STX &0300
455B  E0 69              .i   CPX #&69
455D  D0 3D              .=   BNE addr459C
.addr455F
455F  20 F7 55            .U  JSR addr55F7
4562  20 3F 43            ?C  JSR addr433F
4565  E0 51              .Q   CPX #&51
4567  D0 05              ..   BNE addr456E
4569  A9 00              ..   LDA #&00
456B  8D C6 03           ...  STA &03C6
.addr456E
456E  A0 40              .@   LDY #&40
.addr4570
4570  20 5C 44            \D  JSR addr445C
4573  C8                 .    INY
4574  C0 47              .G   CPY #&47
4576  D0 F8              ..   BNE addr4570
4578  E0 10              ..   CPX #&10
457A  D0 03              ..   BNE addr457F
457C  8E C6 03           ...  STX &03C6
.addr457F
457F  E0 70              .p   CPX #&70
4581  D0 03              ..   BNE addr4586
4583  4C 20 12           L .  JMP addr1220
.addr4586
4586  E0 64              .d   CPX #&64
4588  D0 0E              ..   BNE addr4598
458A  AD CE 03           ...  LDA &03CE
458D  49 FF              I.   EOR #&FF
458F  8D CE 03           ...  STA &03CE
4592  8D CD 03           ...  STA &03CD
4595  8D CC 03           ...  STA &03CC
.addr4598
4598  E0 59              .Y   CPX #&59
459A  D0 C3              ..   BNE addr455F
.addr459C
459C  A5 87              ..   LDA &87
459E  D0 14              ..   BNE addr45B4
45A0  A0 10              ..   LDY #&10
45A2  A9 FF              ..   LDA #&FF
.addr45A4
45A4  BE 18 44           ..D  LDX &4418,Y
45A7  EC 00 03           ...  CPX &0300
45AA  D0 03              ..   BNE addr45AF
45AC  99 00 03           ...  STA &0300,Y
.addr45AF
45AF  88                 .    DEY
45B0  C0 07              ..   CPY #&07
45B2  D0 F0              ..   BNE addr45A4
.addr45B4
45B4  60                 `    RTS
.addr45B5
45B5  8E 4A 03           .J.  STX &034A
45B8  48                 H    PHA
45B9  AD A4 03           ...  LDA &03A4
45BC  20 DD 45            .E  JSR addr45DD
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
45D5  D0 DE              ..   BNE addr45B5
45D7  8C 4A 03           .J.  STY &034A
45DA  8D A4 03           ...  STA &03A4
.addr45DD
45DD  20 9A 33            .3  JSR addr339A
45E0  4E 4B 03           NK.  LSR &034B
45E3  90 CF              ..   BCC addr45B4
45E5  A9 FD              ..   LDA #&FD
45E7  4C 9A 33           L.3  JMP addr339A
.addr45EA
45EA  20 86 3F            .?  JSR addr3F86
45ED  30 C5              0.   BMI addr45B4
45EF  E0 16              ..   CPX #&16
45F1  B0 C1              ..   BCS addr45B4
45F3  BD 6F 03           .o.  LDA &036F,X
45F6  F0 BC              ..   BEQ addr45B4
45F8  AD 4A 03           .J.  LDA &034A
45FB  D0 B7              ..   BNE addr45B4
45FD  A0 03              ..   LDY #&03
45FF  8C 4B 03           .K.  STY &034B
4602  9D 6F 03           .o.  STA &036F,X
4605  E0 11              ..   CPX #&11
4607  B0 05              ..   BCS addr460E
4609  8A                 .    TXA
460A  69 D0              i.   ADC #&D0
460C  D0 B8              ..   BNE addr45C6
.addr460E
460E  F0 B1              ..   BEQ addr45C1
4610  E0 12              ..   CPX #&12
4612  F0 B0              ..   BEQ addr45C4
4614  8A                 .    TXA
4615  69 5D              i]   ADC #&5D
4617  D0 AD              ..   BNE addr45C6
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
4645  B0 89              ..   BCS addr45D0
4647  DC                 .    ...
4648  3F                 ?    ...
4649  20 81 35            .5  JSR addr3581
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
4660  20 2C 47            ,G  JSR addr472C
4663  85 5A              .Z   STA &5A
4665  4C A5 46           L.F  JMP addr46A5
.addr4668
4668  AA                 .    TAX
4669  A5 35              .5   LDA &35
466B  29 60              )`   AND #&60
466D  F0 EE              ..   BEQ addr465D
466F  A9 02              ..   LDA #&02
4671  20 2C 47            ,G  JSR addr472C
4674  85 58              .X   STA &58
4676  4C A5 46           L.F  JMP addr46A5
.addr4679
4679  A5 50              .P   LDA &50
467B  85 34              .4   STA &34
467D  A5 52              .R   LDA &52
467F  85 35              .5   STA &35
4681  A5 54              .T   LDA &54
4683  85 36              .6   STA &36
4685  20 F5 42            .B  JSR addr42F5
4688  A5 34              .4   LDA &34
468A  85 50              .P   STA &50
468C  A5 35              .5   LDA &35
468E  85 52              .R   STA &52
4690  A5 36              .6   LDA &36
4692  85 54              .T   STA &54
4694  A0 04              ..   LDY #&04
4696  A5 34              .4   LDA &34
4698  29 60              )`   AND #&60
469A  F0 CC              ..   BEQ addr4668
469C  A2 02              ..   LDX #&02
469E  A9 00              ..   LDA #&00
46A0  20 2C 47            ,G  JSR addr472C
46A3  85 56              .V   STA &56
.addr46A5
46A5  A5 56              .V   LDA &56
46A7  85 34              .4   STA &34
46A9  A5 58              .X   LDA &58
46AB  85 35              .5   STA &35
46AD  A5 5A              .Z   LDA &5A
46AF  85 36              .6   STA &36
46B1  20 F5 42            .B  JSR addr42F5
46B4  A5 34              .4   LDA &34
46B6  85 56              .V   STA &56
46B8  A5 35              .5   LDA &35
46BA  85 58              .X   STA &58
46BC  A5 36              .6   LDA &36
46BE  85 5A              .Z   STA &5A
46C0  A5 52              .R   LDA &52
46C2  85 81              ..   STA &81
46C4  A5 5A              .Z   LDA &5A
46C6  20 D4 28            .(  JSR addr28D4
46C9  A6 54              .T   LDX &54
46CB  A5 58              .X   LDA &58
46CD  20 3B 29            ;)  JSR addr293B
46D0  49 80              I.   EOR #&80
46D2  85 5C              .\   STA &5C
46D4  A5 56              .V   LDA &56
46D6  20 D4 28            .(  JSR addr28D4
46D9  A6 50              .P   LDX &50
46DB  A5 5A              .Z   LDA &5A
46DD  20 3B 29            ;)  JSR addr293B
46E0  49 80              I.   EOR #&80
46E2  85 5E              .^   STA &5E
46E4  A5 58              .X   LDA &58
46E6  20 D4 28            .(  JSR addr28D4
46E9  A6 52              .R   LDX &52
46EB  A5 56              .V   LDA &56
46ED  20 3B 29            ;)  JSR addr293B
46F0  49 80              I.   EOR #&80
46F2  85 60              .`   STA &60
46F4  A9 00              ..   LDA #&00
46F6  A2 0E              ..   LDX #&0E
.addr46F8
46F8  95 4F              .O   STA &4F,X
46FA  CA                 .    DEX
46FB  CA                 .    DEX
46FC  10 FA              ..   BPL addr46F8
46FE  60                 `    RTS
.addr46FF
46FF  A8                 .    TAY
4700  29 7F              )   AND #&7F
4702  C5 81              ..   CMP &81
4704  B0 20              .    BCS addr4726
4706  A2 FE              ..   LDX #&FE
4708  86 D1              ..   STX &D1
.addr470A
470A  0A                 .    ASL A
470B  C5 81              ..   CMP &81
470D  90 02              ..   BCC addr4711
470F  E5 81              ..   SBC &81
.addr4711
4711  26 D1              &.   ROL &D1
4713  B0 F5              ..   BCS addr470A
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
4734  20 D4 28            .(  JSR addr28D4
4737  B6 50              .P   LDX &50,Y
4739  86 81              ..   STX &81
473B  B9 56 00           .V.  LDA &0056,Y
473E  20 FC 28            .(  JSR addr28FC
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
4762  90 02              ..   BCC addr4766
4764  E5 81              ..   SBC &81
.addr4766
4766  26 1B              &.   ROL &1B
4768  26 1C              &.   ROL &1C
476A  CA                 .    DEX
476B  D0 F2              ..   BNE addr475F
476D  A5 1B              ..   LDA &1B
476F  05 D1              ..   ORA &D1
4771  60                 `    RTS
.addr4772
4772  20 DE 48            .H  JSR addr48DE
4775  20 56 38            V8  JSR addr3856
4778  05 D3              ..   ORA &D3
477A  D0 21              .!   BNE addr479D
477C  A5 E0              ..   LDA &E0
477E  C9 BE              ..   CMP #&BE
4780  B0 1B              ..   BCS addr479D
4782  A0 02              ..   LDY #&02
4784  20 A4 47            .G  JSR addr47A4
4787  A0 06              ..   LDY #&06
4789  A5 E0              ..   LDA &E0
478B  69 01              i.   ADC #&01
478D  20 A4 47            .G  JSR addr47A4
4790  A9 08              ..   LDA #&08
4792  05 65              .e   ORA &65
4794  85 65              .e   STA &65
4796  A9 08              ..   LDA #&08
4798  4C 74 4F           LtO  JMP addr4F74
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
47B1  B0 E8              ..   BCS addr479B
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
47C8  90 0E              ..   BCC addr47D8
47CA  D0 04              ..   BNE addr47D0
47CC  C0 40              .@   CPY #&40
47CE  90 08              ..   BCC addr47D8
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
47EC  D0 D8              ..   BNE addr47C6
47EE  60                 `    RTS
.addr47EF
47EF  C5 81              ..   CMP &81
47F1  B0 1A              ..   BCS addr480D
.addr47F3
47F3  A2 FE              ..   LDX #&FE
47F5  86 82              ..   STX &82
.addr47F7
47F7  0A                 .    ASL A
47F8  B0 0B              ..   BCS addr4805
47FA  C5 81              ..   CMP &81
47FC  90 02              ..   BCC addr4800
47FE  E5 81              ..   SBC &81
.addr4800
4800  26 82              &.   ROL &82
4802  B0 F3              ..   BCS addr47F7
4804  60                 `    RTS
.addr4805
4805  E5 81              ..   SBC &81
4807  38                 8    SEC
4808  26 82              &.   ROL &82
480A  B0 EB              ..   BCS addr47F7
480C  60                 `    RTS
.addr480D
480D  A9 FF              ..   LDA #&FF
480F  85 82              ..   STA &82
4811  60                 `    RTS
.addr4812
4812  45 83              E.   EOR &83
4814  30 06              0.   BMI addr481C
4816  A5 81              ..   LDA &81
4818  18                 .    CLC
4819  65 82              e.   ADC &82
481B  60                 `    RTS
.addr481C
481C  A5 82              ..   LDA &82
481E  38                 8    SEC
481F  E5 81              ..   SBC &81
4821  90 02              ..   BCC addr4825
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
483C  20 47 28            G(  JSR addr2847
483F  85 D1              ..   STA &D1
4841  A5 35              .5   LDA &35
4843  55 0A              U.   EOR &0A,X
4845  85 83              ..   STA &83
4847  A5 36              .6   LDA &36
4849  85 81              ..   STA &81
484B  B5 0B              ..   LDA &0B,X
484D  20 47 28            G(  JSR addr2847
4850  85 81              ..   STA &81
4852  A5 D1              ..   LDA &D1
4854  85 82              ..   STA &82
4856  A5 37              .7   LDA &37
4858  55 0C              U.   EOR &0C,X
485A  20 12 48            .H  JSR addr4812
485D  85 D1              ..   STA &D1
485F  A5 38              .8   LDA &38
4861  85 81              ..   STA &81
4863  B5 0D              ..   LDA &0D,X
4865  20 47 28            G(  JSR addr2847
4868  85 81              ..   STA &81
486A  A5 D1              ..   LDA &D1
486C  85 82              ..   STA &82
486E  A5 39              .9   LDA &39
4870  55 0E              U.   EOR &0E,X
4872  20 12 48            .H  JSR addr4812
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
4886  90 AE              ..   BCC addr4836
4888  60                 `    RTS
.addr4889
4889  4C 99 38           L.8  JMP addr3899
.addr488C
488C  A5 8C              ..   LDA &8C
488E  30 F9              0.   BMI addr4889
4890  A9 1F              ..   LDA #&1F
4892  85 96              ..   STA &96
4894  A5 6A              .j   LDA &6A
4896  30 46              0F   BMI addr48DE
4898  A9 20              .    LDA #&20
489A  24 65              $e   BIT &65
489C  D0 2D              .-   BNE addr48CB
489E  10 2B              .+   BPL addr48CB
48A0  05 65              .e   ORA &65
48A2  29 3F              )?   AND #&3F
48A4  85 65              .e   STA &65
48A6  A9 00              ..   LDA #&00
48A8  A0 1C              ..   LDY #&1C
48AA  91 20              .    STA (&20),Y
48AC  A0 1E              ..   LDY #&1E
48AE  91 20              .    STA (&20),Y
48B0  20 DE 48            .H  JSR addr48DE
48B3  A0 01              ..   LDY #&01
48B5  A9 12              ..   LDA #&12
48B7  91 67              .g   STA (&67),Y
48B9  A0 07              ..   LDY #&07
48BB  B1 1E              ..   LDA (&1E),Y
48BD  A0 02              ..   LDY #&02
48BF  91 67              .g   STA (&67),Y
.addr48C1
48C1  C8                 .    INY
48C2  20 86 3F            .?  JSR addr3F86
48C5  91 67              .g   STA (&67),Y
48C7  C0 06              ..   CPY #&06
48C9  D0 F6              ..   BNE addr48C1
.addr48CB
48CB  A5 4E              .N   LDA &4E
48CD  10 1D              ..   BPL addr48EC
.addr48CF
48CF  A5 65              .e   LDA &65
48D1  29 20              )    AND #&20
48D3  F0 09              ..   BEQ addr48DE
48D5  A5 65              .e   LDA &65
48D7  29 F7              ).   AND #&F7
48D9  85 65              .e   STA &65
48DB  4C 70 34           Lp4  JMP addr3470
.addr48DE
48DE  A9 08              ..   LDA #&08
48E0  24 65              $e   BIT &65
48E2  F0 07              ..   BEQ addr48EB
48E4  45 65              Ee   EOR &65
48E6  85 65              .e   STA &65
48E8  4C 78 4F           LxO  JMP addr4F78
.addr48EB
48EB  60                 `    RTS
.addr48EC
48EC  A5 4D              .M   LDA &4D
48EE  C9 C0              ..   CMP #&C0
48F0  B0 DD              ..   BCS addr48CF
48F2  A5 46              .F   LDA &46
48F4  C5 4C              .L   CMP &4C
48F6  A5 47              .G   LDA &47
48F8  E5 4D              .M   SBC &4D
48FA  B0 D3              ..   BCS addr48CF
48FC  A5 49              .I   LDA &49
48FE  C5 4C              .L   CMP &4C
4900  A5 4A              .J   LDA &4A
4902  E5 4D              .M   SBC &4D
4904  B0 C9              ..   BCS addr48CF
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
4923  D0 0A              ..   BNE addr492F
4925  A5 D1              ..   LDA &D1
4927  6A                 j    ROR A
4928  4A                 J    LSR A
4929  4A                 J    LSR A
492A  4A                 J    LSR A
492B  85 96              ..   STA &96
492D  10 11              ..   BPL addr4940
.addr492F
492F  A0 0D              ..   LDY #&0D
4931  B1 1E              ..   LDA (&1E),Y
4933  C5 4D              .M   CMP &4D
4935  B0 09              ..   BCS addr4940
4937  A9 20              .    LDA #&20
4939  25 65              %e   AND &65
493B  D0 03              ..   BNE addr4940
493D  4C 72 47           LrG  JMP addr4772
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
494F  10 F1              ..   BPL addr4942
4951  A9 C5              ..   LDA #&C5
4953  85 81              ..   STA &81
4955  A0 10              ..   LDY #&10
.addr4957
4957  B9 09 00           ...  LDA &0009,Y
495A  0A                 .    ASL A
495B  B9 0A 00           ...  LDA &000A,Y
495E  2A                 *    ROL A
495F  20 EF 47            .G  JSR addr47EF
4962  A6 82              ..   LDX &82
4964  96 09              ..   STX &09,Y
4966  88                 .    DEY
4967  88                 .    DEY
4968  10 ED              ..   BPL addr4957
496A  A2 08              ..   LDX #&08
.addr496C
496C  B5 46              .F   LDA &46,X
496E  95 72              .r   STA &72,X
4970  CA                 .    DEX
4971  10 F9              ..   BPL addr496C
4973  A9 FF              ..   LDA #&FF
4975  85 E1              ..   STA &E1
4977  A0 0C              ..   LDY #&0C
4979  A5 65              .e   LDA &65
497B  29 20              )    AND #&20
497D  F0 12              ..   BEQ addr4991
497F  B1 1E              ..   LDA (&1E),Y
4981  4A                 J    LSR A
4982  4A                 J    LSR A
4983  AA                 .    TAX
4984  A9 FF              ..   LDA #&FF
.addr4986
4986  95 D2              ..   STA &D2,X
4988  CA                 .    DEX
4989  10 FB              ..   BPL addr4986
498B  E8                 .    INX
498C  86 96              ..   STX &96
.addr498E
498E  4C 04 4B           L.K  JMP addr4B04
.addr4991
4991  B1 1E              ..   LDA (&1E),Y
4993  F0 F9              ..   BEQ addr498E
4995  85 97              ..   STA &97
4997  A0 12              ..   LDY #&12
4999  B1 1E              ..   LDA (&1E),Y
499B  AA                 .    TAX
499C  A5 79              .y   LDA &79
499E  A8                 .    TAY
499F  F0 0F              ..   BEQ addr49B0
.addr49A1
49A1  E8                 .    INX
49A2  46 76              Fv   LSR &76
49A4  66 75              fu   ROR &75
49A6  46 73              Fs   LSR &73
49A8  66 72              fr   ROR &72
49AA  4A                 J    LSR A
49AB  66 78              fx   ROR &78
49AD  A8                 .    TAY
49AE  D0 F1              ..   BNE addr49A1
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
49CA  20 32 48            2H  JSR addr4832
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
4A00  B0 0F              ..   BCS addr4A11
4A02  98                 .    TYA
4A03  4A                 J    LSR A
4A04  4A                 J    LSR A
4A05  AA                 .    TAX
4A06  A9 FF              ..   LDA #&FF
4A08  95 D2              ..   STA &D2,X
4A0A  98                 .    TYA
4A0B  69 04              i.   ADC #&04
4A0D  A8                 .    TAY
4A0E  4C FD 4A           L.J  JMP addr4AFD
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
4A2C  90 23              .#   BCC addr4A51
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
4A46  4C AF 4A           L.J  JMP addr4AAF
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
4A5C  30 08              0.   BMI addr4A66
.addr4A5E
4A5E  46 34              F4   LSR &34
4A60  46 36              F6   LSR &36
4A62  4A                 J    LSR A
4A63  CA                 .    DEX
4A64  10 F8              ..   BPL addr4A5E
.addr4A66
4A66  85 82              ..   STA &82
4A68  A5 3F              .?   LDA &3F
4A6A  85 83              ..   STA &83
4A6C  A5 78              .x   LDA &78
4A6E  85 81              ..   STA &81
4A70  A5 7A              .z   LDA &7A
4A72  20 12 48            .H  JSR addr4812
4A75  B0 D2              ..   BCS addr4A49
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
4A8B  20 12 48            .H  JSR addr4812
4A8E  B0 B9              ..   BCS addr4A49
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
4AA4  20 12 48            .H  JSR addr4812
4AA7  B0 A0              ..   BCS addr4A49
4AA9  85 36              .6   STA &36
4AAB  A5 83              ..   LDA &83
4AAD  85 37              .7   STA &37
.addr4AAF
4AAF  A5 3A              .:   LDA &3A
4AB1  85 81              ..   STA &81
4AB3  A5 34              .4   LDA &34
4AB5  20 47 28            G(  JSR addr2847
4AB8  85 D1              ..   STA &D1
4ABA  A5 3B              .;   LDA &3B
4ABC  45 35              E5   EOR &35
4ABE  85 83              ..   STA &83
4AC0  A5 3C              .<   LDA &3C
4AC2  85 81              ..   STA &81
4AC4  A5 36              .6   LDA &36
4AC6  20 47 28            G(  JSR addr2847
4AC9  85 81              ..   STA &81
4ACB  A5 D1              ..   LDA &D1
4ACD  85 82              ..   STA &82
4ACF  A5 3D              .=   LDA &3D
4AD1  45 37              E7   EOR &37
4AD3  20 12 48            .H  JSR addr4812
4AD6  85 D1              ..   STA &D1
4AD8  A5 3E              .>   LDA &3E
4ADA  85 81              ..   STA &81
4ADC  A5 38              .8   LDA &38
4ADE  20 47 28            G(  JSR addr2847
4AE1  85 81              ..   STA &81
4AE3  A5 D1              ..   LDA &D1
4AE5  85 82              ..   STA &82
4AE7  A5 39              .9   LDA &39
4AE9  45 3F              E?   EOR &3F
4AEB  20 12 48            .H  JSR addr4812
4AEE  48                 H    PHA
4AEF  98                 .    TYA
4AF0  4A                 J    LSR A
4AF1  4A                 J    LSR A
4AF2  AA                 .    TAX
4AF3  68                 h    PLA
4AF4  24 83              $.   BIT &83
4AF6  30 02              0.   BMI addr4AFA
4AF8  A9 00              ..   LDA #&00
.addr4AFA
4AFA  95 D2              ..   STA &D2,X
4AFC  C8                 .    INY
.addr4AFD
4AFD  C4 97              ..   CPY &97
4AFF  B0 03              ..   BCS addr4B04
4B01  4C F8 49           L.I  JMP addr49F8
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
4B64  90 2E              ..   BCC addr4B94
4B66  C8                 .    INY
4B67  B1 22              ."   LDA (&22),Y
4B69  85 1B              ..   STA &1B
4B6B  29 0F              ).   AND #&0F
4B6D  AA                 .    TAX
4B6E  B5 D2              ..   LDA &D2,X
4B70  D0 25              .%   BNE addr4B97
4B72  A5 1B              ..   LDA &1B
4B74  4A                 J    LSR A
4B75  4A                 J    LSR A
4B76  4A                 J    LSR A
4B77  4A                 J    LSR A
4B78  AA                 .    TAX
4B79  B5 D2              ..   LDA &D2,X
4B7B  D0 1A              ..   BNE addr4B97
4B7D  C8                 .    INY
4B7E  B1 22              ."   LDA (&22),Y
4B80  85 1B              ..   STA &1B
4B82  29 0F              ).   AND #&0F
4B84  AA                 .    TAX
4B85  B5 D2              ..   LDA &D2,X
4B87  D0 0E              ..   BNE addr4B97
4B89  A5 1B              ..   LDA &1B
4B8B  4A                 J    LSR A
4B8C  4A                 J    LSR A
4B8D  4A                 J    LSR A
4B8E  4A                 J    LSR A
4B8F  AA                 .    TAX
4B90  B5 D2              ..   LDA &D2,X
4B92  D0 03              ..   BNE addr4B97
.addr4B94
4B94  4C 0C 4D           L.M  JMP addr4D0C
.addr4B97
4B97  A5 D1              ..   LDA &D1
4B99  85 35              .5   STA &35
4B9B  0A                 .    ASL A
4B9C  85 37              .7   STA &37
4B9E  0A                 .    ASL A
4B9F  85 39              .9   STA &39
4BA1  20 32 48            2H  JSR addr4832
4BA4  A5 48              .H   LDA &48
4BA6  85 36              .6   STA &36
4BA8  45 3B              E;   EOR &3B
4BAA  30 10              0.   BMI addr4BBC
4BAC  18                 .    CLC
4BAD  A5 3A              .:   LDA &3A
4BAF  65 46              eF   ADC &46
4BB1  85 34              .4   STA &34
4BB3  A5 47              .G   LDA &47
4BB5  69 00              i.   ADC #&00
4BB7  85 35              .5   STA &35
4BB9  4C DF 4B           L.K  JMP addr4BDF
.addr4BBC
4BBC  A5 46              .F   LDA &46
4BBE  38                 8    SEC
4BBF  E5 3A              .:   SBC &3A
4BC1  85 34              .4   STA &34
4BC3  A5 47              .G   LDA &47
4BC5  E9 00              ..   SBC #&00
4BC7  85 35              .5   STA &35
4BC9  B0 14              ..   BCS addr4BDF
4BCB  49 FF              I.   EOR #&FF
4BCD  85 35              .5   STA &35
4BCF  A9 01              ..   LDA #&01
4BD1  E5 34              .4   SBC &34
4BD3  85 34              .4   STA &34
4BD5  90 02              ..   BCC addr4BD9
4BD7  E6 35              .5   INC &35
.addr4BD9
4BD9  A5 36              .6   LDA &36
4BDB  49 80              I.   EOR #&80
4BDD  85 36              .6   STA &36
.addr4BDF
4BDF  A5 4B              .K   LDA &4B
4BE1  85 39              .9   STA &39
4BE3  45 3D              E=   EOR &3D
4BE5  30 10              0.   BMI addr4BF7
4BE7  18                 .    CLC
4BE8  A5 3C              .<   LDA &3C
4BEA  65 49              eI   ADC &49
4BEC  85 37              .7   STA &37
4BEE  A5 4A              .J   LDA &4A
4BF0  69 00              i.   ADC #&00
4BF2  85 38              .8   STA &38
4BF4  4C 1C 4C           L.L  JMP addr4C1C
.addr4BF7
4BF7  A5 49              .I   LDA &49
4BF9  38                 8    SEC
4BFA  E5 3C              .<   SBC &3C
4BFC  85 37              .7   STA &37
4BFE  A5 4A              .J   LDA &4A
4C00  E9 00              ..   SBC #&00
4C02  85 38              .8   STA &38
4C04  B0 16              ..   BCS addr4C1C
4C06  49 FF              I.   EOR #&FF
4C08  85 38              .8   STA &38
4C0A  A5 37              .7   LDA &37
4C0C  49 FF              I.   EOR #&FF
4C0E  69 01              i.   ADC #&01
4C10  85 37              .7   STA &37
4C12  A5 39              .9   LDA &39
4C14  49 80              I.   EOR #&80
4C16  85 39              .9   STA &39
4C18  90 02              ..   BCC addr4C1C
4C1A  E6 38              .8   INC &38
.addr4C1C
4C1C  A5 3F              .?   LDA &3F
4C1E  30 4A              0J   BMI addr4C6A
4C20  A5 3E              .>   LDA &3E
4C22  18                 .    CLC
4C23  65 4C              eL   ADC &4C
4C25  85 D1              ..   STA &D1
4C27  A5 4D              .M   LDA &4D
4C29  69 00              i.   ADC #&00
4C2B  85 80              ..   STA &80
4C2D  4C 89 4C           L.L  JMP addr4C89
.addr4C30
4C30  A6 81              ..   LDX &81
4C32  F0 1C              ..   BEQ addr4C50
4C34  A2 00              ..   LDX #&00
.addr4C36
4C36  4A                 J    LSR A
4C37  E8                 .    INX
4C38  C5 81              ..   CMP &81
4C3A  B0 FA              ..   BCS addr4C36
4C3C  86 83              ..   STX &83
4C3E  20 EF 47            .G  JSR addr47EF
4C41  A6 83              ..   LDX &83
4C43  A5 82              ..   LDA &82
.addr4C45
4C45  0A                 .    ASL A
4C46  26 80              &.   ROL &80
4C48  30 06              0.   BMI addr4C50
4C4A  CA                 .    DEX
4C4B  D0 F8              ..   BNE addr4C45
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
4C67  4C C9 4C           L.L  JMP addr4CC9
.addr4C6A
4C6A  A5 4C              .L   LDA &4C
4C6C  38                 8    SEC
4C6D  E5 3E              .>   SBC &3E
4C6F  85 D1              ..   STA &D1
4C71  A5 4D              .M   LDA &4D
4C73  E9 00              ..   SBC #&00
4C75  85 80              ..   STA &80
4C77  90 08              ..   BCC addr4C81
4C79  D0 0E              ..   BNE addr4C89
4C7B  A5 D1              ..   LDA &D1
4C7D  C9 04              ..   CMP #&04
4C7F  B0 08              ..   BCS addr4C89
.addr4C81
4C81  A9 00              ..   LDA #&00
4C83  85 80              ..   STA &80
4C85  A9 04              ..   LDA #&04
4C87  85 D1              ..   STA &D1
.addr4C89
4C89  A5 80              ..   LDA &80
4C8B  05 35              .5   ORA &35
4C8D  05 38              .8   ORA &38
4C8F  F0 0F              ..   BEQ addr4CA0
4C91  46 35              F5   LSR &35
4C93  66 34              f4   ROR &34
4C95  46 38              F8   LSR &38
4C97  66 37              f7   ROR &37
4C99  46 80              F.   LSR &80
4C9B  66 D1              f.   ROR &D1
4C9D  4C 89 4C           L.L  JMP addr4C89
.addr4CA0
4CA0  A5 D1              ..   LDA &D1
4CA2  85 81              ..   STA &81
4CA4  A5 34              .4   LDA &34
4CA6  C5 81              ..   CMP &81
4CA8  90 06              ..   BCC addr4CB0
4CAA  20 30 4C            0L  JSR addr4C30
4CAD  4C B3 4C           L.L  JMP addr4CB3
.addr4CB0
4CB0  20 EF 47            .G  JSR addr47EF
.addr4CB3
4CB3  A6 93              ..   LDX &93
4CB5  A5 36              .6   LDA &36
4CB7  30 9E              0.   BMI addr4C57
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
4CD7  90 19              ..   BCC addr4CF2
4CD9  20 30 4C            0L  JSR addr4C30
4CDC  4C F5 4C           L.L  JMP addr4CF5
.addr4CDF
4CDF  A9 60              .`   LDA #&60
4CE1  18                 .    CLC
4CE2  65 82              e.   ADC &82
4CE4  9D 00 01           ...  STA &0100,X
4CE7  E8                 .    INX
4CE8  A9 00              ..   LDA #&00
4CEA  65 80              e.   ADC &80
4CEC  9D 00 01           ...  STA &0100,X
4CEF  4C 0C 4D           L.M  JMP addr4D0C
.addr4CF2
4CF2  20 EF 47            .G  JSR addr47EF
.addr4CF5
4CF5  68                 h    PLA
4CF6  AA                 .    TAX
4CF7  E8                 .    INX
4CF8  A5 39              .9   LDA &39
4CFA  30 E3              0.   BMI addr4CDF
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
4D18  B0 07              ..   BCS addr4D21
4D1A  C5 97              ..   CMP &97
4D1C  B0 03              ..   BCS addr4D21
4D1E  4C 4B 4B           LKK  JMP addr4B4B
.addr4D21
4D21  A5 65              .e   LDA &65
4D23  29 20              )    AND #&20
4D25  F0 09              ..   BEQ addr4D30
4D27  A5 65              .e   LDA &65
4D29  09 08              ..   ORA #&08
4D2B  85 65              .e   STA &65
4D2D  4C 70 34           Lp4  JMP addr3470
.addr4D30
4D30  A9 08              ..   LDA #&08
4D32  24 65              $e   BIT &65
4D34  F0 05              ..   BEQ addr4D3B
4D36  20 78 4F            xO  JSR addr4F78
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
4D4F  50 54              PT   BVC addr4DA5
4D51  A5 65              .e   LDA &65
4D53  29 BF              ).   AND #&BF
4D55  85 65              .e   STA &65
4D57  A0 06              ..   LDY #&06
4D59  B1 1E              ..   LDA (&1E),Y
4D5B  A8                 .    TAY
4D5C  BE 00 01           ...  LDX &0100,Y
4D5F  86 34              .4   STX &34
4D61  E8                 .    INX
4D62  F0 41              .A   BEQ addr4DA5
4D64  BE 01 01           ...  LDX &0101,Y
4D67  86 35              .5   STX &35
4D69  E8                 .    INX
4D6A  F0 39              .9   BEQ addr4DA5
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
4D84  10 02              ..   BPL addr4D88
4D86  C6 38              .8   DEC &38
.addr4D88
4D88  20 19 4E            .N  JSR addr4E19
4D8B  B0 18              ..   BCS addr4DA5
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
4DC2  90 18              ..   BCC addr4DDC
4DC4  C8                 .    INY
4DC5  B1 22              ."   LDA (&22),Y
4DC7  C8                 .    INY
4DC8  85 1B              ..   STA &1B
4DCA  29 0F              ).   AND #&0F
4DCC  AA                 .    TAX
4DCD  B5 D2              ..   LDA &D2,X
4DCF  D0 0E              ..   BNE addr4DDF
4DD1  A5 1B              ..   LDA &1B
4DD3  4A                 J    LSR A
4DD4  4A                 J    LSR A
4DD5  4A                 J    LSR A
4DD6  4A                 J    LSR A
4DD7  AA                 .    TAX
4DD8  B5 D2              ..   LDA &D2,X
4DDA  D0 03              ..   BNE addr4DDF
.addr4DDC
4DDC  4C 5B 4F           L[O  JMP addr4F5B
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
4E11  20 1F 4E            .N  JSR addr4E1F
4E14  B0 C6              ..   BCS addr4DDC
4E16  4C 3F 4F           L?O  JMP addr4F3F
.addr4E19
4E19  A9 00              ..   LDA #&00
4E1B  85 90              ..   STA &90
4E1D  A5 39              .9   LDA &39
.addr4E1F
4E1F  A2 BF              ..   LDX #&BF
4E21  05 3B              .;   ORA &3B
4E23  D0 06              ..   BNE addr4E2B
4E25  E4 3A              .:   CPX &3A
4E27  90 02              ..   BCC addr4E2B
4E29  A2 00              ..   LDX #&00
.addr4E2B
4E2B  86 89              ..   STX &89
4E2D  A5 35              .5   LDA &35
4E2F  05 37              .7   ORA &37
4E31  D0 1C              ..   BNE addr4E4F
4E33  A9 BF              ..   LDA #&BF
4E35  C5 36              .6   CMP &36
4E37  90 16              ..   BCC addr4E4F
4E39  A5 89              ..   LDA &89
4E3B  D0 10              ..   BNE addr4E4D
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
4E51  10 2F              ./   BPL addr4E82
4E53  A5 35              .5   LDA &35
4E55  25 39              %9   AND &39
4E57  30 F2              0.   BMI addr4E4B
4E59  A5 37              .7   LDA &37
4E5B  25 3B              %;   AND &3B
4E5D  30 EC              0.   BMI addr4E4B
4E5F  A6 35              .5   LDX &35
4E61  CA                 .    DEX
4E62  8A                 .    TXA
4E63  A6 39              .9   LDX &39
4E65  CA                 .    DEX
4E66  86 3C              .<   STX &3C
4E68  05 3C              .<   ORA &3C
4E6A  10 DF              ..   BPL addr4E4B
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
4E80  10 C9              ..   BPL addr4E4B
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
4EA4  10 0D              ..   BPL addr4EB3
4EA6  A9 00              ..   LDA #&00
4EA8  38                 8    SEC
4EA9  E5 3E              .>   SBC &3E
4EAB  85 3E              .>   STA &3E
4EAD  A9 00              ..   LDA #&00
4EAF  E5 3F              .?   SBC &3F
4EB1  85 3F              .?   STA &3F
.addr4EB3
4EB3  A5 3D              .=   LDA &3D
4EB5  10 0B              ..   BPL addr4EC2
4EB7  38                 8    SEC
4EB8  A9 00              ..   LDA #&00
4EBA  E5 3C              .<   SBC &3C
4EBC  85 3C              .<   STA &3C
4EBE  A9 00              ..   LDA #&00
4EC0  E5 3D              .=   SBC &3D
.addr4EC2
4EC2  AA                 .    TAX
4EC3  D0 04              ..   BNE addr4EC9
4EC5  A6 3F              .?   LDX &3F
4EC7  F0 0A              ..   BEQ addr4ED3
.addr4EC9
4EC9  4A                 J    LSR A
4ECA  66 3C              f<   ROR &3C
4ECC  46 3F              F?   LSR &3F
4ECE  66 3E              f>   ROR &3E
4ED0  4C C2 4E           L.N  JMP addr4EC2
.addr4ED3
4ED3  86 D1              ..   STX &D1
4ED5  A5 3C              .<   LDA &3C
4ED7  C5 3E              .>   CMP &3E
4ED9  90 0A              ..   BCC addr4EE5
4EDB  85 81              ..   STA &81
4EDD  A5 3E              .>   LDA &3E
4EDF  20 EF 47            .G  JSR addr47EF
4EE2  4C F0 4E           L.N  JMP addr4EF0
.addr4EE5
4EE5  A5 3E              .>   LDA &3E
4EE7  85 81              ..   STA &81
4EE9  A5 3C              .<   LDA &3C
4EEB  20 EF 47            .G  JSR addr47EF
4EEE  C6 D1              ..   DEC &D1
.addr4EF0
4EF0  A5 82              ..   LDA &82
4EF2  85 3C              .<   STA &3C
4EF4  A5 83              ..   LDA &83
4EF6  85 3D              .=   STA &3D
4EF8  A5 89              ..   LDA &89
4EFA  F0 02              ..   BEQ addr4EFE
4EFC  10 13              ..   BPL addr4F11
.addr4EFE
4EFE  20 9F 4F            .O  JSR addr4F9F
4F01  A5 89              ..   LDA &89
4F03  10 31              .1   BPL addr4F36
4F05  A5 35              .5   LDA &35
4F07  05 37              .7   ORA &37
4F09  D0 30              .0   BNE addr4F3B
4F0B  A5 36              .6   LDA &36
4F0D  C9 C0              ..   CMP #&C0
4F0F  B0 2A              .*   BCS addr4F3B
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
4F31  20 9F 4F            .O  JSR addr4F9F
4F34  C6 90              ..   DEC &90
.addr4F36
4F36  68                 h    PLA
4F37  A8                 .    TAY
4F38  4C 3D 4E           L=N  JMP addr4E3D
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
4F59  B0 17              ..   BCS addr4F72
.addr4F5B
4F5B  E6 86              ..   INC &86
4F5D  A4 86              ..   LDY &86
4F5F  C4 97              ..   CPY &97
4F61  B0 0F              ..   BCS addr4F72
4F63  A0 00              ..   LDY #&00
4F65  A5 22              ."   LDA &22
4F67  69 04              i.   ADC #&04
4F69  85 22              ."   STA &22
4F6B  90 02              ..   BCC addr4F6F
4F6D  E6 23              .#   INC &23
.addr4F6F
4F6F  4C BE 4D           L.M  JMP addr4DBE
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
4F80  90 1C              ..   BCC addr4F9E
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
4F96  20 C4 16            ..  JSR addr16C4
4F99  C8                 .    INY
4F9A  C4 97              ..   CPY &97
4F9C  90 E5              ..   BCC addr4F83
.addr4F9E
4F9E  60                 `    RTS
.addr4F9F
4F9F  A5 35              .5   LDA &35
4FA1  10 17              ..   BPL addr4FBA
4FA3  85 83              ..   STA &83
4FA5  20 19 50            .P  JSR addr5019
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
4FBA  F0 19              ..   BEQ addr4FD5
4FBC  85 83              ..   STA &83
4FBE  C6 83              ..   DEC &83
4FC0  20 19 50            .P  JSR addr5019
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
4FD7  10 1A              ..   BPL addr4FF3
4FD9  85 83              ..   STA &83
4FDB  A5 36              .6   LDA &36
4FDD  85 82              ..   STA &82
4FDF  20 48 50            HP  JSR addr5048
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
5000  90 16              ..   BCC addr5018
5002  20 48 50            HP  JSR addr5048
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
501D  20 84 50            .P  JSR addr5084
5020  48                 H    PHA
5021  A6 D1              ..   LDX &D1
5023  D0 2B              .+   BNE addr5050
.addr5025
5025  A9 00              ..   LDA #&00
5027  AA                 .    TAX
5028  A8                 .    TAY
5029  46 83              F.   LSR &83
502B  66 82              f.   ROR &82
502D  06 81              ..   ASL &81
502F  90 09              ..   BCC addr503A
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
5040  B0 EF              ..   BCS addr5031
5042  D0 F6              ..   BNE addr503A
5044  68                 h    PLA
5045  10 30              .0   BPL addr5077
5047  60                 `    RTS
.addr5048
5048  20 84 50            .P  JSR addr5084
504B  48                 H    PHA
504C  A6 D1              ..   LDX &D1
504E  D0 D5              ..   BNE addr5025
.addr5050
5050  A9 FF              ..   LDA #&FF
5052  A8                 .    TAY
5053  0A                 .    ASL A
5054  AA                 .    TAX
.addr5055
5055  06 82              ..   ASL &82
5057  26 83              &.   ROL &83
5059  A5 83              ..   LDA &83
505B  B0 04              ..   BCS addr5061
505D  C5 81              ..   CMP &81
505F  90 0B              ..   BCC addr506C
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
5072  B0 E1              ..   BCS addr5055
5074  68                 h    PLA
5075  30 0C              0.   BMI addr5083
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
508A  10 11              ..   BPL addr509D
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
50A4  D0 25              .%   BNE addr50CB
50A6  A5 8A              ..   LDA &8A
50A8  45 84              E.   EOR &84
50AA  29 0F              ).   AND #&0F
50AC  D0 03              ..   BNE addr50B1
50AE  20 79 46            yF  JSR addr4679
.addr50B1
50B1  A6 8C              ..   LDX &8C
50B3  10 03              ..   BPL addr50B8
50B5  4C 3D 53           L=S  JMP addr533D
.addr50B8
50B8  A5 66              .f   LDA &66
50BA  10 0F              ..   BPL addr50CB
50BC  E0 01              ..   CPX #&01
50BE  F0 08              ..   BEQ addr50C8
50C0  A5 8A              ..   LDA &8A
50C2  45 84              E.   EOR &84
50C4  29 07              ).   AND #&07
50C6  D0 03              ..   BNE addr50CB
.addr50C8
50C8  20 7A 21            z!  JSR addr217A
.addr50CB
50CB  20 58 55            XU  JSR addr5558
50CE  A5 61              .a   LDA &61
50D0  0A                 .    ASL A
50D1  0A                 .    ASL A
50D2  85 81              ..   STA &81
50D4  A5 50              .P   LDA &50
50D6  29 7F              )   AND #&7F
50D8  20 47 28            G(  JSR addr2847
50DB  85 82              ..   STA &82
50DD  A5 50              .P   LDA &50
50DF  A2 00              ..   LDX #&00
50E1  20 4A 52            JR  JSR addr524A
50E4  A5 52              .R   LDA &52
50E6  29 7F              )   AND #&7F
50E8  20 47 28            G(  JSR addr2847
50EB  85 82              ..   STA &82
50ED  A5 52              .R   LDA &52
50EF  A2 03              ..   LDX #&03
50F1  20 4A 52            JR  JSR addr524A
50F4  A5 54              .T   LDA &54
50F6  29 7F              )   AND #&7F
50F8  20 47 28            G(  JSR addr2847
50FB  85 82              ..   STA &82
50FD  A5 54              .T   LDA &54
50FF  A2 06              ..   LDX #&06
5101  20 4A 52            JR  JSR addr524A
5104  A5 61              .a   LDA &61
5106  18                 .    CLC
5107  65 62              eb   ADC &62
5109  10 02              ..   BPL addr510D
510B  A9 00              ..   LDA #&00
.addr510D
510D  A0 0F              ..   LDY #&0F
510F  D1 1E              ..   CMP (&1E),Y
5111  90 02              ..   BCC addr5115
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
5125  20 77 28            w(  JSR addr2877
5128  85 1D              ..   STA &1D
512A  A5 33              .3   LDA &33
512C  45 48              EH   EOR &48
512E  A2 03              ..   LDX #&03
5130  20 08 53            .S  JSR addr5308
5133  85 9E              ..   STA &9E
5135  A5 1C              ..   LDA &1C
5137  85 9C              ..   STA &9C
5139  49 FF              I.   EOR #&FF
513B  85 1B              ..   STA &1B
513D  A5 1D              ..   LDA &1D
513F  85 9D              ..   STA &9D
5141  A6 2B              .+   LDX &2B
5143  20 77 28            w(  JSR addr2877
5146  85 1D              ..   STA &1D
5148  A5 9E              ..   LDA &9E
514A  45 7B              E{   EOR &7B
514C  A2 06              ..   LDX #&06
514E  20 08 53            .S  JSR addr5308
5151  85 4E              .N   STA &4E
5153  A5 1C              ..   LDA &1C
5155  85 4C              .L   STA &4C
5157  49 FF              I.   EOR #&FF
5159  85 1B              ..   STA &1B
515B  A5 1D              ..   LDA &1D
515D  85 4D              .M   STA &4D
515F  20 79 28            y(  JSR addr2879
5162  85 1D              ..   STA &1D
5164  A5 9E              ..   LDA &9E
5166  85 4B              .K   STA &4B
5168  45 7B              E{   EOR &7B
516A  45 4E              EN   EOR &4E
516C  10 0F              ..   BPL addr517D
516E  A5 1C              ..   LDA &1C
5170  65 9C              e.   ADC &9C
5172  85 49              .I   STA &49
5174  A5 1D              ..   LDA &1D
5176  65 9D              e.   ADC &9D
5178  85 4A              .J   STA &4A
517A  4C 9D 51           L.Q  JMP addr519D
.addr517D
517D  A5 9C              ..   LDA &9C
517F  E5 1C              ..   SBC &1C
5181  85 49              .I   STA &49
5183  A5 9D              ..   LDA &9D
5185  E5 1D              ..   SBC &1D
5187  85 4A              .J   STA &4A
5189  B0 12              ..   BCS addr519D
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
51A7  20 77 28            w(  JSR addr2877
51AA  85 1D              ..   STA &1D
51AC  A5 32              .2   LDA &32
51AE  45 4B              EK   EOR &4B
51B0  A2 00              ..   LDX #&00
51B2  20 08 53            .S  JSR addr5308
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
51C7  20 4C 52            LR  JSR addr524C
51CA  A5 8C              ..   LDA &8C
51CC  29 81              ).   AND #&81
51CE  C9 81              ..   CMP #&81
51D0  D0 01              ..   BNE addr51D3
51D2  60                 `    RTS
.addr51D3
51D3  A0 09              ..   LDY #&09
51D5  20 A1 52            .R  JSR addr52A1
51D8  A0 0F              ..   LDY #&0F
51DA  20 A1 52            .R  JSR addr52A1
51DD  A0 15              ..   LDY #&15
51DF  20 A1 52            .R  JSR addr52A1
51E2  A5 64              .d   LDA &64
51E4  29 80              ).   AND #&80
51E6  85 9A              ..   STA &9A
51E8  A5 64              .d   LDA &64
51EA  29 7F              )   AND #&7F
51EC  F0 1D              ..   BEQ addr520B
51EE  C9 7F              .   CMP #&7F
51F0  E9 00              ..   SBC #&00
51F2  05 9A              ..   ORA &9A
51F4  85 64              .d   STA &64
51F6  A2 0F              ..   LDX #&0F
51F8  A0 09              ..   LDY #&09
51FA  20 A8 1D            ..  JSR addr1DA8
51FD  A2 11              ..   LDX #&11
51FF  A0 0B              ..   LDY #&0B
5201  20 A8 1D            ..  JSR addr1DA8
5204  A2 13              ..   LDX #&13
5206  A0 0D              ..   LDY #&0D
5208  20 A8 1D            ..  JSR addr1DA8
.addr520B
520B  A5 63              .c   LDA &63
520D  29 80              ).   AND #&80
520F  85 9A              ..   STA &9A
5211  A5 63              .c   LDA &63
5213  29 7F              )   AND #&7F
5215  F0 1D              ..   BEQ addr5234
5217  C9 7F              .   CMP #&7F
5219  E9 00              ..   SBC #&00
521B  05 9A              ..   ORA &9A
521D  85 63              .c   STA &63
521F  A2 0F              ..   LDX #&0F
5221  A0 15              ..   LDY #&15
5223  20 A8 1D            ..  JSR addr1DA8
5226  A2 11              ..   LDX #&11
5228  A0 17              ..   LDY #&17
522A  20 A8 1D            ..  JSR addr1DA8
522D  A2 13              ..   LDX #&13
522F  A0 19              ..   LDY #&19
5231  20 A8 1D            ..  JSR addr1DA8
.addr5234
5234  A5 65              .e   LDA &65
5236  29 A0              ).   AND #&A0
5238  D0 09              ..   BNE addr5243
523A  A5 65              .e   LDA &65
523C  09 10              ..   ORA #&10
523E  85 65              .e   STA &65
5240  4C 58 55           LXU  JMP addr5558
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
5258  30 15              0.   BMI addr526F
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
5288  B0 16              ..   BCS addr52A0
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
52B6  20 FC 28            .(  JSR addr28FC
52B9  99 49 00           .I.  STA &0049,Y
52BC  96 48              .H   STX &48,Y
52BE  86 1B              ..   STX &1B
52C0  B6 46              .F   LDX &46,Y
52C2  86 82              ..   STX &82
52C4  B6 47              .G   LDX &47,Y
52C6  86 83              ..   STX &83
52C8  B9 49 00           .I.  LDA &0049,Y
52CB  20 FC 28            .(  JSR addr28FC
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
52EA  20 FC 28            .(  JSR addr28FC
52ED  99 49 00           .I.  STA &0049,Y
52F0  96 48              .H   STX &48,Y
52F2  86 1B              ..   STX &1B
52F4  B6 4A              .J   LDX &4A,Y
52F6  86 82              ..   STX &82
52F8  B6 4B              .K   LDX &4B,Y
52FA  86 83              ..   STX &83
52FC  B9 49 00           .I.  LDA &0049,Y
52FF  20 FC 28            .(  JSR addr28FC
5302  99 4B 00           .K.  STA &004B,Y
5305  96 4A              .J   STX &4A,Y
5307  60                 `    RTS
.addr5308
5308  A8                 .    TAY
5309  55 48              UH   EOR &48,X
530B  30 0F              0.   BMI addr531C
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
5329  90 04              ..   BCC addr532F
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
534D  20 82 27            .'  JSR addr2782
5350  A2 03              ..   LDX #&03
5352  20 4C 1D            L.  JSR addr1D4C
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
5369  20 82 27            .'  JSR addr2782
536C  A2 06              ..   LDX #&06
536E  20 4C 1D            L.  JSR addr1D4C
5371  A5 41              .A   LDA &41
5373  85 1B              ..   STA &1B
5375  85 4C              .L   STA &4C
5377  A5 42              .B   LDA &42
5379  85 1C              ..   STA &1C
537B  85 4D              .M   STA &4D
537D  A5 43              .C   LDA &43
537F  85 4E              .N   STA &4E
5381  49 80              I.   EOR #&80
5383  20 82 27            .'  JSR addr2782
5386  A5 43              .C   LDA &43
5388  29 80              ).   AND #&80
538A  85 D1              ..   STA &D1
538C  45 9E              E.   EOR &9E
538E  30 18              0.   BMI addr53A8
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
53A5  4C DB 53           L.S  JMP addr53DB
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
53C7  B0 12              ..   BCS addr53DB
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
53ED  20 82 27            .'  JSR addr2782
53F0  A2 00              ..   LDX #&00
53F2  20 4C 1D            L.  JSR addr1D4C
53F5  A5 41              .A   LDA &41
53F7  85 46              .F   STA &46
53F9  A5 42              .B   LDA &42
53FB  85 47              .G   STA &47
53FD  A5 43              .C   LDA &43
53FF  85 48              .H   STA &48
5401  4C BF 51           L.Q  JMP addr51BF
.addr5404
5404  CA                 .    DEX
5405  D0 31              .1   BNE addr5438
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
5462  20 6C 54            lT  JSR addr546C
5465  A0 0F              ..   LDY #&0F
5467  20 6C 54            lT  JSR addr546C
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
548A  20 C8 54            .T  JSR addr54C8
548D  20 AA 54            .T  JSR addr54AA
5490  4C B1 35           L.5  JMP addr35B1
.addr5493
5493  A9 00              ..   LDA #&00
5495  A4 87              ..   LDY &87
5497  D0 EE              ..   BNE addr5487
5499  EC 45 03           .E.  CPX &0345
549C  F0 E8              ..   BEQ addr5486
549E  8E 45 03           .E.  STX &0345
54A1  20 C8 54            .T  JSR addr54C8
54A4  20 05 1A            ..  JSR addr1A05
54A7  20 D8 35            .5  JSR addr35D8
.addr54AA
54AA  AC 45 03           .E.  LDY &0345
54AD  B9 68 03           .h.  LDA &0368,Y
54B0  F0 D4              ..   BEQ addr5486
54B2  A9 80              ..   LDA #&80
54B4  85 73              .s   STA &73
54B6  A9 48              .H   LDA #&48
54B8  85 74              .t   STA &74
54BA  A9 14              ..   LDA #&14
54BC  85 75              .u   STA &75
54BE  20 36 2D            6-  JSR addr2D36
54C1  A9 0A              ..   LDA #&0A
54C3  85 75              .u   STA &75
54C5  4C 36 2D           L6-  JMP addr2D36
.addr54C8
54C8  85 87              ..   STA &87
.addr54CA
54CA  A9 80              ..   LDA #&80
54CC  85 72              .r   STA &72
54CE  20 0A 36            .6  JSR addr360A
54D1  8D 43 03           .C.  STA &0343
54D4  8D 4A 03           .J.  STA &034A
54D7  8D 4B 03           .K.  STA &034B
54DA  A2 60              .`   LDX #&60
.addr54DC
54DC  20 A1 42            .B  JSR addr42A1
54DF  E8                 .    INX
54E0  E0 78              .x   CPX #&78
54E2  D0 F8              ..   BNE addr54DC
54E4  A6 2F              ./   LDX &2F
54E6  F0 03              ..   BEQ addr54EB
54E8  20 AC 30            .0  JSR addr30AC
.addr54EB
54EB  A0 01              ..   LDY #&01
54ED  84 2D              .-   STY &2D
54EF  A5 87              ..   LDA &87
54F1  D0 14              ..   BNE addr5507
54F3  A0 0B              ..   LDY #&0B
54F5  84 2C              .,   STY &2C
54F7  AD 45 03           .E.  LDA &0345
54FA  09 60              .`   ORA #&60
54FC  20 9A 33            .3  JSR addr339A
54FF  20 42 31            B1  JSR addr3142
5502  A9 AF              ..   LDA #&AF
5504  20 9A 33            .3  JSR addr339A
.addr5507
5507  A2 00              ..   LDX #&00
5509  86 34              .4   STX &34
550B  86 35              .5   STX &35
550D  86 72              .r   STX &72
550F  CA                 .    DEX
5510  86 36              .6   STX &36
5512  20 68 18            h.  JSR addr1868
5515  A9 02              ..   LDA #&02
5517  85 34              .4   STA &34
5519  85 36              .6   STA &36
551B  20 1E 55            .U  JSR addr551E
.addr551E
551E  20 21 55            !U  JSR addr5521
.addr5521
5521  A9 00              ..   LDA #&00
5523  85 35              .5   STA &35
5525  A9 BF              ..   LDA #&BF
5527  85 37              .7   STA &37
5529  C6 34              .4   DEC &34
552B  C6 36              .6   DEC &36
552D  4C C4 16           L..  JMP addr16C4
.addr5530
5530  20 F7 55            .U  JSR addr55F7
5533  88                 .    DEY
5534  D0 FA              ..   BNE addr5530
5536  60                 `    RTS
.addr5537
5537  A9 14              ..   LDA #&14
5539  85 2D              .-   STA &2D
553B  A9 75              .u   LDA #&75
553D  85 08              ..   STA &08
553F  A9 07              ..   LDA #&07
5541  85 07              ..   STA &07
5543  20 60 2B            `+  JSR addr2B60
5546  A9 00              ..   LDA #&00
5548  20 50 55            PU  JSR addr5550
554B  E6 08              ..   INC &08
554D  C8                 .    INY
554E  84 2C              .,   STY &2C
.addr5550
5550  A0 E9              ..   LDY #&E9
.addr5552
5552  91 07              ..   STA (&07),Y
5554  88                 .    DEY
5555  D0 FB              ..   BNE addr5552
.addr5557
5557  60                 `    RTS
.addr5558
5558  A5 65              .e   LDA &65
555A  29 10              ).   AND #&10
555C  F0 F9              ..   BEQ addr5557
555E  A5 8C              ..   LDA &8C
5560  30 F5              0.   BMI addr5557
5562  A2 FF              ..   LDX #&FF
5564  C9 01              ..   CMP #&01
5566  D0 02              ..   BNE addr556A
5568  A2 F0              ..   LDX #&F0
.addr556A
556A  86 91              ..   STX &91
556C  A5 47              .G   LDA &47
556E  05 4A              .J   ORA &4A
5570  05 4D              .M   ORA &4D
5572  29 C0              ).   AND #&C0
5574  D0 E1              ..   BNE addr5557
5576  A5 47              .G   LDA &47
5578  18                 .    CLC
5579  A6 48              .H   LDX &48
557B  10 04              ..   BPL addr5581
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
558C  10 03              ..   BPL addr5591
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
559D  30 03              0.   BMI addr55A2
559F  49 FF              I.   EOR #&FF
55A1  38                 8    SEC
.addr55A2
55A2  65 07              e.   ADC &07
55A4  10 0A              ..   BPL addr55B0
55A6  C9 C2              ..   CMP #&C2
55A8  B0 02              ..   BCS addr55AC
55AA  A9 C2              ..   LDA #&C2
.addr55AC
55AC  C9 F7              ..   CMP #&F7
55AE  90 02              ..   BCC addr55B2
.addr55B0
55B0  A9 F6              ..   LDA #&F6
.addr55B2
55B2  85 35              .5   STA &35
55B4  38                 8    SEC
55B5  E5 07              ..   SBC &07
55B7  08                 .    PHP
55B8  48                 H    PHA
55B9  20 A7 36            .6  JSR addr36A7
55BC  BD C0 16           ...  LDA &16C0,X
55BF  25 91              %.   AND &91
55C1  85 34              .4   STA &34
55C3  68                 h    PLA
55C4  28                 (    PLP
55C5  AA                 .    TAX
55C6  F0 12              ..   BEQ addr55DA
55C8  90 11              ..   BCC addr55DB
.addr55CA
55CA  88                 .    DEY
55CB  10 04              ..   BPL addr55D1
55CD  A0 07              ..   LDY #&07
55CF  C6 08              ..   DEC &08
.addr55D1
55D1  A5 34              .4   LDA &34
55D3  51 07              Q.   EOR (&07),Y
55D5  91 07              ..   STA (&07),Y
55D7  CA                 .    DEX
55D8  D0 F0              ..   BNE addr55CA
.addr55DA
55DA  60                 `    RTS
.addr55DB
55DB  C8                 .    INY
55DC  C0 08              ..   CPY #&08
55DE  D0 04              ..   BNE addr55E4
55E0  A0 00              ..   LDY #&00
55E2  E6 08              ..   INC &08
.addr55E4
55E4  C8                 .    INY
55E5  C0 08              ..   CPY #&08
55E7  D0 04              ..   BNE addr55ED
55E9  A0 00              ..   LDY #&00
55EB  E6 08              ..   INC &08
.addr55ED
55ED  A5 34              .4   LDA &34
55EF  51 07              Q.   EOR (&07),Y
55F1  91 07              ..   STA (&07),Y
55F3  E8                 .    INX
55F4  D0 EE              ..   BNE addr55E4
55F6  60                 `    RTS
.addr55F7
55F7  A9 00              ..   LDA #&00
55F9  85 8B              ..   STA &8B
.addr55FB
55FB  A5 8B              ..   LDA &8B
55FD  F0 FC              ..   BEQ addr55FB
55FF  60                 `    RTS
