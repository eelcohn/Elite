; -----------------------------------------------------------------------------
; Elite - Boa data (type &0D)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

boa_attr = %10100000                    ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..1..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.boa_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.boa_header
	EQUB &05                        ; 0000....: cargo type if scooped: none
	                                ; ....0101: max pieces of debris if destroyed: 5
	EQUW &1324                      ; Area for missile lock
	EQUB &62                        ; Edges data info offset lo
	EQUB &C2                        ; Faces data info offset lo
	EQUB &59                        ; Ship lines stack: 22 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &26                        ; Explosion count: 8 (4*n+6)
	EQUB &4E                        ; Vertices: 13 (n*6)
	EQUB &18                        ; Edges: 24
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &34                        ; Faces: 13 (n*4)
	EQUB &28                        ; Dot beyond distance: 40
	EQUB &FA                        ; Hull strength: 250
	EQUB &18                        ; Maximum speed: 0.24 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &00                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &1C                        ; 00011...: Laser class 3
	                                ; .....100: 4 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.boa_vertices
	EQUB &00, &00, &5D, &1F, &FF, &FF
	EQUB &00, &28, &57, &38, &02, &33
	EQUB &26, &19, &63, &78, &01, &44
	EQUB &26, &19, &63, &F8, &12, &55
	EQUB &26, &28, &3B, &BF, &23, &69
	EQUB &26, &28, &3B, &3F, &03, &6B
	EQUB &3E, &00, &43, &3F, &04, &8B
	EQUB &18, &41, &4F, &7F, &14, &8A
	EQUB &18, &41, &4F, &FF, &15, &7A
	EQUB &3E, &00, &43, &BF, &25, &79
	EQUB &00, &07, &6B, &36, &02, &AA
	EQUB &0D, &09, &6B, &76, &01, &AA
	EQUB &0D, &09, &6B, &F6, &12, &CC

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.boa_edges
	EQUB &1F, &6B, &00, &14
	EQUB &1F, &8A, &00, &1C
	EQUB &1F, &79, &00, &24
	EQUB &1D, &69, &00, &10
	EQUB &1D, &8B, &00, &18
	EQUB &1D, &7A, &00, &20
	EQUB &1F, &36, &10, &14
	EQUB &1F, &0B, &14, &18
	EQUB &1F, &48, &18, &1C
	EQUB &1F, &1A, &1C, &20
	EQUB &1F, &57, &20, &24
	EQUB &1F, &29, &10, &24
	EQUB &18, &23, &04, &10
	EQUB &18, &03, &04, &14
	EQUB &18, &25, &0C, &24
	EQUB &18, &15, &0C, &20
	EQUB &18, &04, &08, &18
	EQUB &18, &14, &08, &1C
	EQUB &16, &02, &04, &28
	EQUB &16, &01, &08, &2C
	EQUB &16, &12, &0C, &30
	EQUB &0E, &0C, &28, &2C
	EQUB &0E, &1C, &2C, &30
	EQUB &0E, &2C, &30, &28

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.boa_faces
	EQUB &3F, &2B, &25, &3C
	EQUB &7F, &00, &2D, &59
	EQUB &BF, &2B, &25, &3C
	EQUB &1F, &00, &28, &00
	EQUB &7F, &3E, &20, &14
	EQUB &FF, &3E, &20, &14
	EQUB &1F, &00, &17, &06
	EQUB &DF, &17, &0F, &09
	EQUB &5F, &17, &0F, &09
	EQUB &9F, &1A, &0D, &0A
	EQUB &5F, &00, &1F, &0C
	EQUB &1F, &1A, &0D, &0A
	EQUB &2E, &00, &00, &6B

.boa_end
