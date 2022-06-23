#include <stdlib.h>
#include <stdio.h>

int main(int argc, char** argv) {
	FILE* fp;
	fp = fopen(argv[1], "rb");
	fseek(fp, 0, SEEK_END);
	size_t length = ftell(fp) / 36;
	rewind(fp);
	
	for(int i = 0; i < length; i++) {
		struct {
			float posx, posy, posz;
			float normx, normy, normz;
			float u, v;
			unsigned int colour;
		} vertice;
		fread(&vertice, sizeof(vertice), 1, fp);
		printf(
		"---------------\n"
		"VERTICE %i:\n"
		"X: %f\nY: %f\nZ: %f\n"
		"NormalX: %f\nNormalY: %f\nNormalZ: %f\n"
		"U: %f\nV: %f\n"
		"Colour: %i\n", i, vertice.posx, vertice.posy, vertice.posz, vertice.normx, vertice.normy, vertice.normz, vertice.u, vertice.v, vertice.colour
		);
	}
	fclose(fp);
}