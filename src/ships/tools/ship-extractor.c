#include <stdio.h>			// Included for NULL, printf(), FILE*, fopen(), fgets(), feof() and fclose()
#include <stdlib.h>			// exit()
#include <string.h>			// strncpy(), strncat()
#include "ship-extractor.h"		// validate()

#define VERSION "0.01"
#define MAX_SHIPS 32

#define BINARY_LASERS(byte)  \
	(byte & 0x80 ? '1' : '0'), \
	(byte & 0x40 ? '1' : '0'), \
	(byte & 0x20 ? '1' : '0'), \
	(byte & 0x10 ? '1' : '0'), \
	(byte & 0x08 ? '1' : '0')

#define BINARY_MISSILES(byte)  \
	(byte & 0x04 ? '1' : '0'), \
	(byte & 0x02 ? '1' : '0'), \
	(byte & 0x01 ? '1' : '0')

#define BINARY_SCOOPINFO(byte)  \
	(byte & 0x80 ? '1' : '0'), \
	(byte & 0x40 ? '1' : '0'), \
	(byte & 0x20 ? '1' : '0'), \
	(byte & 0x10 ? '1' : '0')

#define BINARY_DEBRISINFO(byte)  \
	(byte & 0x08 ? '1' : '0'), \
	(byte & 0x04 ? '1' : '0'), \
	(byte & 0x02 ? '1' : '0'), \
	(byte & 0x01 ? '1' : '0')

#define BINARY_ATTRIBUTES(byte)  \
	(byte & 0x80 ? '1' : '0'), \
	(byte & 0x40 ? '1' : '0'), \
	(byte & 0x20 ? '1' : '0'), \
	(byte & 0x10 ? '1' : '0'), \
	(byte & 0x08 ? '1' : '0'), \
	(byte & 0x04 ? '1' : '0'), \
	(byte & 0x02 ? '1' : '0'), \
	(byte & 0x01 ? '1' : '0')

#define BINARY_BIT(byte, bit) \
	(byte & (0x01 << bit) ? '1' : '0')

const char *ship_id[] = {	// * = not sure yet, check against http://wiki.alioth.net/index.php/Classic_Elite_ships_firepower
	"--none--",		// 00 Unused
	"missile",		// 01
	"spacestation",		// 02
	"escape_pod",		// 03
	"alloy",		// 04
	"barrel",		// 05 (difference between D.MOA-D.MOP (D.MOA &0245) and D.MOT (&0095)
	"boulder",		// 06
	"asteroid",		// 07
	"splinter",		// 08 (difference between D.MOC/D/K/N, D.MOH, D.MOO and D.MOP
	"shuttle",		// 09 * difference between D.MOH and D.Code
	"transporter",		// 0A * difference between D.MOF and D.Code
	"cobra_mk3",		// 0B
	"python",		// 0C
	"boa",			// 0D
	"anaconda",		// 0E
	"ship0F_unknown",	// 0F *
	"viper",		// 10
	"sidewinder",		// 11
	"mamba",		// 12
	"krait",		// 13
	"adder",		// 14
	"gecko",		// 15
	"cobra_mk1-unsure",	// 16
	"worm",			// 17
	"cobra_mk3_pirate",	// 18
	"asp",			// 19 *
	"python_pirate",	// 1A *
	"fer-de-lance",		// 1B
	"moray",		// 1C *
	"thargoid",		// 1D *
	"thargon",		// 1E *
	"constrictor"		// 1F
};

const char *ship_desc[] = {
	"--none--",
	"Missile",
	"Space station",
	"Escape pod",
	"Plate/Alloy",
	"Barrel",
	"Boulder",
	"Asteroid",
	"Splinter",
	"Shuttle",
	"Transporter",
	"Cobra MkIII",
	"Python",
	"Boa",
	"Anaconda",
	"Ship &0F unknown",
	"Viper",
	"Sidewinder",
	"Mamba",
	"Krait",
	"Adder",
	"Gecko",
	"Cobra MkI",
	"Worm",
	"Cobra MkIII (pirate)",
	"Asp Mk2",
	"Python (pirate)",
	"Fer de Lance",
	"Moray",
	"Thargoid",
	"Thargon",
	"Constrictor"
};

const char *goods[] = {
	"none",
	"textiles",
	"radioactives",
	"slaves",
	"liquor_wines",
	"luxuries",
	"narcotics",
	"computers",
	"machinery",
	"alloys",
	"firearms",
	"gold",
	"platinum",
	"gem_stones",
	"alien_items",
	"food"
};

unsigned short	ship_pointers[MAX_SHIPS];
unsigned char	ship_attr[MAX_SHIPS];

int main(int argc, char** argv) {
	FILE		*fp_in, *fp_binout, *fp_txtout;
	char		filename_binout[300], filename_txtout[300];
	char		ship_id_string[8], ship_attr_string[8];
	unsigned char	ship_header[0x14];
	unsigned char	byte;
	int		scoop_type;
	int		i, j, k;
	long int	ship_start, ship_end;

	printf("Elite ship data extractor v" VERSION "\n");
	printf("written by Eelco Huininga 2019\n");
	printf("\n");

	if (argc != 2) {
		printf("Usage: %s <filename>\n", argv[0]);
		exit(1);
	}

	fp_in = fopen(argv[1], "rb");
	if (fp_in == NULL) {
		printf("Cannot open input file %s\n", argv[1]);
		exit(1);
	} else {
		fseek(fp_in, 0L, SEEK_END);
		if (ftell(fp_in) != 0x0A00) {
			printf("Warning: file is most likely not an Elite ship data file (wrong file size)\n");
		}
		rewind(fp_in);

		/* Read ship pointers */
		for (i = 1; i < MAX_SHIPS; i++) {
			ship_pointers[i] = (fgetc(fp_in) + (fgetc(fp_in) * 256));

			/* Check if the first entry points to the missile data */
			if ((i == 1) && (ship_pointers[1] != 0x7F00)) {
				printf("Warning: file is most likely not an Elite ship data file (missing 0x7F00 header)\n");
			}
		}

		/* Read ship attributes */
		for (i = 1; i < MAX_SHIPS; i++) {
			ship_attr[i] = fgetc(fp_in);
		}

		/* Check some values for validity */
		validate();

		/* Generate assembler source file */
		generate_d_mox_asm(argv[1]);

		ship_end = 0x565D;

		/* Read ship data */
		for (i = 1; i < MAX_SHIPS; i++) {
			if (ship_pointers[i] != 0x0000) {
				fseek(fp_in, (ship_pointers[i] - 0x5600), SEEK_SET);
				ship_start = 0x5600 + ftell(fp_in);
				printf("Found ship id &%02X (%s) with attribute &%02X at &%04X\n", i, ship_desc[i], ship_attr[i], (unsigned int)ship_start);

				if (i != 1) {
					if (ship_start != ship_end) {
						printf("Warning: ship_start %04X does not match ship_end %04X.\n", (unsigned int)ship_start, (unsigned int)ship_end);
					}

					/* The ship pointer should match i (the current program counter) */
					if (ship_pointers[i] != ship_start) {
						printf("Warning: ship_pointer for %02X is %04X, but this does not match with %04X\n", i, ship_pointers[i], (unsigned int)ship_start);
					}
				}

				if ((i != 1) && (ship_pointers[i] != 0x7F00)) {
					/* Prepare the output filenames */
					sprintf(ship_id_string, "%02X", i);
					sprintf(ship_attr_string, "%02X", ship_attr[i]);
					strncpy(filename_binout, argv[1], sizeof(filename_binout)-1);
					strncat(filename_binout, "-", sizeof(filename_binout)-1);
	//				strncat(filename_binout, ship_id_string, sizeof(filename_binout)-1);
					strncat(filename_binout, ship_id[i], sizeof(filename_binout)-1);
					strncat(filename_binout, "-", sizeof(filename_binout)-1);
					strncat(filename_binout, ship_attr_string, sizeof(filename_binout)-1);
					strncpy(filename_txtout, filename_binout, sizeof(filename_txtout)-1);
					strncat(filename_binout, ".bin", sizeof(filename_binout)-1);
					strncat(filename_txtout, ".asm", sizeof(filename_txtout)-1);

					/* Open binary output file */
					if ((fp_binout = fopen(filename_binout, "wb")) == NULL) {
						printf("Cannot open binary output file %s\n", filename_binout);
						exit(1);
					}

					/* Open assembler output file */
					if ((fp_txtout = fopen(filename_txtout, "wb")) == NULL) {
						printf("Cannot open assembler output file %s\n", filename_binout);
						exit(1);
					}

					/* Write header to binary output file */
					for (j = 0; j < 0x14; j++) {
						ship_header[j] = fgetc(fp_in);
						fputc(ship_header[j], fp_binout);
					}

					scoop_type = ((ship_header[0] & 0xF0) == 0) ? 0 : ((ship_header[0] & 0xF0) >> 4) + 1;
					
					/* Write header to text output file */
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, "; Elite - %s data (type &%02X)\n", ship_desc[i], i);
					fprintf(fp_txtout, "; written by David Braben and Ian Bell (c) Acornsoft 1984\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, "%s_attributes = %%%c%c%c%c%c%c%c%c        ; %c....... bit 7: Escape pod present\n", ship_id[i], BINARY_ATTRIBUTES(ship_attr[i]), BINARY_BIT(ship_attr[i], 7));
					fprintf(fp_txtout, "                                        ; .%c...... bit 6: Galcop police ship\n", BINARY_BIT(ship_attr[i], 6));
					fprintf(fp_txtout, "                                        ; ..%c..... bit 5: Ship is protected by spacestation\n", BINARY_BIT(ship_attr[i], 5));
					fprintf(fp_txtout, "                                        ; ...%c.... bit 4: Ship is docking\n", BINARY_BIT(ship_attr[i], 4));
					fprintf(fp_txtout, "                                        ; ....%c... bit 3: Ship is a pirate\n", BINARY_BIT(ship_attr[i], 3));
					fprintf(fp_txtout, "                                        ; .....%c.. bit 2: Ship is attacking you\n", BINARY_BIT(ship_attr[i], 2));
					fprintf(fp_txtout, "                                        ; ......%c. bit 1: Ship is a bounty hunter\n", BINARY_BIT(ship_attr[i], 1));
					fprintf(fp_txtout, "                                        ; .......%c bit 0: Ship is a trader\n", BINARY_BIT(ship_attr[i], 0));
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, ".%s_start\n", ship_id[i]);
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, "; Hull data header info\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, ".%s_header\n", ship_id[i]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; %c%c%c%c....: cargo type if scooped: %s\n", ship_header[0], BINARY_SCOOPINFO(ship_header[0]), goods[scoop_type]);
					fprintf(fp_txtout, "	                                ; ....%c%c%c%c: max pieces of debris if destroyed: %d\n", BINARY_DEBRISINFO(ship_header[0]), (ship_header[0] & 0x0F));
					fprintf(fp_txtout, "	EQUW &%04X                      ; Area for missile lock\n", (ship_header[1] + (ship_header[2] * 256)));
					fprintf(fp_txtout, "	EQUB &%02X                        ; Edges data info offset lo\n", ship_header[3]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Faces data info offset lo\n", ship_header[4]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Ship lines stack: %d (4*max_visible_edges+1)\n", ship_header[5], ((ship_header[5] - 1) / 4));
					fprintf(fp_txtout, "	EQUB &%02X                        ; Gun vertex: %d (vertex*4)\n", ship_header[6], (ship_header[6] / 4));
					fprintf(fp_txtout, "	EQUB &%02X                        ; Explosion count: %d (4*n+6)\n", ship_header[7], ((ship_header[7] - 6) / 4));
					fprintf(fp_txtout, "	EQUB &%02X                        ; Vertices: %d (n*6)\n", ship_header[8], (ship_header[8] / 6));
					fprintf(fp_txtout, "	EQUB &%02X                        ; Edges: %d\n", ship_header[9], ship_header[9]);
					fprintf(fp_txtout, "	EQUW &%04X                      ; Bounty: %.1f Cr\n", (ship_header[10] + (ship_header[11] + 256)), (float)((ship_header[10] + (ship_header[11] * 256))) / 10);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Faces: %d (n*4)\n", ship_header[12], (ship_header[12] / 4));
					fprintf(fp_txtout, "	EQUB &%02X                        ; Dot beyond distance: %d\n", ship_header[13], ship_header[13]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Hull strength: %d\n", ship_header[14], ship_header[14]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Maximum speed: 0.%02d LM\n", ship_header[15], ship_header[15]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Edges data info offset hi\n", ship_header[16]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Faces data info offset hi\n", ship_header[17]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; Scaling of normals to make large objects' normals flare out further away (Q%%)\n", ship_header[18]);
					fprintf(fp_txtout, "	EQUB &%02X                        ; %c%c%c%c%c...: Laser class %i\n", ship_header[19], BINARY_LASERS(ship_header[19]), (ship_header[19] >> 3));
					fprintf(fp_txtout, "	                                ; .....%c%c%c: %i missiles\n", BINARY_MISSILES(ship_header[19]), (ship_header[19] & 0x07));
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, "; Vertices data\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, ".%s_vertices\n", ship_id[i]);

					/* Vertices */
					k = 0;
					for (j = 0; j < ship_header[0x08]; j++) {
						byte = fgetc(fp_in);
						if (k == 0) {
							fprintf(fp_txtout, "	EQUB &%02X", byte);
						} else {
							fprintf(fp_txtout, ", &%02X", byte);
						}
						fputc(byte, fp_binout);
						k++;
						if (k == 6) {
							fprintf(fp_txtout, "\n");
							k = 0;
						}
					}

					/* Edges */
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, "; Edges data\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, ".%s_edges\n", ship_id[i]);
					k = 0;
					for (j = 0; j < (ship_header[0x09] * 4); j++) {
						byte = fgetc(fp_in);
						if (k == 0) {
							fprintf(fp_txtout, "	EQUB &%02X", byte);
						} else {
							fprintf(fp_txtout, ", &%02X", byte);
						}
						k++;
						fputc(byte, fp_binout);
						if (k == 4) {
							fprintf(fp_txtout, "\n");
							k = 0;
						}
					}

					/* Faces/Normals */
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, "; Faces/normals data\n");
					fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
					fprintf(fp_txtout, ".%s_faces\n", ship_id[i]);
					k = 0;
					for (j = 0; j < ship_header[0x0C]; j++) {
						byte = fgetc(fp_in);
						if (k == 0) {
							fprintf(fp_txtout, "	EQUB &%02X", byte);
						} else {
							fprintf(fp_txtout, ", &%02X", byte);
						}
						fputc(byte, fp_binout);
						k++;
						if (k == 4) {
							fprintf(fp_txtout, "\n");
							k = 0;
						}
					}

					/* Footer */
					fprintf(fp_txtout, "\n");
					fprintf(fp_txtout, ".%s_end\n", ship_id[i]);
					ship_end = 0x5600 + ftell(fp_in);
					fclose(fp_binout);
					fclose(fp_txtout);
				}
			}
		}
		fclose(fp_in);
	}
}

void validate(void) {
	int	i;

	for (i = 0; i < MAX_SHIPS; i++) {
		switch (ship_pointers[i]) {
			case 0x0000 :	/* Unused ship entry */
				if (ship_attr[i] != 0) {
					printf("Warning: ship %i has no pointer but does have an attribute defined.\n", i);
				}
				break;

			case 0x7F00 :	/* Missile: always located at 0x7F00 */
				if (i != 1) {
					printf("Warning: ship %i points to missile data.\n", i);
				}
				break;

			default :	/* Regular ship entry */
				if ((ship_pointers[i] < 0x5600) || (ship_pointers[i] > 0x6000)) {
					printf("Warning: pointer to ship %i is out of range (%04X)\n", i, ship_pointers[i]);
				}
				break;
		}
	}
}

void generate_d_mox_asm(const char *filename) {
	char	filename_moxout[300];
	FILE	*fp_moxout;
	int	i;

	strncpy(filename_moxout, filename, sizeof(filename_moxout)-1);
	strncat(filename_moxout, ".asm", sizeof(filename_moxout)-1);
	if ((fp_moxout = fopen(filename_moxout, "wb")) == NULL) {
		printf("Cannot open assembler output file %s\n", filename_moxout);
		exit(1);
	} else {
		fprintf(fp_moxout, "; -----------------------------------------------------------------------------\n");
		fprintf(fp_moxout, "; Elite - Ship data\n");
		fprintf(fp_moxout, "; written by David Braben and Ian Bell (c) Acornsoft 1984\n");
		fprintf(fp_moxout, "; Filename       : %s\n", filename);
		fprintf(fp_moxout, "; Load address   : 00005600\n");
		fprintf(fp_moxout, "; Exec address   : 00005600\n");
		fprintf(fp_moxout, "; Length         : 00000A00\n");
		fprintf(fp_moxout, "; -----------------------------------------------------------------------------\n");
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, "ship_attr_none = %%00000000\n");
		fprintf(fp_moxout, "ship_none      = &0000\n");
		fprintf(fp_moxout, "ship_missile   = &7F00\n");
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, "ORG &5600\n");
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, ".start\n");
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, ".ship_pointers\n");
		for (i = 1; i < MAX_SHIPS; i++) {
			if (ship_pointers[i] != 0x0000) {
				fprintf(fp_moxout, "	EQUW ship_%s               ; Ship type %02X: %s\n", ship_id[i], i, ship_desc[i]);
			} else {
				fprintf(fp_moxout, "	EQUW ship_none               ; Ship type %02X: %s\n", i, ship_desc[i]);
			}
		}
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, ".ship_attributes                    ; Ship attributes:\n");
		fprintf(fp_moxout, "                                        ; 7.......: Escape pod present\n");
		fprintf(fp_moxout, "                                        ; .6......: Galcop police ship\n");
		fprintf(fp_moxout, "                                        ; ..5.....: Ship is protected by spacestation\n");
		fprintf(fp_moxout, "                                        ; ...4....: Ship is docking\n");
		fprintf(fp_moxout, "                                        ; ....3...: Ship is a pirate\n");
		fprintf(fp_moxout, "                                        ; .....2..: Ship is attacking you\n");
		fprintf(fp_moxout, "                                        ; ......1.: Ship is a bounty hunter\n");
		fprintf(fp_moxout, "                                        ; .......0: Ship is a trader\n");
		for (i = 1; i < MAX_SHIPS; i++) {
			if (ship_pointers[i] != 0x0000) {
				fprintf(fp_moxout, "	EQUB %s_attributes                  ; Ship type %i: %s\n", ship_id[i], i, ship_desc[i]);
			} else {
				fprintf(fp_moxout, "	EQUB none_attributes                ; Ship type %i: %s\n", i, ship_desc[i]);
			}
		}

		for (i = 1; i < MAX_SHIPS; i++) {
			if (ship_pointers[i] != 0x0000) {
				fprintf(fp_moxout, "\n");
				fprintf(fp_moxout, ".ship_%s\n", ship_id[i]);
				fprintf(fp_moxout, "INCLUDE \"src/ships/%s.asm\n", ship_id[i]);
			}
		}

		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, "	FOR n, *, (&6000 - P%%)\n");
		fprintf(fp_moxout, "		EQUB &00\n");
		fprintf(fp_moxout, "	NEXT\n");
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, ".end\n");
		fprintf(fp_moxout, "\n");
		fprintf(fp_moxout, "SAVE \"bin/%s\", start, end, start, start\n", filename);
	}
}
