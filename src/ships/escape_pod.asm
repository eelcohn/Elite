; -----------------------------------------------------------------------------
; Elite - Escape pod data (type &03)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

escape_pod_attr = %00000001             ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......1 bit 0: Ship is a trader

.escape_pod_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.escape_pod_header
	EQUB &20                        ; 0010....: cargo type if scooped: slaves
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0100                      ; Area for missile lock
	EQUB &2C                        ; Edges data info offset lo
	EQUB &44                        ; Faces data info offset lo
	EQUB &19                        ; Ship lines stack: 6 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &16                        ; Explosion count: 4 (4*n+6)
	EQUB &18                        ; Vertices: 4 (n*6)
	EQUB &06                        ; Edges: 6
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &10                        ; Faces: 4 (n*4)
	EQUB &08                        ; Dot beyond distance: 8
	EQUB &11                        ; Hull strength: 17
	EQUB &08                        ; Maximum speed: 0.08 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &04                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.escape_pod_vertices
	EQUB &07, &00, &24, &9F, &12, &33
	EQUB &07, &0E, &0C, &FF, &02, &33
	EQUB &07, &0E, &0C, &BF, &01, &33
	EQUB &15, &00, &00, &1F, &01, &22

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.escape_pod_edges
	EQUB &1F, &23, &00, &04
	EQUB &1F, &03, &04, &08
	EQUB &1F, &01, &08, &0C
	EQUB &1F, &12, &0C, &00
	EQUB &1F, &13, &00, &08
	EQUB &1F, &02, &0C, &04

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.escape_pod_faces
	EQUB &3F, &34, &00, &7A
	EQUB &1F, &27, &67, &1E
	EQUB &5F, &27, &67, &1E
	EQUB &9F, &70, &00, &00

.escape_pod_end
