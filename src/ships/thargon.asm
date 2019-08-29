; -----------------------------------------------------------------------------
; Elite - Thargon data (type &1E)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

thargon_attr = %00000100                ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.thargon_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.thargon_header
	EQUB &F0                        ; 1111....: cargo type if scooped: --none--
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0640                      ; Area for missile lock
	EQUB &94                        ; Edges data info offset lo
	EQUB &50                        ; Faces data info offset lo
	EQUB &41                        ; Ship lines stack: 16 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &12                        ; Explosion count: 3 (4*n+6)
	EQUB &3C                        ; Vertices: 10 (n*6)
	EQUB &0F                        ; Edges: 15
	EQUW &0132                      ; Bounty: 5.0 Cr
	EQUB &1C                        ; Faces: 7 (n*4)
	EQUB &14                        ; Dot beyond distance: 20
	EQUB &14                        ; Hull strength: 20
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &F8                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; 00010...: Laser class 2
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.thargon_vertices
	EQUB &09, &00, &28, &9F, &01, &55
	EQUB &09, &26, &0C, &DF, &01, &22
	EQUB &09, &18, &20, &FF, &02, &33
	EQUB &09, &18, &20, &BF, &03, &44
	EQUB &09, &26, &0C, &9F, &04, &55
	EQUB &09, &00, &08, &3F, &15, &66
	EQUB &09, &0A, &0F, &7F, &12, &66
	EQUB &09, &06, &1A, &7F, &23, &66
	EQUB &09, &06, &1A, &3F, &34, &66
	EQUB &09, &0A, &0F, &3F, &45, &66

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.thargon_edges
	EQUB &9F, &24, &00, &00
	EQUB &5F, &14, &05, &07
	EQUB &7F, &2E, &2A, &0E
	EQUB &3F, &24, &00, &68
	EQUB &3F, &2E, &2A, &0E
	EQUB &1F, &14, &05, &07
	EQUB &1F, &24, &00, &00
	EQUB &00, &00, &00, &00
	EQUB &00, &00, &00, &00
	EQUB &00, &00, &00, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.thargon_faces
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF
	EQUB &FF, &FF, &FF, &FF

.thargon_end
