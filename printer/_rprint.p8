pico-8 cartridge // http://www.pico-8.com
version 27
__lua__

--[[
	TODO:
	support for " ", other common punctuation.
]]

function _init()
	t=0
	cls()
end

function _update()
	t+=1/60
end

fang=function(char,i,x,y)
	return cos(x/8/32 - y/8/64 - t/2)*1/12
end
fpos=function(char,i,x,y,a,w,dx,dy)
	return 0, cos(x/128 - t)*3
end

function _draw()
	cls()

	local s="hello ?\n... hello | ?\nare we alone?\n::\n[  ]\n[::]\n."
	rprint(s,64,0,0,1,{
		ang=fang,
		pos=fpos,
		trans=0,
		cen=true,
	})
end

function rprint(s,dx,dy,a,w,p)
	local f_ang=p.ang or function() return 0 end
	local f_pos=p.pos or function() return 0,0 end
	local f_col=p.col or function() return 7 end
	local p_trans=p.trans
	local p_font_index = p.font_index or 0
	local p_cen=p.cen

	local a=a or 0
	local w=w or 1

	x,y=dx,dy
	if (p_cen) x=leftmargin_fromcenter(s,1,dx)

	for i=1,#s do
		local char = sub(s,i,i)

		if char=='\n' then
			x=dy
			y+=w*8
			if (p_cen) x=leftmargin_fromcenter(s,i+1,dx)
		elseif char==' ' then
			x+=w*8
		else
			local sid = ords(char) + (p_font_index or 0)
			local sx,sy = flr(sid%16)*8, sid\16*8
			
			local af = a + (f_ang and f_ang(char,i,x,y,a,w,dx,dy) or 0)

			local ofsx,ofsy=f_pos and f_pos(char,i,x,y,a,w,dx,dy) or 0,0
			local xf,yf=x+ofsx,y+ofsy

			local col = f_col(char,i,x,y,a,w,dx,dy,line)
			pal(7,col,0)

			rspr(sx,sy,xf,yf,af,w,p_trans)

			x+=w*8
		end
	end
end

function leftmargin_fromcenter(str,starti,dx)
	local line = get_line(sub(str,starti))
	return dx - #line*8/2
end

function get_line(str)
	nl = find_str(str,"\n")
	if not nl then return str end
	return sub(str,1,nl-1)
end

function split(str, delim)
	delim = delim or '\n'
	ss={}
	i1,i2=1,1
	while i2<=#str do
		if sub(str,i2,i2)==delim then
			add(ss, sub(str,i1,i2-1))
			i2+=1
			i1=i2
		elseif i2==#str then
			add(ss, sub(str,i1,i2))
			i2+=1
		else
			i2+=1
		end
	end
	return ss
end

function find_str(str,look)
	for i=1,#str-#look+1 do
		test=sub(str,i,i+#look-1)
		if look==test then return i end
	end
	return false
end

function rspr(sx,sy,x,y,a,w,trans)
	local na=a%1
	local ww=w*8
	if na<0.02 or na>(1-0.02) then 
		sspr(sx,sy,ww,ww,x,y)
	elseif abs(na-0.5)<0.02 then
		sspr(sx,sy,ww,ww,x,y,ww,ww,true,true)
	else
		local ca,sa=cos(a),sin(a)
		local srcx,srcy
		local ddx0,ddy0=ca,sa
		local mask = 0xfff8<<(w-1)
		w*=4
		ca*=w-0.5
		sa*=w-0.5
		local dx0,dy0=sa-ca+w,-ca-sa+w
		w=2*w-1
		for ix=0,w do
			srcx,srcy=dx0,dy0
			for iy=0,w do
				if (srcx|srcy)&mask==0 then
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
end

function makeset(tbl)
	set={}
	for key,elem in pairs(tbl) do
		set[elem]=key
	end
	return set
end

puncts={
	'.', ',', '\"', "!", "#", 
	"-", "_", "=", "+", "?", 
	":", ";", "/", "\\", "(", ")", 
	"[", "]", "<", ">", "`", "|"
}
punctset=makeset(puncts)
function ords(c)
	o=ord(c)
	if ord('a')<=o and o<=ord('z') then
		return o - ord('a')
		-- A-Z : 0-25
	elseif ord('0')<= o and o<=ord("9") then
		return o - ord('0') + 26
		-- 0-9 : 26-35
	elseif punctset[c]>=1 then
		return 36 + punctset[c] - 1
		-- punct : 36-whatever
	else
		return 56 -- `NOT FOUND` ~ i.e. a ? in a box
	end
end

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
00777700077777000077777007777770077007700770077007700070077007700770077007777770007777000007700000777700007777000000770007777770
07700770077007700777000000077000077007700770077007700070077007700770077000007700077007700077700007700770070007700007770007700000
07700770077007700077770000077000077007700770077007700070000770000077770000077000077077700007700000007700000777000077770007777700
07707770077777000000077000077000077007700777777007707070000770000007700000770000077707700007700000077000000007700770770000000770
07777700077077700000077000077000077007700077770007777770077007700007700007700000077007700007700000770000077007700777777007700770
00770770077007700777770000077000007777000007700007770770077007700007700007777770007777000077770007777770007777000000770000777700
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00777700077777700077770000777700000000000000000000707000000770000070070000000000000000000000000000000000007777000007700000077000
07700000000007700770077007700770000000000000000000707000000770000777777000000000000000000000000000070000077007700007700000077000
07777700000077000077770000777770000000000000000000000000000770000070070000000000000000000077770000070000000077000000000000000000
07700770000770000770077000000770000000000000000000000000000770000070070007777770000000000000000007777700000770000000000000000000
07700770000770000770077000007700000770000007700000000000000000000777777000000000000000000077770000070000000000000007700000077000
00777700000770000077770000777000000770000007700000000000000770000070070000000000077777700000000000070000000770000007700000077000
00000000000000000000000000000000000000000077000000000000000000000000000000000000000000000000000000000000000000000000000000770000
00000000000000000077000000007700007777000007777000007700007700001a1a1a1a00077000000000000000000000000000000000000000000000000000
0000007007000000077000000000077000770000000007700007700000077000a077770100077000000000000000000000000000000000000000000000000000
00000700007000000770000000000770007700000000077000770000000077001770077a00077000000000000000000000000000000000000000000000000000
0000700000070000077000000000077000770000000007700770000000000770a000770100077000000000000000000000000000000000000000000000000000
00070000000070000770000000000770077000000000770007700000000007701007700a00077000000000000000000000000000000000000000000000000000
0070000000000700077000000000077007700000000077000077000000007700a000000100077000000000000000000000000000000000000000000000000000
07000000000000700770000000000770077000000000770000077000000770001007700a00077000000000000000000000000000000000000000000000000000
0000000000000000007700000000770007777000007777000000770000770000a1a1a1a100077000000000000000000000000000000000000000000000000000
