#include <stdio.h>			// Included for NULL, printf(), FILE*, fopen(), fgets(), feof() and fclose()
#include <stdlib.h>			// exit()
#include <string.h>			// strncpy(), strncat()

#define VERSION "0.0.1"

int main(int argc, char** argv) {
	FILE		*fp_in, *fp_out;
	char		filename_out[300], byte;
	int		i;

	printf("Elite binary decoder v" VERSION "\n");
	printf("written by Eelco Huininga 2019\n");
	printf("\n");

	if (argc != 3) {
		printf("Usage: %s <filename in> <filename out>\n", argv[0]);
		exit(1);
	}

	fp_in = fopen(argv[1], "rb");
	if (fp_in == NULL) {
		printf("Cannot open input file %s\n", argv[1]);
		exit(1);
	} else {
		i = 0;
		fp_out = fopen(argv[2], "wb");
		if (fp_out == NULL) {
			printf("Cannot open output file %s\n", argv[2]);
			exit(1);
		} else {
			while( EOF != (byte = fgetc(fp_in))) {
				fputc((byte ^ 0xA5), fp_out);
				i++;
			}
		}
		fclose(fp_out);
		fclose(fp_in);
		printf("Total bytes: %i\n", i);
	}
}

