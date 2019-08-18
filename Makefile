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
SRCFILES = Elite2.asm Elite3.asm D.Code.asm T.Code.asm
TXTFILES = Elite.txt

BINFILES = $(SRCFILES:.asm=.bin)


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

%.bin: src/%.asm
	$(BEEBASM) $(BEEBASMFLAGS) -i $< -o bin/$@

txtfiles: src/$(TXTFILES)
	cp $< bin/

elitedisc: $(BINFILES)
	$(BEEBASM) $(BEEBASMFLAGS) -i $< -do $(DISCIMAGE)

clean:
	rm -rf bin

clean-all: clean-beebasm clean-disc clean

clean-beebasm:
	rm -rf beebasm

clean-disc:
	rm -f $(DISCIMAGE)

