pico-8 cartridge // http://www.pico-8.com
version 30
__lua__

#include dots.lua
#include vec.lua
#include maths.lua
#include poly.lua
#include subpixel.lua
#include main1.lua
__label__
77007770777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07007070707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07007770777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070707000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77700070777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707000777000007770777077707700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70707000707000007070707070700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707770777000007770777077700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70707070007000000070007070700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707770007007000070007077707770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707000700000007770777077007770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00707000700000000070007007000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707770777000000770777007000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70007070707000000070700007000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77707770777007007770777077707770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000707000700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000700077000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007000770077770000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000070700007007000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007070077700000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000070000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000007707000000000000000000000000000000000000000000070000700000000000000000000000000000000000000000000000000000000000000000000
00000770770000000000000000000000000000000000000007007000077000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000000000000000000000000000070707000777700000000000000000000000000000000000000000000000000000000000000000000
00070007000000000000000000000000000000000000000007700070077000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000700000000000000000000007070700070000070000000000000000000000000000000000000000000000000000000000000000000
00000700000000000000007000700000000000000000707700077000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000007070000000000000007777770707000007000700000000000000000000000000000000000000000000000000000000000000000
00000000000000000007700770700000000000000070777777700000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000070707070000000000000000007777777700000007070000000000000000000000000000000000000000000000000000000000000000000
00000000000000000007707700000000000000007077777777007000070700000700000000000000000000000000000000000000000000000000000000000000
00000000000000000077077000000000000000077770777770000000007000070070000000000000000000000000000000000000000000000000000000000000
00000000000070000000700000000000000700777770007700770000000770070007000000000000000000000000000000000000000000000000000000000000
00000000000777070000700000000000000707077707700070000000070000000000700000000000000000000000000000000000000000000000000000000000
00000000000070707000000000000000077077077700000007000000700770707707070000000000000000000000000000000000000000000000000000000000
00000000077000770000000000000007077707077700007000070000700000070700700700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000007707770700700000000000070077000707000000000000000000000000000000000000000000000000000000000000000
00000070000070000000000000000770777777007070000007000770007000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000007777077770000700000000007007700700000000000000000000000000000000000000000000000000000000000000000000
00070000000000000000000000070777700000000000000000077070700070700000000000000000000000000000000000000000000000000000000000000000
07070000000000000000000000007000700000000000000000700777070707077000000000000000000000000000000000000000000000000000000000000000
00707000000000000000000000000700000000000000000000700777007000700000000000000000000000000000000000000000000000000000000000000000
00070000000000000000070070000000000000000000000000007070000000000000000000000000000000000000000000000000000000000000000000000000
70000000000000000000707707000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000070070700000000000000000070077007700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000007007000000000000000700707007070000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000007000070700000000000007770770070700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000070700077000000000000007777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000070007000000000007000070700000000000000770007000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000007007700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

