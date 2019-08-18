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
screen                   = &07                    ; Pointer to screen memory
screen_lo                = &07                    ; Pointer to screen memory LSB
screen_hi                = &08                    ; Pointer to screen memory MSB
hull_pointer             = &1E                    ; Pointer to object's hull data
hull_pointer_lo          = &1E                    ; Pointer to object's hull data LSB
hull_pointer_hi          = &1F                    ; Pointer to object's hull data MSB
inf_pointer              = &20                    ; 
inf_pointer_lo           = &20                    ; 
inf_pointer_hi           = &21                    ; 
vertices_ptr             = &22                    ; Pointer to start of object's hull vertices
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
inkw_x                   = &46                    ; INKW x
inwk_xlo                 = &46                    ; INWK xlo
inwk_xhi                 = &47                    ; INWK xhi
inwk_xsg                 = &48                    ; INWK xsign xship_sign
inkw_y                   = &46                    ; INKW y
inwk_ylo                 = &49                    ; INWK ylo
inwk_yhi                 = &4A                    ; INWK yhi
inwk_ysg                 = &4B                    ; INWK ysign
inkw_z                   = &46                    ; INKW z
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
w0                       = &6C                    ; system seeds w0
w0_l                     = &6C                    ; system seeds w0_l
w0_h                     = &6D                    ; system seeds w0_h Economy
w1                       = &6C                    ; system seeds w1
w1_l                     = &6E                    ; system seeds w1_l
w1_h                     = &6F                    ; system seeds w1_h Radius lo / x-coord of star
w2                       = &6C                    ; system seeds w2
w2_l                     = &70                    ; system seeds w2_l Star size
w2_h                     = &71                    ; system seeds w2_h
my_speed                 = &7D                    ; Player's speed (1=lowest, &28(40)=max for Cobra MkIII)
edgecounter              = &86                    ; edge counter
shiptype                 = &8D                    ; Ship type (&80=planet_2ring/&82=planet_crater, &81=sun, &E0=autodocking
visibility               = &96                    ; visibility
edges                    = &97                    ; number of edges
;                         = &A9                    ; 
xsub                     = &D3                    ; xsub
xsublo                   = &D3                    ; xsublo
xsubhi                   = &D4                    ; xsubhi
ysub                     = &D3                    ; ysub
ysublo                   = &D6                    ; ysublo
ysubhi                   = &D7                    ; ysubhi
zsub                     = &D3                    ; zsub
zsublo                   = &D9                    ; zsublo
zsubhi                   = &DA                    ; zsubhi

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
object01_type            = &0311                  ; Object  1: type (&00=empty, &80=planet, &81=sun, &82=planet)
object02_type            = &0312                  ; Object  2: type (&00=empty)
object03_type            = &0313                  ; Object  3: type (&00=empty)
object04_type            = &0314                  ; Object  4: type (&00=empty)
object05_type            = &0315                  ; Object  5: type (&00=empty)
object06_type            = &0316                  ; Object  6: type (&00=empty)
object07_type            = &0317                  ; Object  7: type (&00=empty)
object08_type            = &0318                  ; Object  8: type (&00=empty)
object09_type            = &0319                  ; Object  9: type (&00=empty)
object10_type            = &031A                  ; Object 10: type (&00=empty)
object11_type            = &031B                  ; Object 11: type (&00=empty)
object12_type            = &031C                  ; Object 12: type (&00=empty)
object13_type            = &031D                  ; Object 13: type (&00=empty)
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
ship_13_total              = &032A                  ; Total number of 
ship_anaconda_total      = &032B                  ; Total number of Anacondas
ship_worm_total          = &032C                  ; Total number of Worms
ship_viper_total         = &032D                  ; Total number of Vipers
ship_17_total              = &032E                  ; Total number of 
ship_18_total              = &032F                  ; Total number of 
ship_krait_total         = &0330                  ; Total number of Krait
ship_adder_total         = &0331                  ; Total number of Adders
ship_21_total              = &0332                  ; Total number of 
ship_22_total              = &0333                  ; Total number of 
ship_23_total              = &0334                  ; Total number of 
ship_24_total              = &0335                  ; Total number of 
ship_asp_mk2_total       = &0336                  ; Total number of Asp Mk2
ship_ferdelance_total    = &0337                  ; Total number of Fer De Lances
ship_27_total              = &0338                  ; Total number of 
ship_28_total              = &0339                  ; Total number of 
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
my_laser_left            = &036A                  ; The player's left laser power
my_laser_right           = &036B                  ; The player's right laser power
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
my_dampening0            = &0387                  ; 
my_dampening1            = &0388                  ; 
my_dampening2            = &0389                  ; 
my_dampening3            = &038A                  ; 
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
my_kills                 = &039F                  ; The player's number of kills
my_kills_lo              = &039F                  ; The player's number of kills low byte
my_kills_hi              = &03A0                  ; The player's number of kills high byte
my_competition_number    = &03A1                  ; Competition number
                                                  ; &03A1-&03A3 unused
;                         = &03A4                  ; Message
my_shield_front          = &03A5                  ; The player's front shield
my_shield_aft            = &03A6                  ; The player's rear shield
my_energy                = &03A7                  ; The player's energy
my_compass_x             = &03A8                  ; The player's space compass x
my_compass_y             = &03A9                  ; The player's space compass y
;                         = &03AA                  ; 
;                         = &03AB                  ; 
planet_economy           = &03AC                  ; (0=Rich Industrial)
my_cargo_item_index      = &03AD
planet_government        = &03AE                  ; (0=Anarchy)
planet_techlevel         = &03AF                  ; Technology level ()
;                         = &03B0                  ; 
;                         = &03B1                  ; 
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
planet_productivity      = &03BD                  ; The planet's productivity
planet_productivity_lo   = &03BD                  ; The planet's productivity low byte
planet_productivity_hi   = &03BE                  ; The planet's productivity high byte
planet_distance          = &03BF                  ; Distance to target planetary system
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
;                         = &07E0                  ; &07E0-&07FF = ACT???
obj_planet               = &0900                  ; Planet x
obj_planet_xlo           = &0900                  ; Planet xlo
obj_planet_xhi           = &0901                  ; Planet xhi
obj_planet_xsg           = &0902                  ; Planet xsign
obj_planet_y             = &0903                  ; Planet y
obj_planet_ylo           = &0903                  ; Planet ylo
obj_planet_yhi           = &0904                  ; Planet yhi
obj_planet_ysg           = &0905                  ; Planet ysign
obj_planet_z             = &0906                  ; Planet z
obj_planet_zlo           = &0906                  ; Planet zlo
obj_planet_zhi           = &0907                  ; Planet zhi
obj_planet_zsg           = &0908                  ; Planet zsign (= distance to planet)
obj_sun_x                = &0925                  ; Sun / Space Station x
obj_sun_xlo              = &0925                  ; Sun / Space Station xlo
obj_sun_xhi              = &0926                  ; Sun / Space Station xhi
obj_sun_xsg              = &0927                  ; Sun / Space Station xsign
obj_sun_y                = &0928                  ; Sun / Space Station y
obj_sun_ylo              = &0928                  ; Sun / Space Station ylo
obj_sun_yhi              = &0929                  ; Sun / Space Station yhi
obj_sun_ysg              = &092A                  ; Sun / Space Station ysign
obj_sun_z                = &092B                  ; Sun / Space Station z
obj_sun_zlo              = &092B                  ; Sun / Space Station zlo
obj_sun_zhi              = &092C                  ; Sun / Space Station zhi
obj_sun_zsg              = &092D                  ; Sun / Space Station zsign
altitude                 = &0DF1                  ; Altitude from planet
stardust_x               = &0F5C                  ; X coord of stardust (0F5C-0F81)
stardust_y               = &0F82                  ; Y coord of stardust (0F82-0FA7)
stardust_z               = &0FA8                  ; Z coord of stardust (0FA8-0FCD)

crtc_register            = &FE00
crtc_data                = &FE01
video_ula_palette        = &FE21
systemvia_irb            = &FE40
systemvia_orb            = &FE40
systemvia_ddra           = &FE43
systemvia_ira_nh         = &FE4F
systemvia_ora_nh         = &FE4F

osword                   = &FFF1
osbyte                   = &FFF4
oscli                    = &FFF7


;temp stuff
addr0D7A = &0D7A
addr114B = &114B
addr11D5 = &11D5

ORG &11E3

.start

.codestart
	JMP descramble
	JMP descramble
.wrchv
	JMP addr1EFC
.addr11EC
	EQUW addr114B                   ; irq1v (Used for screen interrupt)
.brkv
	JMP addr11D5

; -----------------------------------------------------------------------------
; Switch from flight mode to docked mode
; -----------------------------------------------------------------------------
.dockship
	LDX #str_load_t_code MOD 256
	LDY #str_load_t_code DIV 256
	JSR oscli

.str_load_t_code
	EQUS "L.T.CODE", &0D

; -----------------------------------------------------------------------------
; Descramble main code
; -----------------------------------------------------------------------------
.descramble
	LDY #&1300 MOD 256
	STY screen_lo
	LDX #&1300 DIV 256
.descramble1
	STX screen_hi
	TYA
	EOR (screen),Y
	EOR #&33
	STA (screen),Y
	DEY
	BNE descramble1
	INX
	CPX #&56
	BNE descramble1
	JMP addr4244

; -----------------------------------------------------------------------------
; Dock the ship
; -----------------------------------------------------------------------------
.addr121B
	LDA #'R'                        ; *Run
	STA &11F8                       ; Change *Load to *Run
.addr1220
	JSR addr3EE1
	JSR addr0D7A
	BNE dockship

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr1228
	LDA &0900
	STA rand0
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
	STA shiptype
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
	STA beta1
	ORA &7B
	STA beta
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
	LDA key_spacebar
	BEQ addr12AB
	LDA &7D
	CMP #&28
	BCS addr12AB
	INC &7D
.addr12AB
	LDA key_question
	BEQ addr12B6
	DEC &7D
	BNE addr12B6
	INC &7D
.addr12B6
	LDA key_u
	AND &038B
	BEQ addr12CD
	LDY #&EE
	JSR addr3805
	LDA #&28
	JSR addr43F3
	LDA #&00
	STA &0344
.addr12CD
	LDA missile_target
	BPL addr12E3
	LDA key_t
	BEQ addr12E3
	LDX &038B
	BEQ addr12E3
	STA &0344
	LDY #&E0
	JSR addr383D
.addr12E3
	LDA key_m
	BEQ addr12EF
	LDA missile_target
	BMI addr1326
	JSR addr252E
.addr12EF
	LDA key_tab
	BEQ addr12F7
	ASL &0382
.addr12F7
	LDA &0310
	BEQ addr1301
	LDA #&00
	STA &033F
.addr1301
	LDA key_escape
	AND &0386
	BEQ addr130C
	JMP addr20C1
.addr130C
	LDA key_j
	BEQ addr1314
	JSR addr434E
.addr1314
	LDA key_e
	AND &0380
	BEQ addr1326
	LDA ecm_on
	BNE addr1326
	DEC &0340
	JSR addr3813
.addr1326
	LDA key_c
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
	LDA key_a
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
	LDA object01_type,X
	BNE addr1380
	JMP addr153F
.addr1380
	STA &8C
	JSR addr3732
	LDY #&24
.addr1387
	LDA (inf_pointer),Y
	STA &0046,Y
	DEY
	BPL addr1387
	LDA &8C
	BMI addr13B6                    ; Jump if object type is PLANET or SUN
	ASL A
	TAY
	LDA &55FE,Y
	STA hull_pointer_lo
	LDA &55FF,Y
	STA hull_pointer_hi
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
	STA (inf_pointer),Y
	DEY
	BPL addr13BB
	LDA &65
	AND #&A0
	JSR addr41BF
	BNE addr141D
	LDA inwk_xlo
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
	LDA (hull_pointer),Y
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
	STA (inf_pointer),Y
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
	LDA (hull_pointer),Y
	BEQ addr1527
	TAX
	INY
	LDA (hull_pointer),Y
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
	STA (inf_pointer),Y
	LDX &84
	INX
	JMP addr1376
.addr153F
	LDA &0382
	BPL addr154F
	ASL &0382
	JSR addr55F7
	LDA #&30
	STA video_ula_palette
.addr154F
	LDA &8A
	AND #&07
	BNE addr15C2
	LDX my_energy
	BPL addr156C
	LDX my_shield_aft
	JSR addr3626
	STX my_shield_aft
	LDX my_shield_front
	JSR addr3626
	STX my_shield_front
.addr156C
	SEC
	LDA &0383
	ADC my_energy
	BCS addr1578
	STA my_energy
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
	STA inwk_xlo,X
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
	CMP my_energy
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
	LDA ecm_on
	BEQ addr1671
	DEC ecm_on
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
	AND (hull_pointer),Y
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
	STA screen_hi
	LDA &35
	AND #&07
	TAY
	TXA
	AND #&F8
	STA screen_lo
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
	EOR (screen),Y
	STA (screen),Y
.addr1748
	LSR &82
	BCC addr1754
	ROR &82
	LDA screen_lo
	ADC #&08
	STA screen_lo
.addr1754
	LDA &83
	ADC &81
	STA &83
	BCC addr1763
	DEY
	BPL addr1763
	DEC screen_hi
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
	EOR (screen),Y
	STA (screen),Y
.addr1774
	LSR &82
	BCC addr1780
	ROR &82
	LDA screen_lo
	ADC #&08
	STA screen_lo
.addr1780
	LDA &83
	ADC &81
	STA &83
	BCC addr1791
	INY
	CPY #&08
	BNE addr1791
	INC screen_hi
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
	STA screen_hi
	TXA
	AND #&F8
	STA screen_lo
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
	EOR (screen),Y
	STA (screen),Y
.addr17F3
	DEY
	BPL addr17FA
	DEC screen_hi
	LDY #&07
.addr17FA
	LDA &83
	ADC &1B
	STA &83
	BCC addr180E
	LSR &82
	BCC addr180E
	ROR &82
	LDA screen_lo
	ADC #&08
	STA screen_lo
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
	EOR (screen),Y
	STA (screen),Y
.addr181F
	DEY
	BPL addr1826
	DEC screen_hi
	LDY #&07
.addr1826
	LDA &83
	ADC &1B
	STA &83
	BCC addr183B
	ASL &82
	BCC addr183B
	ROL &82
	LDA screen_lo
	SBC #&07
	STA screen_lo
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
	INC text_cursor_y
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
	STA screen_hi
	LDA &35
	AND #&07
	STA screen_lo
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
	EOR (screen),Y
	STA (screen),Y
	TYA
	ADC #&08
	TAY
	LDX &82
	DEX
	BEQ addr18C4
	CLC
.addr18B7
	LDA #&FF
	EOR (screen),Y
	STA (screen),Y
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
	EOR (screen),Y
	STA (screen),Y
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
	EOR (screen),Y
	STA (screen),Y
.addr18EB
	LDY &85
	RTS

.addr18EE
	EQUB &80, &C0, &E0, &F0, &F8, &FC, &FE
.addr18F5
	EQUB &FF, &7F, &3F, &1F, &0F, &07, &03, &01

.addr18FD 
	LDA addr16AF,X
	EOR (screen),Y
	STA (screen),Y
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
	STA screen_hi
	TXA
	AND #&F8
	STA screen_lo
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
	EOR (screen),Y
	STA (screen),Y
	LDA &88
	CMP #&50
	BCS addr1968
	DEY
	BPL addr1961
	LDY #&01
.addr1961
	LDA addr16B7,X
	EOR (screen),Y
	STA (screen),Y
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
	LDX beta1
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
	LDA beta
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
	LDX beta1
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
	LDA beta
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
	STA inwk_xsg,X
	LDY &41
	STY inwk_xlo,X
	LDY &42
	STY inwk_xhi,X
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
	STA text_cursor_x
	LDA #&7E
	JSR addr1847
	LDA #&E6
	LDY &033E
	LDX &0313,Y
	BEQ addr1CA5
	LDY my_energy
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
	LDA my_kills_hi
	BNE addr1C70
	TAX
	LDA my_kills_lo
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
	LDX object01_type,Y
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
	STX text_cursor_x
	RTS
.addr1D4C
	LDA &43
	STA &83
	AND #&80
	STA &D1
	EOR inwk_xsg,X
	BMI addr1D70
	LDA &41
	CLC
	ADC inwk_xlo,X
	STA &41
	LDA &42
	ADC inwk_xhi,X
	STA &42
	LDA &43
	ADC inwk_xsg,X
	AND #&7F
	ORA &D1
	STA &43
	RTS
.addr1D70
	LDA &83
	AND #&7F
	STA &83
	LDA inwk_xlo,X
	SEC
	SBC &41
	STA &41
	LDA inwk_xhi,X
	SBC &42
	STA &42
	LDA inwk_xsg,X
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
	LDA inwk_xhi,X
	AND #&7F
	LSR A
	STA &D1
	LDA inwk_xlo,X
	SEC
	SBC &D1
	STA &82
	LDA inwk_xhi,X
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
	LDA inwk_xlo,X
	STA &1B
	LDA inwk_xhi,X
	AND #&80
	STA &D1
	LDA inwk_xhi,X
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
	STX inwk_xlo,Y
	LDX &81
	LDA &40
	STA inwk_xlo,X
	LDA &41
	STA inwk_xhi,X
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
	STX text_cursor_x
.addr1F1A
	INC text_cursor_y
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
	LDA text_cursor_x
	ASL A
	ASL A
	ASL A
	STA screen_lo
	INC text_cursor_x
	LDA text_cursor_y
	CMP #&18
	BCC addr1F43
	JSR addr54C8
	JMP addr1F52
.addr1F43
	ORA #&60
.addr1F45
	STA screen_hi
	LDY #&07
.addr1F49
	LDA (&1C),Y
	EOR (screen),Y
	STA (screen),Y
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
	STA screen_lo
	LDA #&78
	STA screen_hi
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
	LDA beta
	LDX beta1
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
	STY &3A,X
	DEX
	BPL addr1FB3
	LDX #&03
	LDA my_energy
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
	STA screen_hi
	LDA #&10
	STA screen_lo
	LDA my_shield_front
	JSR addr2036
	LDA my_shield_aft
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
	EQUB &2C
.addr2033
	LDA #&0F
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
	STA (screen),Y
	INY
	STA (screen),Y
	INY
	STA (screen),Y
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
	INC screen_hi
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
	STA (screen),Y
	INY
	STA (screen),Y
	INY
	STA (screen),Y
	INY
	STA (screen),Y
	TYA
	CLC
	ADC #&05
	TAY
	CPY #&1E
	BCC addr2091
	INC screen_hi
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
	LDA ecm_on
	BNE addr2150
	LDA &66
	ASL A
	BMI addr2102
	LSR A
	TAX
	LDA addr1695,X
	STA vertices_ptr_lo
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
	LDA (vertices_ptr),Y
	BIT &216E
	BNE addr2150
	ORA #&80
	STA (vertices_ptr),Y
.addr2150
	LDA inwk_xlo
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
	LDA (vertices_ptr),Y
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
	CMP (hull_pointer),Y
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
	LDA inwk_xlo,X
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
	LDA (hull_pointer),Y
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
	LDA ecm_on
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
	LDA (hull_pointer),Y
	AND #&F8
	BEQ addr22C6
	LDA &65
	ORA #&40
	STA &65
	CPX #&A3
	BCC addr22C6
	LDA (hull_pointer),Y
	LSR A
	JSR addr36E4
	DEC &62
	LDA ecm_on
	BNE addr2311
	LDA #&08
	JMP addr43F3
.addr22C6
	LDA &4D
	CMP #&03
	BCS addr22D4
	LDA inwk_xhi
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
	STA vertices_ptr_lo
	LDA #&09
.addr2409
	STA vertices_ptr_hi
	LDY #&02
	JSR addr2417
	LDY #&05
	JSR addr2417
	LDY #&08
.addr2417
	LDA (vertices_ptr),Y
	EOR #&80
	STA &43
	DEY
	LDA (vertices_ptr),Y
	STA &42
	DEY
	LDA (vertices_ptr),Y
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
	ORA inwk_xhi
	ORA &4A
	BNE addr2505
	LDA inwk_xlo
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
	LDA (hull_pointer),Y
	CMP &83
	BNE addr2505
	DEY
	LDA (hull_pointer),Y
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
	LDA missile_target
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
	LDX missile_target
	JSR addr3732
	LDA object01_type,X
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
	LDA (inf_pointer),Y
	AND #&20
	BEQ addr255C
	JSR addr2580
.addr255C
	LDY #&20
	LDA (inf_pointer),Y
	BEQ addr2505
	ORA #&80
	STA (inf_pointer),Y
	LDY #&1C
	LDA #&02
	STA (inf_pointer),Y
	ASL A
	LDY #&1E
	STA (inf_pointer),Y
	LDA &8C
	CMP #&0B
	BCC addr257F
	LDY #&24
	LDA (inf_pointer),Y
	ORA #&04
	STA (inf_pointer),Y
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
	LDA hull_pointer_lo
	PHA
	LDA hull_pointer_hi
	PHA
	LDA inf_pointer_lo
	PHA
	LDA inf_pointer_hi
	PHA
	LDY #&24
.addr25A4
	LDA &0046,Y
	STA &0100,Y
	LDA (inf_pointer),Y
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
	STA inf_pointer_hi
	PLA
	STA inf_pointer_lo
	LDX #&24
.addr2609
	LDA &0100,X
	STA inwk_xlo,X
	DEX
	BPL addr2609
	PLA
	STA hull_pointer_hi
	PLA
	STA hull_pointer_lo
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
	LDX beta1
	JSR addr27C8
	JSR addr28FF
	STX &24
	STA &25
	LDX &0F95,Y
	STX &82
	LDX &35
	STX &83
	LDX beta1
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
	LDA shiptype
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
	LDA shiptype
	EOR &99
	STA shiptype
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
	LDX inwk_xlo,Y
	STX &81
	LDA &34
	JSR addr28D4
	LDX inwk_xsg,Y
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

.addr2AD6
	EQUB &8C, &E7, &8D, &ED, &8A, &E6, &C1, &C8
	EQUB &C8, &8B, &E0, &8A, &E6, &D6, &C5, &C6
	EQUB &C1, &CA, &95, &9D, &9C, &97

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr2AEC
	STA &03AD
	LDA #&01
	PHA
	LDX #&0C
	CPX &03AD
	BCC addr2B04
.addr2AF9
	ADC &036F,X
	DEX
	BPL addr2AF9
	CMP &036E
	PLA
	RTS
.addr2B04
	LDY &03AD
	LDA &036F,Y
	CMP #&C8
	PLA
	RTS
.addr2B0E
	JSR addr2B11
.addr2B11
	JSR addr2B14
.addr2B14
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
.addr2B3B
	LDA &03BF
	ORA &03C0
	BNE addr2B46
	INC text_cursor_y
	RTS
.addr2B46
	LDA #&BF
	JSR addr3395
	LDX &03BF
	LDY &03C0
	SEC
	JSR addr30B4
	LDA #&C3
.addr2B57
	JSR addr339A
.addr2B5A
	INC text_cursor_y
.addr2B5C
	LDA #&80
	STA &72
.addr2B60
	LDA #&0C
	JMP addr339A
.addr2B65
	LDA #&AD
	JSR addr339A
	JMP addr2BA9
.addr2B6D
	JSR addr339A
	JMP addr3142
.addr2B73
	LDA #&01
	JSR addr54C8
	LDA #&09
	STA text_cursor_x
	LDA #&A3
	JSR addr339A
	JSR addr184E
	JSR addr2B5A
	INC text_cursor_y
	JSR addr2B3B
	LDA #&C2
	JSR addr3395
	LDA &03B8
	CLC
	ADC #&01
	LSR A
	CMP #&02
	BEQ addr2B65
	LDA &03B8
	BCC addr2BA4
	SBC #&05
	CLC
.addr2BA4
	ADC #&AA
	JSR addr339A
.addr2BA9
	LDA &03B8
	LSR A
	LSR A
	CLC
	ADC #&A8
	JSR addr2B57
	LDA #&A2
	JSR addr3395
	LDA &03B9
	CLC
	ADC #&B1
	JSR addr2B57
	LDA #&C4
	JSR addr3395
	LDX &03BA
	INX
	CLC
	JSR addr1E38
	JSR addr2B5A
	LDA #&C0
	JSR addr3395
	SEC
	LDX &03BB
	JSR addr1E38
	LDA #&C6
	JSR addr2B57
	LDA #&28
	JSR addr339A
	LDA &70
	BMI addr2BF4
	LDA #&BC
	JSR addr339A
	JMP addr2C30
.addr2BF4
	LDA &71
	LSR A
	LSR A
	PHA
	AND #&07
	CMP #&03
	BCS addr2C04
	ADC #&E3
	JSR addr2B6D
.addr2C04
	PLA
	LSR A
	LSR A
	LSR A
	CMP #&06
	BCS addr2C11
	ADC #&E6
	JSR addr2B6D
.addr2C11
	LDA &6F
	EOR &6D
	AND #&07
	STA &73
	CMP #&06
	BCS addr2C22
	ADC #&EC
	JSR addr2B6D
.addr2C22
	LDA &71
	AND #&03
	CLC
	ADC &73
	AND #&07
	ADC #&F2
	JSR addr339A
.addr2C30
	LDA #&53
	JSR addr339A
	LDA #&29
	JSR addr2B57
	LDA #&C1
	JSR addr3395
	LDX &03BD
	LDY &03BE
	JSR addr30B3
	JSR addr3142
	LDA #&00
	STA &72
	LDA #&4D
	JSR addr339A
	LDA #&E2
	JSR addr2B57
	LDA #&FA
	JSR addr3395
	LDA &71
	LDX &6F
	AND #&0F
	CLC
	ADC #&0B
	TAY
	JSR addr30B4
	JSR addr3142
	LDA #&6B
	JSR addr1EFC
	LDA #&6D
	JMP addr1EFC
.addr2C78
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
	BNE addr2C94
	LDA &03B8
	ORA #&02
	STA &03B8
.addr2C94
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
	JSR addr2820
	LDA &03BB
	STA &81
	JSR addr2820
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
.addr2CEB
	LDA #&40
	JSR addr54C8
	LDA #&07
	STA text_cursor_x
	JSR addr2F6A
	LDA #&C7
	JSR addr339A
	JSR addr184E
	LDA #&98
	JSR addr1852
	JSR addr2DA1
	LDX #&00
.addr2D09
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
	JSR addr1932
	JSR addr2B0E
	LDX &84
	INX
	BNE addr2D09
	LDA &03C1
	STA &73
	LDA &03C2
	LSR A
	STA &74
	LDA #&04
	STA &75
.addr2D36
	LDA #&18
	LDX &87
	BPL addr2D3E
	LDA #&00
.addr2D3E
	STA &78
	LDA &73
	SEC
	SBC &75
	BCS addr2D49
	LDA #&00
.addr2D49
	STA &34
	LDA &73
	CLC
	ADC &75
	BCC addr2D54
	LDA #&FF
.addr2D54
	STA &36
	LDA &74
	CLC
	ADC &78
	STA &35
	JSR addr1868
	LDA &74
	SEC
	SBC &75
	BCS addr2D69
	LDA #&00
.addr2D69
	CLC
	ADC &78
	STA &35
	LDA &74
	CLC
	ADC &75
	ADC &78
	CMP #&98
	BCC addr2D7F
	LDX &87
	BMI addr2D7F
	LDA #&97
.addr2D7F
	STA &37
	LDA &73
	STA &34
	STA &36
	JMP addr16C4
.addr2D8A
	LDA #&68
	STA &73
	LDA #&5A
	STA &74
	LDA #&10
	STA &75
	JSR addr2D36
	LDA &0365
	STA &40
	JMP addr2DC5
.addr2DA1
	LDA &87
	BMI addr2D8A
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
	JSR addr2D36
	LDA &74
	CLC
	ADC #&18
	STA &74
.addr2DC5
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
	JSR addr3B90
	RTS
.addr2DDE
	LDY #&00
.addr2DE0
	STY &03AD
	LDX &036F,Y
	BEQ addr2E0C
	TYA
	ASL A
	ASL A
	TAY
	LDA &461A,Y
	STA &74
	TXA
	PHA
	JSR addr2B5C
	CLC
	LDA &03AD
	ADC #&D0
	JSR addr339A
	LDA #&0E
	STA text_cursor_x
	PLA
	TAX
	CLC
	JSR addr1E38
	JSR addr3135
.addr2E0C
	LDY &03AD
	INY
	CPY #&11
	BCC addr2DE0
	RTS
.addr2E15
	LDA #&08
	JSR addr54C8
	LDA #&0B
	STA text_cursor_x
	LDA #&A4
	JSR addr2B57
	JSR addr184A
	JSR addr3366
	LDA &036E
	CMP #&1A
	BCC addr2E35
	LDA #&6B
	JSR addr339A
.addr2E35
	JMP addr2DDE
.addr2E38
	TXA
	PHA
	DEY
	TYA
	EOR #&FF
	PHA
	JSR addr55F7
	JSR addr2E65
	PLA
	STA &76
	LDA &03C2
	JSR addr2E7B
	LDA &77
	STA &03C2
	STA &74
	PLA
	STA &76
	LDA &03C1
	JSR addr2E7B
	LDA &77
	STA &03C1
	STA &73
.addr2E65
	LDA &87
	BMI addr2E8C
	LDA &03C1
	STA &73
	LDA &03C2
	LSR A
	STA &74
	LDA #&04
	STA &75
	JMP addr2D36
.addr2E7B
	STA &77
	CLC
	ADC &76
	LDX &76
	BMI addr2E87
	BCC addr2E89
	RTS
.addr2E87
	BCC addr2E8B
.addr2E89
	STA &77
.addr2E8B
	RTS
.addr2E8C
	LDA &03C1
	SEC
	SBC &0359
	CMP #&26
	BCC addr2E9B
	CMP #&E6
	BCC addr2E8B
.addr2E9B
	ASL A
	ASL A
	CLC
	ADC #&68
	STA &73
	LDA &03C2
	SEC
	SBC &035A
	CMP #&26
	BCC addr2EB1
	CMP #&DC
	BCC addr2E8B
.addr2EB1
	ASL A
	CLC
	ADC #&5A
	STA &74
	LDA #&08
	STA &75
	JMP addr2D36
.addr2EBE
	LDA #&80
	JSR addr54C8
	LDA #&07
	STA text_cursor_x
	LDA #&BE
	JSR addr1847
	JSR addr2DA1
	JSR addr2E65
	JSR addr2F6A
	LDA #&00
	STA &97
	LDX #&18
.addr2EDB
	STA inwk_xlo,X
	DEX
	BPL addr2EDB
.addr2EE0
	LDA &6F
	SEC
	SBC &0359
	BCS addr2EEC
	EOR #&FF
	ADC #&01
.addr2EEC
	CMP #&14
	BCS addr2F60
	LDA &6D
	SEC
	SBC &035A
	BCS addr2EFC
	EOR #&FF
	ADC #&01
.addr2EFC
	CMP #&26
	BCS addr2F60
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
	STA text_cursor_x
	INC text_cursor_x
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
	LDX inwk_xlo,Y
	BEQ addr2F31
	INY
	LDX inwk_xlo,Y
	BEQ addr2F31
	DEY
	DEY
	LDX inwk_xlo,Y
	BNE addr2F43
.addr2F31
	STY text_cursor_y
	CPY #&03
	BCC addr2F60
	LDA #&FF
	STA &0046,Y
	LDA #&80
	STA &72
	JSR addr330A
.addr2F43
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
	JSR addr360A
	JSR addr3A54
	JSR addr360A
.addr2F60
	JSR addr2B0E
	INC &97
	BEQ addr2F74
	JMP addr2EE0
.addr2F6A
	LDX #&05
.addr2F6C
	LDA &035B,X
	STA &6C,X
	DEX
	BPL addr2F6C
.addr2F74
	RTS
.addr2F75
	JSR addr2F6A
	LDY #&7F
	STY &D1
	LDA #&00
	STA &80
.addr2F80
	LDA &6F
	SEC
	SBC &03C1
	BCS addr2F8C
	EOR #&FF
	ADC #&01
.addr2F8C
	LSR A
	STA &83
	LDA &6D
	SEC
	SBC &03C2
	BCS addr2F9B
	EOR #&FF
	ADC #&01
.addr2F9B
	LSR A
	CLC
	ADC &83
	CMP &D1
	BCS addr2FAE
	STA &D1
	LDX #&05
.addr2FA7
	LDA &6C,X
	STA &73,X
	DEX
	BPL addr2FA7
.addr2FAE
	JSR addr2B0E
	INC &80
	BNE addr2F80
	LDX #&05
.addr2FB7
	LDA &73,X
	STA &6C,X
	DEX
	BPL addr2FB7
	LDA &6D
	STA &03C2
	LDA &6F
	STA &03C1
	SEC
	SBC &0359
	BCS addr2FD2
	EOR #&FF
	ADC #&01
.addr2FD2
	JSR addr280D
	STA &41
	LDA &1B
	STA &40
	LDA &03C2
	SEC
	SBC &035A
	BCS addr2FE8
	EOR #&FF
	ADC #&01
.addr2FE8
	LSR A
	JSR addr280D
	PHA
	LDA &1B
	CLC
	ADC &40
	STA &81
	PLA
	ADC &41
	STA &82
	JSR addr47B8
	LDA &81
	ASL A
	LDX #&00
	STX &03C0
	ROL &03C0
	ASL A
	ROL &03C0
	STA &03BF
	JMP addr2C78
.addr3011
	LDA hyperspace_countdown_hi
	ORA &8E
	BNE addr3084+1                  ; RTS
	JSR addr4437
	BMI addr305E
	LDA &87
	BNE addr3023
	JMP addr30C3
.addr3023
	JSR addr32FE
.addr3026
	LDA &03BF
	ORA &03C0
	BEQ addr3084+1                  ; RTS
	LDA #&07
	STA text_cursor_x
	LDA #&17
	STA text_cursor_y
	LDA #&00
	STA &72
	LDA #&BD
	JSR addr339A
	LDA &03C0
	BNE addr30B9
	LDA &0365
	CMP &03BF
	BCC addr30B9
	LDA #&2D
	JSR addr339A
	JSR addr330A
.addr3054
	LDA #&0F
	STA hyperspace_countdown_hi
	STA hyperspace_countdown_lo
	TAX
	JMP addr30AC
.addr305E
	LDX &0385
	BEQ addr3084+1                  ; RTS
	INX
	STX &0385
	STX &038C
	JSR addr3054
	LDX #&05
	INC &0367
	LDA &0367
	AND #&07
	STA &0367
.addr307A
	LDA &035B,X
	ASL A
	ROL &035B,X
	DEX
	BPL addr307A
.addr3084
	LDA #&60
	STA &03C1
	STA &03C2
	JSR addr3292
	JSR addr2F75
	LDX #&00
	STX &03BF
	STX &03C0
	LDA #&74
	JSR addr45C6
.addr309F
	LDA &03C1
	STA &0359
	LDA &03C2
	STA &035A
	RTS
.addr30AC
	LDY #&01
	STY text_cursor_x
	STY text_cursor_y
	DEY
.addr30B3
	CLC
.addr30B4
	LDA #&05
	JMP addr1E3C
.addr30B9
	LDA #&CA
	JSR addr339A
	LDA #&3F
	JMP addr339A
.addr30C3
	JSR addr2F75
	JMP addr3026
.addr30C9
	PHA
	STA &77
	ASL A
	ASL A
	STA &73
	LDA #&01
	STA text_cursor_x
	PLA
	ADC #&D0
	JSR addr339A
	LDA #&0E
	STA text_cursor_x
	LDX &73
	LDA &461A,X
	STA &74
	LDA &039E
	AND &461C,X
	CLC
	ADC &4619,X
	STA &03AA
	JSR addr3135
	JSR addr318E
	LDA &74
	BMI addr3104
	LDA &03AA
	ADC &76
	JMP addr310A
.addr3104
	LDA &03AA
	SEC
	SBC &76
.addr310A
	STA &03AA
	STA &1B
	LDA #&00
	JSR addr32F4
	SEC
	JSR addr30B4
	LDY &77
	LDA #&05
	LDX &038D,Y
	STX &03AB
	CLC
	BEQ addr312B
	JSR addr1E3A
	JMP addr3135
.addr312B
	LDA text_cursor_x
	ADC #&04
	STA text_cursor_x
	LDA #&2D
	BNE addr3144
.addr3135
	LDA &74
	AND #&60
	BEQ addr3147
	CMP #&20
	BEQ addr314E
	JSR addr3153
.addr3142
	LDA #&20
.addr3144
	JMP addr339A
.addr3147
	LDA #&74
	JSR addr1EFC
	BCC addr3142
.addr314E
	LDA #&6B
	JSR addr1EFC
.addr3153
	LDA #&67
	JMP addr1EFC
.addr3158
	LDA #&11
	STA text_cursor_x
	LDA #&FF
	BNE addr3144
.addr3160
	LDA #&10
	JSR addr54C8
	LDA #&05
	STA text_cursor_x
	LDA #&A7
	JSR addr1847
	LDA #&03
	STA text_cursor_y
	JSR addr3158
	LDA #&00
	STA &03AD
.addr317A
	LDX #&80
	STX &72
	JSR addr30C9
	INC text_cursor_y
	INC &03AD
	LDA &03AD
	CMP #&11
	BCC addr317A
	RTS
.addr318E
	LDA &74
	AND #&1F
	LDY planet_economy
	STA &75
	CLC
	LDA #&00
	STA &039D
.addr319D
	DEY
	BMI addr31A5
	ADC &75
	JMP addr319D
.addr31A5
	STA &76
	RTS
	JSR addr2F75
.addr31AB
	JSR addr309F
	LDX #&05
.addr31B0
	LDA &6C,X
	STA &03B2,X
	DEX
	BPL addr31B0
	INX
	STX &0349
	LDA &03B8
	STA planet_economy
	LDA &03BA
	STA planet_techlevel
	LDA &03B9
	STA planet_government
	JSR addr3F86
	STA &039E
	LDX #&00
	STX &96
.addr31D8
	LDA &461A,X
	STA &74
	JSR addr318E
	LDA &461C,X
	AND &039E
	CLC
	ADC &461B,X
	LDY &74
	BMI addr31F4
	SEC
	SBC &76
	JMP addr31F7
.addr31F4
	CLC
	ADC &76
.addr31F7
	BPL addr31FB
	LDA #&00
.addr31FB
	LDY &96
	AND #&3F
	STA &038D,Y
	INY
	TYA
	STA &96
	ASL A
	ASL A
	TAX
	CMP #&3F
	BCC addr31D8
	RTS
.addr320E
	JSR addr3F62
	LDA #&FF
	STA &66
	LDA #&1D
	JSR addr3768
	LDA #&1E
	JMP addr3768
.addr321F
	LSR &0366
	SEC
	ROL &0366
.addr3226
	LDA #&03
	JSR addr427E
	LDA #&03
	JSR addr54C8
	JSR addr2623
	JSR addr3EE1
	STY &0341
.addr3239
	JSR addr320E
	LDA #&03
	CMP &033B
	BCS addr3239
	STA &03C3
	LDX #&00
	JSR addr5493
	LDA &035A
	EOR #&1F
	STA &035A
	RTS
.addr3254
	LDA &0365
	SEC
	SBC &03BF
	STA &0365
	LDA &87
	BNE addr3268
	JSR addr54C8
	JSR addr2623
.addr3268
	JSR addr4437
	AND &03C9
	BMI addr321F
	JSR addr3F86
	CMP #&FD
	BCS addr3226
	JSR addr31AB
	JSR addr3EE1
	JSR addr3580
	JSR addr4255
	LDA &87
	AND #&3F
	BNE addr32F0
	JSR addr54CA
	LDA &87
	BNE addr32C8
	INC &87
.addr3292
	LDX &8E
	BEQ addr32C1
	JSR addr2636
	JSR addr3EE1
	JSR addr2F75
	INC &4E
	JSR addr356D
	LDA #&80
	STA &4E
	INC &4D
	JSR addr3740
	LDA #&0C
	STA &7D
	JSR addr41A6
	ORA &038C
	STA &038C
	LDA #&FF
	STA &87
	JSR addr2642
.addr32C1
	LDX #&00
	STX &8E
	JMP addr5493
.addr32C8
	BMI addr32CD
	JMP addr2CEB
.addr32CD
	JMP addr2EBE
.addr32D0
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
.addr32F0
	RTS
	JSR addr2820
.addr32F4
	ASL &1B
	ROL A
	ASL &1B
	ROL A
	TAY
	LDX &1B
	RTS
.addr32FE
	JSR addr2E65
	JSR addr2F75
	JSR addr2E65
	JMP addr5537
.addr330A
	LDX #&05
.addr330C
	LDA &6C,X
	STA &73,X
	DEX
	BPL addr330C
	LDY #&03
	BIT &6C
	BVS addr331A
	DEY
.addr331A
	STY &D1
.addr331C
	LDA &71
	AND #&1F
	BEQ addr3327
	ORA #&80
	JSR addr339A
.addr3327
	JSR addr2B14
	DEC &D1
	BPL addr331C
	LDX #&05
.addr3330
	LDA &73,X
	STA &6C,X
	DEX
	BPL addr3330
	RTS
.addr3338
	LDY #&00
.addr333A
	LDA &0350,Y
	CMP #&0D
	BEQ addr3347
	JSR addr1EFC
	INY
	BNE addr333A
.addr3347
	RTS
.addr3348
	JSR addr334E
	JSR addr330A
.addr334E
	LDX #&05
.addr3350
	LDA &6C,X
	LDY &03B2,X
	STA &03B2,X
	STY &6C, X
	DEX
	BPL addr3350
	RTS
.addr335E
	CLC
	LDX &0367
	INX
	JMP addr1E38
.addr3366
	LDA #&69
	JSR addr3395
	LDX &0365
	SEC
	JSR addr1E38
	LDA #&C3
	JSR addr338F
	LDA #&77
	BNE addr339A
.addr337B
	LDX #&03
.addr337D
	LDA &0361,X
	STA &40,X
	DEX
	BPL addr337D
	LDA #&09
	STA &80
	SEC
	JSR addr1E48
	LDA #&E2
.addr338F
	JSR addr339A
	JMP addr2B60
.addr3395
	JSR addr339A
.addr3398
	LDA #&3A
.addr339A
	TAX
	BEQ addr337B
	BMI addr3413
	DEX
	BEQ addr335E
	DEX
	BEQ addr3348
	DEX
	BNE addr33AB
	JMP addr330A
.addr33AB
	DEX
	BEQ addr3338
	DEX
	BEQ addr3366
	DEX
	BNE addr33B9
	LDA #&80
	STA &72
	RTS
.addr33B9
	DEX
	DEX
	BNE addr33C0
	STX &72
	RTS
.addr33C0
	DEX
	BEQ addr33FB
	CMP #&60
	BCS addr342D
	CMP #&0E
	BCC addr33CF
	CMP #&20
	BCC addr33F7
.addr33CF
	LDX &72
	BEQ addr3410
	BMI addr33E6
	BIT &72
	BVS addr3409
.addr33D9
	CMP #'A'
	BCC addr33E3
	CMP #'['
	BCS addr33E3
	ADC #&20
	.addr33E3
	JMP addr1EFC
.addr33E6
	BIT &72
	BVS addr3401
	CMP #&41
	BCC addr3410
	PHA
	TXA
	ORA #&40
	STA &72
	PLA
	BNE addr33E3
.addr33F7
	ADC #&72
	BNE addr342D
.addr33FB
	LDA #&15
	STA text_cursor_x
	BNE addr3398
.addr3401
	CPX #&FF
	BEQ addr3468
	CMP #&41
	BCS addr33D9
.addr3409
	PHA
	TXA
	AND #&BF
	STA &72
	PLA
.addr3410
	JMP addr1EFC
.addr3413
	CMP #&A0
	BCS addr342B
	AND #&7F
	ASL A
	TAY
	LDA &0880,Y
	JSR addr339A
	LDA &0881,Y
	CMP #&3F
	BEQ addr3468
	JMP addr339A
.addr342B
	SBC #&A0
.addr342D
	TAX
	LDA #&00
	STA vertices_ptr_lo
	LDA #&04
	STA vertices_ptr_hi
	LDY #&00
	TXA
	BEQ addr344E
.addr343B
	LDA (vertices_ptr),Y
	BEQ addr3446
	INY
	BNE addr343B
	INC vertices_ptr_hi
	BNE addr343B
.addr3446
	INY
	BNE addr344B
	INC vertices_ptr_hi
.addr344B
	DEX
	BNE addr343B
.addr344E
	TYA
	PHA
	LDA vertices_ptr_hi
	PHA
	LDA (vertices_ptr),Y
	EOR #&23
	JSR addr339A
	PLA
	STA vertices_ptr_hi
	PLA
	TAY
	INY
	BNE addr3464
	INC vertices_ptr_hi
.addr3464
	LDA (vertices_ptr),Y
	BNE addr344E
.addr3468
	RTS
.addr3469
	LDA &65
	ORA #&A0
	STA &65
	RTS
.addr3470
	LDA &65
	AND #&40
	BEQ addr3479
	JSR addr34D3
.addr3479
	LDA &4C
	STA &D1
	LDA &4D
	CMP #&20
	BCC addr3487
	LDA #&FE
	BNE addr348F
.addr3487
	ASL &D1
	ROL A
	ASL &D1
	ROL A
	SEC
	ROL A
.addr348F
	STA &81
	LDY #&01
	LDA (&67),Y
	ADC #&04
	BCS addr3469
	STA (&67),Y
	JSR addr2965
	LDA &1B
	CMP #&1C
	BCC addr34A8
	LDA #&FE
	BNE addr34B1
.addr34A8
	ASL &82
	ROL A
	ASL &82
	ROL A
	ASL &82
	ROL A
.addr34B1
	DEY
	STA (&67),Y
	LDA &65
	AND #&BF
	STA &65
	AND #&08
	BEQ addr3468
	LDY #&02
	LDA (&67),Y
	TAY
.addr34C3
	LDA &00F9,Y
	STA (&67),Y
	DEY
	CPY #&06
	BNE addr34C3
	LDA &65
	ORA #&40
	STA &65
.addr34D3
	LDY #&00
	LDA (&67),Y
	STA &81
	INY
	LDA (&67),Y
	BPL addr34E0
	EOR #&FF
.addr34E0
	LSR A
	LSR A
	LSR A
	ORA #&01
	STA &80
	INY
	LDA (&67),Y
	STA &8F
	LDA rand1
	PHA
	LDY #&06
.addr34F1
	LDX #&03
.addr34F3
	INY
	LDA (&67),Y
	STA &D2,X
	DEX
	BPL addr34F3
	STY &93
	LDY #&02
.addr34FF
	INY
	LDA (&67),Y
	EOR &93
	STA &FFFD,Y
	CPY #&06
	BNE addr34FF
	LDY &80
.addr350D
	JSR addr3F85
	STA &88
	LDA &D3
	STA &82
	LDA &D2
	JSR addr354B
	BNE addr3545
	CPX #&BF
	BCS addr3545
	STX &35
	LDA &D5
	STA &82
	LDA &D4
	JSR addr354B
	BNE addr3533
	LDA &35
	JSR addr1932
.addr3533
	DEY
	BPL addr350D
	LDY &93
	CPY &8F
	BCC addr34F1
	PLA
	STA rand1
	LDA &0906
	STA rand3
	RTS
.addr3545
	JSR addr3F85
	JMP addr3533
.addr354B
	STA &83
	JSR addr3F85
	ROL A
	BCS addr355E
	JSR addr2847
	ADC &82
	TAX
	LDA &83
	ADC #&00
	RTS
.addr355E
	JSR addr2847
	STA &D1
	LDA &82
	SBC &D1
	TAX
	LDA &83
	SBC #&00
	RTS
.addr356D
	JSR addr3F3B
	LDA #&7F
	STA &63
	STA &64
	LDA planet_techlevel
	AND #&02
	ORA #&80
	JMP addr3768
.addr3580
	LSR &038C
	JSR addr3F26
	LDA &6D
	AND #&03
	ADC #&03
	STA &4E
	ROR A
	STA inwk_xsg
	STA &4B
	JSR addr356D
	LDA &6F
	AND #&07
	ORA #&81
	STA &4E
	LDA &71
	AND #&03
	STA inwk_xsg
	STA inwk_xhi
	LDA #&00
	STA &63
	STA &64
	LDA #&81
	JSR addr3768
.addr35B1
	LDA &87
	BNE addr35D8
.addr35B5
	LDY &03C3
.addr35B8
	JSR addr3F86
	ORA #&08
	STA &0FA8,Y
	STA &88
	JSR addr3F86
	STA &0F5C,Y
	STA &34
	JSR addr3F86
	STA &0F82,Y
	STA &35
	JSR addr1910
	DEY
	BNE addr35B8
.addr35D8
	LDX #&00
.addr35DA
	LDA object01_type,X
	BEQ addr3602
	BMI addr35FF
	STA &8C
	JSR addr3732
	LDY #&1F
.addr35E8
	LDA (inf_pointer),Y
	STA &0046,Y
	DEY
	BPL addr35E8
	STX &84
	JSR addr5558
	LDX &84
	LDY #&1F
	LDA (inf_pointer),Y
	AND #&A7
	STA (inf_pointer),Y
.addr35FF
	INX
	BNE addr35DA
.addr3602
	LDX #&FF
	STX &0EC0
	STX &0F0E
.addr360A
	LDY #&BF
	LDA #&00
.addr360E
	STA &0E00,Y
	DEY
	BNE addr360E
	DEY
	STY &0E00
	RTS
.addr3619
	LDA #&06
	SEI
	STA crtc_register
	STX crtc_data
	CLI
	RTS
.addr3624
	DEX
	RTS
.addr3626
	INX
	BEQ addr3624
.addr3629
	DEC my_energy
	PHP
	BNE addr3632
	INC my_energy
.addr3632
	PLP
	RTS
.addr3634
	JSR addr3694
	LDA &0320
	BNE addr366D
	JSR addr42AE
	JMP addr3670
.addr3642
	ASL A
	TAX
	LDA #&00
	ROR A
	TAY
	LDA #&14
	STA &81
	TXA
	JSR addr2965
	LDX &1B
	TYA
	BMI addr3658
	LDY #&00
	RTS
.addr3658
	LDY #&FF
	TXA
	EOR #&FF
	TAX
	INX
	RTS
.addr3660
	LDX #&08
.addr3662
	LDA &0925,X
	STA &D2,X
	DEX
	BPL addr3662
	JMP addr42BD
.addr366D
	JSR addr3660
.addr3670
	LDA &34
	JSR addr3642
	TXA
	ADC #&C3
	STA my_compass_x
	LDA &35
	JSR addr3642
	STX &D1
	LDA #&CC
	SBC &D1
	STA my_compass_y
	LDA #&F0
	LDX &36
	BPL addr3691
	LDA #&FF
.addr3691
	STA &03C5
.addr3694
	LDA my_compass_y
	STA &35
	LDA my_compass_x
	STA &34
	LDA &03C5
	STA &91
	CMP #&F0
	BNE addr36AC
.addr36A7
	JSR addr36AC
	DEC &35
.addr36AC
	LDA &35
	TAY
	LSR A
	LSR A
	LSR A
	ORA #&60
	STA screen_hi
	LDA &34
	AND #&F8
	STA screen_lo
	TYA
	AND #&07
	TAY
	LDA &34
	AND #&06
	LSR A
	TAX
	LDA addr16BF,X
	AND &91
	EOR (screen),Y
	STA (screen),Y
	LDA &16C0,X
	BPL addr36DD
	LDA screen_lo
	ADC #&08
	STA screen_lo
	LDA &16C0,X
.addr36DD
	AND &91
	EOR (screen),Y
	STA (screen),Y
	RTS
.addr36E4
	STA &D1
	LDX #&00
	LDY #&08
	LDA (inf_pointer),Y
	BMI addr36FE
	LDA my_shield_front
	SBC &D1
	BCC addr36F9
	STA my_shield_front
	RTS
.addr36F9
	STX my_shield_front
	BCC addr370C
.addr36FE
	LDA my_shield_aft
	SBC &D1
	BCC addr3709
	STA my_shield_aft
	RTS
.addr3709
	STX my_shield_aft
.addr370C
	ADC my_energy
	STA my_energy
	BEQ addr3716
	BCS addr3719
.addr3716
	JMP addr41C6
.addr3719
	JSR addr43B1
	JMP addr45EA
.addr371F
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
.addr3732
	TXA
	ASL A
	TAY
	LDA addr1695,Y
	STA inf_pointer_lo
	LDA addr1695+1,Y
	STA inf_pointer_hi
	RTS
.addr3740
	JSR addr3821
	LDX #&81
	STX &66
	LDX #&00
	STX &64
	STX &6A
	STX object02_type
	DEX
	STX &63
	LDX #&0A
	JSR addr37FC
	JSR addr37FC
	JSR addr37FC
	LDA #&00
	STA &67
	LDA #&0E
	STA &68
	LDA #&02
.addr3768
	STA &D1
	LDX #&00
.addr376C
	LDA object01_type,X
	BEQ addr3778
	INX
	CPX #&0C
	BCC addr376C
.addr3776
	CLC
.addr3777
	RTS
.addr3778
	JSR addr3732
	LDA &D1
	BMI addr37D1
	ASL A
	TAY
	LDA &55FF,Y
	BEQ addr3776
	STA hull_pointer_hi
	LDA &55FE,Y
	STA hull_pointer_lo
	CPY #&04
	BEQ addr37C1
	LDY #&05
	LDA (hull_pointer),Y
	STA &06
	LDA &03B0
	SEC
	SBC &06
	STA &67
	LDA &03B1
	SBC #&00
	STA &68
	LDA &67
	SBC inf_pointer_lo
	TAY
	LDA &68
	SBC inf_pointer_hi
	BCC addr3777
	BNE addr37B7
	CPY #&25
	BCC addr3777
.addr37B7
	LDA &67
	STA &03B0
	LDA &68
	STA &03B1
.addr37C1
	LDY #&0E
	LDA (hull_pointer),Y
	STA &69
	LDY #&13
	LDA (hull_pointer),Y
	AND #&07
	STA &65
	LDA &D1
.addr37D1
	STA object01_type,X
	TAX
	BMI addr37E5
	CPX #&03
	BCC addr37E2
	CPX #&0B
	BCS addr37E2
	INC &033E
.addr37E2
	INC &031E,X
.addr37E5
	LDY &D1
	LDA &563D,Y
	AND #&6F
	ORA &6A
	STA &6A
	LDY #&24
.addr37F2
	LDA &0046,Y
	STA (inf_pointer),Y
	DEY
	BPL addr37F2
	SEC
	RTS
.addr37FC
	LDA inwk_xlo,X
	EOR #&80
	STA inwk_xlo,X
	INX
	INX
	RTS
.addr3805
	LDX #&FF
.addr3807
	STX missile_target
	LDX &038B
	JSR addr383D
	STY &0344
	RTS
.addr3813
	LDA #&20
	STA ecm_on
	ASL A
	JSR addr43F3
.addr381B
	LDA #&38
	LDX #&32
	BNE addr3825
.addr3821
	LDA #&C0
	LDX #&35
.addr3825
	LDY #&38
	STA screen_lo
	STX &1C
	STY &1D
	LDA #&7D
	JMP addr1F45
.addr3832
	EQUB &E0, &E0, &80, &E0, &E0, &80, &E0, &E0, &20, &E0, &E0

.addr383D
	TXA
	ASL A
	ASL A
	ASL A
	STA &D1
	LDA #&31
	SBC &D1
	STA screen_lo
	LDA #&7E
	STA screen_hi
	TYA
	LDY #&05
.addr3850
	STA (screen),Y
	DEY
	BNE addr3850
	RTS
.addr3856
	LDA inwk_xlo
	STA &1B
	LDA inwk_xhi
	STA &1C
	LDA inwk_xsg
	JSR addr3CFA
	BCS addr388D
	LDA &40
	ADC #&80
	STA &D2
	TXA
	ADC #&00
	STA &D3
	LDA &49
	STA &1B
	LDA &4A
	STA &1C
	LDA &4B
	EOR #&80
	JSR addr3CFA
	BCS addr388D
	LDA &40
	ADC #&60
	STA &E0
	TXA
	ADC #&00
	STA &E1
	CLC
.addr388D
	RTS
.addr388E
	LDA &8C
	LSR A
	BCS addr3896
	JMP addr3BED
.addr3896
	JMP addr3C30
.addr3899
	LDA &4E
	BMI addr388E
	CMP #&30
	BCS addr388E
	ORA &4D
	BEQ addr388E
	JSR addr3856
	BCS addr388E
	LDA #&60
	STA &1C
	LDA #&00
	STA &1B
	JSR addr297E
	LDA &41
	BEQ addr38BD
	LDA #&F8
	STA &40
.addr38BD
	LDA &8C
	LSR A
	BCC addr38C5
	JMP addr3A54
.addr38C5
	JSR addr3BED
	JSR addr3B76
	BCS addr38D1
	LDA &41
	BEQ addr38D2
.addr38D1
	RTS
.addr38D2
	LDA &8C
	CMP #&80
	BNE addr3914
	LDA &40
	CMP #&06
	BCC addr38D1
	LDA &54
	EOR #&80
	STA &1B
	LDA &5A
	JSR addr3CDB
	LDX #&09
	JSR addr3969
	STA &9B
	STY &09
	JSR addr3969
	STA &9C
	STY &0A
	LDX #&0F
	JSR addr3CEB
	JSR addr3987
	LDA &54
	EOR #&80
	STA &1B
	LDA &60
	JSR addr3CDB
	LDX #&15
	JSR addr3CEB
	JMP addr3987
.addr3914
	LDA &5A
	BMI addr38D1
	LDX #&0F
	JSR addr3CBA
	CLC
	ADC &D2
	STA &D2
	TYA
	ADC &D3
	STA &D3
	JSR addr3CBA
	STA &1B
	LDA &E0
	SEC
	SBC &1B
	STA &E0
	STY &1B
	LDA &E1
	SBC &1B
	STA &E1
	LDX #&09
	JSR addr3969
	LSR A
	STA &9B
	STY &09
	JSR addr3969
	LSR A
	STA &9C
	STY &0A
	LDX #&15
	JSR addr3969
	LSR A
	STA &9D
	STY &0B
	JSR addr3969
	LSR A
	STA &9E
	STY &0C
	LDA #&40
	STA &8F
	LDA #&00
	STA &94
	BEQ addr398B
.addr3969
	LDA inwk_xlo,X
	STA &1B
	LDA inwk_xhi,X
	AND #&7F
	STA &1C
	LDA inwk_xhi,X
	AND #&80
	JSR addr297E
	LDA &40
	LDY &41
	BEQ addr3982
	LDA #&FE
.addr3982
	LDY &43
	INX
	INX
	RTS
.addr3987
	LDA #&1F
	STA &8F
.addr398B
	LDX #&00
	STX &93
	DEX
	STX &92
.addr3992
	LDA &94
	AND #&1F
	TAX
	LDA &07C0,X
	STA &81
	LDA &9D
	JSR addr2847
	STA &82
	LDA &9E
	JSR addr2847
	STA &40
	LDX &94
	CPX #&21
	LDA #&00
	ROR A
	STA &0E
	LDA &94
	CLC
	ADC #&10
	AND #&1F
	TAX
	LDA &07C0,X
	STA &81
	LDA &9C
	JSR addr2847
	STA &42
	LDA &9B
	JSR addr2847
	STA &1B
	LDA &94
	ADC #&0F
	AND #&3F
	CMP #&21
	LDA #&00
	ROR A
	STA &0D
	LDA &0E
	EOR &0B
	STA &83
	LDA &0D
	EOR &09
	JSR addr28FF
	STA &D1
	BPL addr39FB
	TXA
	EOR #&FF
	CLC
	ADC #&01
	TAX
	LDA &D1
	EOR #&7F
	ADC #&00
	STA &D1
.addr39FB
	TXA
	ADC &D2
	STA &76
	LDA &D1
	ADC &D3
	STA &77
	LDA &40
	STA &82
	LDA &0E
	EOR &0C
	STA &83
	LDA &42
	STA &1B
	LDA &0D
	EOR &0A
	JSR addr28FF
	EOR #&80
	STA &D1
	BPL addr3A30
	TXA
	EOR #&FF
	CLC
	ADC #&01
	TAX
	LDA &D1
	EOR #&7F
	ADC #&00
	STA &D1
.addr3A30
	JSR addr196B
	CMP &8F
	BEQ addr3A39
	BCS addr3A45
.addr3A39
	LDA &94
	CLC
	ADC &95
	AND #&3F
	STA &94
	JMP addr3992
.addr3A45
	RTS
.addr3A46
	JMP addr3C30
.addr3A49
	TXA
	EOR #&FF
	CLC
	ADC #&01
	TAX
.addr3A50
	LDA #&FF
	BNE addr3A99
.addr3A54
	LDA #&01
	STA &0E00
	JSR addr3C80
	BCS addr3A46
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
	BNE addr3A7D
	CMP &1C
	BCC addr3A7D
	LDA &1C
	BNE addr3A7D
	LDA #&01
.addr3A7D
	STA &8F
	LDA #&BF
	SEC
	SBC &E0
	TAX
	LDA #&00
	SBC &E1
	BMI addr3A49
	BNE addr3A95
	INX
	DEX
	BEQ addr3A50
	CPX &40
	BCC addr3A99
.addr3A95
	LDX &40
	LDA #&00
.addr3A99
	STX vertices_ptr_lo
	STA vertices_ptr_hi
	LDA &40
	JSR addr280D
	STA &9C
	LDA &1B
	STA &9B
	LDY #&BF
	LDA sunx
	STA &26
	LDA sunx1
	STA &27
.addr3AB2
	CPY &8F
	BEQ addr3AC1
	LDA &0E00,Y
	BEQ addr3ABE
	JSR addr185E
.addr3ABE
	DEY
	BNE addr3AB2
.addr3AC1
	LDA vertices_ptr_lo
	JSR addr280D
	STA &D1
	LDA &9B
	SEC
	SBC &1B
	STA &81
	LDA &9C
	SBC &D1
	STA &82
	STY &35
	JSR addr47B8
	LDY &35
	JSR addr3F86
	AND &93
	CLC
	ADC &81
	BCC addr3AE8
	LDA #&FF
.addr3AE8
	LDX &0E00,Y
	STA &0E00,Y
	BEQ addr3B3A
	LDA sunx
	STA &26
	LDA sunx1
	STA &27
	TXA
	JSR addr3C4F
	LDA &34
	STA &24
	LDA &36
	STA &25
	LDA &D2
	STA &26
	LDA &D3
	STA &27
	LDA &0E00,Y
	JSR addr3C4F
	BCS addr3B1F
	LDA &36
	LDX &24
	STX &36
	STA &24
	JSR addr1868
.addr3B1F
	LDA &24
	STA &34
	LDA &25
	STA &36
.addr3B27
	JSR addr1868
.addr3B2A
	DEY
	BEQ addr3B6C
	LDA vertices_ptr_hi
	BNE addr3B4E
	DEC vertices_ptr_lo
	BNE addr3AC1
	DEC vertices_ptr_hi
.addr3B37
	JMP addr3AC1
.addr3B3A
	LDX &D2
	STX &26
	LDX &D3
	STX &27
	JSR addr3C4F
	BCC addr3B27
	LDA #&00
	STA &0E00,Y
	BEQ addr3B2A
.addr3B4E
	LDX vertices_ptr_lo
	INX
	STX vertices_ptr_lo
	CPX &40
	BCC addr3B37
	BEQ addr3B37
	LDA sunx
	STA &26
	LDA sunx1
	STA &27
.addr3B61
	LDA &0E00,Y
	BEQ addr3B69
	JSR addr185E
.addr3B69
	DEY
	BNE addr3B61
.addr3B6C
	CLC
	LDA &D2
	STA sunx
	LDA &D3
	STA sunx1
.addr3B75
	RTS
.addr3B76
	JSR addr3C80
	BCS addr3B75
	LDA #&00
	STA &0EC0
	LDX &40
	LDA #&08
	CPX #&08
	BCC addr3B8E
	LSR A
	CPX #&3C
	BCC addr3B8E
	LSR A
.addr3B8E
	STA &95
.addr3B90
	LDX #&FF
	STX &92
	INX
	STX &93
.addr3B97
	LDA &93
	JSR addr283D
	LDX #&00
	STX &D1
	LDX &93
	CPX #&21
	BCC addr3BB3
	EOR #&FF
	ADC #&00
	TAX
	LDA #&FF
	ADC #&00
	STA &D1
	TXA
	CLC
.addr3BB3
	ADC &D2
	STA &76
	LDA &D3
	ADC &D1
	STA &77
	LDA &93
	CLC
	ADC #&10
	JSR addr283D
	TAX
	LDA #&00
	STA &D1
	LDA &93
	ADC #&0F
	AND #&3F
	CMP #&21
	BCC addr3BE1
	TXA
	EOR #&FF
	ADC #&00
	TAX
	LDA #&FF
	ADC #&00
	STA &D1
	CLC
.addr3BE1
	JSR addr196B
	CMP #&41
	BCS addr3BEB
	JMP addr3B97
.addr3BEB
	CLC
	RTS
.addr3BED
	LDY &0EC0
	BNE addr3C26
.addr3BF2
	CPY &6B
	BCS addr3C26
	LDA &0F0E,Y
	CMP #&FF
	BEQ addr3C17
	STA &37
	LDA &0EC0,Y
	STA &36
	JSR addr16C4
	INY
	LDA &90
	BNE addr3BF2
	LDA &36
	STA &34
	LDA &37
	STA &35
	JMP addr3BF2
.addr3C17
	INY
	LDA &0EC0,Y
	STA &34
	LDA &0F0E,Y
	STA &35
	INY
	JMP addr3BF2
.addr3C26
	LDA #&01
	STA &6B
	LDA #&FF
	STA &0EC0
.addr3C2F
	RTS
.addr3C30
	LDA &0E00
	BMI addr3C2F
	LDA sunx
	STA &26
	LDA sunx1
	STA &27
	LDY #&BF
.addr3C3F
	LDA &0E00,Y
	BEQ addr3C47
	JSR addr185E
.addr3C47
	DEY
	BNE addr3C3F
	DEY
	STY &0E00
	RTS
.addr3C4F
	STA &D1
	CLC
	ADC &26
	STA &36
	LDA &27
	ADC #&00
	BMI addr3C79
	BEQ addr3C62
	LDA #&FE
	STA &36
.addr3C62
	LDA &26
	SEC
	SBC &D1
	STA &34
	LDA &27
	SBC #&00
	BNE addr3C71
	CLC
	RTS
.addr3C71
	BPL addr3C79
	LDA #&02
	STA &34
	CLC
	RTS
.addr3C79
	LDA #&00
	STA &0E00,Y
	SEC
	RTS
.addr3C80
	LDA &D2
	CLC
	ADC &40
	LDA &D3
	ADC #&00
	BMI addr3CB8
	LDA &D2
	SEC
	SBC &40
	LDA &D3
	SBC #&00
	BMI addr3C98
	BNE addr3CB8
.addr3C98
	LDA &E0
	CLC
	ADC &40
	STA &1C
	LDA &E1
	ADC #&00
	BMI addr3CB8
	STA &1D
	LDA &E0
	SEC
	SBC &40
	TAX
	LDA &E1
	SBC #&00
	BMI addr3D1D
	BNE addr3CB8
	CPX #&BF
	RTS
.addr3CB8
	SEC
	RTS
.addr3CBA
	JSR addr3969
	STA &1B
	LDA #&DE
	STA &81
	STX &80
	JSR addr2820
	LDX &80
	LDY &43
	BPL addr3CD8
	EOR #&FF
	CLC
	ADC #&01
	BEQ addr3CD8
	LDY #&FF
	RTS
.addr3CD8
	LDY #&00
	RTS
.addr3CDB
	STA &81
	JSR addr2A3C
	LDX &54
	BMI addr3CE6
	EOR #&80
.addr3CE6
	LSR A
	LSR A
	STA &94
	RTS
.addr3CEB
	JSR addr3969
	STA &9D
	STY &0B
	JSR addr3969
	STA &9E
	STY &0C
	RTS
.addr3CFA
	JSR addr297E
	LDA &43
	AND #&7F
	ORA &42
	BNE addr3CB8
	LDX &41
	CPX #&04
	BCS addr3D1E
	LDA &43
	BPL addr3D1E
	LDA &40
	EOR #&FF
	ADC #&01
	STA &40
	TXA
	EOR #&FF
	ADC #&00
	TAX
.addr3D1D
	CLC
.addr3D1E
	RTS
.addr3D1F
	JSR addr44AF
	LDA &03CD
	BEQ addr3D4C
	LDA &034C
	EOR #&FF
	JSR addr3D34
	TYA
	TAX
	LDA &034D
.addr3D34
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
.addr3D4C
	LDA &0300
	LDX #&00
	LDY #&00
	CMP #&19
	BNE addr3D58
	DEX
.addr3D58
	CMP #&79
	BNE addr3D5D
	INX
.addr3D5D
	CMP #&39
	BNE addr3D62
	INY
.addr3D62
	CMP #&29
	BNE addr3D67
	DEY
.addr3D67
	RTS
.addr3D68
	LDX #&01
.addr3D6A
	LDA &0359,X
	STA &03C1,X
	DEX
	BPL addr3D6A
	RTS
.addr3D74
	LDA &1B
	STA &03B0
	LDA &1C
	STA &03B1
	RTS
.addr3D7F
	LDX &84
	JSR addr3DD8
	LDX &84
	JMP addr1376
.addr3D89
	JSR addr3F26
	JSR addr360A
	STA object02_type
	STA &0320
	JSR addr3821
	LDA #&06
	STA &4B
	LDA #&81
	JMP addr3768
.addr3DA1
	LDX #&FF
.addr3DA3
	INX
	LDA object01_type,X
	BEQ addr3D74
	CMP #&01
	BNE addr3DA3
	TXA
	ASL A
	TAY
	LDA addr1695,Y
	STA screen_lo
	LDA addr1695+1,Y
	STA screen_hi
	LDY #&20
	LDA (screen),Y
	BPL addr3DA3
	AND #&7F
	LSR A
	CMP &96
	BCC addr3DA3
	BEQ addr3DD2
	SBC #&01
	ASL A
	ORA #&80
	STA (screen),Y
	BNE addr3DA3
.addr3DD2
	LDA #&00
	STA (screen),Y
	BEQ addr3DA3
.addr3DD8
	STX &96
	CPX missile_target
	BNE addr3DE8
	LDY #&EE
	JSR addr3805
	LDA #&C8
	JSR addr45C6
.addr3DE8
	LDY &96
	LDX object01_type,Y
	CPX #&02
	BEQ addr3D89
	CPX #&1F
	BNE addr3DFD
	LDA &0358
	ORA #&02
	STA &0358
.addr3DFD
	CPX #&03
	BCC addr3E08
	CPX #&0B
	BCS addr3E08
	DEC &033E
.addr3E08
	DEC &031E,X
	LDX &96
	LDY #&05
	LDA (hull_pointer),Y
	LDY #&21
	CLC
	ADC (inf_pointer),Y
	STA &1B
	INY
	LDA (inf_pointer),Y
	ADC #&00
	STA &1C
.addr3E1F
	INX
	LDA object01_type,X
	STA &0310,X
	BNE addr3E2B
	JMP addr3DA1
.addr3E2B
	ASL A
	TAY
	LDA &55FE,Y
	STA screen_lo
	LDA &55FF,Y
	STA screen_hi
	LDY #&05
	LDA (screen),Y
	STA &D1
	LDA &1B
	SEC
	SBC &D1
	STA &1B
	LDA &1C
	SBC #&00
	STA &1C
	TXA
	ASL A
	TAY
	LDA addr1695,Y
	STA screen_lo
	LDA addr1695+1,Y
	STA screen_hi
	LDY #&24
	LDA (screen),Y
	STA (inf_pointer),Y
	DEY
	LDA (screen),Y
	STA (inf_pointer),Y
	DEY
	LDA (screen),Y
	STA &41
	LDA &1C
	STA (inf_pointer),Y
	DEY
	LDA (screen),Y
	STA &40
	LDA &1B
	STA (inf_pointer),Y
	DEY
.addr3E75
	LDA (screen),Y
	STA (inf_pointer),Y
	DEY
	BPL addr3E75
	LDA screen_lo
	STA inf_pointer_lo
	LDA screen_hi
	STA inf_pointer_hi
	LDY &D1
.addr3E86
	DEY
	LDA (&40),Y
	STA (&1B),Y
	TYA
	BNE addr3E86
	BEQ addr3E1F

.addr3E90
	EQUB &12, &01, &00, &10
	EQUB &12, &02, &2C, &08
	EQUB &11, &03, &F0, &18
	EQUB &10, &F1, &07, &1A
	EQUB &03, &F1, &BC, &01
	EQUB &13, &F4, &0C, &08
	EQUB &10, &F1, &06, &0C
	EQUB &10, &02, &60, &10
	EQUB &13, &04, &C2, &FF
	EQUB &13, &00, &00, &00

.addr3EB8
	LDX &0367
	DEX
	BNE addr3ECC
	LDA &0359
	CMP #&90
	BNE addr3ECC
	LDA &035A
	CMP #&21
	BEQ addr3ECD
.addr3ECC
	CLC
.addr3ECD
	RTS
.addr3ECE
	JSR addr4296
	LDX #&08
.addr3ED3
	STA beta,X
	DEX
	BPL addr3ED3
	TXA
	LDX #&02
.addr3EDB
	STA my_shield_front,X
	DEX
	BPL addr3EDB
.addr3EE1
	LDA #&12
	STA &03C3
	LDX #&FF
	STX &0EC0
	STX &0F0E
	STX missile_target
	LDA #&80
	STA &034C
	STA &034D
	ASL A
	STA &8A
	STA hyperspace_countdown_hi
	LDA #&03
	STA &7D
	LDA &0320
	BEQ addr3F09
	JSR addr3821
.addr3F09
	LDA ecm_on
	BEQ addr3F10
	JSR addr43A3
.addr3F10
	JSR addr35D8
	JSR addr4296
	LDA #&FF
	STA &03B0
	LDA #&0C
	STA &03B1
	JSR addr1F62
	JSR addr44A4
.addr3F26
	LDY #&24
	LDA #&00
.addr3F2A
	STA &0046,Y
	DEY
	BPL addr3F2A
	LDA #&60
	STA &58
	STA &5C
	ORA #&80
	STA &54
	RTS
.addr3F3B
	LDX #&04
.addr3F3D
	CPX &038B
	BEQ addr3F4B
	LDY #&00
	JSR addr383D
	DEX
	BNE addr3F3D
	RTS
.addr3F4B
	LDY #&EE
	JSR addr383D
	DEX
	BNE addr3F4B
	RTS
.addr3F54
	LDA &03A4
	JSR addr45C6
	LDA #&00
	STA &034A
	JMP addr3FCD
.addr3F62
	JSR addr3F26
	JSR addr3F86
	STA &06
	AND #&80
	STA inwk_xsg
	TXA
	AND #&80
	STA &4B
	LDA #&19
	STA inwk_xhi
	STA &4A
	STA &4D
	JSR addr3F86
	CMP #&F5
	ROL A
	ORA #&C0
	STA &66
.addr3F85
	CLC
.addr3F86
	LDA rand0
	ROL A
	TAX
	ADC rand2
	STA rand0
	STX rand2
	LDA rand1
	TAX
	ADC rand3
	STA rand1
	STX rand3
	RTS
.addr3F9A
	JSR addr3F86
	LSR A
	STA &66
	STA &63
	ROL &65
	AND #&0F
	ORA #&10
	STA &61
	JSR addr3F86
	BMI addr3FB9
	LDA &66
	ORA #&C0
	STA &66
	LDX #&10
	STX &6A
.addr3FB9
	AND #&02
	ADC #&0B
	JSR addr3768
.addr3FC0
	JSR addr1228
	DEC &034A
	BEQ addr3F54
	BPL addr3FCD
	INC &034A
.addr3FCD
	DEC &8A
	BEQ addr3FD4
.addr3FD1
	JMP addr40DB
.addr3FD4
	LDA &0341
	BNE addr3FD1
	JSR addr3F86
	CMP #&23
	BCS addr402E
	LDA &033E
	CMP #&03
	BCS addr402E
	JSR addr3F26
	LDA #&26
	STA &4D
	JSR addr3F86
	STA inwk_xlo
	STX &49
	AND #&80
	STA inwk_xsg
	TXA
	AND #&80
	STA &4B
	ROL inwk_xhi
	ROL inwk_xhi
	JSR addr3F86
	BVS addr3F9A
	JMP addr3F9A
	ORA #&6F
	STA &63
	LDA &0320
	BNE addr402E
	TXA
	BCS addr401E
	AND #&1F
	ORA #&10
	STA &61
	BCC addr4022
.addr401E
	ORA #&7F
	STA &64
.addr4022
	JSR addr3F86
	CMP #&0A
	AND #&01
	ADC #&05
	JSR addr3768
.addr402E
	LDA &0320
	BEQ addr4036
.addr4033
	JMP addr40DB
.addr4036
	JSR addr41A6
	ASL A
	LDX &032E
	BEQ addr4042
	ORA &038C
.addr4042
	STA &D1
	JSR addr3F62
	CMP &D1
	BCS addr4050
	LDA #&10
	JSR addr3768
.addr4050
	LDA &032E
	BNE addr4033
	DEC &0349
	BPL addr4033
	INC &0349
	LDA &0358
	AND #&0C
	CMP #&08
	BNE addr4070
	JSR addr3F86
	CMP #&C8
	BCC addr4070
	JSR addr320E
.addr4070
	JSR addr3F86
	LDY planet_government
	BEQ addr4083
	CMP #&78
	BCS addr4033
	AND #&07
	CMP planet_government
	BCC addr4033
.addr4083
	JSR addr3F62
	CMP #&64
	BCS addr40B2
	INC &0349
	AND #&03
	ADC #&18
	TAY
	JSR addr3EB8
	BCC addr40A8
	LDA #&F9
	STA &66
	LDA &0358
	AND #&03
	LSR A
	BCC addr40A8
	ORA &033D
	BEQ addr40AA
.addr40A8
	TYA
	EQUB &2C
.addr40AA
	LDA #&1F                        ; Ship type = 31: Constrictor
	JSR addr3768
	JMP addr40DB
.addr40B2
	AND #&03
	STA &0349
	STA &89
.addr40B9
	JSR addr3F86
	STA &D1
	JSR addr3F86
	AND &D1
	AND #&07
	STA &0FD2
.addr40C8
	LDA &0FD2
	ADC #&11
	JSR addr3768
	BCS addr40D7
	DEC &0FD2
	BPL addr40C8
.addr40D7
	DEC &89
	BPL addr40B9
.addr40DB
	LDX #&FF
	TXS
	LDX &0347
	BEQ addr40E6
	DEC &0347
.addr40E6
	JSR addr1F62
	LDA &87
	BEQ addr40F8
	AND &03C9
	LSR A
	BCS addr40F8
	LDY #&02
	JSR addr5530
.addr40F8
	JSR addr3D1F
.addr40FB
	JSR addr4101
	JMP addr3FC0
.addr4101
	CMP #&76
	BNE addr4108
	JMP addr1C83
.addr4108
	CMP #&14
	BNE addr410F
	JMP addr2CEB
.addr410F
	CMP #&74
	BNE addr4116
	JMP addr2EBE
.addr4116
	CMP #&75
	BNE addr4120
	JSR addr2F75
	JMP addr2B73
.addr4120
	CMP #&77
	BNE addr4127
	JMP addr2E15
.addr4127
	CMP #&16
	BNE addr412E
	JMP addr3160
.addr412E
	CMP #&20
	BNE addr4135
	JMP addr3292
.addr4135
	CMP #&71
	BCC addr4143
	CMP #&74
	BCS addr4143
	AND #&03
	TAX
	JMP addr5493
.addr4143
	CMP #&54
	BNE addr414A
	JMP addr3011
.addr414A
	CMP #&32
	BEQ addr418B
	STA &06
	LDA &87
	AND #&C0
	BEQ addr416C
	LDA hyperspace_countdown_hi
	BNE addr416C
	LDA &06
	CMP #&36
	BNE addr4169
	JSR addr2E65
	JSR addr3D68
	JSR addr2E65
.addr4169
	JSR addr2E38
.addr416C
	LDA hyperspace_countdown_hi
	BEQ addr418A
	DEC hyperspace_countdown_lo
	BNE addr418A
	LDX hyperspace_countdown_hi
	DEX
	JSR addr30AC
	LDA #&05
	STA hyperspace_countdown_lo
	LDX hyperspace_countdown_hi
	JSR addr30AC
	DEC hyperspace_countdown_hi
	BNE addr418A
	JMP addr3254
.addr418A
	RTS
.addr418B
	LDA &87
	AND #&C0
	BEQ addr418A
	JSR addr32FE
	STA &72
	JSR addr330A
	LDA #&80
	STA &72
	LDA #&01
	STA text_cursor_x
	INC text_cursor_y
	JMP addr2B3B
.addr41A6
	LDA &0372
	CLC
	ADC &0375
	ASL A
	ADC &0379
	RTS
.addr41B2
	LDA #&E0
.addr41B4
	CMP inwk_xhi
	BCC addr41BE
	CMP &4A
	BCC addr41BE
	CMP &4D
.addr41BE
	RTS
.addr41BF
	ORA inwk_xhi
	ORA &4A
	ORA &4D
	RTS
.addr41C6
	JSR addr43B1
	JSR addr3EE1
	ASL &7D
	ASL &7D
	LDX #&18
	JSR addr3619
	JSR addr54C8
	JSR addr54EB
	JSR addr35B5
	LDA #&0C
	STA text_cursor_y
	STA text_cursor_x
	LDA #&92
	JSR addr342D
.addr41E9
	JSR addr3F62
	LSR A
	LSR A
	STA inwk_xlo
	LDY #&00
	STY &87
	STY inwk_xhi
	STY &4A
	STY &4D
	STY &66
	DEY
	STY &8A
	STY &0346
	EOR #&2A
	STA &49
	ORA #&50
	STA &4C
	TXA
	AND #&8F
	STA &63
	ROR A
	AND #&87
	STA &64
	LDX #&05
	LDA &5607
	BEQ addr421E
	BCC addr421E
	DEX
.addr421E
	JSR addr251D
	JSR addr3F86
	AND #&80
	LDY #&1F
	STA (inf_pointer),Y
	LDA &0315
	BEQ addr41E9
	JSR addr44A4
	STA &7D
.addr4234
	JSR addr1228
	LDA &0346
	BNE addr4234
	LDX #&1F
	JSR addr3619
	JMP addr1220
.addr4244
	JSR addr4255
	JSR addr3ECE
	LDA #&FF
	STA &8E
	STA &87
	LDA #&20
	JMP addr40FB
.addr4255
	JSR addr3EB8
	LDA #&06
	BCS addr427E
	JSR addr3F86
	AND #&03
	LDX planet_government
	CPX #&03
	ROL A
	LDX planet_techlevel
	CPX #&0A
	ROL A
	TAX
	LDA &0358
	AND #&0C
	CMP #&08
	BNE addr427D
	TXA
	AND #&01
	ORA #&02
	TAX
.addr427D
	TXA
.addr427E
	CLC
	ADC #&41
	STA &4294
	JSR addr0D7A
	LDX #str_load_d_mo0 MOD 256
	LDY #str_load_d_mo0 DIV 256
	JMP oscli

.str_load_d_mo0
	EQUS "L.D.MO0", &0D

.addr4296
	LDX #&3A
	LDA #&00
.addr429A
	STA object01_type,X
	DEX
	BPL addr429A
	RTS
.addr42A1
	STX screen_hi
.addr42A3
	LDA #&00
	STA screen_lo
	TAY
.addr42A8
	STA (screen),Y
	DEY
	BNE addr42A8
	RTS
.addr42AE
	LDX #&00
	JSR addr371F
	LDX #&03
	JSR addr371F
	LDX #&06
	JSR addr371F
.addr42BD
	LDA &D2
	ORA &D5
	ORA &D8
	ORA #&01
	STA &DB
	LDA &D3
	ORA &D6
	ORA &D9
.addr42CD
	ASL &DB
	ROL A
	BCS addr42E0
	ASL &D2
	ROL &D3
	ASL &D5
	ROL &D6
	ASL &D8
	ROL &D9
	BCC addr42CD
.addr42E0
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
.addr42F5
	LDA &34
	JSR addr280B
	STA &82
	LDA &1B
	STA &81
	LDA &35
	JSR addr280B
	STA &D1
	LDA &1B
	ADC &81
	STA &81
	LDA &D1
	ADC &82
	STA &82
	LDA &36
	JSR addr280B
	STA &D1
	LDA &1B
	ADC &81
	STA &81
	LDA &D1
	ADC &82
	STA &82
	JSR addr47B8
	LDA &34
	JSR addr46FF
	STA &34
	LDA &35
	JSR addr46FF
	STA &35
	LDA &36
	JSR addr46FF
	STA &36
	RTS
.addr433F
	LDX #&10
.addr4341
	JSR addr4439
	BMI addr434A
	INX
	BPL addr4341
	TXA
.addr434A
	EOR #&80
	TAX
	RTS
.addr434E
	LDX &033E
	LDA &0313,X
	ORA &0320
	ORA &0341
	BNE addr439F
	LDY &0908
	BMI addr4368
	TAY
	JSR addr1C43
	LSR A
	BEQ addr439F
.addr4368
	LDY &092D
	BMI addr4375
	LDY #&25
	JSR addr1C41
	LSR A
	BEQ addr439F
.addr4375
	LDA #&81
	STA &83
	STA &82
	STA &1B
	LDA &0908
	JSR addr28FF
	STA &0908
	LDA &092D
	JSR addr28FF
	STA &092D
	LDA #&01
	STA &87
	STA &8A
	LSR A
	STA &0349
	LDX &0345
	JMP addr5493
.addr439F
	LDA #&28
	BNE addr43F3
.addr43A3
	LDA #&00
	STA ecm_on
	STA &0340
	JSR addr381B
	LDA #&48
	BNE addr43F3
.addr43B1
	LDA #&10
	JSR addr43F3
	LDA #&18
	BNE addr43F3
.addr43BA
	LDA #&20
	BNE addr43F3
.addr43BE
	LDX #&01
	JSR addr2590
	BCC addr4418
	LDA #&78
	JSR addr45C6
	LDA #&30
	BNE addr43F3
.addr43CE
	INC my_kills_lo
	BNE addr43DB
	INC my_kills_hi
	LDA #&65
	JSR addr45C6
.addr43DB
	LDX #&07
.addr43DD
	STX &D1
	LDA #&18
	JSR addr4404
	LDA &4D
	LSR A
	LSR A
	AND &D1
	ORA #&F1
	STA &0B
	JSR addr43F6
	LDA #&10
.addr43F3
	JSR addr4404
.addr43F6
	LDX &03C6
	BNE addr4418
	LDX #&09
	LDY #&00
	LDA #&07
	JMP osword       ; SOUND
.addr4404
	LSR A
	ADC #&03
	TAY
	LDX #&07
.addr440A
	LDA #&00
	STA &09,X
	DEX
	LDA &3E90,Y
	STA &09,X
	DEY
	DEX
	BPL addr440A
.addr4418
	RTS

.addr4419
	EQUB &E8, &E2, &E6, &E7, &C2, &D1, &C1
	EQUB &60, &70, &23, &35, &65, &22, &45, &52, &37

.addr4429
	LDX &4418,Y
	JSR addr4439
	BPL addr4451
	LDA #&FF
	STA &0300,Y
	RTS
.addr4437
	LDX #&01
.addr4439
	LDA #&03
	SEI
	STA systemvia_orb
	LDA #&7F
	STA systemvia_ddra
	STX systemvia_ora_nh
	LDX systemvia_ira_nh
	LDA #&0B
	STA systemvia_orb
	CLI
	TXA
.addr4451
	RTS
.addr4452
	LDA #&80
	JSR osbyte
	TYA
	EOR &03CC
	RTS
.addr445C
	STY &D1
	CPX &D1
	BNE addr4472
	LDA &0387,X
	EOR #&FF
	STA &0387,X
	JSR addr1EFA
	JSR addr5530
	LDY &D1
.addr4472
	RTS
.addr4473
	LDA &033F
	BNE addr44C7
	LDY #&01
	JSR addr4429
	INY
	JSR addr4429
	LDA systemvia_irb
	TAX
	AND #&10
	EOR #&10
	STA key_a
	LDX #&01
	JSR addr4452
	ORA #&01
	STA &034C
	LDX #&02
	JSR addr4452
	EOR &03CB
	STA &034D
	JMP addr4555
.addr44A4
	LDA #&00
	LDY #&10
.addr44A8
	STA &0300,Y
	DEY
	BNE addr44A8
	RTS
.addr44AF
	JSR addr44A4
	LDA &03CD
	BNE addr4473
	STA &03CE
	LDY #&07
.addr44BC
	JSR addr4429
	DEY
	BNE addr44BC
	LDA &033F
	BEQ addr4526
.addr44C7
	JSR addr3F26
	LDA #&60
	STA &54
	ORA #&80
	STA &5C
	STA &8C
	LDA &7D
	STA &61
	JSR addr2346
	LDA &61
	CMP #&16
	BCC addr44E3
	LDA #&16
.addr44E3
	STA &7D
	LDA #&FF
	LDX #&00
	LDY &62
	BEQ addr44F3
	BMI addr44F0
	INX
.addr44F0
	STA key_question,X
.addr44F3
	LDA #&80
	LDX #&00
	ASL &63
	BEQ addr450F
	BCC addr44FE
	INX
.addr44FE
	BIT &63
	BPL addr4509
	LDA #&40
	STA &034C
	LDA #&00
.addr4509
	STA key_rotleft,X
	LDA &034C
.addr450F
	STA &034C
	LDA #&80
	LDX #&00
	ASL &64
	BEQ addr4523
	BCS addr451D
	INX
.addr451D
	STA key_x,X
	LDA &034D
.addr4523
	STA &034D
.addr4526
	LDX &034C
	LDA #&07
	LDY key_rotleft
	BEQ addr4533
	JSR addr2A16
.addr4533
	LDY key_rotright
	BEQ addr453B
	JSR addr2A26
.addr453B
	STX &034C
	ASL A
	LDX &034D
	LDY key_x
	BEQ addr454A
	JSR addr2A26
.addr454A
	LDY key_s
	BEQ addr4552
	JSR addr2A16
.addr4552
	STX &034D
.addr4555
	JSR addr433F
	STX &0300
	CPX #&69
	BNE addr459C
.addr455F
	JSR addr55F7
	JSR addr433F
	CPX #&51
	BNE addr456E
	LDA #&00
	STA &03C6
.addr456E
	LDY #&40
.addr4570
	JSR addr445C
	INY
	CPY #&47
	BNE addr4570
	CPX #&10
	BNE addr457F
	STX &03C6
.addr457F
	CPX #&70
	BNE addr4586
	JMP addr1220
.addr4586
	CPX #&64
	BNE addr4598
	LDA &03CE
	EOR #&FF
	STA &03CE
	STA &03CD
	STA &03CC
.addr4598
	CPX #&59
	BNE addr455F
.addr459C
	LDA &87
	BNE addr45B4
	LDY #&10
	LDA #&FF
.addr45A4
	LDX &4418,Y
	CPX &0300
	BNE addr45AF
	STA &0300,Y
.addr45AF
	DEY
	CPY #&07
	BNE addr45A4
.addr45B4
	RTS
.addr45B5
	STX &034A
	PHA
	LDA &03A4
	JSR addr45DD
	PLA
	EQUB &2C
.addr45C1
	LDA #&6C
	EQUB &2C
.addr45C4
	LDA #&6F
.addr45C6
	LDX #&00
	STX &72
	LDY #&09
	STY text_cursor_x
	LDY #&16
	STY text_cursor_y
	CPX &034A
	BNE addr45B5
	STY &034A
	STA &03A4
.addr45DD
	JSR addr339A
	LSR &034B
	BCC addr45B4
	LDA #&FD
	JMP addr339A
.addr45EA
	JSR addr3F86
	BMI addr45B4
	CPX #&16
	BCS addr45B4
	LDA &036F,X
	BEQ addr45B4
	LDA &034A
	BNE addr45B4
	LDY #&03
	STY &034B
	STA &036F,X
	CPX #&11
	BCS addr460E
	TXA
	ADC #&D0
	BNE addr45C6
.addr460E
	BEQ addr45C1
	CPX #&12
	BEQ addr45C4
	TXA
	ADC #&5D
	BNE addr45C6

.addr4619
	EQUB &13, &82, &06, &01, &14, &81, &0A, &03
	EQUB &41, &83, &02, &07, &28, &85, &E2, &1F
	EQUB &53, &85, &FB, &0F, &C4, &08, &36, &03
	EQUB &EB, &1D, &08, &78, &9A, &0E, &38, &03
	EQUB &75, &06, &28, &07, &4E, &01, &11, &1F
	EQUB &7C, &0D, &1D, &07, &B0, &89, &DC, &3F
	EQUB &20, &81, &35, &03, &61, &A1, &42, &07
	EQUB &AB, &A2, &37, &1F, &2D, &C1, &FA, &0F
	EQUB &35, &0F, &C0, &07

; -----------------------------------------------------------------------------
; 
; -----------------------------------------------------------------------------
.addr465D
	TYA
	LDY #&02
	JSR addr472C
	STA &5A
	JMP addr46A5
.addr4668
	TAX
	LDA &35
	AND #&60
	BEQ addr465D
	LDA #&02
	JSR addr472C
	STA &58
	JMP addr46A5
.addr4679
	LDA &50
	STA &34
	LDA &52
	STA &35
	LDA &54
	STA &36
	JSR addr42F5
	LDA &34
	STA &50
	LDA &35
	STA &52
	LDA &36
	STA &54
	LDY #&04
	LDA &34
	AND #&60
	BEQ addr4668
	LDX #&02
	LDA #&00
	JSR addr472C
	STA &56
.addr46A5
	LDA &56
	STA &34
	LDA &58
	STA &35
	LDA &5A
	STA &36
	JSR addr42F5
	LDA &34
	STA &56
	LDA &35
	STA &58
	LDA &36
	STA &5A
	LDA &52
	STA &81
	LDA &5A
	JSR addr28D4
	LDX &54
	LDA &58
	JSR addr293B
	EOR #&80
	STA &5C
	LDA &56
	JSR addr28D4
	LDX &50
	LDA &5A
	JSR addr293B
	EOR #&80
	STA &5E
	LDA &58
	JSR addr28D4
	LDX &52
	LDA &56
	JSR addr293B
	EOR #&80
	STA &60
	LDA #&00
	LDX #&0E
.addr46F8
	STA &4F,X
	DEX
	DEX
	BPL addr46F8
	RTS
.addr46FF
	TAY
	AND #&7F
	CMP &81
	BCS addr4726
	LDX #&FE
	STX &D1
.addr470A
	ASL A
	CMP &81
	BCC addr4711
	SBC &81
.addr4711
	ROL &D1
	BCS addr470A
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
.addr4726
	TYA
	AND #&80
	ORA #&60
	RTS
.addr472C
	STA &1D
	LDA &50,X
	STA &81
	LDA &56,X
	JSR addr28D4
	LDX &50,Y
	STX &81
	LDA &0056,Y
	JSR addr28FC
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
.addr475F
	ROL A
	CMP &81
	BCC addr4766
	SBC &81
.addr4766
	ROL &1B
	ROL &1C
	DEX
	BNE addr475F
	LDA &1B
	ORA &D1
	RTS
.addr4772
	JSR addr48DE
	JSR addr3856
	ORA &D3
	BNE addr479D
	LDA &E0
	CMP #&BE
	BCS addr479D
	LDY #&02
	JSR addr47A4
	LDY #&06
	LDA &E0
	ADC #&01
	JSR addr47A4
	LDA #&08
	ORA &65
	STA &65
	LDA #&08
	JMP addr4F74
.addr479B
	PLA
	PLA
.addr479D
	LDA #&F7
	AND &65
	STA &65
	RTS
.addr47A4
	STA (&67),Y
	INY
	INY
	STA (&67),Y
	LDA &D2
	DEY
	STA (&67),Y
	ADC #&03
	BCS addr479B
	DEY
	DEY
	STA (&67),Y
	RTS
.addr47B8
	LDY &82
	LDA &81
	STA &83
	LDX #&00
	STX &81
	LDA #&08
	STA &D1
.addr47C6
	CPX &81
	BCC addr47D8
	BNE addr47D0
	CPY #&40
	BCC addr47D8
.addr47D0
	TYA
	SBC #&40
	TAY
	TXA
	SBC &81
	TAX
.addr47D8
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
	BNE addr47C6
	RTS
.addr47EF
	CMP &81
	BCS addr480D
.addr47F3
	LDX #&FE
	STX &82
.addr47F7
	ASL A
	BCS addr4805
	CMP &81
	BCC addr4800
	SBC &81
.addr4800
	ROL &82
	BCS addr47F7
	RTS
.addr4805
	SBC &81
	SEC
	ROL &82
	BCS addr47F7
	RTS
.addr480D
	LDA #&FF
	STA &82
	RTS
.addr4812
	EOR &83
	BMI addr481C
	LDA &81
	CLC
	ADC &82
	RTS
.addr481C
	LDA &82
	SEC
	SBC &81
	BCC addr4825
	CLC
	RTS
.addr4825
	PHA
	LDA &83
	EOR #&80
	STA &83
	PLA
	EOR #&FF
	ADC #&01
	RTS
.addr4832
	LDX #&00
	LDY #&00
.addr4836
	LDA &34
	STA &81
	LDA &09,X
	JSR addr2847
	STA &D1
	LDA &35
	EOR &0A,X
	STA &83
	LDA &36
	STA &81
	LDA &0B,X
	JSR addr2847
	STA &81
	LDA &D1
	STA &82
	LDA &37
	EOR &0C,X
	JSR addr4812
	STA &D1
	LDA &38
	STA &81
	LDA &0D,X
	JSR addr2847
	STA &81
	LDA &D1
	STA &82
	LDA &39
	EOR &0E,X
	JSR addr4812
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
	BCC addr4836
	RTS
.addr4889
	JMP addr3899
.addr488C
	LDA &8C
	BMI addr4889
	LDA #&1F
	STA &96
	LDA &6A
	BMI addr48DE
	LDA #&20
	BIT &65
	BNE addr48CB
	BPL addr48CB
	ORA &65
	AND #&3F
	STA &65
	LDA #&00
	LDY #&1C
	STA (inf_pointer),Y
	LDY #&1E
	STA (inf_pointer),Y
	JSR addr48DE
	LDY #&01
	LDA #&12
	STA (&67),Y
	LDY #&07
	LDA (hull_pointer),Y
	LDY #&02
	STA (&67),Y
.addr48C1
	INY
	JSR addr3F86
	STA (&67),Y
	CPY #&06
	BNE addr48C1
.addr48CB
	LDA &4E
	BPL addr48EC
.addr48CF
	LDA &65
	AND #&20
	BEQ addr48DE
	LDA &65
	AND #&F7
	STA &65
	JMP addr3470
.addr48DE
	LDA #&08
	BIT &65
	BEQ addr48EB
	EOR &65
	STA &65
	JMP addr4F78
.addr48EB
	RTS
.addr48EC
	LDA &4D
	CMP #&C0
	BCS addr48CF
	LDA inwk_xlo
	CMP &4C
	LDA inwk_xhi
	SBC &4D
	BCS addr48CF
	LDA &49
	CMP &4C
	LDA &4A
	SBC &4D
	BCS addr48CF
	LDY #&06
	LDA (hull_pointer),Y
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
	BNE addr492F
	LDA &D1
	ROR A
	LSR A
	LSR A
	LSR A
	STA &96
	BPL addr4940
.addr492F
	LDY #&0D
	LDA (hull_pointer),Y
	CMP &4D
	BCS addr4940
	LDA #&20
	AND &65
	BNE addr4940
	JMP addr4772
.addr4940
	LDX #&05
.addr4942
	LDA &5B,X
	STA &09,X
	LDA &55,X
	STA &0F,X
	LDA &4F,X
	STA &15,X
	DEX
	BPL addr4942
	LDA #&C5
	STA &81
	LDY #&10
.addr4957
	LDA &0009,Y
	ASL A
	LDA &000A,Y
	ROL A
	JSR addr47EF
	LDX &82
	STX &09,Y
	DEY
	DEY
	BPL addr4957
	LDX #&08
.addr496C
	LDA inwk_xlo,X
	STA &72,X
	DEX
	BPL addr496C
	LDA #&FF
	STA &E1
	LDY #&0C
	LDA &65
	AND #&20
	BEQ addr4991
	LDA (hull_pointer),Y
	LSR A
	LSR A
	TAX
	LDA #&FF
.addr4986
	STA &D2,X
	DEX
	BPL addr4986
	INX
	STX &96
.addr498E
	JMP addr4B04
.addr4991
	LDA (hull_pointer),Y
	BEQ addr498E
	STA &97
	LDY #&12
	LDA (hull_pointer),Y
	TAX
	LDA &79
	TAY
	BEQ addr49B0
.addr49A1
	INX
	LSR &76
	ROR &75
	LSR &73
	ROR &72
	LSR A
	ROR &78
	TAY
	BNE addr49A1
.addr49B0
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
	JSR addr4832
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
	LDA (hull_pointer),Y
	CLC
	ADC hull_pointer_lo
	STA vertices_ptr_lo
	LDY #&11
	LDA (hull_pointer),Y
	ADC hull_pointer_hi
	STA vertices_ptr_hi
	LDY #&00
.addr49F8
	LDA (vertices_ptr),Y
	STA &3B
	AND #&1F
	CMP &96
	BCS addr4A11
	TYA
	LSR A
	LSR A
	TAX
	LDA #&FF
	STA &D2,X
	TYA
	ADC #&04
	TAY
	JMP addr4AFD
.addr4A11
	LDA &3B
	ASL A
	STA &3D
	ASL A
	STA &3F
	INY
	LDA (vertices_ptr),Y
	STA &3A
	INY
	LDA (vertices_ptr),Y
	STA &3C
	INY
	LDA (vertices_ptr),Y
	STA &3E
	LDX &86
	CPX #&04
	BCC addr4A51
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
	JMP addr4AAF
.addr4A49
	LSR &72
	LSR &78
	LSR &75
	LDX #&01
.addr4A51
	LDA &3A
	STA &34
	LDA &3C
	STA &36
	LDA &3E
	DEX
	BMI addr4A66
.addr4A5E
	LSR &34
	LSR &36
	LSR A
	DEX
	BPL addr4A5E
.addr4A66
	STA &82
	LDA &3F
	STA &83
	LDA &78
	STA &81
	LDA &7A
	JSR addr4812
	BCS addr4A49
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
	JSR addr4812
	BCS addr4A49
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
	JSR addr4812
	BCS addr4A49
	STA &36
	LDA &83
	STA &37
.addr4AAF
	LDA &3A
	STA &81
	LDA &34
	JSR addr2847
	STA &D1
	LDA &3B
	EOR &35
	STA &83
	LDA &3C
	STA &81
	LDA &36
	JSR addr2847
	STA &81
	LDA &D1
	STA &82
	LDA &3D
	EOR &37
	JSR addr4812
	STA &D1
	LDA &3E
	STA &81
	LDA &38
	JSR addr2847
	STA &81
	LDA &D1
	STA &82
	LDA &39
	EOR &3F
	JSR addr4812
	PHA
	TYA
	LSR A
	LSR A
	TAX
	PLA
	BIT &83
	BMI addr4AFA
	LDA #&00
.addr4AFA
	STA &D2,X
	INY
.addr4AFD
	CPY &97
	BCS addr4B04
	JMP addr49F8
.addr4B04
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
	LDA (hull_pointer),Y
	STA &97
	LDA hull_pointer_lo
	CLC
	ADC #&14
	STA vertices_ptr_lo
	LDA hull_pointer_hi
	ADC #&00
	STA vertices_ptr_hi
	LDY #&00
	STY &93
.addr4B4B
	STY &86
	LDA (vertices_ptr),Y
	STA &34
	INY
	LDA (vertices_ptr),Y
	STA &36
	INY
	LDA (vertices_ptr),Y
	STA &38
	INY
	LDA (vertices_ptr),Y
	STA &D1
	AND #&1F
	CMP &96
	BCC addr4B94
	INY
	LDA (vertices_ptr),Y
	STA &1B
	AND #&0F
	TAX
	LDA &D2,X
	BNE addr4B97
	LDA &1B
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	LDA &D2,X
	BNE addr4B97
	INY
	LDA (vertices_ptr),Y
	STA &1B
	AND #&0F
	TAX
	LDA &D2,X
	BNE addr4B97
	LDA &1B
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	LDA &D2,X
	BNE addr4B97
.addr4B94
	JMP addr4D0C
.addr4B97
	LDA &D1
	STA &35
	ASL A
	STA &37
	ASL A
	STA &39
	JSR addr4832
	LDA inwk_xsg
	STA &36
	EOR &3B
	BMI addr4BBC
	CLC
	LDA &3A
	ADC inwk_xlo
	STA &34
	LDA inwk_xhi
	ADC #&00
	STA &35
	JMP addr4BDF
.addr4BBC
	LDA inwk_xlo
	SEC
	SBC &3A
	STA &34
	LDA inwk_xhi
	SBC #&00
	STA &35
	BCS addr4BDF
	EOR #&FF
	STA &35
	LDA #&01
	SBC &34
	STA &34
	BCC addr4BD9
	INC &35
.addr4BD9
	LDA &36
	EOR #&80
	STA &36
.addr4BDF
	LDA &4B
	STA &39
	EOR &3D
	BMI addr4BF7
	CLC
	LDA &3C
	ADC &49
	STA &37
	LDA &4A
	ADC #&00
	STA &38
	JMP addr4C1C
.addr4BF7
	LDA &49
	SEC
	SBC &3C
	STA &37
	LDA &4A
	SBC #&00
	STA &38
	BCS addr4C1C
	EOR #&FF
	STA &38
	LDA &37
	EOR #&FF
	ADC #&01
	STA &37
	LDA &39
	EOR #&80
	STA &39
	BCC addr4C1C
	INC &38
.addr4C1C
	LDA &3F
	BMI addr4C6A
	LDA &3E
	CLC
	ADC &4C
	STA &D1
	LDA &4D
	ADC #&00
	STA &80
	JMP addr4C89
.addr4C30
	LDX &81
	BEQ addr4C50
	LDX #&00
.addr4C36
	LSR A
	INX
	CMP &81
	BCS addr4C36
	STX &83
	JSR addr47EF
	LDX &83
	LDA &82
.addr4C45
	ASL A
	ROL &80
	BMI addr4C50
	DEX
	BNE addr4C45
	STA &82
	RTS
.addr4C50
	LDA #&32
	STA &82
	STA &80
	RTS
.addr4C57
	LDA #&80
	SEC
	SBC &82
	STA &0100,X
	INX
	LDA #&00
	SBC &80
	STA &0100,X
	JMP addr4CC9
.addr4C6A
	LDA &4C
	SEC
	SBC &3E
	STA &D1
	LDA &4D
	SBC #&00
	STA &80
	BCC addr4C81
	BNE addr4C89
	LDA &D1
	CMP #&04
	BCS addr4C89
.addr4C81
	LDA #&00
	STA &80
	LDA #&04
	STA &D1
.addr4C89
	LDA &80
	ORA &35
	ORA &38
	BEQ addr4CA0
	LSR &35
	ROR &34
	LSR &38
	ROR &37
	LSR &80
	ROR &D1
	JMP addr4C89
.addr4CA0
	LDA &D1
	STA &81
	LDA &34
	CMP &81
	BCC addr4CB0
	JSR addr4C30
	JMP addr4CB3
.addr4CB0
	JSR addr47EF
.addr4CB3
	LDX &93
	LDA &36
	BMI addr4C57
	LDA &82
	CLC
	ADC #&80
	STA &0100,X
	INX
	LDA &80
	ADC #&00
	STA &0100,X
.addr4CC9
	TXA
	PHA
	LDA #&00
	STA &80
	LDA &D1
	STA &81
	LDA &37
	CMP &81
	BCC addr4CF2
	JSR addr4C30
	JMP addr4CF5
.addr4CDF
	LDA #&60
	CLC
	ADC &82
	STA &0100,X
	INX
	LDA #&00
	ADC &80
	STA &0100,X
	JMP addr4D0C
.addr4CF2
	JSR addr47EF
.addr4CF5
	PLA
	TAX
	INX
	LDA &39
	BMI addr4CDF
	LDA #&60
	SEC
	SBC &82
	STA &0100,X
	INX
	LDA #&00
	SBC &80
	STA &0100,X
.addr4D0C
	CLC
	LDA &93
	ADC #&04
	STA &93
	LDA &86
	ADC #&06
	TAY
	BCS addr4D21
	CMP &97
	BCS addr4D21
	JMP addr4B4B
.addr4D21
	LDA &65
	AND #&20
	BEQ addr4D30
	LDA &65
	ORA #&08
	STA &65
	JMP addr3470
.addr4D30
	LDA #&08
	BIT &65
	BEQ addr4D3B
	JSR addr4F78
	LDA #&08
.addr4D3B
	ORA &65
	STA &65
	LDY #&09
	LDA (hull_pointer),Y
	STA &97
	LDY #&00
	STY &80
	STY &86
	INC &80
	BIT &65
	BVC addr4DA5
	LDA &65
	AND #&BF
	STA &65
	LDY #&06
	LDA (hull_pointer),Y
	TAY
	LDX &0100,Y
	STX &34
	INX
	BEQ addr4DA5
	LDX &0101,Y
	STX &35
	INX
	BEQ addr4DA5
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
	LDA inwk_xsg
	BPL addr4D88
	DEC &38
.addr4D88
	JSR addr4E19
	BCS addr4DA5
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
.addr4DA5
	LDY #&03
	CLC
	LDA (hull_pointer),Y
	ADC hull_pointer_lo
	STA vertices_ptr_lo
	LDY #&10
	LDA (hull_pointer),Y
	ADC hull_pointer_hi
	STA vertices_ptr_hi
	LDY #&05
	LDA (hull_pointer),Y
	STA &06
	LDY &86
.addr4DBE
	LDA (vertices_ptr),Y
	CMP &96
	BCC addr4DDC
	INY
	LDA (vertices_ptr),Y
	INY
	STA &1B
	AND #&0F
	TAX
	LDA &D2,X
	BNE addr4DDF
	LDA &1B
	LSR A
	LSR A
	LSR A
	LSR A
	TAX
	LDA &D2,X
	BNE addr4DDF
.addr4DDC
	JMP addr4F5B
.addr4DDF
	LDA (vertices_ptr),Y
	TAX
	INY
	LDA (vertices_ptr),Y
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
	JSR addr4E1F
	BCS addr4DDC
	JMP addr4F3F
.addr4E19
	LDA #&00
	STA &90
	LDA &39
.addr4E1F
	LDX #&BF
	ORA &3B
	BNE addr4E2B
	CPX &3A
	BCC addr4E2B
	LDX #&00
.addr4E2B
	STX &89
	LDA &35
	ORA &37
	BNE addr4E4F
	LDA #&BF
	CMP &36
	BCC addr4E4F
	LDA &89
	BNE addr4E4D
.addr4E3D
	LDA &36
	STA &35
	LDA &38
	STA &36
	LDA &3A
	STA &37
	CLC
	RTS
.addr4E4B
	SEC
	RTS
.addr4E4D
	LSR &89
.addr4E4F
	LDA &89
	BPL addr4E82
	LDA &35
	AND &39
	BMI addr4E4B
	LDA &37
	AND &3B
	BMI addr4E4B
	LDX &35
	DEX
	TXA
	LDX &39
	DEX
	STX &3C
	ORA &3C
	BPL addr4E4B
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
	BPL addr4E4B
.addr4E82
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
	BPL addr4EB3
	LDA #&00
	SEC
	SBC &3E
	STA &3E
	LDA #&00
	SBC &3F
	STA &3F
.addr4EB3
	LDA &3D
	BPL addr4EC2
	SEC
	LDA #&00
	SBC &3C
	STA &3C
	LDA #&00
	SBC &3D
.addr4EC2
	TAX
	BNE addr4EC9
	LDX &3F
	BEQ addr4ED3
.addr4EC9
	LSR A
	ROR &3C
	LSR &3F
	ROR &3E
	JMP addr4EC2
.addr4ED3
	STX &D1
	LDA &3C
	CMP &3E
	BCC addr4EE5
	STA &81
	LDA &3E
	JSR addr47EF
	JMP addr4EF0
.addr4EE5
	LDA &3E
	STA &81
	LDA &3C
	JSR addr47EF
	DEC &D1
.addr4EF0
	LDA &82
	STA &3C
	LDA &83
	STA &3D
	LDA &89
	BEQ addr4EFE
	BPL addr4F11
.addr4EFE
	JSR addr4F9F
	LDA &89
	BPL addr4F36
	LDA &35
	ORA &37
	BNE addr4F3B
	LDA &36
	CMP #&C0
	BCS addr4F3B
.addr4F11
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
	JSR addr4F9F
	DEC &90
.addr4F36
	PLA
	TAY
	JMP addr4E3D
.addr4F3B
	PLA
	TAY
	SEC
	RTS
.addr4F3F
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
	BCS addr4F72
.addr4F5B
	INC &86
	LDY &86
	CPY &97
	BCS addr4F72
	LDY #&00
	LDA vertices_ptr_lo
	ADC #&04
	STA vertices_ptr_lo
	BCC addr4F6F
	INC vertices_ptr_hi
.addr4F6F
	JMP addr4DBE
.addr4F72
	LDA &80
.addr4F74
	LDY #&00
	STA (&67),Y
.addr4F78
	LDY #&00
	LDA (&67),Y
	STA &97
	CMP #&04
	BCC addr4F9E
	INY
.addr4F83
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
	JSR addr16C4
	INY
	CPY &97
	BCC addr4F83
.addr4F9E
	RTS
.addr4F9F
	LDA &35
	BPL addr4FBA
	STA &83
	JSR addr5019
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
.addr4FBA
	BEQ addr4FD5
	STA &83
	DEC &83
	JSR addr5019
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
.addr4FD5
	LDA &37
	BPL addr4FF3
	STA &83
	LDA &36
	STA &82
	JSR addr5048
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
.addr4FF3
	LDA &36
	SEC
	SBC #&C0
	STA &82
	LDA &37
	SBC #&00
	STA &83
	BCC addr5018
	JSR addr5048
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
.addr5018
	RTS
.addr5019
	LDA &34
	STA &82
	JSR addr5084
	PHA
	LDX &D1
	BNE addr5050
.addr5025
	LDA #&00
	TAX
	TAY
	LSR &83
	ROR &82
	ASL &81
	BCC addr503A
.addr5031
	TXA
	CLC
	ADC &82
	TAX
	TYA
	ADC &83
	TAY
.addr503A
	LSR &83
	ROR &82
	ASL &81
	BCS addr5031
	BNE addr503A
	PLA
	BPL addr5077
	RTS
.addr5048
	JSR addr5084
	PHA
	LDX &D1
	BNE addr5025
.addr5050
	LDA #&FF
	TAY
	ASL A
	TAX
.addr5055
	ASL &82
	ROL &83
	LDA &83
	BCS addr5061
	CMP &81
	BCC addr506C
.addr5061
	SBC &81
	STA &83
	LDA &82
	SBC #&00
	STA &82
	SEC
.addr506C
	TXA
	ROL A
	TAX
	TYA
	ROL A
	TAY
	BCS addr5055
	PLA
	BMI addr5083
.addr5077
	TXA
	EOR #&FF
	ADC #&01
	TAX
	TYA
	EOR #&FF
	ADC #&00
	TAY
.addr5083
	RTS
.addr5084
	LDX &3C
	STX &81
	LDA &83
	BPL addr509D
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
.addr509D
	EOR &3D
	RTS
.addr50A0
	LDA &65
	AND #&A0
	BNE addr50CB
	LDA &8A
	EOR &84
	AND #&0F
	BNE addr50B1
	JSR addr4679
.addr50B1
	LDX &8C
	BPL addr50B8
	JMP addr533D
.addr50B8
	LDA &66
	BPL addr50CB
	CPX #&01
	BEQ addr50C8
	LDA &8A
	EOR &84
	AND #&07
	BNE addr50CB
.addr50C8
	JSR addr217A
.addr50CB
	JSR addr5558
	LDA &61
	ASL A
	ASL A
	STA &81
	LDA &50
	AND #&7F
	JSR addr2847
	STA &82
	LDA &50
	LDX #&00
	JSR addr524A
	LDA &52
	AND #&7F
	JSR addr2847
	STA &82
	LDA &52
	LDX #&03
	JSR addr524A
	LDA &54
	AND #&7F
	JSR addr2847
	STA &82
	LDA &54
	LDX #&06
	JSR addr524A
	LDA &61
	CLC
	ADC &62
	BPL addr510D
	LDA #&00
.addr510D
	LDY #&0F
	CMP (hull_pointer),Y
	BCC addr5115
	LDA (hull_pointer),Y
.addr5115
	STA &61
	LDA #&00
	STA &62
	LDX &31
	LDA inwk_xlo
	EOR #&FF
	STA &1B
	LDA inwk_xhi
	JSR addr2877
	STA &1D
	LDA &33
	EOR inwk_xsg
	LDX #&03
	JSR addr5308
	STA &9E
	LDA &1C
	STA &9C
	EOR #&FF
	STA &1B
	LDA &1D
	STA &9D
	LDX beta1
	JSR addr2877
	STA &1D
	LDA &9E
	EOR &7B
	LDX #&06
	JSR addr5308
	STA &4E
	LDA &1C
	STA &4C
	EOR #&FF
	STA &1B
	LDA &1D
	STA &4D
	JSR addr2879
	STA &1D
	LDA &9E
	STA &4B
	EOR &7B
	EOR &4E
	BPL addr517D
	LDA &1C
	ADC &9C
	STA &49
	LDA &1D
	ADC &9D
	STA &4A
	JMP addr519D
.addr517D
	LDA &9C
	SBC &1C
	STA &49
	LDA &9D
	SBC &1D
	STA &4A
	BCS addr519D
	LDA #&01
	SBC &49
	STA &49
	LDA #&00
	SBC &4A
	STA &4A
	LDA &4B
	EOR #&80
	STA &4B
.addr519D
	LDX &31
	LDA &49
	EOR #&FF
	STA &1B
	LDA &4A
	JSR addr2877
	STA &1D
	LDA &32
	EOR &4B
	LDX #&00
	JSR addr5308
	STA inwk_xsg
	LDA &1D
	STA inwk_xhi
	LDA &1C
	STA inwk_xlo
.addr51BF
	LDA &7D
	STA &82
	LDA #&80
	LDX #&06
	JSR addr524C
	LDA &8C
	AND #&81
	CMP #&81
	BNE addr51D3
	RTS
.addr51D3
	LDY #&09
	JSR addr52A1
	LDY #&0F
	JSR addr52A1
	LDY #&15
	JSR addr52A1
	LDA &64
	AND #&80
	STA &9A
	LDA &64
	AND #&7F
	BEQ addr520B
	CMP #&7F
	SBC #&00
	ORA &9A
	STA &64
	LDX #&0F
	LDY #&09
	JSR addr1DA8
	LDX #&11
	LDY #&0B
	JSR addr1DA8
	LDX #&13
	LDY #&0D
	JSR addr1DA8
.addr520B
	LDA &63
	AND #&80
	STA &9A
	LDA &63
	AND #&7F
	BEQ addr5234
	CMP #&7F
	SBC #&00
	ORA &9A
	STA &63
	LDX #&0F
	LDY #&15
	JSR addr1DA8
	LDX #&11
	LDY #&17
	JSR addr1DA8
	LDX #&13
	LDY #&19
	JSR addr1DA8
.addr5234
	LDA &65
	AND #&A0
	BNE addr5243
	LDA &65
	ORA #&10
	STA &65
	JMP addr5558
.addr5243
	LDA &65
	AND #&EF
	STA &65
	RTS
.addr524A
	AND #&80
.addr524C
	ASL A
	STA &83
	LDA #&00
	ROR A
	STA &D1
	LSR &83
	EOR inwk_xsg,X
	BMI addr526F
	LDA &82
	ADC inwk_xlo,X
	STA inwk_xlo,X
	LDA &83
	ADC inwk_xhi,X
	STA inwk_xhi,X
	LDA inwk_xsg,X
	ADC #&00
	ORA &D1
	STA inwk_xsg,X
	RTS
.addr526F
	LDA inwk_xlo,X
	SEC
	SBC &82
	STA inwk_xlo,X
	LDA inwk_xhi,X
	SBC &83
	STA inwk_xhi,X
	LDA inwk_xsg,X
	AND #&7F
	SBC #&00
	ORA #&80
	EOR &D1
	STA inwk_xsg,X
	BCS addr52A0
	LDA #&01
	SBC inwk_xlo,X
	STA inwk_xlo,X
	LDA #&00
	SBC inwk_xhi,X
	STA inwk_xhi,X
	LDA #&00
	SBC inwk_xsg,X
	AND #&7F
	ORA &D1
	STA inwk_xsg,X
.addr52A0
	RTS
.addr52A1
	LDA shiptype
	STA &81
	LDX inwk_xsg,Y
	STX &82
	LDX &49,Y
	STX &83
	LDX inwk_xlo,Y
	STX &1B
	LDA &0047,Y
	EOR #&80
	JSR addr28FC
	STA &0049,Y
	STX inwk_xsg,Y
	STX &1B
	LDX inwk_xlo,Y
	STX &82
	LDX inwk_xhi,Y
	STX &83
	LDA &0049,Y
	JSR addr28FC
	STA &0047,Y
	STX inwk_xlo,Y
	STX &1B
	LDA beta
	STA &81
	LDX inwk_xsg,Y
	STX &82
	LDX &49,Y
	STX &83
	LDX &4A,Y
	STX &1B
	LDA &004B,Y
	EOR #&80
	JSR addr28FC
	STA &0049,Y
	STX inwk_xsg,Y
	STX &1B
	LDX &4A,Y
	STX &82
	LDX &4B,Y
	STX &83
	LDA &0049,Y
	JSR addr28FC
	STA &004B,Y
	STX &4A,Y
	RTS
.addr5308
	TAY
	EOR inwk_xsg,X
	BMI addr531C
	LDA &1C
	CLC
	ADC inwk_xlo,X
	STA &1C
	LDA &1D
	ADC inwk_xhi,X
	STA &1D
	TYA
	RTS
.addr531C
	LDA inwk_xlo,X
	SEC
	SBC &1C
	STA &1C
	LDA inwk_xhi,X
	SBC &1D
	STA &1D
	BCC addr532F
	TYA
	EOR #&80
	RTS
.addr532F
	LDA #&01
	SBC &1C
	STA &1C
	LDA #&00
	SBC &1D
	STA &1D
	TYA
	RTS
.addr533D
	LDA shiptype
	EOR #&80
	STA &81
	LDA inwk_xlo
	STA &1B
	LDA inwk_xhi
	STA &1C
	LDA inwk_xsg
	JSR addr2782
	LDX #&03
	JSR addr1D4C
	LDA &41
	STA &9C
	STA &1B
	LDA &42
	STA &9D
	STA &1C
	LDA beta
	STA &81
	LDA &43
	STA &9E
	JSR addr2782
	LDX #&06
	JSR addr1D4C
	LDA &41
	STA &1B
	STA &4C
	LDA &42
	STA &1C
	STA &4D
	LDA &43
	STA &4E
	EOR #&80
	JSR addr2782
	LDA &43
	AND #&80
	STA &D1
	EOR &9E
	BMI addr53A8
	LDA &40
	CLC
	ADC &9B
	LDA &41
	ADC &9C
	STA &49
	LDA &42
	ADC &9D
	STA &4A
	LDA &43
	ADC &9E
	JMP addr53DB
.addr53A8
	LDA &40
	SEC
	SBC &9B
	LDA &41
	SBC &9C
	STA &49
	LDA &42
	SBC &9D
	STA &4A
	LDA &9E
	AND #&7F
	STA &1B
	LDA &43
	AND #&7F
	SBC &1B
	STA &1B
	BCS addr53DB
	LDA #&01
	SBC &49
	STA &49
	LDA #&00
	SBC &4A
	STA &4A
	LDA #&00
	SBC &1B
	ORA #&80
.addr53DB
	EOR &D1
	STA &4B
	LDA shiptype
	STA &81
	LDA &49
	STA &1B
	LDA &4A
	STA &1C
	LDA &4B
	JSR addr2782
	LDX #&00
	JSR addr1D4C
	LDA &41
	STA inwk_xlo
	LDA &42
	STA inwk_xhi
	LDA &43
	STA inwk_xsg
	JMP addr51BF
.addr5404
	DEX
	BNE addr5438
	LDA inwk_xsg
	EOR #&80
	STA inwk_xsg
	LDA &4E
	EOR #&80
	STA &4E
	LDA &50
	EOR #&80
	STA &50
	LDA &54
	EOR #&80
	STA &54
	LDA &56
	EOR #&80
	STA &56
	LDA &5A
	EOR #&80
	STA &5A
	LDA &5C
	EOR #&80
	STA &5C
	LDA &60
	EOR #&80
	STA &60
	RTS
.addr5438
	LDA #&00
	CPX #&02
	ROR A
	STA &9A
	EOR #&80
	STA &99
	LDA inwk_xlo
	LDX &4C
	STA &4C
	STX inwk_xlo
	LDA inwk_xhi
	LDX &4D
	STA &4D
	STX inwk_xhi
	LDA inwk_xsg
	EOR &99
	TAX
	LDA &4E
	EOR &9A
	STA inwk_xsg
	STX &4E
	LDY #&09
	JSR addr546C
	LDY #&0F
	JSR addr546C
	LDY #&15
.addr546C
	LDA &0046,Y
	LDX &4A,Y
	STA &004A,Y
	STX inwk_xlo,Y
	LDA &0047,Y
	EOR &99
	TAX
	LDA &004B,Y
	EOR &9A
	STA &0047,Y
	STX &4B,Y
.addr5486
	RTS
.addr5487
	STX &0345
	JSR addr54C8
	JSR addr54AA
	JMP addr35B1
.addr5493
	LDA #&00
	LDY &87
	BNE addr5487
	CPX &0345
	BEQ addr5486
	STX &0345
	JSR addr54C8
	JSR addr1A05
	JSR addr35D8
.addr54AA
	LDY &0345
	LDA &0368,Y
	BEQ addr5486
	LDA #&80
	STA &73
	LDA #&48
	STA &74
	LDA #&14
	STA &75
	JSR addr2D36
	LDA #&0A
	STA &75
	JMP addr2D36
.addr54C8
	STA &87
.addr54CA
	LDA #&80
	STA &72
	JSR addr360A
	STA &0343
	STA &034A
	STA &034B
	LDX #&60
.addr54DC
	JSR addr42A1
	INX
	CPX #&78
	BNE addr54DC
	LDX hyperspace_countdown_hi
	BEQ addr54EB
	JSR addr30AC
.addr54EB
	LDY #&01
	STY text_cursor_y
	LDA &87
	BNE addr5507
	LDY #&0B
	STY text_cursor_x
	LDA &0345
	ORA #&60
	JSR addr339A
	JSR addr3142
	LDA #&AF
	JSR addr339A
.addr5507
	LDX #&00
	STX &34
	STX &35
	STX &72
	DEX
	STX &36
	JSR addr1868
	LDA #&02
	STA &34
	STA &36
	JSR addr551E
.addr551E
	JSR addr5521
.addr5521
	LDA #&00
	STA &35
	LDA #&BF
	STA &37
	DEC &34
	DEC &36
	JMP addr16C4
.addr5530
	JSR addr55F7
	DEY
	BNE addr5530
	RTS
.addr5537
	LDA #&14
	STA text_cursor_y
	LDA #&75
	STA screen_hi
	LDA #&07
	STA screen_lo
	JSR addr2B60
	LDA #&00
	JSR addr5550
	INC screen_hi
	INY
	STY text_cursor_x
.addr5550
	LDY #&E9
.addr5552
	STA (screen),Y
	DEY
	BNE addr5552
.addr5557
	RTS
.addr5558
	LDA &65
	AND #&10
	BEQ addr5557
	LDA &8C
	BMI addr5557
	LDX #&FF
	CMP #&01
	BNE addr556A
	LDX #&F0
.addr556A
	STX &91
	LDA inwk_xhi
	ORA &4A
	ORA &4D
	AND #&C0
	BNE addr5557
	LDA inwk_xhi
	CLC
	LDX inwk_xsg
	BPL addr5581
	EOR #&FF
	ADC #&01
.addr5581
	ADC #&7B
	STA &34
	LDA &4D
	LSR A
	LSR A
	CLC
	LDX &4E
	BPL addr5591
	EOR #&FF
	SEC
.addr5591
	ADC #&23
	EOR #&FF
	STA screen_lo
	LDA &4A
	LSR A
	CLC
	LDX &4B
	BMI addr55A2
	EOR #&FF
	SEC
.addr55A2
	ADC screen_lo
	BPL addr55B0
	CMP #&C2
	BCS addr55AC
	LDA #&C2
.addr55AC
	CMP #&F7
	BCC addr55B2
.addr55B0
	LDA #&F6
.addr55B2
	STA &35
	SEC
	SBC screen_lo
	PHP
	PHA
	JSR addr36A7
	LDA &16C0,X
	AND &91
	STA &34
	PLA
	PLP
	TAX
	BEQ addr55DA
	BCC addr55DB
.addr55CA
	DEY
	BPL addr55D1
	LDY #&07
	DEC screen_hi
.addr55D1
	LDA &34
	EOR (screen),Y
	STA (screen),Y
	DEX
	BNE addr55CA
.addr55DA
	RTS
.addr55DB
	INY
	CPY #&08
	BNE addr55E4
	LDY #&00
	INC screen_hi
.addr55E4
	INY
	CPY #&08
	BNE addr55ED
	LDY #&00
	INC screen_hi
.addr55ED
	LDA &34
	EOR (screen),Y
	STA (screen),Y
	INX
	BNE addr55E4
	RTS
.addr55F7
	LDA #&00
	STA &8B
.addr55FB
	LDA &8B
	BEQ addr55FB
	RTS
.end

SAVE "bin/D.Code", start, end, codestart, start
