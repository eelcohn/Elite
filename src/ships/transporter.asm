; -----------------------------------------------------------------------------
; Elite - Transporter data (type &0A)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

transporter_attr = %01100001            ; 0....... bit 7: Escape pod present
                                        ; .1...... bit 6: Galcop police ship
                                        ; ..1..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......1 bit 0: Ship is a trader

.transporter_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.transporter_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &09C4                      ; Area for missile lock
	EQUB &F2                        ; Edges data info offset lo
	EQUB &AA                        ; Faces data info offset lo
	EQUB &91                        ; Ship lines stack: 36 (4*max_visible_edges+1)
	EQUB &30                        ; Gun vertex: 12 (vertex*4)
	EQUB &1A                        ; Explosion count: 5 (4*n+6)
	EQUB &DE                        ; Vertices: 37 (n*6)
	EQUB &2E                        ; Edges: 46
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &38                        ; Faces: 14 (n*4)
	EQUB &10                        ; Dot beyond distance: 16
	EQUB &20                        ; Hull strength: 32
	EQUB &0A                        ; Maximum speed: 0.10 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &01                        ; Faces data info offset hi
	EQUB &02                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &00                        ; 00000...: Laser class 0
	                                ; .....000: 0 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.transporter_vertices
	EQUB &00, &0A, &1A, &3F, &06, &77
	EQUB &19, &04, &1A, &BF, &01, &77
	EQUB &1C, &03, &1A, &FF, &01, &22
	EQUB &19, &08, &1A, &FF, &02, &33
	EQUB &1A, &08, &1A, &7F, &03, &44
	EQUB &1D, &03, &1A, &7F, &04, &55
	EQUB &1A, &04, &1A, &3F, &05, &66
	EQUB &00, &06, &0C, &13, &FF, &FF
	EQUB &1E, &01, &0C, &DF, &17, &89
	EQUB &21, &08, &0C, &DF, &12, &39
	EQUB &21, &08, &0C, &5F, &34, &5A
	EQUB &1E, &01, &0C, &5F, &56, &AB
	EQUB &0B, &02, &1E, &DF, &89, &CD
	EQUB &0D, &08, &1E, &DF, &39, &DD
	EQUB &0E, &08, &1E, &5F, &3A, &DD
	EQUB &0B, &02, &1E, &5F, &AB, &CD
	EQUB &05, &06, &02, &87, &77, &77
	EQUB &12, &03, &02, &87, &77, &77
	EQUB &05, &07, &07, &A7, &77, &77
	EQUB &12, &04, &07, &A7, &77, &77
	EQUB &0B, &06, &0E, &A7, &77, &77
	EQUB &0B, &05, &07, &A7, &77, &77
	EQUB &05, &07, &0E, &27, &66, &66
	EQUB &12, &04, &0E, &27, &66, &66
	EQUB &0B, &05, &07, &27, &66, &66
	EQUB &05, &06, &03, &27, &66, &66
	EQUB &12, &03, &03, &27, &66, &66
	EQUB &0B, &04, &08, &07, &66, &66
	EQUB &0B, &05, &03, &27, &66, &66
	EQUB &10, &08, &0D, &E6, &33, &33
	EQUB &10, &08, &10, &C6, &33, &33
	EQUB &11, &08, &0D, &66, &33, &33
	EQUB &11, &08, &10, &46, &33, &33
	EQUB &0D, &03, &1A, &E8, &00, &00
	EQUB &0D, &03, &1A, &68, &00, &00
	EQUB &09, &03, &1A, &25, &00, &00
	EQUB &08, &03, &1A, &A5, &00, &00

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.transporter_edges
	EQUB &1F, &07, &00, &04
	EQUB &1F, &01, &04, &08
	EQUB &1F, &02, &08, &0C
	EQUB &1F, &03, &0C, &10
	EQUB &1F, &04, &10, &14
	EQUB &1F, &05, &14, &18
	EQUB &1F, &06, &00, &18
	EQUB &10, &67, &00, &1C
	EQUB &1F, &17, &04, &20
	EQUB &0B, &12, &08, &24
	EQUB &1F, &23, &0C, &24
	EQUB &1F, &34, &10, &28
	EQUB &0B, &45, &14, &28
	EQUB &1F, &56, &18, &2C
	EQUB &11, &78, &1C, &20
	EQUB &11, &19, &20, &24
	EQUB &11, &5A, &28, &2C
	EQUB &11, &6B, &1C, &2C
	EQUB &13, &BC, &1C, &3C
	EQUB &13, &8C, &1C, &30
	EQUB &10, &89, &20, &30
	EQUB &1F, &39, &24, &34
	EQUB &1F, &3A, &28, &38
	EQUB &10, &AB, &2C, &3C
	EQUB &1F, &9D, &30, &34
	EQUB &1F, &3D, &34, &38
	EQUB &1F, &AD, &38, &3C
	EQUB &1F, &CD, &30, &3C
	EQUB &07, &77, &40, &44
	EQUB &07, &77, &48, &4C
	EQUB &07, &77, &4C, &50
	EQUB &07, &77, &48, &50
	EQUB &07, &77, &50, &54
	EQUB &07, &66, &58, &5C
	EQUB &07, &66, &5C, &60
	EQUB &07, &66, &60, &58
	EQUB &07, &66, &64, &68
	EQUB &07, &66, &68, &6C
	EQUB &07, &66, &64, &6C
	EQUB &07, &66, &6C, &70
	EQUB &06, &33, &74, &78
	EQUB &06, &33, &7C, &80
	EQUB &08, &00, &84, &88
	EQUB &05, &00, &88, &8C
	EQUB &05, &00, &8C, &90
	EQUB &05, &00, &90, &84

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.transporter_faces
	EQUB &3F, &00, &00, &67
	EQUB &BF, &6F, &30, &07
	EQUB &FF, &69, &3F, &15
	EQUB &5F, &00, &22, &00
	EQUB &7F, &69, &3F, &15
	EQUB &3F, &6F, &30, &07
	EQUB &1F, &08, &20, &03
	EQUB &9F, &08, &20, &03
	EQUB &93, &08, &22, &0B
	EQUB &9F, &4B, &20, &4F
	EQUB &1F, &4B, &20, &4F
	EQUB &13, &08, &22, &0B
	EQUB &1F, &00, &26, &11
	EQUB &1F, &00, &00, &79

.transporter_end
