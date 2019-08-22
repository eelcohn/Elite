; -----------------------------------------------------------------------------
; Elite - Coriolis spacestation data (type &02)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.spacestation_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.spacestation_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &6400                      ; Area for missile lock
	EQUB &74                        ; Edges data info offset lo
	EQUB &E4                        ; Faces data info offset lo
	EQUB &55                        ; Ship lines stack: 21 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &36                        ; Explosion count: 12 (4*n+6)
	EQUB &60                        ; Vertices: 16 (n*6)
	EQUB &1C                        ; Edges: 28
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &38                        ; Faces: 14 (n*4)
	EQUB &78                        ; Dot beyond distance: 120
	EQUB &F0                        ; Hull strength: 240
	EQUB &00                        ; Maximum speed: 0.00 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &00                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &06                        ; 00000...: Laser class 0
	                                ; .....110: 6 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.spacestation_vertices
	EQUB &A0, &00, &A0, &1F, &10, &62
	EQUB &00, &A0, &A0, &1F, &20, &83
	EQUB &A0, &00, &A0, &9F, &30, &74
	EQUB &00, &A0, &A0, &5F, &10, &54
	EQUB &A0, &A0, &00, &5F, &51, &A6
	EQUB &A0, &A0, &00, &1F, &62, &B8
	EQUB &A0, &A0, &00, &9F, &73, &C8
	EQUB &A0, &A0, &00, &DF, &54, &97
	EQUB &A0, &00, &A0, &3F, &A6, &DB
	EQUB &00, &A0, &A0, &3F, &B8, &DC
	EQUB &A0, &00, &A0, &BF, &97, &DC
	EQUB &00, &A0, &A0, &7F, &95, &DA
	EQUB &0A, &1E, &A0, &5E, &00, &00
	EQUB &0A, &1E, &A0, &1E, &00, &00
	EQUB &0A, &1E, &A0, &9E, &00, &00
	EQUB &0A, &1E, &A0, &DE, &00, &00

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.spacestation_edges
	EQUB &1F, &10, &00, &0C
	EQUB &1F, &20, &00, &04
	EQUB &1F, &30, &04, &08
	EQUB &1F, &40, &08, &0C
	EQUB &1F, &51, &0C, &10
	EQUB &1F, &61, &00, &10
	EQUB &1F, &62, &00, &14
	EQUB &1F, &82, &14, &04
	EQUB &1F, &83, &04, &18
	EQUB &1F, &73, &08, &18
	EQUB &1F, &74, &08, &1C
	EQUB &1F, &54, &0C, &1C
	EQUB &1F, &DA, &20, &2C
	EQUB &1F, &DB, &20, &24
	EQUB &1F, &DC, &24, &28
	EQUB &1F, &D9, &28, &2C
	EQUB &1F, &A5, &10, &2C
	EQUB &1F, &A6, &10, &20
	EQUB &1F, &B6, &14, &20
	EQUB &1F, &B8, &14, &24
	EQUB &1F, &C8, &18, &24
	EQUB &1F, &C7, &18, &28
	EQUB &1F, &97, &1C, &28
	EQUB &1F, &95, &1C, &2C
	EQUB &1E, &00, &30, &34
	EQUB &1E, &00, &34, &38
	EQUB &1E, &00, &38, &3C
	EQUB &1E, &00, &3C, &30

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.spacestation_faces
	EQUB &1F, &00, &00, &A0
	EQUB &5F, &6B, &6B, &6B
	EQUB &1F, &6B, &6B, &6B
	EQUB &9F, &6B, &6B, &6B
	EQUB &DF, &6B, &6B, &6B
	EQUB &5F, &00, &A0, &00
	EQUB &1F, &A0, &00, &00
	EQUB &9F, &A0, &00, &00
	EQUB &1F, &00, &A0, &00
	EQUB &FF, &6B, &6B, &6B
	EQUB &7F, &6B, &6B, &6B
	EQUB &3F, &6B, &6B, &6B
	EQUB &BF, &6B, &6B, &6B
	EQUB &3F, &00, &00, &A0

.spacestation_end
