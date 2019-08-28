; -----------------------------------------------------------------------------
; Elite - Shuttle data (type &09)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

shuttle_attr = %00100001                ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..1..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......1 bit 0: Ship is a trader

.shuttle_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.shuttle_header
	EQUB &0F                        ; 0000....: cargo type if scooped: none
	                                ; ....1111: max pieces of debris if destroyed: 15
	EQUW &09C4                      ; Area for missile lock
	EQUB &86                        ; Edges data info offset lo
	EQUB &FE                        ; Faces data info offset lo
	EQUB &6D                        ; Ship lines stack: 27 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &26                        ; Explosion count: 8 (4*n+6)
	EQUB &72                        ; Vertices: 19 (n*6)
	EQUB &1E                        ; Edges: 30
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &34                        ; Faces: 13 (n*4)
	EQUB &16                        ; Dot beyond distance: 22
	EQUB &20                        ; Hull strength: 32
	EQUB &08                        ; Maximum speed: 0.08 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.shuttle_vertices
	EQUB &00, &11, &17, &5F, &FF, &FF
	EQUB &11, &00, &17, &9F, &FF, &FF
	EQUB &00, &12, &17, &1F, &FF, &FF
	EQUB &12, &00, &17, &1F, &FF, &FF
	EQUB &14, &14, &1B, &FF, &12, &39
	EQUB &14, &14, &1B, &BF, &34, &59
	EQUB &14, &14, &1B, &3F, &56, &79
	EQUB &14, &14, &1B, &7F, &17, &89
	EQUB &05, &00, &1B, &30, &99, &99
	EQUB &00, &02, &1B, &70, &99, &99
	EQUB &05, &00, &1B, &A9, &99, &99
	EQUB &00, &03, &1B, &29, &99, &99
	EQUB &00, &09, &23, &50, &0A, &BC
	EQUB &03, &01, &1F, &47, &FF, &02
	EQUB &04, &0B, &19, &08, &01, &F4
	EQUB &0B, &04, &19, &08, &A1, &3F
	EQUB &03, &01, &1F, &C7, &6B, &23
	EQUB &03, &0B, &19, &88, &F8, &C0
	EQUB &0A, &04, &19, &88, &4F, &18

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.shuttle_edges
	EQUB &1F, &02, &00, &04
	EQUB &1F, &4A, &04, &08
	EQUB &1F, &6B, &08, &0C
	EQUB &1F, &8C, &00, &0C
	EQUB &1F, &18, &00, &1C
	EQUB &18, &12, &00, &10
	EQUB &1F, &23, &04, &10
	EQUB &18, &34, &04, &14
	EQUB &1F, &45, &08, &14
	EQUB &0C, &56, &08, &18
	EQUB &1F, &67, &0C, &18
	EQUB &18, &78, &0C, &1C
	EQUB &1F, &39, &10, &14
	EQUB &1F, &59, &14, &18
	EQUB &1F, &79, &18, &1C
	EQUB &1F, &19, &10, &1C
	EQUB &10, &0C, &00, &30
	EQUB &10, &0A, &04, &30
	EQUB &10, &AB, &08, &30
	EQUB &10, &BC, &0C, &30
	EQUB &10, &99, &20, &24
	EQUB &07, &99, &24, &28
	EQUB &09, &99, &28, &2C
	EQUB &07, &99, &20, &2C
	EQUB &05, &BB, &34, &38
	EQUB &08, &BB, &38, &3C
	EQUB &07, &BB, &34, &3C
	EQUB &05, &AA, &40, &44
	EQUB &08, &AA, &44, &48
	EQUB &07, &AA, &40, &48

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.shuttle_faces
	EQUB &DF, &37, &37, &28
	EQUB &5F, &00, &4A, &04
	EQUB &DF, &33, &33, &17
	EQUB &9F, &4A, &00, &04
	EQUB &9F, &33, &33, &17
	EQUB &1F, &00, &4A, &04
	EQUB &1F, &33, &33, &17
	EQUB &1F, &4A, &00, &04
	EQUB &5F, &33, &33, &17
	EQUB &3F, &00, &00, &6B
	EQUB &9F, &29, &29, &5A
	EQUB &1F, &29, &29, &5A
	EQUB &5F, &37, &37, &28

.shuttle_end
