pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
	t = 0
	cls()

	for i=0,7 do
		pal(i,i+8+128,1)
	end
end

function _update()
	t += 1/30

	for i=1,1000 do
		local x = rnd(128)
		local y = rnd(128)
		
		local c = (x/32 + y/(16+0.1*sin(y/64+x/64+t)) + sin(x/128-t/4)*0.15 + t/3)
		local dd = c - flr(c) 
		local j = (x/32+sin(y/128+x/128+t/4)*0.1+t/4)
		local jj = j - flr(j)
		local q = (cos((x+y)/256) + cos((y-x) /256+ 0.5))
		local qq = q - flr(q)
		c = c + flr(j)
		
		c=c%8+8
		local c2 = (c-1)%8+8
		
		if (dd)<0.5 then
			fillp(0b1010010110100101.1)
		end
		if jj < 0.25 then
			c-=8
			c2-=8
		end
		c=flr(c)%16
		c2=flr(c)%16
		
		circ(x,y,1,c+16*c2)
		fillp()
	end

	local x = 64 + 3*sin(t/16)
	local y = 64 + 3*cos(t/16)
	fillp(0b1010111101011111.1)
	circ(x,y,32,0)
	fillp()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700008080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
