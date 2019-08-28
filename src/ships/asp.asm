; -----------------------------------------------------------------------------
; Elite - Asp Mk2 data (type &19)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

asp_attr = %10001100                    ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....1... bit 3: Ship is a pirate
                                        ; .....1.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.asp_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.asp_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &0E10                      ; Area for missile lock
	EQUB &86                        ; Edges data info offset lo
	EQUB &F6                        ; Faces data info offset lo
	EQUB &65                        ; Ship lines stack: 25 (4*max_visible_edges+1)
	EQUB &20                        ; Gun vertex: 8 (vertex*4)
	EQUB &1A                        ; Explosion count: 5 (4*n+6)
	EQUB &72                        ; Vertices: 19 (n*6)
	EQUB &1C                        ; Edges: 28
	EQUW &01C8                      ; Bounty: 20.0 Cr
	EQUB &30                        ; Faces: 12 (n*4)
	EQUB &28                        ; Dot beyond distance: 40
	EQUB &96                        ; Hull strength: 150
	EQUB &28                        ; Maximum speed: 0.40 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &29                        ; 00101...: Laser class 5
	                                ; .....001: 1 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.asp_vertices
	EQUB &00, &12, &00, &56, &01, &22
	EQUB &00, &09, &2D, &7F, &12, &BB
	EQUB &2B, &00, &2D, &3F, &16, &BB
	EQUB &45, &03, &00, &5F, &16, &79
	EQUB &2B, &0E, &1C, &5F, &01, &77
	EQUB &2B, &00, &2D, &BF, &25, &BB
	EQUB &45, &03, &00, &DF, &25, &8A
	EQUB &2B, &0E, &1C, &DF, &02, &88
	EQUB &1A, &07, &49, &5F, &04, &79
	EQUB &1A, &07, &49, &DF, &04, &8A
	EQUB &2B, &0E, &1C, &1F, &34, &69
	EQUB &2B, &0E, &1C, &9F, &34, &5A
	EQUB &00, &09, &2D, &3F, &35, &6B
	EQUB &11, &00, &2D, &AA, &BB, &BB
	EQUB &11, &00, &2D, &29, &BB, &BB
	EQUB &00, &04, &2D, &6A, &BB, &BB
	EQUB &00, &04, &2D, &28, &BB, &BB
	EQUB &00, &07, &49, &4A, &04, &04
	EQUB &00, &07, &53, &4A, &04, &04

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.asp_edges
	EQUB &16, &12, &00, &04
	EQUB &16, &01, &00, &10
	EQUB &16, &02, &00, &1C
	EQUB &1F, &1B, &04, &08
	EQUB &1F, &16, &08, &0C
	EQUB &10, &79, &0C, &20
	EQUB &1F, &04, &20, &24
	EQUB &10, &8A, &18, &24
	EQUB &1F, &25, &14, &18
	EQUB &1F, &2B, &04, &14
	EQUB &1F, &17, &0C, &10
	EQUB &1F, &07, &10, &20
	EQUB &1F, &28, &18, &1C
	EQUB &1F, &08, &1C, &24
	EQUB &1F, &6B, &08, &30
	EQUB &1F, &5B, &14, &30
	EQUB &16, &36, &28, &30
	EQUB &16, &35, &2C, &30
	EQUB &16, &34, &28, &2C
	EQUB &1F, &5A, &18, &2C
	EQUB &1F, &4A, &24, &2C
	EQUB &1F, &69, &0C, &28
	EQUB &1F, &49, &20, &28
	EQUB &0A, &BB, &34, &3C
	EQUB &09, &BB, &3C, &38
	EQUB &08, &BB, &38, &40
	EQUB &08, &BB, &40, &34
	EQUB &0A, &04, &48, &44

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.asp_faces
	EQUB &5F, &00, &23, &05
	EQUB &7F, &08, &26, &07
	EQUB &FF, &08, &26, &07
	EQUB &36, &00, &18, &01
	EQUB &1F, &00, &2B, &13
	EQUB &BF, &06, &1C, &02
	EQUB &3F, &06, &1C, &02
	EQUB &5F, &3B, &40, &1F
	EQUB &DF, &3B, &40, &1F
	EQUB &1F, &50, &2E, &32
	EQUB &9F, &50, &2E, &32
	EQUB &3F, &00, &00, &5A

.asp_end
