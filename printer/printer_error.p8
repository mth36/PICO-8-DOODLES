pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
	t=0
	cls()
end

function _update()
	t+=1/60
end

function _draw()
	cls()

	circ(64,64,1,10)

	fang=function(char,i,x,y)
		return  cos(x/8/64 - y/8/128 - t/6)
	end
	fpos=function(char,i,x,y,a,w,dx,dy)
		return 0, cos(x/128 - t)*3
	end

	for y=0,128-8,8 do
		rprint("hellookay",0,y,0,1,{
			ang=fang,
			pos=fpos,
		},0)
	end
end
-- fs: (all members have signature f(char,i,x,y,a,dx,dy))
--		pos: -> x,y (draw pos offset)
--		ang: -> a (angle offset)
ord_ofs=97
special_chars={"\n",}
function rprint(s,dx,dy,a,w,fs,trans)
	f_ang=fs.ang or function() return 0 end
	f_pos=fs.pos or function() return 0,0 end
	a=a or 0
	w=w or 1

	x,y=dx,dy
	i=1
	while i<=#s do 
		printh(s)
		char = sub(s,i,i)

		while char=='\n' do
			i+=1
			x=dy
			y+=w*8
			char = sub(s,i,i)
		end

		sid = ord(char) - ord_ofs
		sx,sy = flr(sid%16)*8, sid\16*8
		
		af = a + f_ang(char,i,x,y,a,w,dx,dy)

		ofsx,ofsy=f_pos(char,i,x,y,a,w,dx,dy)
		xf,yf=x+ofsx,y+ofsy

		rspr(sx,sy,xf,yf,af,w,0)

		x+=w*8
		i+=1
	end
end

function find_str(str,look)
	for i=1,#str-#look+1 do
		test=sub(str,i,i+#look-1)
		if look==test then return i end
	end
	return false
end

function rspr(sx,sy,x,y,a,w,trans)
	local ca,sa=mcos(a),msin(a)
	local srcx,srcy
	local ddx0,ddy0=ca,sa
	local mask=shl(0xfff8,(w-1))
	w*=4
	ca*=w-0.5
	sa*=w-0.5
	local dx0,dy0=sa-ca+w,-ca-sa+w
	w=2*w-1
	for ix=0,w do
		srcx,srcy=dx0,dy0
		for iy=0,w do
			if band(bor(srcx,srcy),mask)==0 then
				local c=sget(sx+srcx,sy+srcy)
				if c~=trans then
				pset(x+ix,y+iy,c)
				end
			end
			srcx-=ddy0
			srcy+=ddx0
		end
		dx0+=ddx0
		dy0+=ddy0
	end
end

mcos=(function()
	cache={}
	return function(a)
		a %= 1
		if not cache[a] then
			cache[a]=cos(a)
		end
		return cache[a]
	end
end)()

msin=(function()
	cache={}
	return function(a)
		a %= 1
		if not cache[a] then
			cache[a]=sin(a)
		end
		return cache[a]
	end
end)()

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000077777000077770007777000077777700777777000777700077007700777777000000770077007700770000007700070077007700777777007777700
00777700077007700770077007707700077000000770000007700770077007700007700000000770077077000770000007770770077707700770077007700770
07700770077777000770000007700770077777000777770007700000077007700007700000000770077770000770000007777770077777700770077007700770
07700770077007700770000007700770077000000770000007707770077777700007700000000770077770000770000007707070077777700770077007777700
07777770077007700770077007707700077777700770000007700770077007700007700007700770077077000770000007700070077077700770077007700000
07700770077777000077770007777000077777700770000000777770077007700777777000777700077007700777777007700070077007700777777007700000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700077777000077777007777770077007700770077007700070077007700770077007777770000000000000000000000000000000000000000000000000
07700770077007700777000000077000077007700770077007700070077007700770077000007700000000000000000000000000000000000000000000000000
07700770077007700077770000077000077007700770077007700070000770000077770000077000000000000000000000000000000000000000000000000000
07707770077777000000077000077000077007700777777007707070000770000007700000770000000000000000000000000000000000000000000000000000
07777700077077700000077000077000077007700077770007777770077007700007700007700000000000000000000000000000000000000000000000000000
00770770077007700777770000077000007777000007700007770770077007700007700007777770000000000000000000000000000000000000000000000000
__label__
77007777070700700700000000000000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777077077007700770007007000000007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
77770007007777000077070007700070070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
07777000000770000007700000770700077000700700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
00777700000000000000000000077000007707000770007007070000007777000000700000000000000000000000000000000000000000000000000000000000
00077770000770000000000000000000000770000077070007777700007007700707700000000000000000000000000000000000000000000000000000000000
00007777007700000000000000000000000000000007700000770000007007700777770000000000000000000000000000000000000000000000000000000000
00000777077070000000000000000000000000000000000000070000007770000000770000000000000000000000000000000000000000000000000000000000
70007777770700770700000000000000000770000000000000000000000770000000000000000000000000000000000000000000000000000000000000000000
77077707777007770770007007000000007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777000077777700077070007700070070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
77770000007777000007700000770700077000700700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
07777000000770000000000000077000007707000770007007070000007777000000700000000000000000000000000000000000000000000000000000000000
00007777007700000000000000000000000770000077070007777700007007700707700000000000000000000000000000000000000000000000000000000000
00000777077000000000000000000000000000000007700000770000007007700777770000000000000000000000000000000000000000000000000000000000
00000777770070070000000000000000000000000000000000070000007770000000770000000000000000000000000000000000000000000000000000000000
00007777770700770700000000000000000770000000000000000000000770000000000000000000000000000000000000000000000000000000000000000000
70077770777007770770007007000000007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777700777777770077070007700070070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
77777000077777700007700000770700077000700700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
77770000007777000000000000077000007707000770007007077000007770000000700000000000000000000000000000000000000000000000000000000000
00000007077000000000000000000000000770000077070007777770007077000707700000000000000000000000000000000000000000000000000000000000
00000077770077000000000000000000000000000007700000770000007077000777770000000000000000000000000000000000000000000000000000000000
00000777700770000000000000000000000000000000000000077000007700000000770000000000000000000000000000000000000000000000000000000000
00007777707700077700000700000000000770000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000
00077777777000777770007707000000007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777777777007770777077007700070070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
07777777777777770077770000770700077000700700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
77777777077777700007700000077000007707000770007007077000007770000000700000000000000000000000000000000000000000000000000000000000
77777777000077700000000000000000000770000077070007777770007077000707700000000000000000000000000000000000000000000000000000000000
77777770000777000000000000000000000000000007700000770000007077000777770000000000000000000000000000000000000000000000000000000000
77777700007770007000000000000000000000000000000000077000007700000000770000000000000000000000000000000000000000000000000000000000
77777000077700007700000000000000000770000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000
77770000777000077770000707000000007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
77700000770000777777007707700070070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
77000000777007770777777000770700077000700700077000070000000000000007000000000000000000000000000000000000000000000000000000000000
70000000777777770077770000077000007707000770007007077000007777000007000000000000000000000000000000000000000000000000000000000000
00077777777777700000000000000000000770000077070007777770007007700707000000000000000000000000000000000000000000000000000000000000
00007777777777000000000000000000000000000007700000770000007007700777700000000000000000000000000000000000000000000000000000000000
00077777777770000000000000000000000000000000000000077000007770000000700000000000000000000000000000000000000000000000000000000000
70777077777700007000000000000000000770000000000000000000000770000000000000000000000000000000000000000000000000000000000000000000
77770007777000007700000077000007007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
77700000770000007770000777700077070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
77770000700000007777007707770770077000700700077000070000000000000007000000000000000000000000000000000000000000000000000000000000
77777000000000000777777000777700007707000770007007077000007777000007000000000000000000000000000000000000000000000000000000000000
00777700000000000000000000077000000770000077070007777770007007700707000000000000000000000000000000000000000000000000000000000000
00077770000000070000000000000000000000000007700000770000007007700777700000000000000000000000000000000000000000000000000000000000
70007777000000770000000000000000000000000000000000077000007770000000700000000000000000000000000000000000000000000000000000000000
77077777000007770000000070000000000770000000000000000000000770000000000000000000000000000000000000000000000000000000000000000000
77770077000077777000000077000000007077000007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
77770007000777777700000077700007070007700070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
07777000007777777770000077770077077000700700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
00777700077777777777000007777770007707000770007007077000007777000000700000000000000000000000000000000000000000000000000000000000
00077000777777770000000000777700000770000077070007777770007007700707700000000000000000000000000000000000000000000000000000000000
00077700777777770000000000000000000000000007700000770000007007700777770000000000000000000000000000000000000000000000000000000000
00007770777007770000000000000000000770000000000000077000007770000000770000000000000000000000000000000000000000000000000000000000
77077777770007770000000000000000007777000000000000000000000770000000000000000000000000000000000000000000000000000000000000000000
77770077700077070000000070000000077077700007700000000000000000000000000000000000000000000000000000000000000000000000000000000000
07770000000770000000000077000000770007770070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
00777000007700070000000077700007777000770700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
00077000007000770000000077770077077707700770007007077000007777000000700000000000000000000000000000000000000000000000000000000000
00000000007777000000000007777770007777000077070007777770007007700707700000000000000000000000000000000000000000000000000000000000
00077000077777700000000000000000000770000007700000770000007007700777770000000000000000000000000000000000000000000000000000000000
0000770077777777000000000000000000777700000000000007700000777000a000770000000000000000000000000000000000000000000000000000000000
070777707770077700000000000000000777777000000000000000000007700a0a00000000000000000000000000000000000000000000000000000000000000
0777007077007077000000000000000077007777000770000000000000000000a000000000000000000000000000000000000000000000000000000000000000
00770000700700770000000070000000770007770070770000070000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000007700000000077000000777000770700077000070000000000000007700000000000000000000000000000000000000000000000000000000000
00000000000077000000000077700000777700770770007007077000007777000000700000000000000000000000000000000000000000000000000000000000
00000000000770007707777777770000077777700077070007777770007007700707700000000000000000000000000000000000000000000000000000000000
00077000007777007000777700000000007777000007700000770000007007700777770000000000000000000000000000000000000000000000000000000000
00007700077777700000077700000000077777700000000000077000007770000000770000000000000000000000000000000000000000000000000000000000
07077770777007770000007700000000770077770007700000000000000770000000000000000000000000000000000000000000000000000000000000000000
07770070770070770000000700000000700007770077770000000000000000000000000000000000000000000000000000000000000000000000000000000000
00770000000707700000000000000000700000770770777000070000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000077000000000000000000770000077700077700070000000000000007700000000000000000000000000000000000000000000000000000000000
00000000000770000000000000000000777000077770007707077000007777000000700000000000000000000000000000000000000000000000000000000000
00000000000000000077770000000000777700770777077007777770007007700707700000000000000000000000000000000000000000000000000000000000
00077000000770000777777000000000077777700077770000770000007007700777770000000000000000000000000000000000000000000000000000000000
00007700007777007700777700000000000077770007700000077000007770000000770000000000000000000000000000000000000000000000000000000000
07077770077007707000077700000000000007770077770000000000000770000000000000000000000000000000000000000000000000000000000000000000
07770070070070700000007700000000000000770777777000000000000000000000000000000000000000000000000000000000000000000000000000000000
00770000000707000000000700000000000000077700777700070000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000070000000000000000000700000007700077700070000000000000007700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000770000007770007707077000007777000000700000000000000000000000000000000000000000000000000000000000
00000000000000000007700000000000777000007777007707777770007007700707700000000000000000000000000000000000000000000000000000000000
00077000000770000077770077077777777700000777777000770000007007700777770000000000000000000000000000000000000000000000000000000000
00007700007777000770777070007777000000000077770000077000007770000000770000000000000000000000000000000000000000000000000000000000
07077770077007707700077700000777000000000777777000000000000770000000000000000000000000000000000000000000000000000000000000000000
07770070070070707000007700000077000000007700777700077000000000000000000000000000000000000000000000000000000000000000000000000000
00770000000707000000000000000007000000007000077700070000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000070000000000000000000000000007000007700070000000000000007700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007700000777077007007777000000700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007770000777777777007007700707700000000000000000000000000000000000000000000000000000000000
00077000000770000007700000777700000000007777007707770000007007700777770000000000000000000000000000000000000000000000000000000000
00007700007777000070770007777770000000000777777000777000007770000000770000000000000000000000000000000000000000000000000000000000
07077770077007700700077077007777000000000000777700077000000770000000000000000000000000000000000000000000000000000000000000000000
07770070070070700000007070000777000000000000077700770000000000000000000000000000000000000000000000000000000000000000000000000000
00770000000707000000000000000077000000000000007700077000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000070000000000000000007000000000000000770770000000000000007700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007000000077077070007777000000700000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000007700000077777777007007700707700000000000000000000000000000000000000000000000000000000000
00077700000770000007700000077000000000007770000077770707007007700777770000000000000000000000000000000000000000000000000000000000
00007770007777000070770000777700770777777777000007777000007770000000770000000000000000000000000000000000000000000000000000000000
77077777077007700700077007707770700077770000000000777700000770000000000000000000000000000000000000000000000000000000000000000000
77770077070070700000007077000777000007770000000000077000000000000000000000000000000000000000000000000000000000000000000000000000
07770000000707000000000070000077700000770000000000770000000000000000000000000000000000000000000000000000000000000000000000000000
00777000000070000000000000000000770000070000000000777000007007000007700000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000777000000000000070777707077777700000700000000000000000000000000000000000000000000000000000000000
00077777000000000000000000000000777700070000000077777777007007770707700000000000000000000000000000000000000000000000000000000000
00007777000770000007700000000000777770770000000077777770007007770777770000000000000000000000000000000000000000000000000000000000
00077777007777000070770000077000007777000000000077770000077770000000770000000000000000000000000000000000000000000000000000000000
70777077077007700700077000707700077777700000000007777000007770000000000000000000000000000000000000000000000000000000000000000000
77770007070070700000007007000770770077770000000077770000000770000000000000000000000000000000000000000000000000000000000000000000
77700000000707000000000000000070770007770000000007777000000000000000000000000000000000000000000000000000000000000000000000000000
77770000000070000000000000000000777000770000000000777700077777700007700000000000000000000000000000000000000000000000000000000000
77777000000000000000000000000000777700770000000007777770077777770000700000000000000000000000000000000000000000000000000000000000
77777777000770000000000000000000077777700000000077777777077007770707700000000000000000000000000000000000000000000000000000000000
77777770007777000007700000000000007777000000000077777777077007770777770000000000000000000000000000000000000000000000000000000000
77777700077777700070770000077000000770000000000077777077077777070000770000000000000000000000000000000000000000000000000000000000
77777000777007770700077000707700007777007707777777770007077770000000000000000000000000000000000000000000000000000000000000000000
77770000770070770000007007000770077077707000777777777777007777000000000000000000000000000000000000000000000000000000000000000000
77700000000700700000000000000070770007770000077777777777077777700007700000000000000000000000000000000000000000000000000000000000
77000000000007000000000000000000777000777000007777777777777777770007700000000000000000000000000000000000000000000000000000000000
70000000000070000000000000000000077707707700000777777777777007770000700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007777007770000077777777770000777707700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000770007777000777777777770000777777770000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007777707777777777777007700000777000000000000000000000000000000000000000000000000000000000

