; -----------------------------------------------------------------------------
; Elite - fer-de-lance data (type &1B)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.fer-de-lance_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.fer-de-lance_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0640                      ; Area for missile lock
	EQUB &86                        ; Edges data info offset lo
	EQUB &F2                        ; Faces data info offset lo
	EQUB &69                        ; Ship lines stack: 26 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &1A                        ; Explosion count: 5 (4*n+6)
	EQUB &72                        ; Vertices: 19 (n*6)
	EQUB &1B                        ; Edges: 27
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &28                        ; Faces: 10 (n*4)
	EQUB &28                        ; Dot beyond distance: 40
	EQUB &A0                        ; Hull strength: 160
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &12                        ; 00010...: Laser class 2
	                                ; .....010: 2 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.fer-de-lance_vertices
	EQUB &00, &0E, &6C, &5F, &01, &59
	EQUB &28, &0E, &04, &FF, &12, &99
	EQUB &0C, &0E, &34, &FF, &23, &99
	EQUB &0C, &0E, &34, &7F, &34, &99
	EQUB &28, &0E, &04, &7F, &45, &99
	EQUB &28, &0E, &04, &BC, &01, &26
	EQUB &0C, &02, &34, &BC, &23, &67
	EQUB &0C, &02, &34, &3C, &34, &78
	EQUB &28, &0E, &04, &3C, &04, &58
	EQUB &00, &12, &14, &2F, &06, &78
	EQUB &03, &0B, &61, &CB, &00, &00
	EQUB &1A, &08, &12, &89, &00, &00
	EQUB &10, &0E, &04, &AB, &00, &00
	EQUB &03, &0B, &61, &4B, &00, &00
	EQUB &1A, &08, &12, &09, &00, &00
	EQUB &10, &0E, &04, &2B, &00, &00
	EQUB &00, &0E, &14, &6C, &99, &99
	EQUB &0E, &0E, &2C, &CC, &99, &99
	EQUB &0E, &0E, &2C, &4C, &99, &99

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.fer-de-lance_edges
	EQUB &1F, &19, &00, &04
	EQUB &1F, &29, &04, &08
	EQUB &1F, &39, &08, &0C
	EQUB &1F, &49, &0C, &10
	EQUB &1F, &59, &00, &10
	EQUB &1C, &01, &00, &14
	EQUB &1C, &26, &14, &18
	EQUB &1C, &37, &18, &1C
	EQUB &1C, &48, &1C, &20
	EQUB &1C, &05, &00, &20
	EQUB &0F, &06, &14, &24
	EQUB &0B, &67, &18, &24
	EQUB &0B, &78, &1C, &24
	EQUB &0F, &08, &20, &24
	EQUB &0E, &12, &04, &14
	EQUB &0E, &23, &08, &18
	EQUB &0E, &34, &0C, &1C
	EQUB &0E, &45, &10, &20
	EQUB &08, &00, &28, &2C
	EQUB &09, &00, &2C, &30
	EQUB &0B, &00, &28, &30
	EQUB &08, &00, &34, &38
	EQUB &09, &00, &38, &3C
	EQUB &0B, &00, &34, &3C
	EQUB &0C, &99, &40, &44
	EQUB &0C, &99, &40, &48
	EQUB &08, &99, &44, &48

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.fer-de-lance_faces
	EQUB &1C, &00, &18, &06
	EQUB &9F, &44, &00, &18
	EQUB &BF, &3F, &00, &25
	EQUB &3F, &00, &00, &68
	EQUB &3F, &3F, &00, &25
	EQUB &1F, &44, &00, &18
	EQUB &BC, &0C, &2E, &13
	EQUB &3C, &00, &2D, &16
	EQUB &3C, &0C, &2E, &13
	EQUB &5F, &00, &1C, &00

.fer-de-lance_end
