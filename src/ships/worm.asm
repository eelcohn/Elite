; -----------------------------------------------------------------------------
; Elite - Worm data (type &17)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.worm_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.worm_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &2649                      ; Area for missile lock
	EQUB &50                        ; Edges data info offset lo
	EQUB &90                        ; Faces data info offset lo
	EQUB &49                        ; Ship lines stack: 18 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &12                        ; Explosion count: 3 (4*n+6)
	EQUB &3C                        ; Vertices: 10 (n*6)
	EQUB &10                        ; Edges: 16
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &20                        ; Faces: 8 (n*4)
	EQUB &13                        ; Dot beyond distance: 19
	EQUB &1E                        ; Hull strength: 30
	EQUB &17                        ; Maximum speed: 0.23 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &03                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &08                        ; 00001...: Laser class 1
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.worm_vertices
	EQUB &0A, &0A, &23, &5F, &02, &77
	EQUB &0A, &0A, &23, &DF, &03, &77
	EQUB &05, &06, &0F, &1F, &01, &24
	EQUB &05, &06, &0F, &9F, &01, &35
	EQUB &0F, &0A, &19, &5F, &24, &77
	EQUB &0F, &0A, &19, &DF, &35, &77
	EQUB &1A, &0A, &19, &7F, &46, &77
	EQUB &1A, &0A, &19, &FF, &56, &77
	EQUB &08, &0E, &19, &3F, &14, &66
	EQUB &08, &0E, &19, &BF, &15, &66

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.worm_edges
	EQUB &1F, &07, &00, &04
	EQUB &1F, &37, &04, &14
	EQUB &1F, &57, &14, &1C
	EQUB &1F, &67, &1C, &18
	EQUB &1F, &47, &18, &10
	EQUB &1F, &27, &10, &00
	EQUB &1F, &02, &00, &08
	EQUB &1F, &03, &04, &0C
	EQUB &1F, &24, &10, &08
	EQUB &1F, &35, &14, &0C
	EQUB &1F, &14, &08, &20
	EQUB &1F, &46, &20, &18
	EQUB &1F, &15, &0C, &24
	EQUB &1F, &56, &24, &1C
	EQUB &1F, &01, &08, &0C
	EQUB &1F, &16, &20, &24

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.worm_faces
	EQUB &1F, &00, &58, &46
	EQUB &1F, &00, &45, &0E
	EQUB &1F, &46, &42, &23
	EQUB &9F, &46, &42, &23
	EQUB &1F, &40, &31, &0E
	EQUB &9F, &40, &31, &0E
	EQUB &3F, &00, &00, &C8
	EQUB &5F, &00, &50, &00

.worm_end
