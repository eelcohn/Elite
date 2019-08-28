; -----------------------------------------------------------------------------
; Elite - Constrictor data (type &1F)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

constrictor_attr = %00000100            ; 0....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.constrictor_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.constrictor_header
	EQUB &03                        ; 0000....: cargo type if scooped: none
	                                ; ....0011: max pieces of debris if destroyed: 3
	EQUW &1081                      ; Area for missile lock
	EQUB &7A                        ; Edges data info offset lo
	EQUB &DA                        ; Faces data info offset lo
	EQUB &4D                        ; Ship lines stack: 19 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &2E                        ; Explosion count: 10 (4*n+6)
	EQUB &66                        ; Vertices: 17 (n*6)
	EQUB &18                        ; Edges: 24
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &28                        ; Faces: 10 (n*4)
	EQUB &2D                        ; Dot beyond distance: 45
	EQUB &FC                        ; Hull strength: 252
	EQUB &24                        ; Maximum speed: 0.36 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &34                        ; 00110...: Laser class 6
	                                ; .....100: 4 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.constrictor_vertices
	EQUB &14, &07, &50, &5F, &02, &99
	EQUB &14, &07, &50, &DF, &01, &99
	EQUB &36, &07, &28, &DF, &14, &99
	EQUB &36, &07, &28, &FF, &45, &89
	EQUB &14, &0D, &28, &BF, &56, &88
	EQUB &14, &0D, &28, &3F, &67, &88
	EQUB &36, &07, &28, &7F, &37, &89
	EQUB &36, &07, &28, &5F, &23, &99
	EQUB &14, &0D, &05, &1F, &FF, &FF
	EQUB &14, &0D, &05, &9F, &FF, &FF
	EQUB &14, &07, &3E, &52, &99, &99
	EQUB &14, &07, &3E, &D2, &99, &99
	EQUB &19, &07, &19, &72, &99, &99
	EQUB &19, &07, &19, &F2, &99, &99
	EQUB &0F, &07, &0F, &6A, &99, &99
	EQUB &0F, &07, &0F, &EA, &99, &99
	EQUB &00, &07, &00, &40, &9F, &01

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.constrictor_edges
	EQUB &1F, &09, &00, &04
	EQUB &1F, &19, &04, &08
	EQUB &1F, &01, &04, &24
	EQUB &1F, &02, &00, &20
	EQUB &1F, &29, &00, &1C
	EQUB &1F, &23, &1C, &20
	EQUB &1F, &14, &08, &24
	EQUB &1F, &49, &08, &0C
	EQUB &1F, &39, &18, &1C
	EQUB &1F, &37, &18, &20
	EQUB &1F, &67, &14, &20
	EQUB &1F, &56, &10, &24
	EQUB &1F, &45, &0C, &24
	EQUB &1F, &58, &0C, &10
	EQUB &1F, &68, &10, &14
	EQUB &1F, &78, &14, &18
	EQUB &1F, &89, &0C, &18
	EQUB &1F, &06, &20, &24
	EQUB &12, &99, &28, &30
	EQUB &05, &99, &30, &38
	EQUB &0A, &99, &38, &28
	EQUB &0A, &99, &2C, &3C
	EQUB &05, &99, &34, &3C
	EQUB &12, &99, &2C, &34

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.constrictor_faces
	EQUB &1F, &00, &37, &0F
	EQUB &9F, &18, &4B, &14
	EQUB &1F, &18, &4B, &14
	EQUB &1F, &2C, &4B, &00
	EQUB &9F, &2C, &4B, &00
	EQUB &9F, &2C, &4B, &00
	EQUB &1F, &00, &35, &00
	EQUB &1F, &2C, &4B, &00
	EQUB &3F, &00, &00, &A0
	EQUB &5F, &00, &1B, &00

.constrictor_end
