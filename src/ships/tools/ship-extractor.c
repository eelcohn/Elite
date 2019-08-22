#include <stdio.h>			// Included for NULL, printf(), FILE*, fopen(), fgets(), feof() and fclose()
#include <stdlib.h>			// exit()
#include <string.h>			// strncpy(), strncat()

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

const char *ship_id[] = {		// * = not sure yet, check against http://wiki.alioth.net/index.php/Classic_Elite_ships_firepower
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

int main(int argc, char** argv) {
	FILE		*fp_in, *fp_binout, *fp_txtout;
	char		filename_binout[300], filename_txtout[300];
	char		ship_id_string[8], ship_attr_string[8];
	unsigned short	ship_pointers[32];
	unsigned char	ship_attr[32];
	unsigned char	ship_header[0x14];
	unsigned char	byte;
	int		scoop_type;
	int		i, j, k;

	printf("Elite ship data extractor v0.01\n");
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

		for (i = 1; i < 32; i++) {
			ship_pointers[i] = (fgetc(fp_in) + (fgetc(fp_in) * 256));
		}
		if (ship_pointers[1] != 0x7F00) {
			printf("Warning: file is most likely not an Elite ship data file (missing 0x7F00 header)\n");
		}
		for (i = 1; i < 32; i++) {
			ship_attr[i] = fgetc(fp_in);
		}
		for (i = 1; i < 32; i++) {
			if ((ship_pointers[i] != 0x0000) && (ship_pointers[i] != 0x7F00)) {
				printf("Found ship id &%02X (%s)\n", i, ship_id[i]);

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
				fprintf(fp_txtout, "; Elite - %s data (type &%02X)\n", ship_id[i], i);
				fprintf(fp_txtout, "; written by David Braben and Ian Bell (c) Acornsoft 1984\n");
				fprintf(fp_txtout, "; -----------------------------------------------------------------------------\n");
				fprintf(fp_txtout, "\n");
				fprintf(fp_txtout, ".%s_start\n\n", ship_id[i]);
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
				fprintf(fp_txtout, "\n");
				fprintf(fp_txtout, ".%s_end\n", ship_id[i]);
				fclose(fp_binout);
				fclose(fp_txtout);
			}
		}
		fclose(fp_in);
	}
}
