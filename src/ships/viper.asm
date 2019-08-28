; -----------------------------------------------------------------------------
; Elite - Viper data (type &10)
; written by David Braben and Ian Bell (c) Acornsoft 1984
; -----------------------------------------------------------------------------

viper_attr = %11000010                  ; 1....... bit 7: Escape pod present
                                        ; .1...... bit 6: Galcop police ship
                                        ; ..0..... bit 5: Ship is protected by spacestation
                                        ; ...0.... bit 4: Ship is docking
                                        ; ....0... bit 3: Ship is a pirate
                                        ; .....0.. bit 2: Ship is attacking you
                                        ; ......1. bit 1: Ship is a bounty hunter
                                        ; .......0 bit 0: Ship is a trader

.viper_start

; -----------------------------------------------------------------------------
; Hull data header info
; -----------------------------------------------------------------------------
.viper_header
	EQUB &00                        ; 0000....: cargo type if scooped: none
	                                ; ....0000: max pieces of debris if destroyed: 0
	EQUW &15F9                      ; Area for missile lock
	EQUB &6E                        ; Edges data info offset lo
	EQUB &BE                        ; Faces data info offset lo
	EQUB &4D                        ; Ship lines stack: 19 (4*max_visible_edges+1)
	EQUB &00                        ; Gun vertex: 0 (vertex*4)
	EQUB &2A                        ; Explosion count: 9 (4*n+6)
	EQUB &5A                        ; Vertices: 15 (n*6)
	EQUB &14                        ; Edges: 20
	EQUW &0100                      ; Bounty: 0.0 Cr
	EQUB &1C                        ; Faces: 7 (n*4)
	EQUB &17                        ; Dot beyond distance: 23
	EQUB &64                        ; Hull strength: 100
	EQUB &20                        ; Maximum speed: 0.32 LM
	EQUB &00                        ; Edges data info offset hi
	EQUB &00                        ; Faces data info offset hi
	EQUB &01                        ; Scaling of normals to make large objects' normals flare out further away (Q%)
	EQUB &11                        ; 00010...: Laser class 2
	                                ; .....001: 1 missiles

; -----------------------------------------------------------------------------
; Vertices data
; -----------------------------------------------------------------------------
.viper_vertices
	EQUB &00, &00, &48, &1F, &21, &43
	EQUB &00, &10, &18, &1E, &10, &22
	EQUB &00, &10, &18, &5E, &43, &55
	EQUB &30, &00, &18, &3F, &42, &66
	EQUB &30, &00, &18, &BF, &31, &66
	EQUB &18, &10, &18, &7E, &54, &66
	EQUB &18, &10, &18, &FE, &35, &66
	EQUB &18, &10, &18, &3F, &20, &66
	EQUB &18, &10, &18, &BF, &10, &66
	EQUB &20, &00, &18, &B3, &66, &66
	EQUB &20, &00, &18, &33, &66, &66
	EQUB &08, &08, &18, &33, &66, &66
	EQUB &08, &08, &18, &B3, &66, &66
	EQUB &08, &08, &18, &F2, &66, &66
	EQUB &08, &08, &18, &72, &66, &66

; -----------------------------------------------------------------------------
; Edges data
; -----------------------------------------------------------------------------
.viper_edges
	EQUB &1F, &42, &00, &0C
	EQUB &1E, &21, &00, &04
	EQUB &1E, &43, &00, &08
	EQUB &1F, &31, &00, &10
	EQUB &1E, &20, &04, &1C
	EQUB &1E, &10, &04, &20
	EQUB &1E, &54, &08, &14
	EQUB &1E, &53, &08, &18
	EQUB &1F, &60, &1C, &20
	EQUB &1E, &65, &14, &18
	EQUB &1F, &61, &10, &20
	EQUB &1E, &63, &10, &18
	EQUB &1F, &62, &0C, &1C
	EQUB &1E, &46, &0C, &14
	EQUB &13, &66, &24, &30
	EQUB &12, &66, &24, &34
	EQUB &13, &66, &28, &2C
	EQUB &12, &66, &28, &38
	EQUB &10, &66, &2C, &38
	EQUB &10, &66, &30, &34

; -----------------------------------------------------------------------------
; Faces/normals data
; -----------------------------------------------------------------------------
.viper_faces
	EQUB &1F, &00, &20, &00
	EQUB &9F, &16, &21, &0B
	EQUB &1F, &16, &21, &0B
	EQUB &DF, &16, &21, &0B
	EQUB &5F, &16, &21, &0B
	EQUB &5F, &00, &20, &00
	EQUB &3F, &00, &00, &30

.viper_end
