; -----------------------------------------------------------------------------
; Elite - Sidewinder data (type &11)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

sidewinder_attr = %00001100             ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.sidewinder_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.sidewinder_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &1081                      ; Area for missile lock
	EQUB &50                        ; Edges data info offset lo
	EQUB &8C                        ; Faces data info offset lo
	EQUB &3D                        ; Ship lines stack: 15 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &1E                        ; Explosion count: 6 (4*n+6)
	EQUB &3C                        ; Vertices: 10 (n*6)
	EQUB &0F                        ; Edges: 15
	EQUW &0132                      ; Bounty: 5.0 Cr
	EQUB &1C                        ; Faces: 7 (n*4)
	EQUB &14                        ; Dot beyond distance: 20
	EQUB &46                        ; Hull strength: 70
	EQUB &25                        ; Maximum speed: 0.37 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; 00010...: Laser class 2
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.sidewinder_vertices
	EQUB &20, &00, &24, &9F, &10, &54
	EQUB &20, &00, &24, &1F, &20, &65
	EQUB &40, &00, &1C, &3F, &32, &66
	EQUB &40, &00, &1C, &BF, &31, &44
	EQUB &00, &10, &1C, &3F, &10, &32
	EQUB &00, &10, &1C, &7F, &43, &65
	EQUB &0C, &06, &1C, &AF, &33, &33
	EQUB &0C, &06, &1C, &2F, &33, &33
	EQUB &0C, &06, &1C, &6C, &33, &33
	EQUB &0C, &06, &1C, &EC, &33, &33

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.sidewinder_edges
	EQUB &1F, &50, &00, &04
	EQUB &1F, &62, &04, &08
	EQUB &1F, &20, &04, &10
	EQUB &1F, &10, &00, &10
	EQUB &1F, &41, &00, &0C
	EQUB &1F, &31, &0C, &10
	EQUB &1F, &32, &08, &10
	EQUB &1F, &43, &0C, &14
	EQUB &1F, &63, &08, &14
	EQUB &1F, &65, &04, &14
	EQUB &1F, &54, &00, &14
	EQUB &0F, &33, &18, &1C
	EQUB &0C, &33, &1C, &20
	EQUB &0C, &33, &18, &24
	EQUB &0C, &33, &20, &24

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.sidewinder_faces
	EQUB &1F, &00, &20, &08
	EQUB &9F, &0C, &2F, &06
	EQUB &1F, &0C, &2F, &06
	EQUB &3F, &00, &00, &70
	EQUB &DF, &0C, &2F, &06
	EQUB &5F, &00, &20, &08
	EQUB &5F, &0C, &2F, &06

.sidewinder_end
