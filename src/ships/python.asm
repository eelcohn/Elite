; -----------------------------------------------------------------------------
; Elite - Python data (type &0C)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

python_attr = %10100000                 ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..1..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.python_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.python_header
	EQUB &05                        ; 0000....: cargo type if scooped: none
	                                ; ....0101: max pieces of debris if destroyed: 5
	EQUW &1900                      ; Area for missile lock
	EQUB &56                        ; Edges data info offset lo
	EQUB &BE                        ; Faces data info offset lo
	EQUB &55                        ; Ship lines stack: 21 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &2A                        ; Explosion count: 9 (4*n+6)
	EQUB &42                        ; Vertices: 11 (n*6)
	EQUB &1A                        ; Edges: 26
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &34                        ; Faces: 13 (n*4)
	EQUB &28                        ; Dot beyond distance: 40
	EQUB &FA                        ; Hull strength: 250
	EQUB &14                        ; Maximum speed: 0.20 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &00                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &1B                        ; 00011...: Laser class 3
	                                ; .....011: 3 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.python_vertices
	EQUB &00, &00, &E0, &1F, &10, &32
	EQUB &00, &30, &30, &1F, &10, &54
	EQUB &60, &00, &10, &3F, &FF, &FF
	EQUB &60, &00, &10, &BF, &FF, &FF
	EQUB &00, &30, &20, &3F, &54, &98
	EQUB &00, &18, &70, &3F, &89, &CC
	EQUB &30, &00, &70, &BF, &B8, &CC
	EQUB &30, &00, &70, &3F, &A9, &CC
	EQUB &00, &30, &30, &5F, &32, &76
	EQUB &00, &30, &20, &7F, &76, &BA
	EQUB &00, &18, &70, &7F, &BA, &CC

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.python_edges
	EQUB &1F, &32, &00, &20
	EQUB &1F, &20, &00, &0C
	EQUB &1F, &31, &00, &08
	EQUB &1F, &10, &00, &04
	EQUB &1F, &59, &08, &10
	EQUB &1F, &51, &04, &08
	EQUB &1F, &37, &08, &20
	EQUB &1F, &40, &04, &0C
	EQUB &1F, &62, &0C, &20
	EQUB &1F, &A7, &08, &24
	EQUB &1F, &84, &0C, &10
	EQUB &1F, &B6, &0C, &24
	EQUB &07, &88, &0C, &14
	EQUB &07, &BB, &0C, &28
	EQUB &07, &99, &08, &14
	EQUB &07, &AA, &08, &28
	EQUB &1F, &A9, &08, &1C
	EQUB &1F, &B8, &0C, &18
	EQUB &1F, &C8, &14, &18
	EQUB &1F, &C9, &14, &1C
	EQUB &1F, &AC, &1C, &28
	EQUB &1F, &CB, &18, &28
	EQUB &1F, &98, &10, &14
	EQUB &1F, &BA, &24, &28
	EQUB &1F, &54, &04, &10
	EQUB &1F, &76, &20, &24

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.python_faces
	EQUB &9F, &1B, &28, &0B
	EQUB &1F, &1B, &28, &0B
	EQUB &DF, &1B, &28, &0B
	EQUB &5F, &1B, &28, &0B
	EQUB &9F, &13, &26, &00
	EQUB &1F, &13, &26, &00
	EQUB &DF, &13, &26, &00
	EQUB &5F, &13, &26, &00
	EQUB &BF, &19, &25, &0B
	EQUB &3F, &19, &25, &0B
	EQUB &7F, &19, &25, &0B
	EQUB &FF, &19, &25, &0B
	EQUB &3F, &00, &00, &70

.python_end
