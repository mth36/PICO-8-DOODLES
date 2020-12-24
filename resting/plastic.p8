pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

poke(0x5f2d, 1)

--poly

_const_a = 1007/1024
_const_b = 441/1024
_const_c = 5/128

vec = {
	frompolar = function(ang,r)
		return vec(r*cos(ang), r*sin(ang))
	end,
	unit=function(rot)
		return 
			vec(1,0,0),
			vec(0,1,0),
			vec(0,0,1)
	end,

	ZERO = 0.001,

	copy = function(self)
		return vec(self.x,self.y,self.z)
	end,

	polar = function(self)
		return self:ang(), #self
	end,
	ang = function(self)
		return atan2(self.x,self.y)
	end,
	r = function(self)
		return #self
	end,
	turn = function(self, ang)
		local v = self:copy()
		v:setang(self:ang() + ang)
		return v
	end,
	abs = function(self)
		return vec(
			abs(self.x),
			abs(self.y),
			abs(self.z)
		)
	end,

	setc=function(self, x, y, z)
		self.x=x or 0
		self.y=y or 0
		self.z=z or 0
		return self
	end,
	set=function(self,v)
		self.x=v.x or 0
		self.y=v.y or 0
		self.z=v.z or 0
	end,
	setang = function(self,ang)
		return self:setpolar(ang, #self)
	end,
	setr = function(self, r)
		self:setpolar(self:ang(), r)
	end,
	setpolar = function(self, ang, r)
		return self:setc(r*cos(ang), r*sin(ang))
	end,

	magn = function(self)
		return #self
	end,
	sqrmagn = function(v)
		return v.x*v.x + v.y*v.y + v.z*v.z
	end,

	-- https://www.flipcode.com/archives/Fast_Approximate_Distance_Functions.shtml
	-- is only 2D
	approx_magn = function(v)
		local mmin = min(v.x,v.y)
		local mmax = max(v.x,v.y)
		return _const_a*mmax + _const_b*mmin
			- (mmax < 16*mmin and _const_c*mmax or 0)
	end, 

	norm=function(self, len)
		len = len or 1
		if self:nearzero(vec.ZERO) then
			return vec()
		else 
			return self/#self * len
		end
	end,
	perp = function(self, len)
		return vec(-self.y, self.x):norm(len)
	end,
	cross = function(A, B)
		return vec(
			A.y*B.z - A.z*B.y,
			A.z*B.x - A.x*B.z,
			A.x*B.y - A.y*B.x
		)
	end,
	dot = function(v,w)
		return v.x*w.x + v.y*w.y + v.z*w.z
	end,
	cmult = function(a,b)
		return vec(
			a.x*b.x,
			a.y*b.y,
			a.z*b.z
		)
	end,
	nonzero = function(self,unit)
		return not (self.x==0 and self.y==0 and self.z==0)
	end,
	nearzero = function(self,dist)
		return #self<dist
	end,

	constrain = function(self,anchor,dist)
		return (self - anchor):norm(dist) + anchor
	end,
	constrain_min = function(self,anchor,dist)
		local v = self - anchor
		return #v<dist and self:constrain(anchor,dist) or self
	end,
	constrain_max = function(self,anchor,dist)
		local v = self - anchor
		return #v>dist and self:constrain(anchor,dist) or self
	end,

	xy = function(self)
		return self.x,self.y
	end,
	-- yz = function(self)
	-- 	return self.y,self.z
	-- end,
	-- xz = function(self)
	-- 	return self.x,self.z
	-- end,
	xyz=function(self)
		return self.x,self.y,self.z
	end,
	cx=function(self)
		return vec(self and self.x or 1,0,0)
	end,
	cy=function(self)
		return vec(0,self and self.y or 1,0)
	end,
	cz=function(self)
		return vec(0,0,self and self.z or 1)
	end,
	distr = function(self,f)
		return vec(
			f(self.x),
			f(self.y),
			f(self.z)
		)
	end,
	zip = function(self,v,f)
		return vec(
			f(self.x,v.x),
			f(self.y,v.y),
			f(self.y,v.y)
		)
	end,
	fflr = function(self, unit)
		return self:distr(function(a) 
			return fflr(a, unit or 1)
		end)
	end,
	fflrz = function(self, unit)
		local signs = self:distr(sgn)
		local fv = self:distr(abs):fflr(unit)
		return fv:cmult(signs)
	end,
	rot_x = function(v, ang)
		return vec(
			v.x, 
			v.y * cos(ang) - v.z * sin(ang), 
			v.y * sin(ang) + v.z * cos(ang)
		)
	end,
	
	rot_y = function(v, ang)
		return vec(
			v.z * sin(ang) + v.x * cos(ang), 
			v.y, 
			v.z * cos(ang) - v.x * sin(ang)
		)
	end,
	
	rot_z = function(v, ang)
		return vec(
			v.x * cos(ang) - v.y * sin(ang), 
			v.x * sin(ang) + v.y * cos(ang), 
			v.z
		)
	end,

	rot_yxz = function(v, a)
		local nv = v:copy()
		nv = vec.rot_y(nv, a.y)
		nv = vec.rot_x(nv, a.x)
		nv = vec.rot_z(nv, a.z)
		return nv
	end,

	u_rot_yxz = function(angs)
		local cx,sx,cy,sy,cz,sz = angs:cache_trig()
		local x,y,z = angs:xyz()
		local ux = vec(
			cy*cz - sy*sx*sz,
			cy*sz + sy*sx*cz,
			-sy*cx
		)
		local uy = vec(
			-cx*sz,
			cx*cz,
			sx
		)
		local uz = vec(
			sy*cz + cy*sx*sz,
			sy*sz - cy*sx*cz,
			cy*cx
		)
		return ux,uy,uz
	end,

	rrot = function(v, config, a)
		local nv = v:copy()
		for i=1,#config do
			local func = self["rot_"..sub(config, i,i)]
			nv = func(nv, a[i])
		end
		return nv
	end,

	cache_trig = function(angs)
		return 
			cos(angs.x),sin(angs.x),
			cos(angs.y),sin(angs.y),
			cos(angs.z),sin(angs.z)
	end,
}

_vec={
	__index=vec,
	__add=function(p1,p2)
		return vec(p1.x+p2.x,p1.y+p2.y,p1.z+p2.z)
	end,
	__sub=function(p1,p2)
		return vec(p1.x-p2.x,p1.y-p2.y,p1.z-p2.z)
	end,
	__mul=function(p,a)
		return vec(p.x*a,p.y*a,p.z*a)
	end,
	__div=function(p,a)
		return vec(p.x/a,p.y/a,p.z/a)
	end,
	__unm=function(p)
		return vec(-p.x,-p.y,-p.z)
	end,
	__len=function(p)
		return sqrt(p.x*p.x+p.y*p.y+p.z*p.z)
	end,
	__tostring=function(self)
		return "<"..flr(10*self.x)/10 ..","..flr(10*self.y)/10 ..","..flr(10*self.z)/10 ..">"
	end,
}

setmetatable(vec, {
	__call = function(self,x,y,z)
		return setmetatable({
			x=x or 0,
			y=y or 0,
			z=z or 0,
		}, _vec)
end})

function polydraw(vecs,cen,col)
	cen = cen or vec()
	for i=1,#vecs do
		local p1 = vecs[i] + cen
		local p2 = vecs[i%#vecs+1] + cen
		line(p1.x,p1.y,p2.x,p2.y,col)
	end
end

function polyfill(points,cen,col)
	local xl,xr,ymin,ymax={},{},129,0xffff
	for k,v in ipairs(points) do
		local p1, p2 = v + cen, points[k%#points+1] + cen
		local x1,y1,x2,y2,x_array=p1.x,flr(p1.y),p2.x,flr(p2.y),xr
		if y1 == y2 then
			xl[y1],xr[y1]=min(xl[y1] or 32767,min(x1,x2)),max(xr[y1] or 0x8001,max(x1,x2))
		else
			if (y1>y2) then x_array,y1,y2,x1,x2=xl,y2,y1,x2,x1 end
			for y=y1,y2 do
				x_array[y]=flr(x1+(x2-x1)*(y-y1)/(y2-y1))
			end
		end
		ymin,ymax=min(y1,ymin),max(y2,ymax)
	end
	for y=ymin,ymax do
		rectfill(xl[y],y,xr[y],y,col)
	end
end

function polypath(vecs,cen,col)
	cen = cen or vec()
	for i=1,#vecs-1 do
		local p1 = vecs[i] + cen
		local p2 = vecs[i+1] + cen
		line(p1.x,p1.y,p2.x,p2.y,col)
	end
end

function polycen(poly)
	local v = vec()
	for point in all(poly) do
		v = v + point
	end
	return v / #poly
end

function poly_normal(poly)
	local v1 = (poly[2] - poly[1]):norm()
	local v2 = (poly[3] - poly[2]):norm()
	return vec.cross(v1,v2)
end

	--[[
				 4____________________1 (s2,s2,s2)
			   / |                  /|
			 /                    /  |
		  /     |              /    |
		3____________________2      |
		|       |            |      |
		|                    |      |
		|       6_ _ _ _ _ _ | _ _ _5
		|     /              |     /
		|   /                |   /
		| (-s2,-s2,-s2)      | /
		7/___________________8

	--]]
function poly_cube(s)
	local s2 = s/2
	local v = {
		vec(s2,s2,s2),
		vec(s2,-s2,s2),
		vec(-s2,-s2,s2),
		vec(-s2,s2,s2),
		vec(s2,s2,-s2),
		vec(-s2,s2,-s2),
		vec(-s2,-s2,-s2),
		vec(s2,-s2,-s2),
	}
	local f = {
		{ 1,2,3,4 },
		{ 5,6,7,8 },
		{ 1,4,6,5 },
		{ 1,5,8,2 },
		{ 2,8,7,3 },
		{ 3,7,6,4 },
	}
	return f, v
end

function sqr(a) return a*a end

function magn(x,y)
	return sqrt(x*x + y*y)
end

function init_shapes() 
	local cube_f, cube_v = poly_cube(1)
	local cube = {
		f = cube_f,
		v = cube_v,
	}

	SHAPE = {
		cube = cube,
	}
	return SHAPE
end

local polyv = polydraw
local polyp = polypath
local polyf = polyfill

project_onto_rect = function(p, r)
	local lt,wh = r.lt,r.wh
	return vec(mid(p.x, lt.x, (lt+wh).x),mid(p.y, lt.y, (lt+wh).y))
end

local rct = {
	lt = vec(32,32),
	wh = vec(16,16),
}

pal(0,1+128,1)
pal(0,1,2)
pal(6,7,1)
pal(6,7,2)
pal(7,7,2)
pal(1,1,2)
poke(0x5f5f,0x10)
memset(0x5f70, 0b11001100, 16)

local fff = 0b1010010110100101.1

local circ_radius = 6
local circ_dist_x = 32
local circ_dist_y = 32
local circ_ofs_x = 0
local circ_ofs_y = 0

local t=-1
cls()
pc = 0
show = true

local mx,my = stat(32), stat(33)
local omx,omy = mx,my

::♥::

mx,my = stat(32), stat(33)
k = 0.2
omx = omx + k*(mx - omx)
omy = omy + k*(my - omy)

t+=1/30

if (do_again) then fillp(0b0101111101011111) rectfill(0,0,128,128,pc%2==0 and 0 or 6) end
do_again = false

if btnp(5) then
	pc = (pc+1)%4
	fillp(0b1111101011111010)
	rectfill(0,0,128,128,pc%2==0 and 0 or 6)
	do_again = true
end

if btnp(4) then
	show = not show
end

local rct = {
	lt = vec(omx, omy),
	wh = vec(32, 32),
}
rct.lt = rct.lt - rct.wh/2

circ_ofs_x = 16*sin(t/16)
circ_ofs_y = 16*cos(t/16)

for i=1,600 do
	local x,y=rnd(128),rnd(128)
	local v = vec(x,y)

	local dist_rect = (project_onto_rect(v,rct) - v):magn()

	local dist_circ = magn(
		x + circ_dist_x/2 - x%circ_dist_x - x,
		y + circ_dist_y/2 - y%circ_dist_y - y
	) - circ_radius

	local filled = false
	local p = pc
	if p==0 then
		if dist_circ + dist_rect < 10 then
			if dist_circ + dist_rect > 4 then
				fillp(fff)
				filled = true
			end
			circ(x,y,1,6)
		else
			circ(x,y,1,0)
		end
	elseif p==1 then
		if dist_circ - dist_rect < 2 then
			if dist_circ - dist_rect > -16 then
				fillp(fff)
				filled = true
			end
			circ(x,y,1,6)
		else
			circ(x,y,1,0)
		end
	elseif p==2 then
		if - dist_circ + dist_rect < 4 then
			if - dist_circ + dist_rect > -6 then
				fillp(fff)
				filled = true
			end
			circ(x,y,1,6)
		else
			circ(x,y,1,0)
		end
	else
		if - dist_circ - dist_rect < -8 then
			if - dist_circ - dist_rect > -16 then
				fillp(fff)
				filled = true
			end
			circ(x,y,1,6)
		else
			circ(x,y,1,0)
		end
	end
	if (filled) fillp()
end

if show then
	rectfill(0,122,128,127,pc%2==0 and 0 or 6)
	rect(-1,121,128,128,pc%2==0 and 6 or 0)
	print(
		"press x (" .. (pc+1) .. "). move mouse around.",
		0,
		123,
		pc%2==0 and 6 or 0
	)
end

fillp()

spr(0,mx-1,my-1)

flip()goto ♥
__gfx__
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
77700000000000077777700000007000777777770007000777777777777770000000007777000000000000077777000000000700000777000000770777770007
77000000000000000007000000000000777770000000000077777777777700000000007777000000000000000070000000000000000770000000070777770000
70000000000000000000000000000000000700000000000077777777777700000000007770000000000000000000000000000000000700000000070077770000
00000000000000000000000000000000000000000000000077777770007700000000700000000000000000000000000000000000000000000000000007777000
00000000000000000000000000000000000000000000000000077770007000000000000000000000000000000000000000000000000000000000000007777777
00000000000000000000000000000000000000000000000000077000007000000000000000000000000000000000000000000000000000000000000007770777
00000000000000000000000000000000000000000000000000077000000000000000000000000000000000000000000000000000000000000000000007000077
00000000000000000000000000000000000000000000000000707700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077000000000000000000000000000000000000000000000000000000000000000000000077
00000000000000000000000000000000000000000000000000000777700000000000000000000000000000000000000000000000000000000000000000007700
00000000000000000000000000000000000000000000000000077777770000000000000000000000000000000000000000000000000000000000000000770070
00000000000000000000000000000000000000000000000000777777777000000000000000000000000000000000000000000000000000000000000077700707
70000000000000000000000000000000000000000000000077777777777700000000000000000000000000000000000000000000000000000000007777700000
70000000000000000000000000000000000770000000007777777777777770000000007770000000000000000000000000000000000700000000077077770000
07000000000000000000000000000000007777000000077777777777777777000000077777000000000000000000000000000000007770000000077707070000
70700000000000000000000000000000077777700000077777777777777777700000077007700000000000000000000000000000077777700000077770077770
00070000000000000070000000000000777777777000077777777777777777770000077770770000000000007000000000000000777777770000007700000077
00007000000000000770000000000007777777777700007777777777777777700000707000007000000000007770000000000000777700077000007777000077
00077000000000000777000000000007777777777000007777777777777777700000707000070000000000007777000000000007777777777000007077000070
77770000000000000077000000000000777777770000007777777777777777000007007070077000000000000000000000000077777777777000007777700000
00070000000000000000000000000000777777700000007777777777777777000000777000707000000000000000000000000007777777770000007777770000
77777000000000000000000000000000007777700000000777777777777777000000007700700000000000000000000000000000000777700000007777770000
70000000000000000000000000000000000707700000000777777777777770000000007077000000000000000000000000000000000070700000007777770000
70000000000000000000000000000000000000000000000777777777777770000000000000000700000000000000000000000000000000000000007770000000
00000000000000000000000000000000000000000000000777777777777700000000000000000000000000000000000000000000000000000000000777007000
00000000000000000000000000000000000000000000000007700000000700000000000000000000000000000000000000000000000000000000000770777000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000770
70000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000007000777
70000000000000000000000000000000000000000000000077777777777000000000000000000000000000000000000000000000000000000000000077777777
70000000000000000000000000000000000000000000000777777777777700000000000000000000000000000000000000000000000000000000000770007777
00000000000000000000000000000000000000000000000777777777777700000000000000000000000000000000000000000000000000000000000700007777
77000000000000000000000000000000000007000000007777777777777770000000000770000000000000000000000000000000000070000000007077777700
00700000000000000000000000000000007777700000007777777777777777000000077007000000000000000000000000000000007777000000007007777700
70070000000000000000000000000007777777770000007777777777777777700007700007770000000000000000000000000007777777770000070007770000
07770000000000000000000000000007777777770000077777777777777777770007000000777000000000000700000000000007777777777000070000000000
00077700000000007777000000000007777777777700077777777777777777700007070000077000000000000777000000000707777777777700700000000000
00077700000000000777000000000007777777777000777777777777777777700007070000077000000000007777000000000007777777777000070000007700
00007000000000000070000000000007777777777000777777777777777777700000707000077000000000000770000000000007777777777000070000077700
77070000000000000000000000000007777777770000077777777777777777000000707000070000000000000000000000000007777777770000007777777770
77770000000000000000000000000000007777700000007777777777777777000000777700700000000000000000000000000000007777700000007777770000
70000000000000000000000000000000000070000000000777777777777777000000000077700000000000000000000000000000000007000000000770000000
00000000000000000000000000000000000000000000000777777777777770000000000000000000000000000000000000000000000000000000000707000000
00000000000000000000000000000000000000000000000077777777777770000000000000000000000000000000000000000000000000000000000070000777
00000000000000000000000000000000000000000000000007777777777770000000000000000000000000000000000000000000000000000000000077777077
00000000000000000000000000000000000000000000000000700770000000000000000000000000000000000000000000000000000000000000000000000777
00000000000000000000000000000000000000000000000000000777000000000000000000000000000000000000000000000000000000000000000000000777
00000000000000000000000000000000000000000000000000077777700000000000000000000000000000000000000000000000000000000000000000077000
00000000000000000000000000000000000000000000000000777777770770000000000000000000000000000000000000000000000000000000000007700000
00000000000000000000000000000000000000000000000077777777777700000000000000000000000000000000000000000000000000000000000770000000
77000000000000000000000000000000000700000000007777777777777770000000007000000000000000000000000000000000000700000000077077000000
77700770000000000000000000000000007770000000007777777777777777000000007770000000000000000000000000000000007770000000070700000000
07770000000000000000000000000000777777700000077777777777777777700000070007700000000000000000000000000000077777000000070007700000
00770000000000000000000000000000777777770000077777777777777777770000770007770000000000000000000000000000077777770000070007700000
00077000000000000770000000000000000000777000077777777777777777700000770000007000000000000770000000000000777777777000070707000000
00077000000000000770000000000007777777777000007777777777777777700007770000007000000000000700000000000007777777777000070707000000
00777000000000000000000000000000777777777000007777777777777777700007777000070000000000000000000000000007777777770000007007000000
07770000000000000000000000000000777777777070000777777777777777700000077700070000000000000000000000000000077777700000007007700000
77770000000000000000000000000000077777000000000777777777777777700000077770700000000000000000000000000000077777000000007007700000
00000000000000000000000000000000007070000000000777777777777777000000000007700000000000000000000000000000000007000000007007700000
00000000000000000000000000000000000000000000000777777777777770000000000000000000000000000000000000000000000000000000007007700000
00000000000000000000000000000000000000000000000077777777777770000000000000000000000000000000000000000000000000000000007777777700
00000000000000000000000000000000000000000000000007000777000000000000000000000000000000000000000000000000000000000000000077777777
00000000000000000000000000000000000000000000000000007070700000000000000000000000000000000000000000000000000000000000000000777777
00000000000000000000000000000000000000000000000000007770700000000000000000000000000000000000000000000000000000000000000000007770
00000000000000000000000000000000000000000000000000077777000000000000000000000000000000000000000000000000000000000000000000070077
00000000000000000000000000000000000000000000000000777777700000000000000000000000000000000000000000000000000000000000000000700707
00000000000000000000000000000000000000000000000007777777770000000000000000000000000000000000000000000000000000000000000077700700
00000000000000000000000000000000070000000000000007777777777700000000000000000007700000000000000000000000070000000000000707000000
70000000000000000000000000000000077700000000000077777777777770000000077000000000000000000000000000000000077700000000007070000000
77700000000000000000000000000000077777000000000777777777777777000000077770000000000000000000000000000000077777000000070777777000
07770000000000000000000000000000077777770000007777777777777777770000070007700000000000000000000000000000077777700000700077777000
70077000000000007770000000000000077777777000007777777777777777770000070000777000000000000770000000000000077777777000070077777000
70070700000000000770000000000000077777777000777777777777777777700000070000777000000000000070000000000000077777777700070000000000
70770700000000000000000000000000777777777000777777777777777777000000077007700000000000000000000000000000077777777000007000000000
70700700000000000000000000000000777777777000077777777777777770000000070770000000000000000000000000000000077770000000000700000007
77700000000000000000000000000000770000700000000777777777777700000000077700000000000000000000000000000000700070000000000707700000
77000000000000000000000000000000000000000000000077777777777700000000070000000000000000000000000000000000000007000000000077000000
00000000000000000000000000000000000000000000007007777777777000000000000000000000000000000000000000000000000000000070000007700000
00000000000000000000000000000000000000000000000000077777770000000000000000000000000000000000000000000000000000000000000000700007
00000000000000000000000000000000000000000000000000007777700000000000000000000000000000000000000000000000000000000000000000700777
70000000000000000000000000000000000000000000000000000777700000000000000000000000000000000000000000000000000000000000000000077700
00000000000000000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000007077
00000000000000000000000000000000000000000000000000000777770000000000000000000000000000000000000000000000000000000000000000077777
00000000000000000000000000000000000000000000000000777777777000000000000000000000000000000000000000000000000000000000000077770000
00000000000000000000000000000000000000000000007777777777777700000000000000000000000000000000000000000000000000000000000070770000
77000000000000000000000000000000000070000000007777777777777770000000000070000000000000000000000000000000000070000000700700777770
70700000000000000000000000000000007777000000007777777777777777000000000707000000000000000000000000000000007777000000000700000000
07070000000000000000000000000000077777700000007777777777777777000000077000700000000000000000000000000000077777700000000700000000
00770000000000000000000000000007777777770000007777777777777777700000700000070000000000000000000000000007777777770000007000000000
00007000000000000770000000000000777777777000007777777777777777700007000000007000000000000770000000000007777777777000007000770000
00007000000000007770000000000007777777770000007777777777777777700000700000007000000000000770000000000000777777777000077077770000
70077000000000000000000000000000777777770000007777777777777777700000700000077000000000000000000000000000777777770000077077777000
70770000000000000000000000000000777777770000077777777777777777700000077700770000000000000000000000000000077777770000007007777000
77700000000000000000000000000000000700700000077777777777777777700000077077000000000000000000000000000000007000070000000700000000
70000000000000000000000000000000000000000000007777777777777770000000007700000000000000000000000000000000000000000000000770000770
00000000000000000000000000000000000000000000000777777777777000000000000000000000000000000000000000000000000000000000000070000770
00000000000000000000000000000000000000000000000000777777770000000000000000000000000000000000000000000000000000000000000007000000
00000000000000000000000000000000000000000000000000007777000000000000000000000000000000000000000000000000000000000000000000707077
00000000000000000000000000000000000000000000000000000077000000000000000000000000000000000000000000000000000000000000000000077700
00000000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000707
00000000000000000000000000000000000000000000000000000777770000000000000000000000000000000000000000000000000000000000000077777770
00000000000000000000000000000000000000000000000000777777777000000000000000000000000000000000000000000000000000000000000077777000
00000000000000000000000000000000000000000000000777777777777000000000000000000000000000000000000000000000000000000000000077777000
77000000000000000000000000000000000070000000000777777777777700000000000077000000000000000000000000000000000070000000000707777000
00700000000000000000000000000000000777000000007777777777777770000000000777700000000000000000000000000000007777000000000707777700
00070000000000000000000000000000777777700000007777777777777777700000777777700000000000000000000000000000077777700000007777777700
00070000000000000070000000000000777777770000007777777777777777700007700700070000000000000700000000000007777777770000077770007777
00007000000000007777000000000000777777777000007777777777777777700007000000007000000000000770000000000000777777777000077070000000
00007000000000007777000000000000777777770000077777777777777777700000700000007000000000007770000000000000777777770000077070000000
70770000000000000000000000000000777777770000007777777777777777700000070000770000000000000770000000000000777777770000077000000000
00770000000000000000000000000000777777700000007777777777777777700000070007770000000000000000000000000000777777770000077700000000
07000000000000000000000000000000007000700700007777777777777777000000007770770000000000000000000000000000070000700000007770000077
70000000000000000000000000000000000000000000000777777777777777000000000000000000000000000000000000000000000000000000000770000000
70000000000000000000000000000000000000000000000077777777777077000000000000000000000000000000000000000000000000000000000770000000
00000000000000000000000000000000000000000000000007777777770000000000000000000000000000000000000000000000000000000000000007700000
00000000000000000000000000000000000000000000000077077777000000000000000000000000000000000000000000000000000000000000000007707777
00000000000000000000000000000000000000000000000000007770000000000000000000000000000000000000000000000000000000000000000000777700
00000000000000000000000000000000000000000000000000007777000000000000000000000000000000000000000000000000000000000000000000000707
00000000000000000000000000000000000000000000000000077700000000000000000000000000000000000000000000000000000000000000000000007077
00000000000000000000000000000000000000000000000000077777000000000000000000000000000000000000000000000000000000000000000000070777
00000000000000000000000000000000000000000000000077777777770000000000000000000000000000000000000000000000000000000000000007700777
00000000000000000000000000000000007000000000007070777777770000000000000000000000000000000000000000000000007000000000000777000000
70000000000000000000000000000000007700000000000777777777777770000000007700000000000000000000000000000000077000000000000777000000
77770000000000000000000000000000077777700000007777777777777777000000077000000000000000000000000000000000077707000000000700000000
77777000000000000700000000000000777777700000077777777777777777770000070777000000000000000000000000000000077777770000077000000700
00777000000000000770000000000007777777770000777777777777777777770000077000770000000000000770000000000000000007777700077000000700
07077000000000007770000000000007777777770000077777777777777770070000077007707000000000000770000000000000007777777000007000000000
07777000000000000000000000000000777777777000007777777777777770070000077777077000000000000000000000000000777777777000000707000007

