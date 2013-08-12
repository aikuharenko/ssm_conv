#include <stdio.h>

void hello(){

	printf("hello\n");

}

void convolve(float* image, float* patch, int im_w, int im_h, int patch_w, float* res){
	printf("hello from c convolve!\n");


	int w = im_w - patch_w + 1;
	int h = im_h - patch_w + 1;
	int p, y, x;

	for (y = 0; y < h; y++){
		for (x = 0; x < w; x++){

			p = y * w + x;
			res[p] = p;

		}
	}

}
