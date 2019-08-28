; -----------------------------------------------------------------------------
; Elite - Krait data (type &13)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

krait_attr = %10001100                  ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.krait_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.krait_header
	EQUB &01                        ; 0000....: cargo type if scooped: none
	                                ; ....0001: max pieces of debris if destroyed: 1
	EQUW &0E10                      ; Area for missile lock
	EQUB &7A                        ; Edges data info offset lo
	EQUB &CE                        ; Faces data info offset lo
	EQUB &55                        ; Ship lines stack: 21 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &12                        ; Explosion count: 3 (4*n+6)
	EQUB &66                        ; Vertices: 17 (n*6)
	EQUB &15                        ; Edges: 21
	EQUW &0164                      ; Bounty: 10.0 Cr
	EQUB &18                        ; Faces: 6 (n*4)
	EQUB &19                        ; Dot beyond distance: 25
	EQUB &50                        ; Hull strength: 80
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; 00010...: Laser class 2
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.krait_vertices
	EQUB &00, &00, &60, &1F, &01, &23
	EQUB &00, &12, &30, &3F, &03, &45
	EQUB &00, &12, &30, &7F, &12, &45
	EQUB &5A, &00, &03, &3F, &01, &44
	EQUB &5A, &00, &03, &BF, &23, &55
	EQUB &5A, &00, &57, &1E, &01, &11
	EQUB &5A, &00, &57, &9E, &23, &33
	EQUB &00, &05, &35, &09, &00, &33
	EQUB &00, &07, &26, &06, &00, &33
	EQUB &12, &07, &13, &89, &33, &33
	EQUB &12, &07, &13, &09, &00, &00
	EQUB &12, &0B, &27, &28, &44, &44
	EQUB &12, &0B, &27, &68, &44, &44
	EQUB &24, &00, &1E, &28, &44, &44
	EQUB &12, &0B, &27, &A8, &55, &55
	EQUB &12, &0B, &27, &E8, &55, &55
	EQUB &24, &00, &1E, &A8, &55, &55

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.krait_edges
	EQUB &1F, &03, &00, &04
	EQUB &1F, &12, &00, &08
	EQUB &1F, &01, &00, &0C
	EQUB &1F, &23, &00, &10
	EQUB &1F, &35, &04, &10
	EQUB &1F, &25, &10, &08
	EQUB &1F, &14, &08, &0C
	EQUB &1F, &04, &0C, &04
	EQUB &1E, &01, &0C, &14
	EQUB &1E, &23, &10, &18
	EQUB &08, &45, &04, &08
	EQUB &09, &00, &1C, &28
	EQUB &06, &00, &20, &28
	EQUB &09, &33, &1C, &24
	EQUB &06, &33, &20, &24
	EQUB &08, &44, &2C, &34
	EQUB &08, &44, &34, &30
	EQUB &07, &44, &30, &2C
	EQUB &07, &55, &38, &3C
	EQUB &08, &55, &3C, &40
	EQUB &08, &55, &40, &38

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.krait_faces
	EQUB &1F, &03, &18, &03
	EQUB &5F, &03, &18, &03
	EQUB &DF, &03, &18, &03
	EQUB &9F, &03, &18, &03
	EQUB &3F, &26, &00, &4D
	EQUB &BF, &26, &00, &4D

.krait_end
