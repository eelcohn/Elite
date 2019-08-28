; -----------------------------------------------------------------------------
; Elite - Moray data (type &1C)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

moray_attr = %00001100                  ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.moray_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.moray_header
	EQUB &01                        ; 0000....: cargo type if scooped: none
	                                ; ....0001: max pieces of debris if destroyed: 1
	EQUW &0384                      ; Area for missile lock
	EQUB &68                        ; Edges data info offset lo
	EQUB &B4                        ; Faces data info offset lo
	EQUB &45                        ; Ship lines stack: 17 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &1A                        ; Explosion count: 5 (4*n+6)
	EQUB &54                        ; Vertices: 14 (n*6)
	EQUB &13                        ; Edges: 19
	EQUW &0132                      ; Bounty: 5.0 Cr
	EQUB &24                        ; Faces: 9 (n*4)
	EQUB &28                        ; Dot beyond distance: 40
	EQUB &64                        ; Hull strength: 100
	EQUB &19                        ; Maximum speed: 0.25 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; 00010...: Laser class 2
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.moray_vertices
	EQUB &0F, &00, &41, &1F, &02, &78
	EQUB &0F, &00, &41, &9F, &01, &67
	EQUB &00, &12, &28, &31, &FF, &FF
	EQUB &3C, &00, &00, &9F, &13, &66
	EQUB &3C, &00, &00, &1F, &25, &88
	EQUB &1E, &1B, &0A, &78, &45, &78
	EQUB &1E, &1B, &0A, &F8, &34, &67
	EQUB &09, &04, &19, &E7, &44, &44
	EQUB &09, &04, &19, &67, &44, &44
	EQUB &00, &12, &10, &67, &44, &44
	EQUB &0D, &03, &31, &05, &00, &00
	EQUB &06, &00, &41, &05, &00, &00
	EQUB &0D, &03, &31, &85, &00, &00
	EQUB &06, &00, &41, &85, &00, &00

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.moray_edges
	EQUB &1F, &07, &00, &04
	EQUB &1F, &16, &04, &0C
	EQUB &18, &36, &0C, &18
	EQUB &18, &47, &14, &18
	EQUB &18, &58, &10, &14
	EQUB &1F, &28, &00, &10
	EQUB &0F, &67, &04, &18
	EQUB &0F, &78, &00, &14
	EQUB &0F, &02, &00, &08
	EQUB &0F, &01, &04, &08
	EQUB &11, &13, &08, &0C
	EQUB &11, &25, &08, &10
	EQUB &0D, &45, &08, &14
	EQUB &0D, &34, &08, &18
	EQUB &05, &44, &1C, &20
	EQUB &07, &44, &1C, &24
	EQUB &07, &44, &20, &24
	EQUB &05, &00, &28, &2C
	EQUB &05, &00, &30, &34

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.moray_faces
	EQUB &1F, &00, &2B, &07
	EQUB &9F, &0A, &31, &07
	EQUB &1F, &0A, &31, &07
	EQUB &F8, &3B, &1C, &65
	EQUB &78, &00, &34, &4E
	EQUB &78, &3B, &1C, &65
	EQUB &DF, &48, &63, &32
	EQUB &5F, &00, &53, &1E
	EQUB &5F, &48, &63, &32

.moray_end
