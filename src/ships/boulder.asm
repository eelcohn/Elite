; -----------------------------------------------------------------------------
; Elite - boulder data (type &06)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.boulder_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.boulder_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0384                      ; Area for missile lock
	EQUB &3E                        ; Edges data info offset lo
	EQUB &7A                        ; Faces data info offset lo
	EQUB &2D                        ; Ship lines stack: 11 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &0E                        ; Explosion count: 2 (4*n+6)
	EQUB &2A                        ; Vertices: 7 (n*6)
	EQUB &0F                        ; Edges: 15
	EQUW &0101                      ; Bounty: 0.1 Cr
	EQUB &28                        ; Faces: 10 (n*4)
	EQUB &14                        ; Dot beyond distance: 20
	EQUB &14                        ; Hull strength: 20
	EQUB &1E                        ; Maximum speed: 0.30 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.boulder_vertices
	EQUB &12, &25, &0B, &BF, &01, &59
	EQUB &1E, &07, &0C, &1F, &12, &56
	EQUB &1C, &07, &0C, &7F, &23, &67
	EQUB &02, &00, &27, &3F, &34, &78
	EQUB &1C, &22, &1E, &BF, &04, &89
	EQUB &05, &0A, &0D, &5F, &FF, &FF
	EQUB &14, &11, &1E, &3F, &FF, &FF

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.boulder_edges
	EQUB &1F, &15, &00, &04
	EQUB &1F, &26, &04, &08
	EQUB &1F, &37, &08, &0C
	EQUB &1F, &48, &0C, &10
	EQUB &1F, &09, &10, &00
	EQUB &1F, &01, &00, &14
	EQUB &1F, &12, &04, &14
	EQUB &1F, &23, &08, &14
	EQUB &1F, &34, &0C, &14
	EQUB &1F, &04, &10, &14
	EQUB &1F, &59, &00, &18
	EQUB &1F, &56, &04, &18
	EQUB &1F, &67, &08, &18
	EQUB &1F, &78, &0C, &18
	EQUB &1F, &89, &10, &18

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.boulder_faces
	EQUB &DF, &0F, &03, &08
	EQUB &9F, &07, &0C, &1E
	EQUB &5F, &20, &2F, &18
	EQUB &FF, &03, &27, &07
	EQUB &FF, &05, &04, &01
	EQUB &1F, &31, &54, &08
	EQUB &3F, &70, &15, &15
	EQUB &7F, &4C, &23, &52
	EQUB &3F, &16, &38, &89
	EQUB &3F, &28, &6E, &26

.boulder_end
