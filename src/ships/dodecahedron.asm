; -----------------------------------------------------------------------------
; Elite - Dodecahedron spacestation data (type &02)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.dodecahedron_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.spacestation_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &7E90                      ; Area for missile lock
	EQUB &A4                        ; Edges data info offset lo
	EQUB &2C                        ; Faces data info offset lo
	EQUB &61                        ; Ship lines stack: 24 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &36                        ; Explosion count: 12 (4*n+6)
	EQUB &90                        ; Vertices: 24 (n*6)
	EQUB &22                        ; Edges: 34
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &30                        ; Faces: 12 (n*4)
	EQUB &7D                        ; Dot beyond distance: 125
	EQUB &F0                        ; Hull strength: 240
	EQUB &00                        ; Maximum speed: 0.00 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &01                        ; Faces data info offset hi
	EQUB &00                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.dodecahedron_vertices
	EQUB &00, &96, &C4, &1F, &01, &55
	EQUB &8F, &2E, &C4, &1F, &01, &22
	EQUB &58, &79, &C4, &5F, &02, &33
	EQUB &58, &79, &C4, &DF, &03, &44
	EQUB &8F, &2E, &C4, &9F, &04, &55
	EQUB &00, &F3, &2E, &1F, &15, &66
	EQUB &E7, &4B, &2E, &1F, &12, &77
	EQUB &8F, &C4, &2E, &5F, &23, &88
	EQUB &8F, &C4, &2E, &DF, &34, &99
	EQUB &E7, &4B, &2E, &9F, &45, &AA
	EQUB &8F, &C4, &2E, &3F, &16, &77
	EQUB &E7, &4B, &2E, &7F, &27, &88
	EQUB &00, &F3, &2E, &7F, &38, &99
	EQUB &E7, &4B, &2E, &FF, &49, &AA
	EQUB &8F, &C4, &2E, &BF, &56, &AA
	EQUB &58, &79, &C4, &3F, &67, &BB
	EQUB &8F, &2E, &C4, &7F, &78, &BB
	EQUB &00, &96, &C4, &7F, &89, &BB
	EQUB &8F, &2E, &C4, &FF, &9A, &BB
	EQUB &58, &79, &C4, &BF, &6A, &BB
	EQUB &10, &20, &C4, &9E, &00, &00
	EQUB &10, &20, &C4, &DE, &00, &00
	EQUB &10, &20, &C4, &17, &00, &00
	EQUB &10, &20, &C4, &57, &00, &00

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.dodecahedron_edges
	EQUB &1F, &01, &00, &04
	EQUB &1F, &02, &04, &08
	EQUB &1F, &03, &08, &0C
	EQUB &1F, &04, &0C, &10
	EQUB &1F, &05, &10, &00
	EQUB &1F, &16, &14, &28
	EQUB &1F, &17, &28, &18
	EQUB &1F, &27, &18, &2C
	EQUB &1F, &28, &2C, &1C
	EQUB &1F, &38, &1C, &30
	EQUB &1F, &39, &30, &20
	EQUB &1F, &49, &20, &34
	EQUB &1F, &4A, &34, &24
	EQUB &1F, &5A, &24, &38
	EQUB &1F, &56, &38, &14
	EQUB &1F, &7B, &3C, &40
	EQUB &1F, &8B, &40, &44
	EQUB &1F, &9B, &44, &48
	EQUB &1F, &AB, &48, &4C
	EQUB &1F, &6B, &4C, &3C
	EQUB &1F, &15, &00, &14
	EQUB &1F, &12, &04, &18
	EQUB &1F, &23, &08, &1C
	EQUB &1F, &34, &0C, &20
	EQUB &1F, &45, &10, &24
	EQUB &1F, &67, &28, &3C
	EQUB &1F, &78, &2C, &40
	EQUB &1F, &89, &30, &44
	EQUB &1F, &9A, &34, &48
	EQUB &1F, &6A, &38, &4C
	EQUB &1E, &00, &50, &54
	EQUB &14, &00, &54, &5C
	EQUB &17, &00, &5C, &58
	EQUB &14, &00, &58, &50

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.dodecahedron_faces
	EQUB &1F, &00, &00, &C4
	EQUB &1F, &67, &8E, &58
	EQUB &5F, &A9, &37, &59
	EQUB &5F, &00, &B0, &58
	EQUB &DF, &A9, &37, &59
	EQUB &9F, &67, &8E, &58
	EQUB &3F, &00, &B0, &58
	EQUB &3F, &A9, &37, &59
	EQUB &7F, &67, &8E, &58
	EQUB &FF, &67, &8E, &58
	EQUB &BF, &A9, &37, &59
	EQUB &3F, &00, &00, &C4

.dodecahedron_end
