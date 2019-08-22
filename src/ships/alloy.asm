; -----------------------------------------------------------------------------
; Elite - Alloy data (type &04)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

.alloy_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.alloy_header
	EQUB &80                        ; 1000....: cargo type if scooped: alloys
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0064                      ; Area for missile lock
	EQUB &2C                        ; Edges data info offset lo
	EQUB &3C                        ; Faces data info offset lo
	EQUB &11                        ; Ship lines stack: 4 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &0A                        ; Explosion count: 1 (4*n+6)
	EQUB &18                        ; Vertices: 4 (n*6)
	EQUB &04                        ; Edges: 4
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &04                        ; Faces: 1 (n*4)
	EQUB &05                        ; Dot beyond distance: 5
	EQUB &10                        ; Hull strength: 16
	EQUB &10                        ; Maximum speed: 0.16 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &03                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.alloy_vertices
	EQUB &0F, &16, &09, &FF, &FF, &FF
	EQUB &0F, &26, &09, &BF, &FF, &FF
	EQUB &13, &20, &0B, &14, &FF, &FF
	EQUB &0A, &2E, &06, &54, &FF, &FF

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.alloy_edges
	EQUB &1F, &FF, &00, &04
	EQUB &10, &FF, &04, &08
	EQUB &14, &FF, &08, &0C
	EQUB &10, &FF, &0C, &00

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.alloy_faces
	EQUB &00, &00, &00, &00

.alloy_end
