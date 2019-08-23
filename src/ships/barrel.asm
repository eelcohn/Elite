; -----------------------------------------------------------------------------
; Elite - Barrel data (type &05)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.barrel_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.barrel_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0190                      ; Area for missile lock
	EQUB &50                        ; Edges data info offset lo
	EQUB &8C                        ; Faces data info offset lo
	EQUB &31                        ; Ship lines stack: 12 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &12                        ; Explosion count: 3 (4*n+6)
	EQUB &3C                        ; Vertices: 10 (n*6)
	EQUB &0F                        ; Edges: 15
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &1C                        ; Faces: 7 (n*4)
	EQUB &0C                        ; Dot beyond distance: 12
	EQUB &11                        ; Hull strength: 17
	EQUB &0F                        ; Maximum speed: 0.15 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.barrel_vertices
	EQUB &18, &10, &00, &1F, &10, &55
	EQUB &18, &05, &0F, &1F, &10, &22
	EQUB &18, &0D, &09, &5F, &20, &33
	EQUB &18, &0D, &09, &7F, &30, &44
	EQUB &18, &05, &0F, &3F, &40, &55
	EQUB &18, &10, &00, &9F, &51, &66
	EQUB &18, &05, &0F, &9F, &21, &66
	EQUB &18, &0D, &09, &DF, &32, &66
	EQUB &18, &0D, &09, &FF, &43, &66
	EQUB &18, &05, &0F, &BF, &54, &66

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.barrel_edges
	EQUB &1F, &10, &00, &04
	EQUB &1F, &20, &04, &08
	EQUB &1F, &30, &08, &0C
	EQUB &1F, &40, &0C, &10
	EQUB &1F, &50, &00, &10
	EQUB &1F, &51, &00, &14
	EQUB &1F, &21, &04, &18
	EQUB &1F, &32, &08, &1C
	EQUB &1F, &43, &0C, &20
	EQUB &1F, &54, &10, &24
	EQUB &1F, &61, &14, &18
	EQUB &1F, &62, &18, &1C
	EQUB &1F, &63, &1C, &20
	EQUB &1F, &64, &20, &24
	EQUB &1F, &65, &24, &14

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.barrel_faces
	EQUB &1F, &60, &00, &00
	EQUB &1F, &00, &29, &1E
	EQUB &5F, &00, &12, &30
	EQUB &5F, &00, &33, &00
	EQUB &7F, &00, &12, &30
	EQUB &3F, &00, &29, &1E
	EQUB &9F, &60, &00, &00

.barrel_end
