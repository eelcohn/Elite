; -----------------------------------------------------------------------------
; Elite - Python ship data (type 12)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.ship_python_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
	EQUB &05                        ; High nibble: scoop info, low nibble: debris spin info
	EQUW &1900                      ; Area for missile lock
	EQUB &56                        ; Edges data info offset lo
	EQUB &BE                        ; Faces data info offset lo
	EQUB &55                        ; Ship lines stack = 21 (4*maxlines+1)
	EQUB &00                        ; Gun vertex = 0 (vertex*4)
	EQUB &2A                        ; Explosion count = 9 (4*n+6)
	EQUB &42                        ; 11 Vertices (n*6)
	EQUB &1A                        ; 26 Edges
	EQUW &0000                      ; Bounty
	EQUB &34                        ; 13 Faces (n*4)
	EQUB &28                        ; Dot beyond distance
	EQUB &FA                        ; Energy
	EQUB &14                        ; Speed
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &00                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &1B                        ; %00011xxx Laser | %xxxxx011: 3 Missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
	EQUB &00, &00, &E0, &1F, &10, &32
	EQUB &00, &30, &30, &1E, &10, &54
	EQUB &60, &00, &10, &3F, &FF, &FF
	EQUB &60, &00, &10, &BF, &FF, &FF
	EQUB &00, &30, &20, &3E, &54, &98
	EQUB &00, &18, &70, &3F, &89, &CC
	EQUB &30, &00, &70, &BF, &B8, &CC
	EQUB &30, &00, &70, &3F, &A9, &CC
	EQUB &00, &30, &30, &5E, &32, &76
	EQUB &00, &30, &20, &7E, &76, &BA
	EQUB &00, &18, &70, &7E, &BA, &CC

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.ship_python_edges
	EQUB &1E, &32, &00, &20
	EQUB &1F, &20, &00, &0C
	EQUB &1F, &31, &00, &08
	EQUB &1E, &10, &00, &04
	EQUB &1D, &59, &08, &10
	EQUB &1D, &51, &04, &08
	EQUB &1D, &37, &08, &20
	EQUB &1D, &40, &04, &0C
	EQUB &1D, &62, &0C, &20
	EQUB &1D, &A7, &08, &24
	EQUB &1D, &84, &0C, &10
	EQUB &1D, &B6, &0C, &24
	EQUB &05, &88, &0C, &14
	EQUB &05, &BB, &0C, &28
	EQUB &05, &99, &08, &14
	EQUB &05, &AA, &08, &28
	EQUB &1F, &A9, &08, &1C
	EQUB &1F, &B8, &0C, &18
	EQUB &1F, &C8, &14, &18
	EQUB &1F, &C9, &14, &1C
	EQUB &1D, &AC, &1C, &28
	EQUB &1D, &CB, &18, &28
	EQUB &1D, &98, &10, &14
	EQUB &1D, &BA, &24, &28
	EQUB &1D, &54, &04, &10
	EQUB &1D, &76, &20, &24

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.ship_python_faces
	EQUB &9E, &1B, &28, &0B
	EQUB &1E, &1B, &28, &0B
	EQUB &DE, &1B, &28, &0B
	EQUB &5E, &1B, &28, &0B
	EQUB &9E, &13, &26, &00
	EQUB &1E, &13, &26, &00
	EQUB &DE, &13, &26, &00
	EQUB &5E, &13, &26, &00
	EQUB &BE, &19, &25, &0B
	EQUB &3E, &19, &25, &0B
	EQUB &7E, &19, &25, &0B
	EQUB &FE, &19, &25, &0B
	EQUB &3E, &00, &00, &70

.ship_python_end
