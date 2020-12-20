pico-8 cartridge // http://www.pico-8.com
version 29
__lua__



t=0
dt=1/30
tf=0
sqrt2=sqrt(2)

cls()
::HOME::
t+=dt
tf+=1

for ox=0,128,40 do
	for oy=0,128,40 do
		ox = ox + oy\48%2 * (16 + 4*sin(t/8))
		local parity = (ox\40+oy\40)%2*2-1
		local mod = ox/300+oy/250
		for i=1,75 do
			local ang,r = rnd(1),rnd(18)
			local a = flr(ang*6+parity/2)%2
			local j = 4 + 2*sin(t/8)
			local ar = 16 * max(0,sin(ang+a/j+t/2+mod+parity))

			local c = r<ar and 7 or 0
			local x,y = r*cos(ang)+ox,r*sin(ang)+oy
			circfill(x,y,1,c)
		end
	end
end

flip() goto HOME
__label__
70777777770707000000000000000007077777777777777777770000000000000000000000000077000000000000000000000000007777777777777000777077
00777777700000000000000000000077777777777777777777700000000000000000000000000007700000000000000000000000077777777777777707077777
00077777770000000000000000000077777770007707077777000000000000000000000000000077777770000000000000000000007777777770077770077777
00007000777000000000000000000777777000000777700000000000000000000000000007707777777777000000000000000000000777777770777700000007
00000000777770000000000000000077770000007777000000000000000000000000000707777777777777700700000000000000000777000000077700000077
00000000070770000000000000000000700000007777700000000000000000000000070777777777777777707777000000000000007770000000777700000007
00000000000077000000000000000000000000000777000000070000000000000000777777777077077777777777000000000000000000000007077700000000
70000000000000000000000000000000000000007770000000770000000000000007777777777007077777707777700000000000000000000077707700000000
70000000000000000000000000000000000000000777077000000000000000000077700777777077007070000777000000000000000000000007077700000000
00000000000000000000000000000000000000007777777000000000000000000007000007777700000000000777000000000000000000000000007700000000
00000000000000000000000000000000000000007777777707000000000000000000000000777000000000000070000000000000000000000000007777000000
00000000000000000000000000000000000000007707077700700000000000000000000700070000000000000000000000000000000000000000000777000000
00000000000000000000000000000000000000007770777000000000000000000000000000000000000000000000000000000000000000000000000770000000
00000000000000000000000000000000000000000777077000000000000000000000000000000700000000000000000000000000000000000000007770000000
00000000000000000000000000000000000000000777000000000000000000000000000007000000000000000000000000000000000000000000000700000000
00000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000707000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007770000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007777000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077777700000000
70000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000700007777777000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000007000077777777000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000777000000000000000000000000000007777777700000000
00000000000000700000000000000000077000000007070077070000000000000007000000000000777000000000000000000000000000070777777000000000
00000000000007770000000000000000777700000000007070007000000000000077700000000000070000000000000000000000000000077777777000000000
00000000007700700000000000000007777077000000000000000000000000000007000070000000070000000000000000000000000000007777777700000000
00000000777770000000000000000000700777700000007000000000000000000077707777000000770000007707000000000000000000000777777770000000
00000707777707000000000000000000000077000070770000000000000000000777777770700007770000000007000000000000000000007777777700000700
00077777777077700000000000000000000007700700070000000000000000000007777777700007770000000000700000000000000000000070777700007770
00077777777707770000000000000000000007077770000000000000000000000700777777777007770000007000700000000000000000007007077700007770
00777777777700700000000000000000000000000700000000000000000000000000707777777777770700000007000000000000000000077777777700000000
07777777077777000000000000000000000000000070000000000000000000000707000777777777777770007077000700000000000000707777770000000000
77707070777777700000000000000000000000770777000000000000000000007770707777777777770777777700007000000000000007777077000000000000
77000777070707000000000000000000000007777770070000000000000000000700077777777777700077777000070000000000000000777777000770000000
77707770777000000000000000000000707777777777770000000000000000000000777770007777700077077700000000000000000000007070000077070000
77707007770000000000000000000000077777777077777070000000000000000000777000077777000000007070000000000000000070700000000077700000
77000700707000000000000000000070777777077777777777700000000000000007770007007777000000000000700000000000000777700000000007770000
77707770000000000000000000000777777770007777777777770000000000000007700077777777000000000007070000000000007770000000000077770000
77777700000000000000000000007777770007000770777777700000000000000000000007777770000000007000000000000000000700000000000077770000
77770770000000000000000000077777777000000777007777770000000000000000000000777077000000000000000000000000000000000000000077700000
07700000000000000000000000007077707000000077700077700000000000000000000000007777000000000000700000000000000000000000000777770000
00700070007000000000000000000007000000000007000000000000000000000000000000077777700000000000000000000000000000000000000077700000
00000000000000000000000000000070707707000000000000000000000000000000000000007007000000000000000000000000000000000000000000700000
70000000000000000000000000000000077770000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000
00000000000000000000000000000000777000000000000000000000000000000000000000000700000000000000000000000000000000000000700077700000
00070000000000000000000000000000000000000000000000000000000000000000000000007770000000000000000000000000000000000000000070070070
70700000000000000000000000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000770700
00000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000777700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000070000077700000000000007000000000000000000000
00000000000000000000000000000000000000000000000000007000700000000000000000000000000770000777700000000000000000000000000000000000
00070000000000000000000000000000000000000000000000077707770000000000000000000000000077077777700000000000000000000000000000000000
70777000007000000000000000000000000000000000000000007700700000000000000000000000000000007777700000000000000000000000000000070000
77077707770000000000000000000000000000000000000000000077070000000000000000000000000077077777000000000000000000000000000077777077
70077777777000000000000000000000000000000000000000000777777000000000000000000000000007777777000000000000000000000000000070077777
00777777770070000000000007700000000000000000000000000077770000000000000000000000000000770777700000000000000000000000000000007777
00077077777777000000000077000000000000000007000000000777777000000000000000000000000700700077770000000007700000000000000000007777
00000777777770000000000000000000000000000007707000000777770000000000000000000000007777700777770000000077770000000000000000000777
00000077077700000000000000000000000000077000777007000777700000000000000000000000000777700777700007000707700000000000000000000077
00000000777770007000000000000000000000077707777777700077700000000000000000000000007077077777700007707700000000000000000000000000
00000000077770000700000000000000700000777777777777000000700000000000000000000000077707777777070077770700000000000000000000000000
00000000000700000000000000000000000000070777777777000000000000000000000000000000007077777777777777707770000000000000000000000000
00000000000000000000000000000000000000000077777770777000000000000000000000000000000707777777777777700700000000000000000000000000
00000000077707707000000000000000000000000000770007077000000000000000000000000000077777777700777000000000000000000000000000000000
00000000077777777700000000000000000000007000000000770000007000000000000000000070777777777700070000000000000000000000000000000000
00000777777007777770700000000000000000000700000077777000000000000000000000000777777777007000070000000000000000000000000000000000
00007777770007777777770000000000000000000000000777777000000000000000000000007770777700000000000000000000000000000000000000000070
00077777777000777777700070000000000000000000000777770000000000000000000000000707777000000000000000000000000000000000000000000777
70777700070007777777770777000000000000000000707777777000000000000000000000000000707000000000070000000000000000000000000000000777
00070700700000777777777770000000000000000000770777777000000000000000000000000000000000000000000000000000000000000000000000000000
00700000700007777707777770000000000000000007777777777000000000000000000000000000000000000000000000000007000000000000000000000000
00000000000077777777777777000000000000000077770077777000000000000000000000000000000000000000000000000000700000000000000000000000
00000000000007777777777770000000000000000007700707777000000000000000000000000000000000000000000000700000000000000000000000007000
00700000000000077777770000000000000000000007777777777000000000000000000000000000000000000000000000770000000000000000000000000000
00000000070000007077700000000000000000000000707777770000000000000000000000000000000000000000700000000000000000000000000000000000
00000000000000000007000000000000000000000000000770770000000000000000000000000000000000000000000000000070000000000000000000000000
00000000000000000000000000000000000000000000000707077000000000000000000000000000000000000000000007700000000000000000000000000000
00000000000000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000
00000000000000000000000000000000000000000000000707077000000000000000000000000000000000000000000777000000000000000000000000000000
00000000000007000000000000000000000000000077077000777700000000000000000000000000000000000000007707000007000000000000000000000000
00000000000077700000000000000000000000000000070007777000000000000000000000000000000000000000000000007007000000000000000000000000
00000000000007000007000000000000000000000000007007777700000000000000000000000000000000707070070000007700000000000000000000000000
00000000000077700077700000000000000000000000077000777000000000000000000000000000000007777777000007077000070000000000000000000000
00000000000077777707000000000000000000000000000000777000000000000000000000000000007000707077700077777000700000000000000000000000
00000000000007777770000000000000000000000777070000077000000000000000000000000000077777777777000707777777000000000000000000000000
07000000000007777700000000000000000000000070007070777700000000000000000000000000007777777777007000777777700000000000000070000000
00707000000007070007000000000000000000000000077077777700000000000000000000000000000777777777700707777777000000000000000007007000
07777700000077777077700000000000000000000007070700777000000000000000000000000000000007777777707777777000000000000000000000777700
07707770000007770007000007000000000000000077777777770000007077700000000000000000000000707777777770770000000000000000000000777700
07000777070000700000000000000000000000000777777770777000777707700000000000000000000000000077777700000000000000000000000000777770
00707707700007000000000000000077000000077777777777777707777707770000000000000000000000000007777070000000000000000000000000077777
00070000070000000000000000000000000000777777777777777007777077700000000000000000000000000000770000000000000000000000000000070777
00700000000000000000000000000000000000070070777777770077770070000000000000000000000000000000700700000000000000000000000000000077
00700070070000000000000000000000000000000077777777000007700000000000000000000000000000007000007770000000000000000000000000000770
00000007077700000000700700000000000000000777777777700770000000000000000000000000000000077000007700000000000000000000000000000000
00700007777700000000077700000000000000007077700000007700000000000000000000000000000000700000077777000000000000000000000000000000
00070077777770000000007000000000000000077707000000000000000000000000000000000000000007777000007007700000000000000000000000000000
00777777777777000000000000070000000000007000000000000000000000000000000000000000000000707700000000000000000000000000000000000000
00070077777777000000000000000000000000000000000000000000000000000000000000000000000000070700000000000000000000000000000000000000
00700777777770000000000000000000000000000000000000000000000000000000000000000000000000700070000000000000000000000000000000000000

