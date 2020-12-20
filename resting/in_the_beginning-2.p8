pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
dt=0.0333
t=0

cls()
::♥::
--cls()
t+=dt
mx,my=stat(32),stat(33)

for i=1,1000 do
	y=rnd(128)-64
	x=rnd(128)-64
	
	c=
		 sin(y/600 + sin(t/20) + 1)
		+flr((x-t*6)/40)
		+sin(x/80)
		+cos(y/56)
		+t*2

	c=flr(c%4)*3.5 -- [1,14]
	local fill = nil
	if c==3.5 or c==7+3.5 then
		fill = 0b1010010110100101.1
		c = 0x0
	end
	
	fillp(fill)
	circ(x+64,y+64,1,c)
	fillp()
end

flip() goto ♥
__gfx__
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000007070707070707070700070707070777777777777707077777777777777777777777777707070707070000000000000000000
00000000000000000000000000070707070707070707070707070707777777777777770707777777777777777777777777070707070700000000000000000000
00000000000000000000000000707070707070707070707070707070777777777777777777777777777777777777777770707070700000000000000000000000
00000000000000000000000000070777070707070707070707070707077777777777777777777777777777777777777707070707070000000000000000000000
00000000000000000000000000007777707070707070707070707070707777777777777777777777777777777777777070707070700000000000000000000000
00000000000000000000000000070777770707070707070707070707070707777777777777777777777777777777770707070707000000000000000000000000
00000000000000000000000000007777777070707070707000707070707070777777777777777777777777777777707070707070700000000000000000000000
00000000000000000000000000077777770707070707070700070707070707777777777777077777777777777777770707070707070000000000000000000000
00000000000000000000000000077777777070707070707070707070707077777777777770777777777777777777707070707070700000000000000000000000
00000000000000000000000000077777777707070707070700070707070707777777777777777777777777777777770707070700070000000000000000000000
00000000000000000000000000707777777070707070707070707070707077777777777777777777777777777777777070707070707000000000000000000000
00000000000000000000000000077777770707070707070707070707070777777777777777777777777777777777777707070707070000000000000000000000
00000000000000000000000000007077777070707070707070707070707077777777777777777777777777777777777070707070707000000000000000000000
00000000000000000000000000070707070707070707070007070707070777777777777777777777777777777777770707070707070000000000000000000000
00000000000000000000000000007070777070707070707070707070707077777770777077777777777777777777777077707070700000000000000000000000
00000000000000000000000000070707777707070707070707070707077777777777770777777777777777777777777777770707070000000000000000000000
00000000000000000000000000007070777070707070707070707070777777777777777077777777777777777777777777777070707000000000000000000000
00000000000000000000000000000707070707070707070707070777777777777777770777777777777777777777777777777707070700000000000000000000
00000000000000000000000000000070707070707070707070707777777777777770707077777777777777777777777777777770707000000000000000000000
00000000000000000000000000000707070777770707070707777777777777777707070700777777777777777777777777777777070700000000000000000000
00000000000000000000000000000070707777777070707077777777777777770000707077777777770707070777777777777777707070000000000000000000
00000007070000000000000000000707077777777777777777777777777777770007070707777770700070707007777777777777770707000000000000000000
70707070700000000000000000000070777777777777777777777077777770700000707077777700000007000000777777777777777070000000000000000000
07070707070000000000000000000007077777777777777777777777777707000000000707070000000000000000077777777777777707000000000000000000
70707070707070700000000000000000777777777777777777777777777070000000000000000000000000000000007777777777777770700000000000000000
07070707070707070000000000000000077777777777777777777777770000000000000000000000000000000000000077777777777777770000000000000000
70707070707070707000000000000000077777777777777777777777700000000000000000000000000000000000000000777777777777777000000000000000
07070707070707070700000000000000007777777777777777777777000000000000000000000000000000000000000000777777777777770700000000000000
70707070707070700070000000000000070777777777777777707770000000000000000000000000000000000000000000077777777777777000000000000000
07070707070707070707000000000000007007777777777777070700000000000000000000000007000000000000000000007777777777777700000000000000
70707070707070707070000000000000000007777770777777700000000000000000000000000000000000000000000000000777777777777070700000000000
07070707070700070700070000000000000000777777777777700000000000000000000000000000000000000000000000000007777777777700070000000000
70777770707070707070707000000000000000070777777707000000000000000000000000000000000000000000000000000007777777707700707000000000
07077777070707070707070000000000000000007777777000000000000000000000000000000000000000000000000000000000777777770707070700070000
70777770707070707070707000000000000000007077770000000000000000000000000000000000000000000000000000000000777777777070700070700000
07770777070707070707070000000000000000000770770000000000000000000000000000000000000000000000000000000007077777777707000007070000
77707070707070707000707000000000000000007777777000000000000000000000000000000000000000000000000000000070777777777070707070000000
07770777070707070700070000000000000000070770777700000000000000000000000000000000000000000000000000000077777777777707070700000007
70707070707070707070700000000000000000007777777700000000000000000000000000000070000000000000000000000077777777777770707000000000
07070707070707070707070000000000000000777777777770700000000000000000000000000007000000070000000000000077777777777700070000000000
70707070707070707000700000000000007077777777777777077700000000000000000000000070000000700000000000000777777777777700000000000000
07070707070707070700000000000000077777777777777777777700000000000000000000000000000000000000000000077777777777777700000000000000
70707070707070707000000000000000007777777777777777777770700000000000000000000000000000000000000000777777777777777070000000000000
07070707070707070000000000000007070777777777777777777777070000000000000000000000000000000000000000777777777777770000000000000000
70707070707070700000000000000000707777777777777777777777707000000000000000007000000000000000000077777777777777700000000000000000
07070707070707000000000000000000077777777777777777777777777000000000000000000000000000000000077707777777777777000000000000000000
70707070007000000000000000000000777777777777777777777777777770000000000000000000000000007000777777777777777770700000000000000000
07000707000000000000000000000007777777777777777777777777777777000000000700770707000000070707077777777777770707000000000000000000
70000000000000000000000000000070777777777770777077777777777777777000707077777777700077077770777777777770707070000000000000000000
00000000000000000000000000000707077707070707070707070077777777777707070777777777777777777777777777777707070700000000000000000000
00000000000000000000000000000070707770707070707070707077777777777777707070777777777777777777777777777070707070000000000000000000
00000000000000000000000000000707770707070707070707070777777777777777770707077777777777777777777777770707070700000000000000000000
00000000000000000000000000007777777070707070700070707070777777777777707070777777777777777777777777707070707000000000000000000000
00000000000000000000000000070777770707070707070707070707077777777777770707777777777777777777777707070707070700000000000000000000
00000000000000000000000000007777777070707070707070707070707770777777777777777777777777777777707070707070707000000000700000000000
00000000000000000000000000777777777707070707070707070707070707077777777777077777777777777777070707070707070000000000000000000000
00000000000000000000000007777777777070707000707070707070707070777777777770707070777077777770707000707070707000000000000007007000
00000000000000000000000077777777770707070707070007070707070707077777777777070707070707777707070700070707070000000000000077770700
00000000000000000000000777777777707070007070000000707070707070777777777770707070777070707070707000707070700000000000007077707777
00000000000000000000077077777777770700000000000007070707070707077777777777070707070707070707070707070007070000000000070777777777
00000000000000000000070777777777777000000000000000000070707070707077777770707070707070707070707070700000700000000000707777777777
00000000000000000000007777777777777000000000000000000007070707070707777707070707070707070707070707070000000000000007777777777777
00000000000000000000007777777777770000000000000000000070707070707070777777707070707070707070707070707000000000000007777777777777
00000000000000000000077777777777770000000000000000000000070707070707077777770707070707070707070707070000000000000077777777777777
00000000000000000000777777777777700000000000000000000000707070707070777777707070707070707070707070700000000000000777777777777777
00000000000000000000777777777777770700000000000000000007070707070707777777000707070707070707070707000000000000000077777777777777
00000070000000000000777777777777707000000000000000000070707070707070777770007070707070707070707070000000000000000007777777777777
00070700000000000700777777777777770700000000000000000707070707070707777777000707070707070707070707000000000000000070777777777777
00007070000000000077077777777777777000000000000000000070007070707077777777707070707070707070707070700000000000000007777777777777
00000000000000000000777777777777777700000000000000000707070707070777777777070707070707070707070707070007000000000007777777777777
00000000000000000000077777777777777070000000000000007070707070707077777777707070707070700000707070707070000000000000707707777777
00000000000000000700007707777777770707000000000007070707070707777777777777070707070707070777070707070707000000000000000070077777
00000000000000000000000070777777707070700000700000707070707070777777777770707070707070707777707070707070000000000000000700707000
00000000000000000000000707077777770707070707070707070707070707777777777777070707777777777777770707070707000000000000000000070000
00000000000000000000000000077777777070707070707070707070707777777777777770777777777777777777777070707070707000000000000000000000
00000000000000000000000000077777770707070707070707070707077777777777777707077777777777777777777707070707070000000000000000000000
00000000000000000000000000007077777070707070707070707070707777777777777070777777777777777777777770707000707000000000000000000000
00000000000000000000000000000707770707070707070707070707077777777777777707777777777777777777777777070707070700000000000000000000
00000000000000000000000000007077777070707070707077707077777777777777707077777777777777777777777777777070707000000000000000000000
00000000000000000000000000000707777777070707070707770777777777777777770707777777777777777777777777770777070700000000000000000007
00000000000000000000000000000077777777707070707070777777777777777777007070777777777777777777777777777770707070000000000000000000
00000000000000000000000000000007777777770707070707777777777777777770000707777777777707077777777777777707070700000000000000000000
00000000000000000000000000000000777777777070707777777777777777707000007070777770707070707777777777777770707070000000000000000000
00070000070000000000000000000000077777777777077777777777777777070000000707077707000007070777777777777777070707000000000000000000
00707070000000000000000000000000777777777777777777777777777770700000007000777070000000007077707777777777707070700000000000000000
07070707000000000000000000000007777777777777777777777777777770000000000007070700000000000000007777777777770707000000000000000000
70707070000000000000000000000000777777777777777777777777777700000000000000700000000000000000070777777777777070700000000000000000
07000007070707000000000000000007777777777777777777777777777000000000000000000000000000000000007777777777777707700000000000000000
70700070707070700000000000000000777777777777777777777777777000000000000000700000000000000000000777777777077777700000000000000000
07070707070707000000000000000000007777777777777777777777777000000000000000000000000000000000000777777777777777770000000000000000
70707070707070700000000000000000007777777777777777777777770000000000000000000000700000000000007070777777777777707000000000000000
77070707070707070000000000000000070777777777777777777777770000000000000000000000000000000000000707777777777777700000000000000000
70707070707070707000000000000000007707777777777777777777777000000000000000000000000000000000000070777777777770707000000000000000
07070700070707000000000000000000007770777777777777777777777000000000000000000000000000000000000707777777777707070000000000000000
70707070707070000000000000000000007777777777777777777777777000000000000000000000000000000000000077777777777770700000000000000000
07070707070007000000000000000000077777777777777777777777777700000000000000700000000000000000070077777777777707070000000000000000
70007070707070000000000000000000707777777777777777777777777707000000000007070070000000000000707777777777777070700000000000000000
07070707000000000000000000000000077777777777777777777777777770700000000007770000000700000007777777777777777707070000000000000000
70007000000000000000000000000000707777777777707777777777777777070000000070777000000077000077777777777777777070700000000000000000
00000007000000000000000000000000077777077777077777777777777777777000070707077777070777700707777777777777070707000000000000000000
70000000000000000000000000000000777770707770707777777777777777777000000070777777777077777077777777777770707070700000000000000000
00000007000000000000000000000007077777070707077707777777777777777770000707777777777777777777777777770707070707000000000000000000
00000000007000000000000000000007707770777070707070707077777777777777777077777777777777777777777777707070707070700000000000007000
00000000000000000000000000000770770707070707070707070707777777777777777777777777777777777777777707070707070700000000000000070000
00000000000000000000000000007777707070707000707070707077777777777777777777777777777777777777777070707070707070000000700000000000
00000000000000000000000000070777770707070707070707070707070777777777070777777777777777777777770707070707070700000000000000000000
00000000000000000000000000777777777070707070707070700070707770777770707777777777777777777777707070707070707000000000000000000000
00000000000000070000000000777777770707070707070707070007070707077777777777070777777707777777070707070707000000000000000000077000
00000000000000707000000077777777777070000070000070707070707770707077777770707077777070777770707070707070000000000000000070777707
00070000000000070000000777777777777000000000000000070707070700070707777777070707070707070707070007070000000000000000700777777777
00000000000000000000007777777777770000000000000000007000707070707070777770707070707070707070007070700000000000000007077777777777
00000000000000000000707777777777000000000000000000000000070707070707077777070707070707070707070707000000000000000077777777777777
00000000700000000077077777777777700000000000000000000000007070707070707070707070707070707070707070700000000000000777777770777770
00000000000000007707777777777777070000000000000000000000000707070707070707070707070707070707070707000000000000007777707777777777
00000000000000070777777777777777707000700000000000000000000000707070707070707070707070707070700000000000000000000777777777777770
00000000000000077777777777077777070000000000000000000000000000070707070707070707070707070707000000000000000000000777777707777777
00000000000000777777777770707070707000000000000000000000000000707070707070707070707070707070700000000000000000000077777077777777
00000000070007077777777777070707000700000000000000000000000000070707070700070707070707070707000000000000000000000777770777777777
00000000007000707777777777707070000070000000000000000000000000707070700000007070707070707070000000000000000000007777777777777777
00070000007700007777777777070707000000000000000000000000000000070707070000070007070707070700000000000000000000000777777777777777
00000000077770077777777770707070700000000000000000000000000000707077707070000000707070707000000000000000000000007777777777777777
00070000007770077777777777070707000000000000000000000000000007070777070000000007070707070700000000000000000000070777777777777777
00700000000707007077777777777070000000000000000000000000000070707070707000000070707070700070000000000000000000707777777777777777
00000000000070007707777777770700000000000000000700000000000000070707070700000007070707000007070000000000000000070777777777777777
00000000700070077777777777777070000000000000000000000000000000707070707070000070707070700000700000000000000000007070777777777777
00000007000000007777777777770700000000000000000000000000070000770707070700000707070707070007000000070000000000000777777777777777
00000000000000000777777777707070000000000000000000000000007000777070707770007070707070707070700000000000000000000707777777777777
00000000000000000777777707770707000000000000000000000000070700000707077777000707070707070707070700000000000000000070777777777777

