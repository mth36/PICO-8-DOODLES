pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
dt=1/30
t=0

cls()
::♥::
t+=dt

for i=1,300 do
	x,y=rnd(128),rnd(128)
	xa,ya=x-64,y-64

	c=sin(y/147-t/4)
	  *x/64
	  *cos(x/64 -t/2)
	  *y/128
	 -(x+t*30)/32
	 +y/32
	
	if rnd(1) < abs(x)*abs(y) / (64*64) then
		c=4
	end
	
	c=flr(c%2)*7
	circ(64 + x/2, 64 + y/2, 1, c)
	circ(64 + x/2, 64 - y/2, 1, c)
	circ(64 - x/2, 64 + y/2, 1, c)
	circ(64 - x/2, 64 - y/2, 1, c)
end

flip()goto ♥
__label__
00000000000000000000000000000000000000000000000000007070000000000000000007070000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000070700000000000000000000707000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000707000700000000000000700070700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007777007070000000000007070077770000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000070000700000000000000700007000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070000070000007000007000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777000707000070700077700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777070070700707007077700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000700077707777077077770777000700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000070070070707777700777770707007007000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000707000007077777000077777070000070700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000070007000777777700777777700070007000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000077070777777700777777707077000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000777707077077077077077070777700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007770777700777700777707770000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777777007777770077777700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777777077777777077777700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777777777777777777777700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077777777777777777777000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007770777777777707770000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000707707777770770700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007077070077007077070000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007000000000000700007777770000700000000000070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000070700000000000000000077000000000000000000707000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007000000000000000000000000000000000000000070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007700000000000070077007000000000000770000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000070070700000000000000077000000000000000707007000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700007000000000000000000000000000000000070000700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007070000000000000000000000000000007070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000707700000000000000000000000000770700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700007007070000000000000000000000007070070000700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000700707000000000000000000000070700700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700007707070000000000000000000000007070770000700000000000000000000000000000000000000000
00000000000000000000000000000000000000007070707000700700000000000000000000700700070707070000000000000000000000000000000000000000
00000000000000000000000000000000000000000007700707707770000000000000000007770770700770000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000777070777770000000000000000007777707077700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000077777777777700000000000000777777777777000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000700707777707777000000000077770777770700700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007007077777077770700700700707777077777070070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000700077077777770777777777707777777077000700000000000000000000000000000000000000000000
00000000000000000000000000700070700000000000000070707777777077777777077777770707000000000000000707000700000000000000000000000000
00000000000000000000000007070707000000000000000077077007707777777777770770077077000000000000000070707070000000000000000000000000
00000000000000000000000000700070070000000000000070770770070777777777707007707707000000000000007007000700000000000000000000000000
00000000000000000000000000000000700000000000000007007777707077777777070777770070000000000000000700000000000000000000000000000000
00000000000000000000000000000007000000000000000000007777770707700770707777770000000000000000000070000000000000000000000000000000
00000000000000000000000000000070700000000000000000007707777777777777777770770000000000000000000707000000000000000000000000000000
00000000000000000000000000000007707000000000000000000070077777777777777007000000000000000000070770000000000000000000000000000000
00000000000000000000000000000000070700000000000000007000777777777777777700070000000000000000707000000000000000000000000000000000
00000000000000000000000000007007700700000000000000000707777777777777777770700000000000000000700770070000000000000000000000000000
00700000000000000000000007000707707070000000000000000000777777077077777700000000000000000007070770700070000000000000000000000700
07000000000000000000000070707000700777000000070000007000707777700777770700070000007000000077700700070707000000000000000000000070
70700000000000000000000000070700777777000700000000000000070077777777007000000000000000700077777700707000000000000000000000000707
77000000000000000000000000007007777777707070000000000000000707777770700000000000000007070777777770070000000000000000000000000077
07007007000000000000000000000770777777777700000000000000007070777707070000000000000000777777777707700000000000000000000070070070
70000070770000000000000000000007777077777700000000000000000707777770700000000000000000777777077770000000000000000000007707000007
70007007707000000000000000000000077777777777000000000000000770777707700000000000000077777777777000000000000000000000070770070007
07770700070000700000000000000000007777770770700000000000000007077070000000000000000707707777770000000000000000000700007000707770
77777070000007770070000000000000007777707077770700000000000000700700000000000000707777070777770000000000000007007770000007077777
77707707070777770707000007000000077777070707777070700000000007000070000000000707077770707077777000000070000070707777707070770777
07770770707707777070000000000000770077707777777777070000000007000070000000007077777777770777007700000000000007077770770707707770
77707077770777777700700000000007000707777777777777700000000000000000000000000777777777777770700070000000000700777777707777070777
77770777777077777007070000000000070077777777777770000000000000000000000000000007777777777777007000000000007070077777077777707777
70770777777007777700707000000000007707077777777777000000000000000000000000000077777777777070770000000000070700777770077777707707
00000077770007777770077700000000007000007777777777000000000000000000000000000077777777770000070000000000777007777770007777000000
00000077770007777770077700000000007000007777777777000000000000000000000000000077777777770000070000000000777007777770007777000000
70770777777007777700707000000000007707077777777777000000000000000000000000000077777777777070770000000000070700777770077777707707
77770777777077777007070000000000070077777777777770000000000000000000000000000007777777777777007000000000007070077777077777707777
77707077770777777700700000000007000707777777777777700000000000000000000000000777777777777770700070000000000700777777707777070777
07770770707707777070000000000000770077707777777777070000000007000070000000007077777777770777007700000000000007077770770707707770
77707707070777770707000007000000077777070707777070700000000007000070000000000707077770707077777000000070000070707777707070770777
77777070000007770070000000000000007777707077770700000000000000700700000000000000707777070777770000000000000007007770000007077777
07770700070000700000000000000000007777770770700000000000000007077070000000000000000707707777770000000000000000000700007000707770
70007007707000000000000000000000077777777777000000000000000770777707700000000000000077777777777000000000000000000000070770070007
70000070770000000000000000000007777077777700000000000000000707777770700000000000000000777777077770000000000000000000007707000007
07007007000000000000000000000770777777777700000000000000007070777707070000000000000000777777777707700000000000000000000070070070
77000000000000000000000000007007777777707070000000000000000707777770700000000000000007070777777770070000000000000000000000000077
70700000000000000000000000070700777777000700000000000000070077777777007000000000000000700077777700707000000000000000000000000707
07000000000000000000000070707000700777000000070000007000707777700777770700070000007000000077700700070707000000000000000000000070
00700000000000000000000007000707707070000000000000000000777777077077777700000000000000000007070770700070000000000000000000000700
00000000000000000000000000007007700700000000000000000707777777777777777770700000000000000000700770070000000000000000000000000000
00000000000000000000000000000000070700000000000000007000777777777777777700070000000000000000707000000000000000000000000000000000
00000000000000000000000000000007707000000000000000000070077777777777777007000000000000000000070770000000000000000000000000000000
00000000000000000000000000000070700000000000000000007707777777777777777770770000000000000000000707000000000000000000000000000000
00000000000000000000000000000007000000000000000000007777770707700770707777770000000000000000000070000000000000000000000000000000
00000000000000000000000000000000700000000000000007007777707077777777070777770070000000000000000700000000000000000000000000000000
00000000000000000000000000700070070000000000000070770770070777777777707007707707000000000000007007000700000000000000000000000000
00000000000000000000000007070707000000000000000077077007707777777777770770077077000000000000000070707070000000000000000000000000
00000000000000000000000000700070700000000000000070707777777077777777077777770707000000000000000707000700000000000000000000000000
00000000000000000000000000000000000000000000700077077777770777777777707777777077000700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007007077777077770700700700707777077777070070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000700707777707777000000000077770777770700700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000077777777777700000000000000777777777777000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000777070777770000000000000000007777707077700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007700707707770000000000000000007770770700770000000000000000000000000000000000000000000
00000000000000000000000000000000000000007070707000700700000000000000000000700700070707070000000000000000000000000000000000000000
00000000000000000000000000000000000000000700007707070000000000000000000000007070770000700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000700707000000000000000000000070700700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700007007070000000000000000000000007070070000700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000707700000000000000000000000000770700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007070000000000000000000000000000007070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700007000000000000000000000000000000000070000700000000000000000000000000000000000000000
00000000000000000000000000000000000000000070070700000000000000077000000000000000707007000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007700000000000070077007000000000000770000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007000000000000000000000000000000000000000070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000070700000000000000000077000000000000000000707000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007000000000000700007777770000700000000000070000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007077070077007077070000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000707707777770770700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007770777777777707770000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077777777777777777777000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777777777777777777777700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777777077777777077777700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777777007777770077777700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007770777700777700777707770000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000777707077077077077077070777700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000077070777777700777777707077000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000070007000777777700777777700070007000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000707000007077777000077777070000070700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000070070070707777700777770707007007000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000700077707777077077770777000700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777070070700707007077700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777000707000070700077700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070000070000007000007000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000070000700000000000000700007000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007777007070000000000007070077770000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000707000700000000000000700070700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000070700000000000000000000707000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007070000000000000000007070000000000000000000000000000000000000000000000000000

