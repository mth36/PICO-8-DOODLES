pico-8 cartridge // http://www.pico-8.com
version 30
__lua__
function _init()
	t_=rnd(100)
	cls(9)

	pal({
		[0]=2+128,
		5+128,
		5,
		6+128,
		15,
		15+128,
		14+128,
		8,
		8+128,
		2,
	},1)
	
	
	

	lens = {
		7,10,5,13
	}
end

function _update()
	t = time()+t_
	
	local ct8=cos(t/8)
	local st8=sin(t/8)

	local blend = sin(t/16)*0.5+0.5
	
	local cx,cy=
		64+8*cos(t/8),
		64+8*sin(t/8)
	
	local gx = 80-20*sin(t/24)
	local wx = 0+30*sin(t/16)
	local gy = 80+30*cos(t/16)
	local wy = 0+15*cos(t/32)
	
	for i=1,1500 do
		local ox,oy=rnd(128),rnd(128)
		local x,y = ox,oy

		if x>gx then
			x -= wx
		elseif x>=gx-wx and x<=gx then
			x = gx-wx
		end
		if y>gy then
			y -= wy
		elseif y>=gy-wy and y<=gy then
			y = gy-wy
		end

		local sd=(x-cx)*(x-cx)+(y-cy)*(y-cy)
		local c=(
			sin(x/128)+sin(y/64 + t/16)
			+ 4*sin(sqrt(sd+x/64 - y/128)/250) 
			+ 2*flr(x/32+y/64)
			+ t*0.5
		)%10

		local f = (c&0x0.ffff)
		f = f*f

		if f<0.250 then
			fillp(0b1010111110101111.1)
		elseif f<0.5 then
			fillp(0b1010010110100101.1)	
		elseif f<0.75 then
			fillp(0b1010000010100000.1)
		else
			fillp()
		end
		
		circ(ox,oy,1,c)
	end

	fillp()

	local i = (t/6)\1%#lens+1
	local strlen = lens[i]

	local sx,sy = 0,64+(i-1)*8
	local px,py = 0,112

	for x=0,127 do
		local y = 1 + sin(x/200 + t/8)*4 + cos(x/32 - t/16)*1
		local cy = py+10
		if y>=0 then
			line(x,-1,x,y,0)
		end
	end

	for x=0,8*strlen-1 do
		for y=0,8-1 do
			local s = sget(sx+x,sy+y)
			if pget(px+x,py+y)%4>1 then
				pset(px+x,py+y,s)
			end
		end
	end

	
end

function boxblur(x,y,width)
	sum=0
	count=(width*2+1)*(width*2+1)

	for xa=x-width,x+width,1 do
		for ya=y-width,y+width,1 do
			sum=sum+pget(xa,ya)
		end
	end

	return sum/count
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000007000000000000000000070000000000007770000000000007000000000700000000700007007000007000000000000000000000000000000000000
00077700007000000007770000000070000777000070007000777770007000000000000000000000007070000007000000077077007770000007770000777000
00700700007777000070007000777770007000700070000007000070007777000007700000007000007700000070000000707707007007000070007000700700
07000700070000700700000007000700077777700777700007000700070000700007000000007000070070000070000007007007070007000700007000700700
07007700070000700700000007000700070000000700000000777700070000700007000000007000070070000070000007000007070007000700070007077000
00770770077777000077770000777700007777000700000000000700070007000000700000707000070007000007000007000070070070000077700007000000
00000000000000000000000000000000000000000000000007777000000000000000000000070000000000000000000000000000000000000000000007000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000700000000000000000000000000000000000000000000000000000000770000007700000777000007770000070070000077770
00777700070770000007770000700000007000700700070000700700070007700070007000777770007007000000700007000700070007000700700000700000
07000700007007000070007007777000070007000700700007000070007070000700007007000700007007000007000000007000000007000777770000777000
07000700070000000007700007000000070007000700700070070070000700000700070000077000070070000007000000770000000770000007000000000700
00777000070000000700070007000700070007000707000070770070007070000077770000700070070070000070000007000000700070000070000007000700
00007000070000000077700000777000007777000770000007707700070007700000070007777700007700000777000077777000077700000070000000777000
00007700000000000000000000000000000000000000000000000000000000000777700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777000007770000077700000777000000000000000000000707000000770000070070000000000000000000000000000000000000077700007700000077000
07000000000007000070070007000700000000000000000000707000000770000777777000000000000000000000000000070000000700070007700000077000
77770000000070000777700000777000000000000000000000000000000770000070070000000000000000000077770000070000000007700000000000000000
70007000077770007000700000007000000000000000000000000000000770000070070007777770000000000000000007777700000070000000000000000000
70007000007000007000700000070000000000000007700000000000000000000777777000000000000000000077770000070000000000000007700000077000
07770000070000000777000000700000000070000000700000000000000770000070070000000000077777700000000000070000000700000007700000077000
00000000000000000000000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000770000
00000000000000000077000000007700007777000007777000007700007700001a1a1a1a00000000000000000000000000000000000000000000000000000000
0000007007000000077000000000077000770000000007700007700000077000a077770107777770000000000000000000000000000000000000000000000000
00000700007000000770000000000770007700000000077000770000000077001770077a07777770000777000000000000000000000000000000000000000000
0000700000070000077000000000077000770000000007700770000000000770a000770107777770007007000000000000000000000000000000000000000000
00070000000070000770000000000770077000000000770007700000000007701007700a07777770070007000000000000000000000000000000000000000000
0070000000000700077000000000077007700000000077000077000000007700a000000107777770070077000000000000000000000000000000000000000000
07000000000000700770000000000770077000000000770000077000000770001007700a07777770007707700000000000000000000000000000000000000000
0000000000000000007700000000770007777000007777000000770000770000a1a1a1a100000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000700000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777770000777000077700000700000000700000007770000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070007000700070070007777000007000000070007000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000700077777700700070007000000007000000777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700070000000700070007000700007000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000700007777000700700000777000000700000077770000007000000000000000000000000000000000000000000000000000000000000000000000000000
07777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000007770000700000000000000000000000070000000070000070000000000000000000000000000000000000000000000000000000000000
00077700000777000070007000700000000000000000000000070000000000000070000000077700000000000000000000000000000000000000000000000000
00700070007000700070000007777000000000000000000000700000000770000070770000700070000000000000000000000000000000000000000000000000
00077000070000700777700007000000000000000000000000700000000700000777000007777770000000000000000000000000000000000000000000000000
07000700070007000700000007000700000770000000000000700000000700000700700007000000000000000000000000000000000000000000000000000000
00777000007770000700000000777000000070000000000000070000000070000700070000777700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000777000070000000077700070770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07000070007007000777700000700070007007000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70070070070007000700000007777770070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70770070070077000700070007000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07707700007707700077700000777700070000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000007000000000000000000000000000000070000000000000000000000000070000000000000000000000000000000000000000000000000
00077700000000000007000000077700070007000007770000070000007000700000000000000070000777000070007000000000000000000000000000000000
00700700000000000070000000700070070070000070007000700000070000700000000000777770007007000700007000000000000000000000000000000000
07000700000000000070000007000070070070000777777000700000070007000000000007000700070007000700070000000000000000000000000000000000
07007700000000000070000007000700070700000700000000700000007777000000000007000700070077000077770000000000000000000000000000000000
00770770000000000007000000777000077000000077770000070000000007000000000000777700007707700000070000007000000000000000000000000000
00000000000000000000000000000000000000000000000000000000077770000000000000000000000000000777700000000000000000000000000000000000
__map__
023a8a3b16042d000000008a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000