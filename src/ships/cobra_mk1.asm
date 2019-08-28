; -----------------------------------------------------------------------------
; Elite - Cobra MkI data (type &16)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

cobra_mk1_attr = %10001100        ; 1....... bit 7: Escape pod present
                                  ; .0...... bit 6: Galcop police ship
                                  ; ..0..... bit 5: Ship is protected by spacestation
                                  ; ...0.... bit 4: Ship is docking
                                  ; ....1... bit 3: Ship is a pirate
                                  ; .....1.. bit 2: Ship is attacking you
                                  ; ......0. bit 1: Ship is a bounty hunter
                                  ; .......0 bit 0: Ship is a trader

.cobra_mk1_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.cobra_mk1_header
	EQUB &03                        ; 0000....: cargo type if scooped: none
	                                ; ....0011: max pieces of debris if destroyed: 3
	EQUW &2649                      ; Area for missile lock
	EQUB &56                        ; Edges data info offset lo
	EQUB &9E                        ; Faces data info offset lo
	EQUB &45                        ; Ship lines stack: 17 (4*max_visible_edges+1)
	EQUB &28                        ; Gun vertex: 10 (vertex*4)
	EQUB &1A                        ; Explosion count: 5 (4*n+6)
	EQUB &42                        ; Vertices: 11 (n*6)
	EQUB &12                        ; Edges: 18
	EQUW &014B                      ; Bounty: 7.5 Cr
	EQUB &28                        ; Faces: 10 (n*4)
	EQUB &13                        ; Dot beyond distance: 19
	EQUB &5A                        ; Hull strength: 90
	EQUB &1A                        ; Maximum speed: 0.26 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &12                        ; 00010...: Laser class 2
	                                ; .....010: 2 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.cobra_mk1_vertices
	EQUB &12, &01, &32, &DF, &01, &23
	EQUB &12, &01, &32, &5F, &01, &45
	EQUB &42, &00, &07, &9F, &23, &88
	EQUB &42, &00, &07, &1F, &45, &99
	EQUB &20, &0C, &26, &BF, &26, &78
	EQUB &20, &0C, &26, &3F, &46, &79
	EQUB &36, &0C, &26, &FF, &13, &78
	EQUB &36, &0C, &26, &7F, &15, &79
	EQUB &00, &0C, &06, &34, &02, &46
	EQUB &00, &01, &32, &42, &01, &11
	EQUB &00, &01, &3C, &5F, &01, &11

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.cobra_mk1_edges
	EQUB &1F, &01, &04, &00
	EQUB &1F, &23, &00, &08
	EQUB &1F, &38, &08, &18
	EQUB &1F, &17, &18, &1C
	EQUB &1F, &59, &1C, &0C
	EQUB &1F, &45, &0C, &04
	EQUB &1F, &28, &08, &10
	EQUB &1F, &67, &10, &14
	EQUB &1F, &49, &14, &0C
	EQUB &14, &02, &00, &20
	EQUB &14, &04, &20, &04
	EQUB &10, &26, &10, &20
	EQUB &10, &46, &20, &14
	EQUB &1F, &78, &10, &18
	EQUB &1F, &79, &14, &1C
	EQUB &14, &13, &00, &18
	EQUB &14, &15, &04, &1C
	EQUB &02, &01, &28, &24

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.cobra_mk1_faces
	EQUB &1F, &00, &29, &0A
	EQUB &5F, &00, &1B, &03
	EQUB &9F, &08, &2E, &08
	EQUB &DF, &0C, &39, &0C
	EQUB &1F, &08, &2E, &08
	EQUB &5F, &0C, &39, &0C
	EQUB &1F, &00, &31, &00
	EQUB &3F, &00, &00, &9A
	EQUB &BF, &79, &6F, &3E
	EQUB &3F, &79, &6F, &3E

.cobra_mk1_end
