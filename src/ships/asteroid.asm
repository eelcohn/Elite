; -----------------------------------------------------------------------------
; Elite - asteroid data (type &07)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.asteroid_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.asteroid_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &1900                      ; Area for missile lock
	EQUB &4A                        ; Edges data info offset lo
	EQUB &9E                        ; Faces data info offset lo
	EQUB &41                        ; Ship lines stack: 16 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &22                        ; Explosion count: 7 (4*n+6)
	EQUB &36                        ; Vertices: 9 (n*6)
	EQUB &15                        ; Edges: 21
	EQUW &0105                      ; Bounty: 0.5 Cr
	EQUB &38                        ; Faces: 14 (n*4)
	EQUB &32                        ; Dot beyond distance: 50
	EQUB &3C                        ; Hull strength: 60
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.asteroid_vertices
	EQUB &00, &50, &00, &1F, &FF, &FF
	EQUB &50, &0A, &00, &DF, &FF, &FF
	EQUB &00, &50, &00, &5F, &FF, &FF
	EQUB &46, &28, &00, &5F, &FF, &FF
	EQUB &3C, &32, &00, &1F, &65, &DC
	EQUB &32, &00, &3C, &1F, &FF, &FF
	EQUB &28, &00, &46, &9F, &10, &32
	EQUB &00, &1E, &4B, &3F, &FF, &FF
	EQUB &00, &32, &3C, &7F, &98, &BA

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.asteroid_edges
	EQUB &1F, &72, &00, &04
	EQUB &1F, &D6, &00, &10
	EQUB &1F, &C5, &0C, &10
	EQUB &1F, &B4, &08, &0C
	EQUB &1F, &A3, &04, &08
	EQUB &1F, &32, &04, &18
	EQUB &1F, &31, &08, &18
	EQUB &1F, &41, &08, &14
	EQUB &1F, &10, &14, &18
	EQUB &1F, &60, &00, &14
	EQUB &1F, &54, &0C, &14
	EQUB &1F, &20, &00, &18
	EQUB &1F, &65, &10, &14
	EQUB &1F, &A8, &04, &20
	EQUB &1F, &87, &04, &1C
	EQUB &1F, &D7, &00, &1C
	EQUB &1F, &DC, &10, &1C
	EQUB &1F, &C9, &0C, &1C
	EQUB &1F, &B9, &0C, &20
	EQUB &1F, &BA, &08, &20
	EQUB &1F, &98, &1C, &20

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.asteroid_faces
	EQUB &1F, &09, &42, &51
	EQUB &5F, &09, &42, &51
	EQUB &9F, &48, &40, &1F
	EQUB &DF, &40, &49, &2F
	EQUB &5F, &2D, &4F, &41
	EQUB &1F, &87, &0F, &23
	EQUB &1F, &26, &4C, &46
	EQUB &BF, &42, &3B, &27
	EQUB &FF, &43, &0F, &50
	EQUB &7F, &42, &0E, &4B
	EQUB &FF, &46, &50, &28
	EQUB &7F, &3A, &66, &33
	EQUB &3F, &51, &09, &43
	EQUB &3F, &2F, &5E, &3F

.asteroid_end
