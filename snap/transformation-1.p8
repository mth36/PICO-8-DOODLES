pico-8 cartridge // http://www.pico-8.com
version 30
__lua__

#include vec.lua
#include tex.lua
#include _2_util.lua
#include _1_util.lua
#include _1_text.lua

t=13
orot = 0
pal({[0]=0,8,11+128,10,12+128,14,12,},1)

function _init()
	ttonum(torus)
	tet = {
		v = {vec(1, 1, 1),vec(ヌ☉★1, ヌ☉★1, 1),vec(ヌ☉★1, 1, ヌ☉★1),vec(1, ヌ☉★1, ヌ☉★1),},
		l={{1,2},{2,3},{3,4},{1,4},{1,3},{2,4},},
		f={{1,2,3, },{1,2,  4},{1,  3,4},{  2,3,4},},
	}
	local tot = vec(1, 1, 1) + vec(ヌ☉★1, ヌ☉★1, 1) + vec(ヌ☉★1, 1, ヌ☉★1) + vec(1, ヌ☉★1, ヌ☉★1)
	avg = tot / 4
end

function _update()
	t+=1/30
	if t%16<8 then cls() end
	if t%16<2 then
		circinv(64,64,(t%16)*50,4,4,0)
	end

	-- set transform
	orot += rnd(0.00) + (sin(t/8)+0.5>0 and sin(t/8)*0.025 or 0)
	us = vec(-t/8+orot,t/12 + t/4\0.01*0.01,-t/8):u_rot_yxz()
	scale = vec.one() * (32 + rnd(8)*sin(t/8))
	trans = vec(64,64,0)

	drw_gridlines()

	local vs = transform_obj()
	draw_obj(vs)

	if t%16>8 then
		local ti = (t%16-8)/8
		local hh = (t*64-16)%(128)
		local h = min(0,12*sin(ti/1.5))
		if h<0 then
			rectfill(hh,120+h,hh+3,120,0)
		end
	end

	if t%16>14 and t%16<15.5 then
		local y = 130
		local x = 64
		while y>0 do
			local nx = x + rnd(16)-8
			local ny = y - rnd(32)+8
			line(x,y,nx,ny,0)
			x,y=nx,ny
		end
	end

	if t%16>15.5 then
		local ti = (t%16-15.5)+0.5
		for x=-8,128,4 do
			line(x,8,x+16,64,0)
		end
	end

	local s ="i am a place of transformation"
	draw_text(s, 24, 0, 1.75, 1.75, -1/20)
end

--[[--====================================
==========================================
--]]--====================================

function drw_gridlines()
	g=gen()
	local max = 20
	local r = 32
	for i=0,max-1 do
		poke(0x5f5e,g())
		local ang = i/max+t/8
		local pos = vec.frompolar(ang,r)
		local dir = pos:norm()*64
		pos += vec(64,64)
		local prp = dir:perp()

		for m=1,0,gcos(t+8,-1,-0.12,16) do
			if rnd(1)<0.975 then
				local p1x,p1y = (pos + dir*m + prp*m):xy()
				local p2x,p2y = (pos - dir*m + prp*m):xy()
				local p3x,p3y = (pos - dir*m - prp*m):xy()
				local p4x,p4y = (pos + dir*m - prp*m):xy()
				line(p1x,p1y,p2x,p2y,15)
				line(p2x,p2y,p3x,p3y,15)
				line(p3x,p3y,p4x,p4y,15)
				line(p4x,p4y,p1x,p1y,15)
			end
		end
	end
end

function transform_obj()
	local vs = {}
	for v in all(tet.v) do
		local v = v - avg
		local nv = us:dot(v:scale(scale)) + trans
		add(vs,nv)
	end
	return vs
end

function draw_obj(vs)
	-- draw outline fill
	local g = gen()
	for f in all(tet.f) do
		local buf = {}
		for vi in all(f) do
			add(buf, (vs[vi]-vec(64,64))*2+vec(64,64))
		end
		poke(0x5f5e,g())
		--line(buf[1].x,buf[1].y,buf[2].x,buf[2].y,15)
		trifill(buf[1]*(sin(t/8)*0.1+1),buf[2]*(sin(t/8)*0.1+1),buf[3]*(sin(t/8)*0.1+1),15)
	end

	-- draw inner black obj
	local g = gen()
	for f in all(tet.f) do
		local buf = {}
		for vi in all(f) do
			add(buf, vs[vi])
		end

		poke(0x5f5e,0b11110001)
		line(buf[1]*(sin(t/8)*0.1+1),buf[2]*(sin(t/8)*0.1+1),buf[3]*(sin(t/8)*0.1+1),0)
		poke(0x5f5e,0b11111111)
		trifill(buf[1]*(sin(t/8)*0.1+1),buf[2]*(sin(t/8)*0.1+1),buf[3]*(sin(t/8)*0.1+1),0)
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
00000000000000000077000000007700007777000007777000007700007700001a1a1a1a00000000000000000000000000000000000000000000000000000000
0000007007000000077000000000077000770000000007700007700000077000a077770107777770000770000000000000000000000000000000000000000000
00000700007000000770000000000770007700000000077000770000000077001770077a07777770007777000000000000000000000000000000000000000000
0000700000070000077000000000077000770000000007700770000000000770a000770107777770077007700000000000000000000000000000000000000000
00070000000070000770000000000770077000000000770007700000000007701007700a07777770077007700000000000000000000000000000000000000000
0070000000000700077000000000077007700000000077000077000000007700a000000107777770077777700000000000000000000000000000000000000000
07000000000000700770000000000770077000000000770000077000000770001007700a07777770077007700000000000000000000000000000000000000000
0000000000000000007700000000770007777000007777000000770000770000a1a1a1a100000000000000000000000000000000000000000000000000000000
