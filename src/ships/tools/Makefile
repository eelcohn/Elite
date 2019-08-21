# --------------------------------------------------------------------------- #
# Elite ship extractor - Makefile                                             #
#                                                                             #
# (c) Eelco Huininga 2019                                                     #
# --------------------------------------------------------------------------- #

# --------------------------------------------------------------------------- #
# First we'll set all the variables                                           #
# --------------------------------------------------------------------------- #

# Define the program title
TITLE = Elite ship extractor

# Define which compiler we want to use
CC = gcc

# --------------------------------------------------------------------------- #
# Set the compiler flags:                                                     #
#  -Wall         turns on most, but not all, compiler warnings                #
#  -Wall -Wextra turns on almost all compiler warnings                        #
#  -O2           do some code optimizations when compiling                    #
# --------------------------------------------------------------------------- #
CFLAGS = -O2 -Wall -Wextra -Wpedantic

# define any directories containing header files other than /usr/include
INCLUDES = 

# define library paths in addition to /usr/lib
LDFLAGS = 

# define any libraries to link into executable:
LIBS = 

# define the C source files
MAIN_SRCS = ship-extractor.c

# define the C object files
OBJS	= $(MAIN_SRCS:.cpp=.o)

# define the executable file
MAIN	= ship-extractor
MAIN_LINK	= main_link

# define the install location
INSTALL_PATH	= ..



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
%.o: %.cpp
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

all:	$(MAIN) $(MAIN_LINK)
	@echo
	@echo Done! The $(TITLE) is compiled.
	
$(MAIN): $(OBJS)

main_link:
	@echo Linking $(MAIN)...
	$(CC) $(CFLAGS) $(INCLUDES) -o $(MAIN) $(OBJS) $(LDFLAGS) $(LIBS)

install:
	@echo Installing $(MAIN)...
	@install -m 755 $(MAIN) $(INSTALL_PATH)
	@strip $(INSTALL_PATH)/$(MAIN)
	@echo
	@echo Done! The $(TITLE) is installed.

clean:
	@$(RM) $(OBJS) $(MAIN)

help:
	@echo "$(TITLE) - Makefile help"
	@echo ""
	@echo Options
	@echo "   make"
	@echo "      Compile the sourcecode."
	@echo ""
	@echo "   make install"
	@echo "      Install the compiled sourcecode."
	@echo ""
	@echo "   make clean"
	@echo "      Remove all like object (.o) files and the compiled binaries."
	@echo ""
	@echo "   make help"
	@echo "      Show this help screen."
