; -----------------------------------------------------------------------------
; Elite - Splinter data (type &08)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

splinter_attr = %00000000               ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.splinter_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.splinter_header
	EQUB &B0                        ; 1011....: cargo type if scooped: platinum
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0100                      ; Area for missile lock
	EQUB &5A                        ; Edges data info offset lo
	EQUB &44                        ; Faces data info offset lo
	EQUB &19                        ; Ship lines stack: 6 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &16                        ; Explosion count: 4 (4*n+6)
	EQUB &18                        ; Vertices: 4 (n*6)
	EQUB &06                        ; Edges: 6
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &10                        ; Faces: 4 (n*4)
	EQUB &08                        ; Dot beyond distance: 8
	EQUB &14                        ; Hull strength: 20
	EQUB &0A                        ; Maximum speed: 0.10 LM
	EQUB &FE                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &05                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.splinter_vertices
	EQUB &18, &19, &10, &DF, &12, &33
	EQUB &00, &0C, &0A, &3F, &02, &33
	EQUB &0B, &06, &02, &5F, &01, &33
	EQUB &0C, &2A, &07, &1F, &01, &22

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.splinter_edges
	EQUB &1F, &23, &00, &04
	EQUB &1F, &03, &04, &08
	EQUB &1F, &01, &08, &0C
	EQUB &1F, &12, &0C, &00
	EQUB &03, &41, &23, &BC
	EQUB &54, &99, &54, &2A

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.splinter_faces
	EQUB &A8, &26, &00, &00
	EQUB &34, &32, &96, &1C
	EQUB &00, &01, &01, &13
	EQUB &20, &00, &4C, &1F

.splinter_end
