require 'torch'
local ffi = require 'ffi'
require 'torchffi'
require 'image'

ffi.cdef[[

	void hello();
	void convolve(float* image, float* patch, int im_w, int im_h, int patch_w, float* res);

]]

ssm_conv = {}
local clib = ffi.load("ssm_conv")
ssm_conv.c = clib
ssm_conv.c.hello()

--
function ssm_conv.convolve(im, patch)

	print("hello from torch convolve")
	local im_cont = im:type('torch.FloatTensor'):contiguous()	
	local im_c = torch.data(im_cont)
	local w = (#im)[3]
	local h = (#im)[2]
	local r = 3

	res = torch.FloatTensor(h - r + 1, w - r + 1)
	res_c = torch.data(res)	

	local patch_cont = patch:type('torch.FloatTensor'):contiguous()	
	local patch_c = torch.data(patch_cont)

	ssm_conv.c.convolve(im_c, patch_c, w, h, r, res_c)
	
end
--]]


