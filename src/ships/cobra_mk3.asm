; -----------------------------------------------------------------------------
; Elite - Cobra Mk3 ship data (type 11)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.ship_cobra_mk3_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
	EQUB &03                        ; High nibble: scoop info, low nibble: debris spin info
	EQUW &2341                      ; Area for missile lock
	EQUB &BC                        ; Edges data info offset lo
	EQUB &54                        ; Faces data info offset lo
	EQUB &99                        ; Ship lines stack  = 38 (4*maxlines+1)
	EQUB &54                        ; Gun vertex = 21 (vertex*4)
	EQUB &2A                        ; Explosion count = 9 (4*n+6)
	EQUB &A8                        ; 28 Vertices (n*6)
	EQUB &26                        ; 38 Edges
	EQUW &0000                      ; Bounty
	EQUB &34                        ; 13 Faces (n*4)
	EQUB &32                        ; Dot beyond distance
	EQUB &96                        ; Energy
	EQUB &1C                        ; Speed
	EQUB &00                        ; Edges data info offset hi
	EQUB &01                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &13                        ; %00010xxx Laser | %xxxxx011: 3 Missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.ship_cobra_mk3_vertices
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
.ship_cobra_mk3_edges
	EQUB &1F, &B0, &00, &04, &1F, &C4, &00, &10
	EQUB &1F, &A3, &04, &0C, &1F, &A7, &0C, &20
	EQUB &1F, &C8, &10, &1C, &1F, &98, &18, &1C
	EQUB &1F, &96, &18, &24, &1F, &95, &14, &24
	EQUB &1F, &97, &14, &20, &1F, &51, &08, &14
	EQUB &1F, &62, &08, &18, &1F, &73, &0C, &14
	EQUB &1F, &84, &10, &18, &1F, &10, &04, &08
	EQUB &1F, &20, &00, &08, &1F, &A9, &20, &28
	EQUB &1F, &B9, &28, &2C, &1F, &C9, &1C, &2C
	EQUB &1F, &BA, &04, &28, &1F, &CB, &00, &2C
	EQUB &1D, &31, &04, &14, &1D, &42, &00, &18
	EQUB &06, &B0, &50, &54, &14, &99, &30, &34
	EQUB &14, &99, &48, &4C, &14, &99, &38, &3C
	EQUB &14, &99, &40, &44, &13, &99, &3C, &40
	EQUB &11, &99, &38, &44, &13, &99, &34, &48
	EQUB &13, &99, &30, &4C, &1E, &65, &08, &24
	EQUB &06, &99, &58, &60, &06, &99, &5C, &60
	EQUB &08, &99, &58, &5C, &06, &99, &64, &68
	EQUB &06, &99, &68, &6C, &08, &99, &64, &6C

; -----------------------------------------------------------------------------
; Faces data
; -----------------------------------------------------------------------------
.ship_cobra_mk3_faces
	EQUB &1F, &00, &3E, &1F, &9F, &12, &37, &10 ; start normals #0 = top front plate of Cobra Mk III
	EQUB &1F, &12, &37, &10, &9F, &10, &34, &0E
	EQUB &1F, &10, &34, &0E, &9F, &0E, &2F, &00
	EQUB &1F, &0E, &2F, &00, &9F, &3D, &66, &00
	EQUB &1F, &3D, &66, &00, &3F, &00, &00, &50
	EQUB &DF, &07, &2A, &09, &5F, &00, &1E, &06
	EQUB &5F, &07, &2A, &09

.ship_cobra_mk3_end
