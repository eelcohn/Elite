; -----------------------------------------------------------------------------
; Elite - Missile ship data (type &01)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.missile_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.missile_header
	EQUB &00                        ; High nibble: scoop info, low nibble: debris spin info
	EQUW &0640                      ; Area for missile lock
	EQUB &7A                        ; Edges data info offset lo
	EQUB &DA                        ; Faces data info offset lo
	EQUB &51                        ; Ship lines stack = 24 (4*maxlines+1)
	EQUB &00                        ; Gun vertex = 0 (vertex*4)
	EQUB &0A                        ; Explosion count = 1 (4*n+6)
	EQUB &66                        ; 17 Vertices (n*6)
	EQUB &18                        ; 24 Edges
	EQUW &0000                      ; Bounty
	EQUB &24                        ; 9 Faces (n*4)
	EQUB &0E                        ; Dot beyond distance
	EQUB &02                        ; Energy
	EQUB &2C                        ; Speed
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; %00000xxx No lasers | %xxxxx011: No missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.missile_vertices
	EQUB &00, &00, &44, &1F, &10, &32
	EQUB &08, &08, &24, &5F, &21, &54
	EQUB &08, &08, &24, &1F, &32, &74
	EQUB &08, &08, &24, &9F, &30, &76
	EQUB &08, &08, &24, &DF, &10, &65
	EQUB &08, &08, &2C, &3F, &74, &88
	EQUB &08, &08, &2C, &7F, &54, &88
	EQUB &08, &08, &2C, &FF, &65, &88
	EQUB &08, &08, &2C, &BF, &76, &88
	EQUB &0C, &0C, &2C, &28, &74, &88
	EQUB &0C, &0C, &2C, &68, &54, &88
	EQUB &0C, &0C, &2C, &E8, &65, &88
	EQUB &0C, &0C, &2C, &A8, &76, &88
	EQUB &08, &08, &0C, &A8, &76, &77
	EQUB &08, &08, &0C, &E8, &65, &66
	EQUB &08, &08, &0C, &28, &74, &77
	EQUB &08, &08, &0C, &68, &54, &55

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.missile_edges
	EQUB &1F, &21, &00, &04
	EQUB &1F, &32, &00, &08
	EQUB &1F, &30, &00, &0C
	EQUB &1F, &10, &00, &10
	EQUB &1F, &24, &04, &08
	EQUB &1F, &51, &04, &10
	EQUB &1F, &60, &0C, &10
	EQUB &1F, &73, &08, &0C
	EQUB &1F, &74, &08, &14
	EQUB &1F, &54, &04, &18
	EQUB &1F, &65, &10, &1C
	EQUB &1F, &76, &0C, &20
	EQUB &1F, &86, &1C, &20
	EQUB &1F, &87, &14, &20
	EQUB &1F, &84, &14, &18
	EQUB &1F, &85, &18, &1C
	EQUB &08, &85, &18, &28
	EQUB &08, &87, &14, &24
	EQUB &08, &87, &20, &30
	EQUB &08, &85, &1C, &2C
	EQUB &08, &74, &24, &3C
	EQUB &08, &54, &28, &40
	EQUB &08, &76, &30, &34
	EQUB &08, &65, &2C, &38

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.missile_faces
	EQUB &9F, &40, &00, &10
	EQUB &5F, &00, &40, &10
	EQUB &1F, &40, &00, &10
	EQUB &1F, &00, &40, &10
	EQUB &1F, &20, &00, &00
	EQUB &5F, &00, &20, &00
	EQUB &9F, &20, &00, &00
	EQUB &1F, &00, &20, &00
	EQUB &3F, &00, &00, &b0

.missile_end
