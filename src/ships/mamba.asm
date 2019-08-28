; -----------------------------------------------------------------------------
; Elite - Mamba data (type &12)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

mamba_attr = %10001100                  ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.mamba_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.mamba_header
	EQUB &01                        ; 0000....: cargo type if scooped: none
	                                ; ....0001: max pieces of debris if destroyed: 1
	EQUW &1324                      ; Area for missile lock
	EQUB &AA                        ; Edges data info offset lo
	EQUB &1A                        ; Faces data info offset lo
	EQUB &5D                        ; Ship lines stack: 23 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &22                        ; Explosion count: 7 (4*n+6)
	EQUB &96                        ; Vertices: 25 (n*6)
	EQUB &1C                        ; Edges: 28
	EQUW &0196                      ; Bounty: 15.0 Cr
	EQUB &14                        ; Faces: 5 (n*4)
	EQUB &19                        ; Dot beyond distance: 25
	EQUB &5A                        ; Hull strength: 90
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &01                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &12                        ; 00010...: Laser class 2
	                                ; .....010: 2 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.mamba_vertices
	EQUB &00, &00, &40, &1F, &10, &32
	EQUB &40, &08, &20, &FF, &20, &44
	EQUB &20, &08, &20, &BE, &21, &44
	EQUB &20, &08, &20, &3E, &31, &44
	EQUB &40, &08, &20, &7F, &30, &44
	EQUB &04, &04, &10, &8E, &11, &11
	EQUB &04, &04, &10, &0E, &11, &11
	EQUB &08, &03, &1C, &0D, &11, &11
	EQUB &08, &03, &1C, &8D, &11, &11
	EQUB &14, &04, &10, &D4, &00, &00
	EQUB &14, &04, &10, &54, &00, &00
	EQUB &18, &07, &14, &F4, &00, &00
	EQUB &10, &07, &14, &F0, &00, &00
	EQUB &10, &07, &14, &70, &00, &00
	EQUB &18, &07, &14, &74, &00, &00
	EQUB &08, &04, &20, &AD, &44, &44
	EQUB &08, &04, &20, &2D, &44, &44
	EQUB &08, &04, &20, &6E, &44, &44
	EQUB &08, &04, &20, &EE, &44, &44
	EQUB &20, &04, &20, &A7, &44, &44
	EQUB &20, &04, &20, &27, &44, &44
	EQUB &24, &04, &20, &67, &44, &44
	EQUB &24, &04, &20, &E7, &44, &44
	EQUB &26, &00, &20, &A5, &44, &44
	EQUB &26, &00, &20, &25, &44, &44

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.mamba_edges
	EQUB &1F, &20, &00, &04
	EQUB &1F, &30, &00, &10
	EQUB &1F, &40, &04, &10
	EQUB &1E, &42, &04, &08
	EQUB &1E, &41, &08, &0C
	EQUB &1E, &43, &0C, &10
	EQUB &0E, &11, &14, &18
	EQUB &0C, &11, &18, &1C
	EQUB &0D, &11, &1C, &20
	EQUB &0C, &11, &14, &20
	EQUB &14, &00, &24, &2C
	EQUB &10, &00, &24, &30
	EQUB &10, &00, &28, &34
	EQUB &14, &00, &28, &38
	EQUB &0E, &00, &34, &38
	EQUB &0E, &00, &2C, &30
	EQUB &0D, &44, &3C, &40
	EQUB &0E, &44, &44, &48
	EQUB &0C, &44, &3C, &48
	EQUB &0C, &44, &40, &44
	EQUB &07, &44, &50, &54
	EQUB &05, &44, &50, &60
	EQUB &05, &44, &54, &60
	EQUB &07, &44, &4C, &58
	EQUB &05, &44, &4C, &5C
	EQUB &05, &44, &58, &5C
	EQUB &1E, &21, &00, &08
	EQUB &1E, &31, &00, &0C

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.mamba_faces
	EQUB &5E, &00, &18, &02
	EQUB &1E, &00, &18, &02
	EQUB &9E, &20, &40, &10
	EQUB &1E, &20, &40, &10
	EQUB &3E, &00, &00, &7F

.mamba_end
