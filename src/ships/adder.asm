; -----------------------------------------------------------------------------
; Elite - Adder data (type &14)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

adder_attr = %10001100                  ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.adder_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.adder_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &09C4                      ; Area for missile lock
	EQUB &80                        ; Edges data info offset lo
	EQUB &F4                        ; Faces data info offset lo
	EQUB &61                        ; Ship lines stack: 24 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &16                        ; Explosion count: 4 (4*n+6)
	EQUB &6C                        ; Vertices: 18 (n*6)
	EQUB &1D                        ; Edges: 29
	EQUW &0128                      ; Bounty: 4.0 Cr
	EQUB &3C                        ; Faces: 15 (n*4)
	EQUB &17                        ; Dot beyond distance: 23
	EQUB &55                        ; Hull strength: 85
	EQUB &18                        ; Maximum speed: 0.24 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &10                        ; 00010...: Laser class 2
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.adder_vertices
	EQUB &12, &00, &28, &9F, &01, &BC
	EQUB &12, &00, &28, &1F, &01, &23
	EQUB &1E, &00, &18, &3F, &23, &45
	EQUB &1E, &00, &28, &3F, &45, &66
	EQUB &12, &07, &28, &7F, &56, &7E
	EQUB &12, &07, &28, &FF, &78, &AE
	EQUB &1E, &00, &28, &BF, &89, &AA
	EQUB &1E, &00, &18, &BF, &9A, &BC
	EQUB &12, &07, &28, &BF, &78, &9D
	EQUB &12, &07, &28, &3F, &46, &7D
	EQUB &12, &07, &0D, &9F, &09, &BD
	EQUB &12, &07, &0D, &1F, &02, &4D
	EQUB &12, &07, &0D, &DF, &1A, &CE
	EQUB &12, &07, &0D, &5F, &13, &5E
	EQUB &0B, &03, &1D, &85, &00, &00
	EQUB &0B, &03, &1D, &05, &00, &00
	EQUB &0B, &04, &18, &04, &00, &00
	EQUB &0B, &04, &18, &84, &00, &00

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.adder_edges
	EQUB &1F, &01, &00, &04
	EQUB &07, &23, &04, &08
	EQUB &1F, &45, &08, &0C
	EQUB &1F, &56, &0C, &10
	EQUB &1F, &7E, &10, &14
	EQUB &1F, &8A, &14, &18
	EQUB &1F, &9A, &18, &1C
	EQUB &07, &BC, &1C, &00
	EQUB &1F, &46, &0C, &24
	EQUB &1F, &7D, &24, &20
	EQUB &1F, &89, &20, &18
	EQUB &1F, &0B, &00, &28
	EQUB &1F, &9B, &1C, &28
	EQUB &1F, &02, &04, &2C
	EQUB &1F, &24, &08, &2C
	EQUB &1F, &1C, &00, &30
	EQUB &1F, &AC, &1C, &30
	EQUB &1F, &13, &04, &34
	EQUB &1F, &35, &08, &34
	EQUB &1F, &0D, &28, &2C
	EQUB &1F, &1E, &30, &34
	EQUB &1F, &9D, &20, &28
	EQUB &1F, &4D, &24, &2C
	EQUB &1F, &AE, &14, &30
	EQUB &1F, &5E, &10, &34
	EQUB &05, &00, &38, &3C
	EQUB &03, &00, &3C, &40
	EQUB &04, &00, &40, &44
	EQUB &03, &00, &44, &38

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.adder_faces
	EQUB &1F, &00, &27, &0A
	EQUB &5F, &00, &27, &0A
	EQUB &1F, &45, &32, &0D
	EQUB &5F, &45, &32, &0D
	EQUB &1F, &1E, &34, &00
	EQUB &5F, &1E, &34, &00
	EQUB &3F, &00, &00, &A0
	EQUB &3F, &00, &00, &A0
	EQUB &3F, &00, &00, &A0
	EQUB &9F, &1E, &34, &00
	EQUB &DF, &1E, &34, &00
	EQUB &9F, &45, &32, &0D
	EQUB &DF, &45, &32, &0D
	EQUB &1F, &00, &1C, &00
	EQUB &5F, &00, &1C, &00

.adder_end
