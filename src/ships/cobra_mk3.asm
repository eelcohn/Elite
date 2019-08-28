; -----------------------------------------------------------------------------
; Elite - Cobra MkIII data (type &0B)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

cobra_mk3_attr = %10100000              ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..1..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.cobra_mk3_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.cobra_mk3_header
	EQUB &03                        ; 0000....: cargo type if scooped: none
	                                ; ....0011: max pieces of debris if destroyed: 3
	EQUW &2341                      ; Area for missile lock
	EQUB &BC                        ; Edges data info offset lo
	EQUB &54                        ; Faces data info offset lo
	EQUB &99                        ; Ship lines stack: 38 (4*max_visible_edges+1)
	EQUB &54                        ; Gun vertex: 21 (vertex*4)
	EQUB &2A                        ; Explosion count: 9 (4*n+6)
	EQUB &A8                        ; Vertices: 28 (n*6)
	EQUB &26                        ; Edges: 38
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &34                        ; Faces: 13 (n*4)
	EQUB &32                        ; Dot beyond distance: 50
	EQUB &96                        ; Hull strength: 150
	EQUB &1C                        ; Maximum speed: 0.28 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &01                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &13                        ; 00010...: Laser class 2
	                                ; .....011: 3 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.cobra_mk3_vertices
	EQUB &20, &00, &4C, &1F, &FF, &FF
	EQUB &20, &00, &4C, &9F, &FF, &FF
	EQUB &00, &1A, &18, &1F, &FF, &FF
	EQUB &78, &03, &08, &FF, &73, &AA
	EQUB &78, &03, &08, &7F, &84, &CC
	EQUB &58, &10, &28, &BF, &FF, &FF
	EQUB &58, &10, &28, &3F, &FF, &FF
	EQUB &80, &08, &28, &7F, &98, &CC
	EQUB &80, &08, &28, &FF, &97, &AA
	EQUB &00, &1A, &28, &3F, &65, &99
	EQUB &20, &18, &28, &FF, &A9, &BB
	EQUB &20, &18, &28, &7F, &B9, &CC
	EQUB &24, &08, &28, &B4, &99, &99
	EQUB &08, &0C, &28, &B4, &99, &99
	EQUB &08, &0C, &28, &34, &99, &99
	EQUB &24, &08, &28, &34, &99, &99
	EQUB &24, &0C, &28, &74, &99, &99
	EQUB &08, &10, &28, &74, &99, &99
	EQUB &08, &10, &28, &F4, &99, &99
	EQUB &24, &0C, &28, &F4, &99, &99
	EQUB &00, &00, &4C, &06, &B0, &BB
	EQUB &00, &00, &5A, &1F, &B0, &BB
	EQUB &50, &06, &28, &E8, &99, &99
	EQUB &50, &06, &28, &A8, &99, &99
	EQUB &58, &00, &28, &A6, &99, &99
	EQUB &50, &06, &28, &28, &99, &99
	EQUB &58, &00, &28, &26, &99, &99
	EQUB &50, &06, &28, &68, &99, &99

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.cobra_mk3_edges
	EQUB &1F, &B0, &00, &04
	EQUB &1F, &C4, &00, &10
	EQUB &1F, &A3, &04, &0C
	EQUB &1F, &A7, &0C, &20
	EQUB &1F, &C8, &10, &1C
	EQUB &1F, &98, &18, &1C
	EQUB &1F, &96, &18, &24
	EQUB &1F, &95, &14, &24
	EQUB &1F, &97, &14, &20
	EQUB &1F, &51, &08, &14
	EQUB &1F, &62, &08, &18
	EQUB &1F, &73, &0C, &14
	EQUB &1F, &84, &10, &18
	EQUB &1F, &10, &04, &08
	EQUB &1F, &20, &00, &08
	EQUB &1F, &A9, &20, &28
	EQUB &1F, &B9, &28, &2C
	EQUB &1F, &C9, &1C, &2C
	EQUB &1F, &BA, &04, &28
	EQUB &1F, &CB, &00, &2C
	EQUB &1D, &31, &04, &14
	EQUB &1D, &42, &00, &18
	EQUB &06, &B0, &50, &54
	EQUB &14, &99, &30, &34
	EQUB &14, &99, &48, &4C
	EQUB &14, &99, &38, &3C
	EQUB &14, &99, &40, &44
	EQUB &13, &99, &3C, &40
	EQUB &11, &99, &38, &44
	EQUB &13, &99, &34, &48
	EQUB &13, &99, &30, &4C
	EQUB &1E, &65, &08, &24
	EQUB &06, &99, &58, &60
	EQUB &06, &99, &5C, &60
	EQUB &08, &99, &58, &5C
	EQUB &06, &99, &64, &68
	EQUB &06, &99, &68, &6C
	EQUB &08, &99, &64, &6C

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.cobra_mk3_faces
	EQUB &1F, &00, &3E, &1F
	EQUB &9F, &12, &37, &10
	EQUB &1F, &12, &37, &10
	EQUB &9F, &10, &34, &0E
	EQUB &1F, &10, &34, &0E
	EQUB &9F, &0E, &2F, &00
	EQUB &1F, &0E, &2F, &00
	EQUB &9F, &3D, &66, &00
	EQUB &1F, &3D, &66, &00
	EQUB &3F, &00, &00, &50
	EQUB &DF, &07, &2A, &09
	EQUB &5F, &00, &1E, &06
	EQUB &5F, &07, &2A, &09

.cobra_mk3_end
