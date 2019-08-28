; -----------------------------------------------------------------------------
; Elite - Anaconda data (type &0E)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

anaconda_attr = %10100001               ; 1....... bit 7: Escape pod present
                                        ; .0...... bit 6: Galcop police ship
                                        ; ..1..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......0. bit 1: Ship is a bounty hunter
                                        ; .......1 bit 0: Ship is a trader

.anaconda_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.anaconda_header
	EQUB &07                        ; 0000....: cargo type if scooped: none
	                                ; ....0111: max pieces of debris if destroyed: 7
	EQUW &2710                      ; Area for missile lock
	EQUB &6E                        ; Edges data info offset lo
	EQUB &D2                        ; Faces data info offset lo
	EQUB &59                        ; Ship lines stack: 22 (4*max_visible_edges+1)
	EQUB &30                        ; Gun vertex: 12 (vertex*4)
	EQUB &2E                        ; Explosion count: 10 (4*n+6)
	EQUB &5A                        ; Vertices: 15 (n*6)
	EQUB &19                        ; Edges: 25
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &30                        ; Faces: 12 (n*4)
	EQUB &32                        ; Dot beyond distance: 50
	EQUB &FC                        ; Hull strength: 252
	EQUB &0E                        ; Maximum speed: 0.14 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &3F                        ; 00111...: Laser class 7
	                                ; .....111: 7 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.anaconda_vertices
	EQUB &00, &07, &3A, &3E, &01, &55
	EQUB &2B, &0D, &25, &FE, &01, &22
	EQUB &1A, &2F, &03, &FE, &02, &33
	EQUB &1A, &2F, &03, &7E, &03, &44
	EQUB &2B, &0D, &25, &7E, &04, &55
	EQUB &00, &30, &31, &3E, &15, &66
	EQUB &45, &0F, &0F, &BE, &12, &77
	EQUB &2B, &27, &28, &DF, &23, &88
	EQUB &2B, &27, &28, &5F, &34, &99
	EQUB &45, &0F, &0F, &3E, &45, &AA
	EQUB &2B, &35, &17, &BF, &FF, &FF
	EQUB &45, &01, &20, &DF, &27, &88
	EQUB &00, &00, &FE, &1F, &FF, &FF
	EQUB &45, &01, &20, &5F, &49, &AA
	EQUB &2B, &35, &17, &3F, &FF, &FF

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.anaconda_edges
	EQUB &1E, &01, &00, &04
	EQUB &1E, &02, &04, &08
	EQUB &1E, &03, &08, &0C
	EQUB &1E, &04, &0C, &10
	EQUB &1E, &05, &00, &10
	EQUB &1D, &15, &00, &14
	EQUB &1D, &12, &04, &18
	EQUB &1D, &23, &08, &1C
	EQUB &1D, &34, &0C, &20
	EQUB &1D, &45, &10, &24
	EQUB &1E, &16, &14, &28
	EQUB &1E, &17, &18, &28
	EQUB &1E, &27, &18, &2C
	EQUB &1E, &28, &1C, &2C
	EQUB &1F, &38, &1C, &30
	EQUB &1F, &39, &20, &30
	EQUB &1E, &49, &20, &34
	EQUB &1E, &4A, &24, &34
	EQUB &1E, &5A, &24, &38
	EQUB &1E, &56, &14, &38
	EQUB &1E, &6B, &28, &38
	EQUB &1F, &7B, &28, &30
	EQUB &1F, &78, &2C, &30
	EQUB &1F, &9A, &30, &34
	EQUB &1F, &AB, &30, &38

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.anaconda_faces
	EQUB &7E, &00, &33, &31
	EQUB &BE, &33, &12, &57
	EQUB &FE, &4D, &39, &13
	EQUB &5F, &00, &5A, &10
	EQUB &7E, &4D, &39, &13
	EQUB &3E, &33, &12, &57
	EQUB &3E, &00, &6F, &14
	EQUB &9F, &61, &48, &18
	EQUB &DF, &6C, &44, &22
	EQUB &5F, &6C, &44, &22
	EQUB &1F, &61, &48, &18
	EQUB &1F, &00, &5E, &12

.anaconda_end
