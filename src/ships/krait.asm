; -----------------------------------------------------------------------------
; Elite - Krait ship data (type 19)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.ship_krait_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
	EQUB &01                        ; High nibble: scoop info, low nibble: debris spin info
	EQUW &0E10                      ; Area for missile lock
	EQUB &7A                        ; Edges data info offset lo
	EQUB &CE                        ; Faces data info offset lo
	EQUB &55                        ; Ship lines stack = 21 (4*maxlines+1)
	EQUB &00                        ; Gun vertex = 0 (vertex*4)
	EQUB &12                        ; Explosion count = 3 (4*n+6)
	EQUB &66                        ; 17 Vertices (n*6)
	EQUB &15                        ; 21 Edges
	EQUW &0064                      ; Bounty
	EQUB &18                        ; 6 Faces (n*4)
	EQUB &14                        ; Dot beyond distance
	EQUB &50                        ; Energy
	EQUB &1E                        ; Speed
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; %00010xxx Laser | %xxxxx000: No missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.ship_krait_vertices
	EQUB &00, &00, &60, &1F, &01, &23
	EQUB &00, &12, &30, &3F, &03, &45
	EQUB &00, &12, &30, &7F, &12, &45
	EQUB &5A, &00, &03, &3F, &01, &44
	EQUB &5A, &00, &03, &BF, &23, &55
	EQUB &5A, &00, &57, &1C, &01, &11
	EQUB &5A, &00, &57, &9C, &23, &33
	EQUB &00, &05, &35, &09, &00, &33
	EQUB &00, &07, &26, &06, &00, &33
	EQUB &12, &07, &13, &89, &33, &33
	EQUB &12, &07, &13, &09, &00, &00
	EQUB &12, &0B, &27, &28, &44, &44
	EQUB &12, &0B, &27, &68, &44, &44
	EQUB &24, &00, &1E, &28, &44, &44
	EQUB &12, &0B, &27, &A8, &55, &55
	EQUB &12, &0B, &27, &E8, &55, &55
	EQUB &24, &00, &1E, &A8, &55, &55

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.ship_krait_edges
	EQUB &1F, &03, &00, &04, &1F, &12, &00, &08
	EQUB &1F, &01, &00, &0C, &1F, &23, &00, &10
	EQUB &1F, &35, &04, &10, &1F, &25, &10, &08
	EQUB &1F, &14, &08, &0C, &1F, &04, &0C, &04
	EQUB &1C, &01, &0C, &14, &1C, &23, &10, &18
	EQUB &05, &45, &04, &08, &09, &00, &1C, &28
	EQUB &06, &00, &20, &28, &09, &33, &1C, &24
	EQUB &06, &33, &20, &24, &08, &44, &2C, &34
	EQUB &08, &44, &34, &30, &07, &44, &30, &2C
	EQUB &07, &55, &38, &3C, &08, &55, &3C, &40
	EQUB &08, &55, &40, &38

; -----------------------------------------------------------------------------
; Faces data
; -----------------------------------------------------------------------------
.ship_krait_faces
	EQUB &1F, &07, &30, &06, &5F, &07, &30, &06
	EQUB &DF, &07, &30, &06, &9F, &07, &30, &06
	EQUB &3F, &4D, &00, &9A, &BF, &4D, &00, &9A

.ship_krait_end
