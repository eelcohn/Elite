; -----------------------------------------------------------------------------
; Elite - Gecko data (type &15)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

gecko_attr = %00001100                  ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.gecko_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.gecko_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &2649                      ; Area for missile lock
	EQUB &5C                        ; Edges data info offset lo
	EQUB &A0                        ; Faces data info offset lo
	EQUB &41                        ; Ship lines stack: 16 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &1A                        ; Explosion count: 5 (4*n+6)
	EQUB &48                        ; Vertices: 12 (n*6)
	EQUB &11                        ; Edges: 17
	EQUW &0137                      ; Bounty: 5.5 Cr
	EQUB &24                        ; Faces: 9 (n*4)
	EQUB &12                        ; Dot beyond distance: 18
	EQUB &46                        ; Hull strength: 70
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &03                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; 00010...: Laser class 2
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.gecko_vertices
	EQUB &0A, &04, &2F, &DF, &03, &45
	EQUB &0A, &04, &2F, &5F, &01, &23
	EQUB &10, &08, &17, &BF, &05, &67
	EQUB &10, &08, &17, &3F, &01, &78
	EQUB &42, &00, &03, &BF, &45, &66
	EQUB &42, &00, &03, &3F, &12, &88
	EQUB &14, &0E, &17, &FF, &34, &67
	EQUB &14, &0E, &17, &7F, &23, &78
	EQUB &08, &06, &21, &D0, &33, &33
	EQUB &08, &06, &21, &51, &33, &33
	EQUB &08, &0D, &10, &F0, &33, &33
	EQUB &08, &0D, &10, &71, &33, &33

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.gecko_edges
	EQUB &1F, &03, &00, &04
	EQUB &1F, &12, &04, &14
	EQUB &1F, &18, &14, &0C
	EQUB &1F, &07, &0C, &08
	EQUB &1F, &56, &08, &10
	EQUB &1F, &45, &10, &00
	EQUB &1F, &28, &14, &1C
	EQUB &1F, &37, &1C, &18
	EQUB &1F, &46, &18, &10
	EQUB &1D, &05, &00, &08
	EQUB &1E, &01, &04, &0C
	EQUB &1D, &34, &00, &18
	EQUB &1E, &23, &04, &1C
	EQUB &14, &67, &08, &18
	EQUB &14, &78, &0C, &1C
	EQUB &10, &33, &20, &28
	EQUB &11, &33, &24, &2C

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.gecko_faces
	EQUB &1F, &00, &1F, &05
	EQUB &1F, &04, &2D, &08
	EQUB &5F, &19, &6C, &13
	EQUB &5F, &00, &54, &0C
	EQUB &DF, &19, &6C, &13
	EQUB &9F, &04, &2D, &08
	EQUB &BF, &58, &10, &D6
	EQUB &3F, &00, &00, &BB
	EQUB &3F, &58, &10, &D6

.gecko_end
