pico-8 cartridge // http://www.pico-8.com
version 30
__lua__

#include vec.lua
#include tex.lua
#include _2_util.lua
#include subpixel2.lua

local t=rnd(100)
orot = 0

local gen = (function()
	local i=0
	return function()
		i=i+1
		if i%3==0 then
			return 0b11110001
		elseif i%3==1 then
			return 0b11110010
		else
			return 0b11110100
		end
	end
end)

pal({
	[0]=0,
	8,
	11+128,
	10,
	12+128,
	14,
	12,
	7
},1)

function _init()
	ttonum(torus)

	tet = {
		v = {
			vec(1, 1, 1),
			vec(ヌ☉★1, ヌ☉★1, 1),
			vec(ヌ☉★1, 1, ヌ☉★1),
			vec(1, ヌ☉★1, ヌ☉★1),
		},
		l={
			{1,2},
			{2,3},
			{3,4},
			{1,4},
			{1,3},
			{2,4},
		},
		f={
			{1,2,3, },
			{1,2,  4},
			{1,  3,4},
			{  2,3,4},
		},
	}
	local tot =
		  vec(1, 1, 1)
		+ vec(ヌ☉★1, ヌ☉★1, 1)
		+ vec(ヌ☉★1, 1, ヌ☉★1)
		+ vec(1, ヌ☉★1, ヌ☉★1)
	avg = tot / 4
end

function _update()
	t+=1/30
	cls()

	local x,y
	x=64
	y=64

	local f = circfill

	g=gen()
	local max = 20
	for i=0,max-1 do
		poke(0x5f5e,g())
		local ang = i/max+t/8
		local r = 32
		local pos = vec.frompolar(ang,r)
		local dir = pos:norm()*64
		pos += vec(64,64)
		local prp = dir:perp()

		for m=1,0,-abs(cos(t/16)*0.75)-0.1 do
			-- local p1 = pos + dir*m + prp*m*(sin(i/3+t/8))
			-- local p2 = pos - dir*m + prp*m*(sin(i/3+t/8))
			-- local p3 = pos - dir*m - prp*m*(sin(i/3+t/8))
			-- local p4 = pos + dir*m - prp*m*(sin(i/3+t/8))

			local p1 = pos + dir*m + prp*m
			local p2 = pos - dir*m + prp*m
			local p3 = pos - dir*m - prp*m
			local p4 = pos + dir*m - prp*m

			line(p1.x,p1.y,p2.x,p2.y,15)
			line(p2.x,p2.y,p3.x,p3.y,15)
			line(p3.x,p3.y,p4.x,p4.y,15)
			line(p4.x,p4.y,p1.x,p1.y,15)
			--trifill(p1,p2,p3,15)
			--trifill(p1,p3,p4,15)
		end
	end

	orot += rnd(0.00) + (sin(t/8)+0.5>0 and sin(t/8)*0.025 or 0)
	local us = vec(-t/8+orot,t/12 + t/4\0.01*0.01,-t/8):u_rot_yxz()
	local scale = vec.one() * (32 + rnd(8)*sin(t/8))
	local trans = vec(64,64,0)

	local vs = {}
	for v in all(tet.v) do
		local v = v - avg
		local nv = us:dot(v:scale(scale)) + trans

		add(vs,nv)
	end

	--poke(0x5f5e,0b11111111)
	g = gen()
	--for i=1,t%3 do g() end
	for f in all(tet.f) do
		local buf = {}
		for vi in all(f) do
			add(buf, (vs[vi]-vec(64,64))*2+vec(64,64))
		end
		poke(0x5f5e,g())
		--line(buf[1].x,buf[1].y,buf[2].x,buf[2].y,15)
		trifill(buf[1]*(sin(t/8)*0.1+1),buf[2]*(sin(t/8)*0.1+1),buf[3]*(sin(t/8)*0.1+1),15)
	end

	poke(0x5f5e,0b11111111)
	g = gen()
	--for i=1,t%3 do g() end
	for f in all(tet.f) do
		local buf = {}
		for vi in all(f) do
			add(buf, vs[vi])
		end

		--line(buf[1].x,buf[1].y,buf[2].x,buf[2].y,15)
		trifill(buf[1]*(sin(t/8)*0.1+1),buf[2]*(sin(t/8)*0.1+1),buf[3]*(sin(t/8)*0.1+1),0)
	end
end

function ttonum(obj)
	for k,e in pairs(obj) do
		if type(e)=="table" then
			ttonum(e)
		elseif type(e)=="string" then
			obj[k] = tonum(e)
		end
	end
	return obj
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
