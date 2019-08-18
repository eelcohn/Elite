; -----------------------------------------------------------------------------
; Elite - Shuttle ship data (type 9)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.ship_shuttle_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
	EQUB &0F                        ; High nibble: scoop info, low nibble: debris spin info
	EQUW &09C4                      ; Area for missile lock
	EQUB &86                        ; Edges data info offset lo
	EQUB &FE                        ; Faces data info offset lo
	EQUB &6D                        ; Ship lines stack = 27 (4*maxlines+1)
	EQUB &00                        ; Gun vertex = 0 (vertex*4)
	EQUB &26                        ; Explosion count = 8 (4*n+6)
	EQUB &72                        ; 19 Vertices (n*6)
	EQUB &1E                        ; 30 Edges
	EQUW &0000                      ; Bounty
	EQUB &34                        ; 13 Faces (n*4)
	EQUB &16                        ; Dot beyond distance
	EQUB &20                        ; Energy
	EQUB &08                        ; Speed
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; %00000xxx No lasers | %xxxxx000: No missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.ship_shuttle_vertices
	EQUB &00, &23, &2F, &5F, &FF, &FF
	EQUB &23, &00, &2F, &9F, &FF, &FF
	EQUB &00, &23, &2F, &1F, &FF, &FF
	EQUB &23, &00, &2F, &1F, &FF, &FF
	EQUB &28, &28, &35, &FF, &12, &39
	EQUB &28, &28, &35, &BF, &34, &59
	EQUB &28, &28, &35, &3F, &56, &79
	EQUB &28, &28, &35, &7F, &17, &89
	EQUB &0A, &00, &35, &30, &99, &99
	EQUB &00, &05, &35, &70, &99, &99
	EQUB &0A, &00, &35, &A8, &99, &99
	EQUB &00, &05, &35, &28, &99, &99
	EQUB &00, &11, &47, &50, &0A, &BC
	EQUB &05, &02, &3D, &46, &FF, &02
	EQUB &07, &17, &31, &07, &01, &F4
	EQUB &15, &09, &31, &07, &A1, &3F
	EQUB &05, &02, &3D, &C6, &6B, &23
	EQUB &07, &17, &31, &87, &F8, &C0
	EQUB &15, &09, &31, &87, &4F, &18

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.ship_shuttle_edges
	EQUB &1F, &02, &00, &04
	EQUB &1F, &4A, &04, &08
	EQUB &1F, &6B, &08, &0C
	EQUB &1F, &8C, &00, &0C
	EQUB &1F, &18, &00, &1C
	EQUB &18, &12, &00, &10
	EQUB &1F, &23, &04, &10
	EQUB &18, &34, &04, &14
	EQUB &1F, &45, &08, &14
	EQUB &0C, &56, &08, &18
	EQUB &1F, &67, &0C, &18
	EQUB &18, &78, &0C, &1C
	EQUB &1F, &39, &10, &14
	EQUB &1F, &59, &14, &18
	EQUB &1F, &79, &18, &1C
	EQUB &1F, &19, &10, &1C
	EQUB &10, &0C, &00, &30
	EQUB &10, &0A, &04, &30
	EQUB &10, &AB, &08, &30
	EQUB &10, &BC, &0C, &30
	EQUB &10, &99, &20, &24
	EQUB &06, &99, &24, &28
	EQUB &08, &99, &28, &2C
	EQUB &06, &99, &20, &2C
	EQUB &04, &BB, &34, &38
	EQUB &07, &BB, &38, &3C
	EQUB &06, &BB, &34, &3C
	EQUB &04, &AA, &40, &44
	EQUB &07, &AA, &44, &48
	EQUB &06, &AA, &40, &48

; -----------------------------------------------------------------------------
; Faces data
; -----------------------------------------------------------------------------
.ship_shuttle_faces
	EQUB &DF, &6E, &6E, &50
	EQUB &5F, &00, &95, &07
	EQUB &DF, &66, &66, &2E
	EQUB &9F, &95, &00, &07
	EQUB &9F, &66, &66, &2E
	EQUB &1F, &00, &95, &07
	EQUB &1F, &66, &66, &2E
	EQUB &1F, &95, &00, &07
	EQUB &5F, &66, &66, &2E
	EQUB &3F, &00, &00, &D5
	EQUB &9F, &51, &51, &B1
	EQUB &1F, &51, &51, &B1
	EQUB &5F, &6E, &6E, &50

.ship_shuttle_end
