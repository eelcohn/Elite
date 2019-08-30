# --------------------------------------------------------------------------- #
# Elite (c) Acornsoft 1984                                                    #
#                                                                             #
# re-written for BeebAsm by Eelco Huininga 2019                               #
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# First we'll set all the variables                                           #
# --------------------------------------------------------------------------- #
# Define which compiler we want to use                                        #
# --------------------------------------------------------------------------- #
BEEBASM = beebasm/beebasm

# --------------------------------------------------------------------------- #
# Define the compiler flags                                                   #
# --------------------------------------------------------------------------- #
BEEBASMFLAGS = 

# --------------------------------------------------------------------------- #
# Name of the disc image                                                      #
# --------------------------------------------------------------------------- #
DISCIMAGE = Elite.ssd

# --------------------------------------------------------------------------- #
# Source files                                                                #
# --------------------------------------------------------------------------- #
SRCFILES = \
	src/Elite2.asm \
	src/Elite3.asm \
	src/D.Code.asm \
	src/T.Code.asm \
	src/D.MOA.asm \
	src/D.MOB.asm \
	src/D.MOC.asm \
	src/D.MOD.asm \
	src/D.MOE.asm \
	src/D.MOF.asm \
	src/D.MOG.asm \
	src/D.MOH.asm \
	src/D.MOI.asm \
	src/D.MOJ.asm \
	src/D.MOK.asm \
	src/D.MOL.asm \
	src/D.MOM.asm \
	src/D.MON.asm \
	src/D.MOO.asm \
	src/D.MOP.asm

TXTFILES = Elite.txt

BINFILES = $(SRCFILES:.asm=.bin)

SHIPFILES = *.asm


# --------------------------------------------------------------------------- #
# Make targets                                                                #
# --------------------------------------------------------------------------- #
all: mkbindir beebasm $(BINFILES) txtfiles

mkbindir:
ifeq (,$(wildcard ./bin))
	@mkdir ./bin
endif

beebasm:
ifeq (,$(wildcard ./beebem))
	git clone https://github.com/stardot/beebasm
endif
ifeq (,$(wildcard ./beebem/beebem))
	cd beebasm/src/ && make code
endif

%.bin: %.asm
	$(BEEBASM) $(BEEBASMFLAGS) -i $< -o bin/$@

txtfiles: src/$(TXTFILES)
	cp $< bin/

ships: src/ships/$(SHIPFILES)
	@for ship in $^ ; do \	
		@echo "ORG &0000" > src/ships/tmp.asm ; \
		@echo ".start" >> src/ships/tmp.asm ; \
		@cat $< >> src/ships/tmp.asm ; \
		@echo ".end" >> src/ships/tmp.asm ; \
		@echo "SAVE \"bin/$@.bin\", start, end, start, start" >> src/ships/tmp.asm ; \
		$(BEEBASM) $(BEEBASMFLAGS) -i src/ships/tmp.asm -o bin/$(ship) ; \
		@rm src/ships/tmp.asm ; \
	done

elitedisc: $(BINFILES)
	$(BEEBASM) $(BEEBASMFLAGS) -i $< -do $(DISCIMAGE)

clean:
	rm -rf bin

clean-all: clean-beebasm clean-disc clean

clean-beebasm:
	rm -rf beebasm

clean-disc:
	rm -f $(DISCIMAGE)
