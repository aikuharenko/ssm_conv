require 'torch'
local ffi = require 'ffi'
require 'torchffi'
require 'image'

ffi.cdef[[

	void hello();

]]

wta = {}
local cwta = ffi.load("ssm_conv")
wta.c = cwta
wta.c.hello()
