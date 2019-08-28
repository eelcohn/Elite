; -----------------------------------------------------------------------------
; Elite - Thargoid data (type &1D)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

thargoid_attr = %00001100               ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.thargoid_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.thargoid_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &2649                      ; Area for missile lock
	EQUB &8C                        ; Edges data info offset lo
	EQUB &F4                        ; Faces data info offset lo
	EQUB &65                        ; Ship lines stack: 25 (4*max_visible_edges+1)
	EQUB &3C                        ; Gun vertex: 15 (vertex*4)
	EQUB &26                        ; Explosion count: 8 (4*n+6)
	EQUB &78                        ; Vertices: 20 (n*6)
	EQUB &1A                        ; Edges: 26
	EQUW &01F5                      ; Bounty: 50.0 Cr
	EQUB &28                        ; Faces: 10 (n*4)
	EQUB &37                        ; Dot beyond distance: 55
	EQUB &F0                        ; Hull strength: 240
	EQUB &27                        ; Maximum speed: 0.39 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &16                        ; 00010...: Laser class 2
	                                ; .....110: 6 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.thargoid_vertices
	EQUB &20, &30, &30, &5F, &40, &88
	EQUB &20, &44, &00, &5F, &10, &44
	EQUB &20, &30, &30, &7F, &21, &44
	EQUB &20, &00, &44, &3F, &32, &44
	EQUB &20, &30, &30, &3F, &43, &55
	EQUB &20, &44, &00, &1F, &54, &66
	EQUB &20, &30, &30, &1F, &64, &77
	EQUB &20, &00, &44, &1F, &74, &88
	EQUB &18, &74, &74, &DF, &80, &99
	EQUB &18, &A4, &00, &DF, &10, &99
	EQUB &18, &74, &74, &FF, &21, &99
	EQUB &18, &00, &A4, &BF, &32, &99
	EQUB &18, &74, &74, &BF, &53, &99
	EQUB &18, &A4, &00, &9F, &65, &99
	EQUB &18, &74, &74, &9F, &76, &99
	EQUB &18, &00, &A4, &9F, &87, &99
	EQUB &18, &40, &50, &9E, &99, &99
	EQUB &18, &40, &50, &BE, &99, &99
	EQUB &18, &40, &50, &FE, &99, &99
	EQUB &18, &40, &50, &DE, &99, &99

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.thargoid_edges
	EQUB &1F, &84, &00, &1C
	EQUB &1F, &40, &00, &04
	EQUB &1F, &41, &04, &08
	EQUB &1F, &42, &08, &0C
	EQUB &1F, &43, &0C, &10
	EQUB &1F, &54, &10, &14
	EQUB &1F, &64, &14, &18
	EQUB &1F, &74, &18, &1C
	EQUB &1F, &80, &00, &20
	EQUB &1F, &10, &04, &24
	EQUB &1F, &21, &08, &28
	EQUB &1F, &32, &0C, &2C
	EQUB &1F, &53, &10, &30
	EQUB &1F, &65, &14, &34
	EQUB &1F, &76, &18, &38
	EQUB &1F, &87, &1C, &3C
	EQUB &1F, &98, &20, &3C
	EQUB &1F, &90, &20, &24
	EQUB &1F, &91, &24, &28
	EQUB &1F, &92, &28, &2C
	EQUB &1F, &93, &2C, &30
	EQUB &1F, &95, &30, &34
	EQUB &1F, &96, &34, &38
	EQUB &1F, &97, &38, &3C
	EQUB &1E, &99, &40, &44
	EQUB &1E, &99, &48, &4C

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.thargoid_faces
	EQUB &5F, &67, &3C, &19
	EQUB &7F, &67, &3C, &19
	EQUB &7F, &67, &19, &3C
	EQUB &3F, &67, &19, &3C
	EQUB &1F, &40, &00, &00
	EQUB &3F, &67, &3C, &19
	EQUB &1F, &67, &3C, &19
	EQUB &1F, &67, &19, &3C
	EQUB &5F, &67, &19, &3C
	EQUB &9F, &30, &00, &00

.thargoid_end
