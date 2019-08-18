; -----------------------------------------------------------------------------
; Elite - Transporter ship data (type 10)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.ship_transporter_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
	EQUB &00                        ; High nibble: scoop info, low nibble: debris spin info
	EQUW &09C4                      ; Area for missile lock
	EQUB &F2                        ; Edges data info offset lo
	EQUB &AA                        ; Faces data info offset lo
	EQUB &91                        ; Ship lines stack = 36 (4*maxlines+1)
	EQUB &30                        ; Gun vertex = 21 (vertex*4)
	EQUB &1A                        ; Explosion count = 9 (4*n+6)
	EQUB &DE                        ; 37 Vertices (n*6)
	EQUB &2E                        ; 46 Edges
	EQUW &0000                      ; Bounty
	EQUB &38                        ; 14 Faces (n*4)
	EQUB &10                        ; Dot beyond distance
	EQUB &20                        ; Energy
	EQUB &0A                        ; Speed
	EQUB &00                        ; Edges data info offset hi
	EQUB &01                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; %00000xxx No lasers | %xxxxx000: No missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.ship_transporter_vertices
	EQUB &00, &13, &33, &3F, &06, &77
	EQUB &33, &07, &33, &BF, &01, &77
	EQUB &39, &07, &33, &FF, &01, &22
	EQUB &33, &11, &33, &FF, &02, &33
	EQUB &33, &11, &33, &7F, &03, &44
	EQUB &39, &07, &33, &7F, &04, &55
	EQUB &33, &07, &33, &3F, &05, &66
	EQUB &00, &0C, &18, &12, &FF, &FF
	EQUB &3C, &02, &18, &DF, &17, &89
	EQUB &42, &11, &18, &DF, &12, &39
	EQUB &42, &11, &18, &5F, &34, &5A
	EQUB &3C, &02, &18, &5F, &56, &AB
	EQUB &16, &05, &3D, &DF, &89, &CD
	EQUB &1B, &11, &3D, &DF, &39, &DD
	EQUB &1B, &11, &3D, &5F, &3A, &DD
	EQUB &16, &05, &3D, &5F, &AB, &CD
	EQUB &0A, &0B, &05, &86, &77, &77
	EQUB &24, &05, &05, &86, &77, &77
	EQUB &0A, &0D, &0E, &A6, &77, &77
	EQUB &24, &07, &0E, &A6, &77, &77
	EQUB &17, &0C, &1D, &A6, &77, &77
	EQUB &17, &0A, &0E, &A6, &77, &77
	EQUB &0A, &0F, &1D, &26, &66, &66
	EQUB &24, &09, &1D, &26, &66, &66
	EQUB &17, &0A, &0E, &26, &66, &66
	EQUB &0A, &0C, &06, &26, &66, &66
	EQUB &24, &06, &06, &26, &66, &66
	EQUB &17, &07, &10, &06, &66, &66
	EQUB &17, &09, &06, &26, &66, &66
	EQUB &21, &11, &1A, &E5, &33, &33
	EQUB &21, &11, &21, &C5, &33, &33
	EQUB &21, &11, &1A, &65, &33, &33
	EQUB &21, &11, &21, &45, &33, &33
	EQUB &19, &06, &33, &E7, &00, &00
	EQUB &1A, &06, &33, &67, &00, &00
	EQUB &11, &06, &33, &24, &00, &00
	EQUB &11, &06, &33, &A4, &00, &00

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.ship_transporter_edges
	EQUB &1F, &07, &00, &04
	EQUB &1F, &01, &04, &08
	EQUB &1F, &02, &08, &0C
	EQUB &1F, &03, &0C, &10
	EQUB &1F, &04, &10, &14
	EQUB &1F, &05, &14, &18
	EQUB &1F, &06, &00, &18
	EQUB &0F, &67, &00, &1C
	EQUB &1F, &17, &04, &20
	EQUB &0A, &12, &08, &24
	EQUB &1F, &23, &0C, &24
	EQUB &1F, &34, &10, &28
	EQUB &0A, &45, &14, &28
	EQUB &1F, &56, &18, &2C
	EQUB &10, &78, &1C, &20
	EQUB &10, &19, &20, &24
	EQUB &10, &5A, &28, &2C
	EQUB &10, &6B, &1C, &2C
	EQUB &12, &BC, &1C, &3C
	EQUB &12, &8C, &1C, &30
	EQUB &10, &89, &20, &30
	EQUB &1F, &39, &24, &34
	EQUB &1F, &3A, &28, &38
	EQUB &10, &AB, &2C, &3C
	EQUB &1F, &9D, &30, &34
	EQUB &1F, &3D, &34, &38
	EQUB &1F, &AD, &38, &3C
	EQUB &1F, &CD, &30, &3C
	EQUB &06, &77, &40, &44, &06, &77, &48, &4C  ; I.B. on roof
	EQUB &06, &77, &4C, &50
	EQUB &06, &77, &48, &50
	EQUB &06, &77, &50, &54
	EQUB &06, &66, &58, &5C
	EQUB &06, &66, &5C, &60, &06, &66, &60, &58  ; D.B. on roof
	EQUB &06, &66, &64, &68
	EQUB &06, &66, &68, &6C
	EQUB &06, &66, &64, &6C
	EQUB &06, &66, &6C, &70
	EQUB &05, &33, &74, &78, &05, &33, &7C, &80  ; skids
	EQUB &07, &00, &84, &88, &04, &00, &88, &8C  ; thruster
	EQUB &04, &00, &8C, &90
	EQUB &04, &00, &90, &84

; -----------------------------------------------------------------------------
; Faces data
; -----------------------------------------------------------------------------
.ship_transporter_faces
	EQUB &3F, &00, &00, &67
	EQUB &BF, &6F, &30, &07
	EQUB &FF, &69, &3F, &15
	EQUB &5F, &00, &22, &00
	EQUB &7F, &69, &3F, &15
	EQUB &3F, &6F, &30, &07
	EQUB &1F, &08, &20, &03
	EQUB &9F, &08, &20, &03
	EQUB &92, &08, &22, &0B
	EQUB &9F, &4B, &20, &4F
	EQUB &1F, &4B, &20, &4F
	EQUB &12, &08, &22, &0B
	EQUB &1F, &00, &26, &11
	EQUB &1F, &00, &00, &79

.ship_transporter_end
