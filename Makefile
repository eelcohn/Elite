# --------------------------------------------------------------------------- #
# Elite (c) Acornsoft 1984                                                    #
#                                                                             #
# written by Eelco Huininga 2019                                              #
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# First we'll set all the variables                                           #
# --------------------------------------------------------------------------- #
# Define which compiler we want to use                                        #
# --------------------------------------------------------------------------- #
CC = beebasm

# --------------------------------------------------------------------------- #
# Set the compiler flags:                                                     #
#  -g            adds debugging information to the executable file            #
#  -Wall         turns on most, but not all, compiler warnings                #
#  -Wall -Wextra turns on almost all compiler warnings                        #
#  -O2           do some code optimizations when compiling                    #
#  -std=c++11    turns on compiler and library support for the 2011 C++       #
#                standard (needed for thread support)                         #
# --------------------------------------------------------------------------- #
CFLAGS = -g -O3 -std=c++11 -Wall -Wextra

# define any directories containing header files other than /usr/include
INCLUDES = .

# define library paths in addition to /usr/lib
LDFLAGS = .

# define any libraries to link into executable:
LIBS =	-lcrypto \
	-lssl

# define the C source files
ELITE_SRCS = \
	src/Elite3.asm \
	src/D.Code.asm \
	src/T.Code.asm

# define the executable file
ELITE_DISC	= Elite-Multiplayer.ssd



# --------------------------------------------------------------------------- #
# The following part of the makefile is generic; it can be used to            #
# build any executable just by changing the definitions above and by          #
# deleting dependencies appended to the file from 'make depend'               #
# --------------------------------------------------------------------------- #
# this is a suffix replacement rule for building .o's from .c's it uses       #
# automatic variables $<: the name of the prerequisite of the rule(a .c file) #
# and $@: the name of the target of the rule (a .o file) (see the gnu make    #
# manual section about automatic variables)                                   #
# --------------------------------------------------------------------------- #
%: %.asm
	$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

all:	$(CLIENT) cert
	@echo
	@echo Done! Elite Mulitplayer is compiled.
	
$(CLIENT): $(ELITE_SRCS)
	@echo Creating disc image...
	@rem todo

clean:
	@$(RM) $(CLIENT_OBJS) $(CLIENT) config.h
	@$(RM) *~

depend: $(MAIN_SRCS)
	makedepend $(INCLUDES) $^

help:
	@echo Options
	@echo "   make | make all"
	@echo "      Compile the sourcecode."
	@echo ""
	@echo "   make clean"
	@echo "      Remove all like object (.o) files and the compiled binaries (FileStore and client)."
	@echo ""
	@echo "   make help"
	@echo "      Show this help screen."
