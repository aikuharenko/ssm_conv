require 'ssm_conv'
require 'image'

patch = torch.FloatTensor(3,3):fill(0.1)
ssm_conv.convolve(image.rgb2y(image.lena()), patch)
