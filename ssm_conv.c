#include <stdio.h>

void hello(){

	printf("hello\n");

}

void convolve(float* image, float* patch, int im_w, int im_h, int patch_w, float* res){

	printf("hello from c convolve!\n");

	int w = im_w - patch_w + 1;
	int h = im_h - patch_w + 1;
	int p, y, x, i, j, patch_pos, res_pos, im_pos;

	for (y = 0; y < h; y++){
		for (x = 0; x < w; x++){

			float rs = 0;
			for (i = 0; i < patch_w; i++){
				for (j = 0; j < patch_w; j++){
					
					patch_pos = i * patch_w + j;
					im_pos = (y + i) * im_w + (x + j);
					rs += patch[patch_pos] * image[im_pos];

				}
			}
			
			res_pos = y * w + x;
			res[res_pos] = rs;

		}
	}

}
