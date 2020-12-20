pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
	dt=1/30
	t=0
   tf=0

	pal(2,1+128,1)

	scrw,scrh = 128,128

	cls()
end

function _update()
	--cls(0)
   t+=dt
   tf+=1
	T = t

	for i = 1, 1500 do
		local x, y = rnd(240), rnd(136)
		local p
		
		-- y=(scrh/scrw)*x is a line from top-left to bottom-right
		if y < (scrh / scrw * x) then
			-- left vs right half of screen:
			if x < scrw / 2 then
				p = pget(x - 1, y + 2)
			else
				p = pget(x - 2, y - 1)
			end
		else
			if x > scrw / 2 then
				p = pget(x + 1, y - 2)
			else
				p = pget(x + 2, y + 1)
			end
		end
		circ(x, y, 1, p)
	end

	local k = sqrt(2)
	for i=1,100 do
		local ang,r = rnd(1),rnd(64*k)
		local ang2,r2 = ang, r-3

		local x1,y1 = 64+r*cos(ang),64+r*sin(ang)
		local x2,y2 = 64+r2*cos(ang2),64+r2*sin(ang2)

		local p = pget(x1,y1)
		if p==0 then
			circ(x2,y2,1,2)
			line(x1,y1,x2,y2,1.5+sin(t/8)*0.5)
		end
 	end

	local r = 16
	local x = 64 + cos(t/8)*32
	local y = 64 + sin(t/8)*32
	local w = 7
	for i=1,w do
		circ(x,y,r-i+1+rnd(2)-1,0)
	end


	local vs = {
		vec(20,20),
		vec(20,-20),
		vec(-20,-20),
		vec(-20,20),

	}

	vs = subdivide(vs, 4, false)

	for i=1,#vs do
		local v = vs[i]

		local ang,r = (v):polar()
		ang = ang - T/8
		r = r + 2*sin(t/16 + i/(8 + sin(t/18)))
		v = vec.frompolar(ang,r)

		v = v + vec(5*cos(T/4 - i/(#vs/3)),sin(T/8 + i/(#vs/5))*8) + vec(0,i%2*3)

		vs[i] = v
	end

	polyv(vs,vec(64,65),0)
	polyv(vs,vec(64,62),0)
	polyv(vs,vec(64,67),1)
	polyv(vs,vec(64,64),13)
end

function sqr(a)
	return a*a
end

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
	one=function()
		return vec(1,1,1)
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

	-- TODO: implement better version of this thing:
	xy = function(self)
		return self.x,self.y
	end,
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
		return sqrt(sqr(p.x)+sqr(p.y)+sqr(p.z))
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

function append(t1, t2)
	for elem in all(t2) do
		add(t1, elem)
	end
	return t1
end

function line2(x1,y1,x2,y2,c)
	local num_steps=max(
	 abs(flr(x2)-flr(x1)),
	 abs(flr(y2)-flr(y1)))
	local dx=(x2-x1)/num_steps
	local dy=(y2-y1)/num_steps
	for i=0,num_steps do
	 pset(x1,y1,c)
	 x1+=dx
	 y1+=dy
	end
  end

-- TODO: add a "levels" parameter...
function subdivide(vs, levels, is_path)
	if (levels<=0) return vs
	if (levels==nil) levels = 1
	local res = {}

	local length = is_path and (#vs-1) or #vs 
	for i=1,length do
		local v = vs[i]
		local w = is_path and vs[i+1] or vs[i%length+1]

		local line = subdivide_line(v,w,levels)
		line[#line] = nil

		append(res, line)
	end

	if is_path then
		add(res, vs[#vs])
	end

	return res
end

function subdivide_line(a, b, levels)
	if (levels<=0) return {a,b}

	-- a --- avg --- b
	local avg = (a + b)/2
	local aa = subdivide_line(a,  avg,levels-1)
	local bb = subdivide_line(avg,b,  levels-1)
	aa[#aa] = nil
	append(aa,bb)
	return aa
end

function polydraw(vecs,cen,col)
	cen = cen or vec()
	for i=1,#vecs do
		local p1 = vecs[i] + cen
		local p2 = vecs[i%#vecs+1] + cen
		line2(p1.x,p1.y,p2.x,p2.y,col)
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
		line2(p1.x,p1.y,p2.x,p2.y,col)
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


polyv = polydraw
polyp = polypath
polyf = polyfill
__label__
h010111h1h1h1h1h111h101hhh1h1h1h11101h1hh1hhdhdh0h00101011111hddd00000000000000h1h1000000000h0h000000000000101000000000100000000
01011111h1h1h1h1h1110101h1h1h1h1111101h1hhhdhdhdh0h001011111h0dddd00000000000011h11110h0000h000000000000011010100000001010000000
101011hh1hhh111h1111101h1h1h1h1h11h01hhhhhdhdhdh0h0h1011111h0h0ddhd00000001010111111110h0000h10100h0h0h01000010000000h0101000000
h1h11h11hhhh1111111101h1h1h1h1h11h0h0hhhhdhdhdh0h0hd010110hhh0h0h0h1h1h1h1h1010111111110h00h1010100h0h0h0h000000000000h01010100h
1h1h111h1h11111h1110101h1h1h1h1h11h1hhhhhhd1dhdh1hd01d110h0h0h0h0h0h1h1h1h1h1h10101111111h01010100h0h0h0h1h00000h0001h1h01110100
hhh1h111h11111h1h1110101h1h1h1h1h11hhhhhhdddhdh1h1h1d1d110h0h0hdh0hhhhh1h1h1h11101001111h1h100100h0h0h0h1h1000000h010h0hh101100h
hhhh111h1h111h1h1110101h1h1h1h1h1hhhhhhhhddddh0h1h1hhd1h0h0d0h0h0ddhh1hhhh0h1h10100001111h11100000h1h0h0h1h000h010h1h0h1h01h10h0
hhh1h111h111h1h1110101h1h1h1h1h1hhhhhdhhdhddhhh1h1hhdhh010h0h0d0d0dhdh1hhhh0h1h1h000000111111000001h000h0h0h0h0h0h1h0h0h0101h101
hhhh111h1h1h1h1h1h101h1h1h1h1h1hhhhhdhddhddhdhdhdh1dhdh10h0h0d0d0dhdhdhh1h1h0h0h0h0h00000111010h0h10000000h0h0h001h0h0h0h01h1010
h1h1h111h1h1h1h1h1hhh1h1hhh1h1hhhhhdhdhhddddhdhdhd1hdhd0h0h0h0d0dh1hdh1hdh1110h000h1h100h0h11110h1h10000000h0h0010111h0h01h1h101
1h1h1h1h1h1h1h1h1hhhhh1hhhhh1hhhhhdhdhhddhdhdhdhdhddhdhd0h0d0d0d0dddd1h1hdhd1100000h1h1h0h1h111h1h1h1h0h0000h0h1h1111110111h1010
01h1h1h1h1h1h1h1h10hh1hhhhh1hhhhhhhdhdddhdhdhdhdhddhdhd0hh10d0d0d0dddd1d1ddhd111000h01h0h1h1h1h1h1h1h1h0h000hhhhhh1111101111h101
101h1h1h1h1h1h1h1hhh1hhhhh1hhhhhdhdddddhdhdhdhdhddhdhdh1h1h1010d0d0dd1d1ddhdh111h0h010101h1h1h1h1h1h1hhhhh0h1h1hhh01000101101h10
0hh111h1h1h1h1h1hhhhhhhhhhhhhhhdhdhdddddhdhdhdhddddhdh1h1h111d10d0dddddddddhh1111101010101h111h1h1h1hhhh1h11111010101000100001h1
1h1h1h1h1h1h1h1h1hhhhhhhhhhhhhhhdhdddddhdhdhdhddddhdhdh1h111d1d1d0dddddddddd1111111010101011111h1h1h1hh1h1h1h11101010100000000hh
h1hhhhh1h1h1hhh1hhhhhhhhhdhhhhhdhdddddhdhdhdhdhddhdhdh1h11111d111d0d0d0dddd11111111111110111111111h1111h1h1h1h111hh0101000000h1h
1h1hhhhh1h1hhhhhhhhhhhhhdhdhdhhhdhdddhdhdhdhdhddddhdh1h11111d1111010d0d0d0d11111111h11111111111111111111h1h1h1hhhhhh0h0h0h0h00h0
h1h1hhhdhdhhhhhhhhhhhhhhhdhdhdhdhdddhdhdhdhdhddddddhdh11111d1d1d11110d0d0d0d11111111h111111111111111111h1h1h1h1hhhhhhhhhhhh0h00h
1h1hhhdhdhhhhhhhhhhhhhhhdhdhdhdhdddddhdhdhdhddddddddh1011101d1d0d1d1d1d0d0d1d111111h1h1111111111h1h11111h1h1h1h1hhhhhhhhh0hh0000
h1hhhhhdhdhhhhhhhhhhhdhdhdhdhdhdhdddhdhdhdhdhddddddhd011111d1d1d0d1d1d1d0d1d1dh1h1h1h1h11hh11h1h1h1h111h1h1h1h1h1h1h1hhh0h000001
1hhhhhhhhhdhdhhhhhhhdhdhdhdhdhdhdddddhdhdhdhd1dddddd01011101d0d010d011d1d0d1d1d1hhhh1h1h1hhhhhhh1111h1h1h1h1h0h1h1h1h1h1h0h0h0h0
hdhhhhhhhhhdhdhdhhhdhdhdhdhdhdhd1dddddhdhdhd1d1ddddh101h101d1d0d0d01h11d0dhd1d1d1h1hh1h1h1h1hhhhh1111h1h1h1h1h0h0h1h1h1h1h0h0h0h
d0dhhhhhhhhhdhdhdhdhdhdhdhdhdhd1d1dddh0hdhd1d1dddd01h1h1h1d1d0d0d0dh1h10d0d1d1d11111hhhh1h1h1hhhh111h1h1h1h1h0h0h110h0h1hhh0h0h0
1dhdhhhhhhhhddhdhdhdhdhdhdhdhdhd1dddh0h0hd1d1dddd010hh1h1d1dhd1d0d0dh1h1hd0d111h11111hhhh1h1hhhh1h1h1h1h1h1h1hhh1h010h1hhhhh0h0h
d1d1dhhhhhhddddhdhdhdhdhdhdhdhd1dddh0h0hdhd1ddd1010hhhh101dhdhd110d0dhdh1h1h1111h111h1h11h1hhhhhhhh1hhh1hhh1hhhhh01010hhhhhhhhh1
1d1d111hhhhhdhdd1d1dhdhdhd1d1d1dddh0h0hdhd1ddd1010h1hhh01d1dhd1d000d0d0dh1h1h11h1h1h1h1h11h101hhhhhhhhhhhhhhhhhhhh010h0hhhhhhhhh
dh111111d1hdhdh1d1d1dhdhd1d1d1dddd0h0hdhd1d1d1110h0hhd01d1dhdhd0d101d0d0d0dhd0d1h1h1h1111h1h10101hhhhhhhhhhhhhhhhhh010h0hhh0hhhh
h11111111ddhdhdh1d1d1d1dhd1d1d1dd0h0h0hd1d1d1111h0hhd0d01dhdh0000d0d1d0d0d0d0d011d1h111111h1h1010hhhhhhhhhhhhhhhh1h1010h1h1h0h0h
hh1hh111h1hdhdh101d1d1d1d1d1d1ddd10h0101d1d1111h0h1dhd01d1dh010000d0d100d0d0d0d011d1d111111h1h101hhhhhhhhhhh0h1h1h1h1h1h11hhh0hh
h1hhhh1h1h1h1h10101010101d1d1d1d101010101d111110h0d1d0h01hh0000001011d1d0d0d0d0d000d0d1111h1h1h1h1hhhhhhhhhhhhh0h1h1h1h1h1hhhhhh
hh1hhhh1h1h1h1d10d01010101d1d101d101010111d1101101hd0001hhh00000101010d0d0d0d0d0d0d0d0d011111h11110hhhhhhhhhhhhhhh1h1h1h1h1h1hhh
hh0hh1hhhhhh1h1dd0d01010101d101010d01011111101001hdh000d1h000hh00101000d0d0d0d0d0d0d0d0d0111111111111hhhhhhhhhhhhhh1h1h1h1h1h1hh
hhhhhhhhhhhhd1h1dd0d01010101d101010101111110101h01h00000h00dhh1hh0h00000d0d1d0d0d1d0d0d0d0d11111111111h1hhhhhhhhhhhh1h1h1h1h1h1h
hhhhhhhhhhhdhdhdhdhddd101010101010101011110101h01000000000dd0101h11d00000d0d0d0d1d0d0d00001d1d111111111h1h1hh1h1hhhhhhh1h1h1h1h1
hhhhhhhhhhhhdhdhdhdhddd1010101010101010110101h0h0d000dd000d0d0001h1h000100d000dh11d0d0000101d0d1d1111111hh111h1h1hhhhhhh1h1h1h1h
h0h0hdh1h1hhhdhdhdhddddd1010101010101011h10d00d010000d000ddd000000h11010hd0000h1hd1d0d0000101d0d1d1011111110h0h1h1hhhhh0h1h1h1h1
0h0hdhdh1hhhhhdhdhdhdddddd0d01010101010110d00d000d000000d0000ddd00011100dh11010hd0d0d0d000010000d00101010h01010h1h1hhh0h0h0h1h1h
h0h0hdh1d1hhhhhhhdhddddhd0d0d010101010100d0d000100d0000ddd001d00dd0000000dhd100000000d0000d010100100101010101010h0h1h1h0h0h0h1h1
0h0h0hdh1h1d1hdhhhhhddhdhd0d1d0d110hd1d0d0d000000d0000dd0dd1d00000d100d000d1d00hdh0000000d0d0101111111110101010h0h0h1h0h0h0h1h1h
h0h0h0hdhdhdddddh0hhhdhhdhd1d1d0d011hd0d0d0000000000ddd0000d0111000ddd0d0d1d1d1dhdh01000d0d0000000111111111010101011h1h0h0h0h1h1
0h1h1h0hdhdhdddddhdhd1dhddhd1d1d0d0h0dd0d000000dd1d1dd0111001111110000d0d0d1d1d1dhhh100000000000000000111111010101010h0h010h0h1h
h1h1hhhd1dhdhddddddd1d1d1ddhd1d1d00000dd0000000d0ddd001111111111111d0d1dd00101110hh10000000000000010000111111010101010h01010h0h1
0h1hhhh1h1dhd1ddddddd1d1d1dd0dhd0d000000000000d010001111h1111111111111d10d001010101h000h000000000000000001111101010101010101011h
10h0hh1h1h111d1dddddd1111111d0d0d1d00001000000d11h11111h1111111h11111d1d1d000101000000h00000000h1h000000001110h01010101010101010
h10h0h1hhhhd01d1d1dd1d111111dd011h1000111h000d0111111111111111h0h111111110d00110000000d00000000000000000001h1h110101010101111101
1h10h0h1hhd111101d1d11111d1d1dd011h10d0d11h00d111h11111h1111111hh1h1h11101d0000000000d0dd0000000000000000001h1h11010101010111111
hhhh0h1h1h1d110101010111d1d1dddd1h10ddd0dh1hd011h11111h1111111h1hhhh1h11110d000000000d0ddd0000000000000000001h1h110h0h0101111111
hhhhh0h1h1d1d1d0101010dd1d1d1dddd111ddddd1h1d11111111h1h11111h1h1h1hh1h11010d0h00000d01d0000000000000000000001h1h1h0h0hhh1111111
hhhhhh0h1h1d0d0d01010d0dd1d1ddddd1111d0ddd1ddd11111111h1h111h1h111h1hh1111100d0h0000d10d11000000000000000000001h1h1h0hhhhh111111
1hhhhhh0h1h1d0d0d0d0d0d0dd1d1d1dd11111d0dd0ddd1111111h1h1h1h1h1h111h1h1111110d00000d010d11d0d0000000000000000001h1h1h1hhh1111111
h1h0hhhh1h1h1d1h1d1d1d0d0dd1d1d1d0101h01010ddd111111h1h1h1h1h1h1h111hhh111111d0d0d0d10d10d0d0d0000000000000000h0hh1h1h1111111111
1h0h0hhhhhh1h1h1h1d1d1d0d0dd1d1d1d010010101ddd0111111h1h111h1h1h1h111hh1h1h111d0ddd010d1d1d1d000000000000000000h0hh1h1h111111111
h1h0h0h1hhhh1h1h1h1d1d1d1d0dd1d111d011111d0ddd001111h1h1h1h1h1h1h1h111111h1111d0d00100d10d00100000000h0000000000h111111111111111
1h1h1h11hhhhh111h1h1h1d1d1d01d1111110111d1ddddd0111h1h1h1h1h1h1h1h1h1111111111d0d001dd10d0d0000000010000000000001111111111111111
1011h1111hhhh1111h1h1h1d10111111111d11111d1dddd0h111h1h1h1h1h1h111111h11111111dd111d00110d01000h01110010000000000011111111111111
011111h1h11hhh111111h101010111111dd1d11111d1dd0d0h1h111h1h1h1h1h1111h1111111111d100d001h101000h11h1h0h00000000000001111111111111
11111h1h1h1h1h1h1111101010101111111d1d1111111d1dh1h1h1h1h1h1h1h1h11h11010111111dd0d01100h101000h0000h000000000000001111111111111
011111h1h1h1h1h0h1111h1101111111111111d11111111d0h1h1h1h1h1h1h1h1hh1h1101011111dd0d101010010000000000000000000010011111111111111
1111h111111h1h0h0h11111111d11111111111111d11111d0hh1h1h1h1h1h1h1h1hhh1110111111d0dd10000100000000h00000000000000h111111111111111
1h1h1h11111111h010h11111111d111111111111111111d1d01h1h1h1h1h1h1h1h1h1hhh111111dd1d100000000000000010000000000000h0001h1111111111
h1h1h0111111111111111111111111111111111111111111d0h1h1h1h1h1h1h1h1h1h1hhh111111d101d000000000000h0010000000000001h0101h111111111
1h1h01011111111111111d1d1111111111111111111111h1d0hh1h1h1h1h1h1h1h1h1h1h1h11111d01100000000000010010000100000000h1h01h0h1h111111
h1h1h01011111111111111d1d1111111d111d1d1111h1d10d0h1h1h1h1h1h1h1h1h1h1h1h1h1111d0100000000000000100100h0000000000hhhh0h0h0h10111
1h1hhhhhhh1111111111111d1d11111d1d1d1d1d11h1d1d11d0h1h1h1h1h1h1h1h1h1h1h1h1h111d000000000000000001000h0000000000h1hh1h1h0h0h1011
h1h1hhhhhhh111111111111111111111d1d1d1d1d11h1d1d1dh1h1h1h1h1h1h1h1h1h1h1h1h1h11d000000000000000000000000000000000hh1h11100h10111
11111h1hhh11111111111111111111111111d11d1d1d1dd11d0h1h1h1h1h1h1h1h1h1h1h1h1h1h1d00000000000000000000000000000000000h111000101011
hh111111h1hhh111111111111111111111111d1d11d1d1ddhdhhh1h1h1h1h1h1h1h1h1h1h1h1h1h1d1000000000000000000000000000000000010100001010h
hh11111111hhhh111111111111111111111111d1dd1d1d1d0d0h1h1h1h1h1h1h1h1h1h1h1h1h1hh1d1000000000000000000000000000h00000101010100h0h0
0011h1h11h1hhhh111111111111111111111111d1dddd1d1ddh1h1h1h1h1h1h1h1h1h1h1h1h1h1h1d100000000000000000000000000h0111000001h101h0h0h
010h1h1hh11111hh1h11111111d1111111111111d1d1dddd0d1h1h1h1h1h1h1h1h1h1h1h1h1h1h1hd0110h00000000000000000000000h00000001h1h1111011
h0h0h1111h111111h1h1h1111d1d11111111011111dd1d010d01h111h1h1h1h1h1h1h1h1h1h1h1h1d01hh0h00h00000000000000000h1000h000001h1h111101
0h0h0h0hhh1111111h1h1h1111d1d1d1111010011d1d0000d110111111111h1h1h1h1h1h111h1h11d0110h1h100000000000000000h1111h11000001h1111010
hhh010h0hhh101h1h1hhh1h1h11d1d1d1d1d000011d100d0d1h1111h111111h1h1h1h1h1h1h1h1h1dd0010h10100000000h0hh00h10h1000h011100h1h111111
1h1h1hhhhhh0h0h010hhhh1h1h1hd0d1d1d1d0h00101ddd0d10101h1h111111h1h1h1h1h1h1hhh1h1d00000h00000000000h11111h01110000000100h0h01111
hh1hhh1hhhhh0h0h0h0hhhh1h1h10d0d0d1d1h0h0000ddddd010101h1h111111h1h1h1h1h1hhh0h110d000h0h000hh110hh0hh11000111110000000h0h0h0111
h1h1h1hhhhhhhhh0h0h0hhhhhhhh10d0d0d0h1h0d000d01d11010101h0h1h1111h1h1h1h1hhh0h0h10dd000h0h00h11000h011000000111010h0h000h0h01h10
hh1h1hhhhhhhhhhh0h010hhhh0h00d0d0d0h1h0d0d00d0dd1000h0h001hh1h111111h1h1h1h0h0h0hddd0000h0h0000111010h00000001011h0h0h000h11h1h1
hhhhhhhhhhhhhhh0h0h0h1100h00d0d0dhh1h0h0d0dd11dd10000100101h1h1111111h1h0h1h0hhh0ddd0000dh100000101010h00000001010h1h00000h11h1h
1hhhhhhhhhhhhh0h0h011h1000h0000d0h1h1h00000d1d0ddd000000011111h1111101h0h1h1hhhhhdd1dd0d0d01000101010h10000000010h0hhh0h0h0h1hh1
h1hhhhhhhhhhhhhhh110h1010h0h00h0h0h1h100000d1d11dd00000000111h0011111h1h111h1hhhhdd1ddd0dd001010101000000000000000h0h0h1h000h1h1
1h1hhhhhh1h1hhhhhh1h011110h0hh010h0d0h10ddd1d01100d00000001010h1111h11hh110hh1hhhdd1dd00d0d0h1h111h100h0000000000000001h10000h1h
0hh0hhhh1h1h1h1hh1h1111111hhhh10h0h0d1hdd001d11111d0000000010h01110000h1h11hh11hhdd0ddd1dd0d0h1h101h1h100000000000000101h101010h
hhhhhhhhh1h1h1h1h11h111111hhhhh1hhhhdh10d011d111110d00000000h1h0101hhhhh1h0h1010111d1d1d1d10d0h100010101000000000000001h1h1010h1
01hhhhhhhh1h1h1h1h11011111hhhhhh1h1h1dd0dddd1111111d00000000010001h1hhhhh0h1h101011d101dd1d100001000001000000000h00000h0h1h1011h
1010hhhhhhh1h1h1h1h1h0101h1hhh1111h1d1ddd00011111110d00d000001000011hh0h1h1h1h10111d1001dd1d101d0d0d00000000000h0100000h0h1h0h01
0101hhhh1h1h1h1h1h1h0100000h1h111111110d100011111011d000000001h0h0hd11h1h1h1h001000dd00d10d1111110d0d000000h00h1h0100000h0h0h0h0
10101h11h1h1h1hhhhh1h0100011h0h11h11111d1111111111110d0d00000101dhdh1h1h1h1h1h10000dd0d1dd1d1d1d110d000000010000110000000h1h1h1h
0101010h111h1hhhhhhh0h101110101hh1h111d11111111111101ddddd001d101d1d01h1h1h1h000dddd111d1dd1dhd1d11010d00010101h0h0000000101h1h1
001010h1h0h1h1hhhhh0h0hh010101011hh1100111111111111110000dd001d1d1d01h10100h0h0d00011111d11d1d1d11h1010h0h010101h11h000000101h1h
0101011h1h0h1h1hhhhh0hhh1h1h10100h0h0h01111111111111111110dd0d00000d010000h0h0d000d111111111d1010h001000h1h000101h1hh000000101h1
111h1h1111h1h1h10hhhh011h1h1h1h1h0h0hd11111111111111h111110d0000d000h000000000dd11111111111d1d10000000000h1h000001h1hh0000000d1d
111111111h1h1h101010h1001hhh1h1h100dd1d111111111111h1h1h1110dddddd0h1h00dd100d01111111111111d1d00000000001h100000h1hhhhhhhh0h0d1
111110101111111101010h0h0hhhh1h1hhd11111111111111111h1h1h111ddd00dd0000d0ddddd11111111h1111dhd1d10000h101010100000h0hhh1h1hh0d1d
11111111111111111110h0h0h0h0hh1hhd1d1111111111111111111h1h11000d10dd01d00000d01111111111d1dhdhdhd10001h1h1010100000h0hhh1h1hhhd1
111111111111111111110h0h010h0hhhhhd1d1d1111111111111111111h11111110ddd00111d01111111111d1d1hh1hdhd00000h1h1010100000hhhhh1h1hhhd
hhhh111111110111111110101010h01hhhhhh1hd1111111111111111111h11110100000111111111111111d1dhhhh01hd101h100h1h10101000h1hhh1h1d1dhh
hhhh11h111h11010111111010101010111hh1h011111111111111111111111101010d01111h1111111111d1dh1hhh1h010101h10001h0h101001h11101d1d1d1
hhh1h1hh1h11111101111h10111010101h11h0h1111111111111111111110101010111111h1h1111111111dh1hhh1h1h0h0101000000hd0d01010011101d1d1d
1h1h1h1hh1h111111110h0h01111110101011h11111111111111111111101010h0h0h111h111111111111111h11h11h0h1h0100000000001d11010010h11d111
hhh1h1h1hh1h1h1111h10h0h0111111h101110111111111111111101110101011h00111h1h1111111100111010h011010h100000000000001d1100000101h111
h1hh1h1h1111h1h11h1h1010h0111111h1111101011111011111h0101000101010000111h1111111h00001010h0h0100000100000000000001d0d01010101h11
1hhhh1h1111h1h1h11h1h10101111111111111101010101010111h0h00000101h10h0h110101010100000010h0h010000000000000000000101d0d010101h111
1hhhhh1hh1h1h1h11h1h1h1h10111111111h1111110101010101h1h10100001h1hh0h010h1101011000000hh0h00000000000000000000010101d0d010101111
h1hhhhhhhh1h1h1h11h1h1h1h111111111h1h1h1111010h0101h1hhh10000000110h010101110h100000000hh000000000000000000000001010100d0d0d0111
1h111hhhh1h1h1h1111h111h11111111111h1h1h111101010101hhhhh0h000000000h010h010h0000000000000001000010000000000000001010h000000d011
h11111hhhh1h1h1hh11111111h1h1111111111h1111110101h1hhhhhhh000000100h0h0h011h0h000h1h0000010001001010000000000000000010h0h01001d1
1h11111hhhhhh1h10h111111h1h1h1111111111h11111111h1hhhhhhhhhh001000h1h0h100h1h0h000h1000010h0100101010h00000000100010010h0h01111d
h1h1111111h1h010101h111h1h1h111111111111h1h1h1111h1hhhh1hh0h01010h1h1h00001h1h100h010000010101101010h1h0000001110101111111111111
1h1h11111h1h0h010101110111h1h111111111111h1h1h11h1h1h110h0h0h01010h1h1000001h10110000h0011101001h10h0h1000001111h0h1111111111111
h1hh111111h1h00010101h11111h1h1h111111110101h1hhhh0h1h0h0h0h0h0h0h1h1h00001h11110h00h0010111011h1hh0h0101101011h1h1h1111111h1111
hhh11111111h10100101h1h11111h1h1h111111010101h1hh0h0h0h0h0h0h0h0h0h1h0000101111h10hh0h1011111101h11h1h01111011h1h1h1h111h1h1h111
hhhh11111111110100001hhh1111111h1h111101010101h101010h0h0h0h1h0h0h0h00001h1111h10h0hh0011110101011h1h0001111hh1h1h1h1h1h1h0h0h01
hhhhhhh1111110001000hhh1h1111111h1h11110101001101h1010h0h0h1h1111010000101h1hh1h1010h01111110100001h0000111hhhh1hhhhh1hhhhhhh0h0
0000h1hhh1hh000000h0hhhh1h1h11111h11111100001011h1h101hh0h0h1h10010000101h1hhhh1001h0101111110100100000111h1hh0hhh0hhhhhhhhhhh0h
00001h1hh0hhh0000h0h0h0hhhhhh1h11hh1111101010101111h1h0hh0h0h10010100101h1hhhh1000h1h01111110101001000h11h1hh0h0h0hhhhhhhhhhhhhh
000001h1hh0h0h0100h0h0h0hhh1hh1hh1h111111010101011h1h0h1hh0h10100100111h1h11h10100hh0dh11111h01011010h0111hh0h0h0hhhhhhhhhhhhhhh
1000001hh0h0h0h000h1hhhh0h1h11h1hh1h11110101010111111h1h1011010101011110hh1h00100hh0dhd1111h0h010010h0h01hhhh0h0h0hhh0h0h0h0h0h1
0100010h0hhh0h0h0h1h1hh0h0h0h11011h1h11110101010111111h1h10110101110110hh110h000hhhhhdh111h1h01011h1hh01h1hh0h0h0hhhhh0h0h0h0h0h
10100000h0hhhhh0h0h1h11h0h0h0h01111h1h1h1111h1011111111h1h1010h111011010h1010h0h1hhhdhhh111h0001001hh0h01hh0h0h0h0hhh0h0h0h0h0h0
0101000h0h0h000h0h0h1111h0h0h0h0h111h1h1h1hhh0hh11111111h1h101010111010hh010h0h101hdhdh10110h01001hhhh0h0h0h1h0h0h0h0h0h0h0h0h0h
10h010h0h0h0000000h01110010h1h010h0h0h0h1h0h0h01h01011111h1h10101101h0hh0h0h0h101hhhdh1011hh0hh0101h1010h0h1h1h0h0h0h0h0h0h0h0h0
0h1h010h0h0h00001001010100h1h1h0h0h000h0h0h0h0h0111111111111010110110hh0h010h1h10hhdhd011h10hh0h01hh010h0h0h1h0h0h0h0h0h0h0h0h01
11h010h0h1h0h0h0000000h0h0101h100000000h0h0h0h00011111111h1h101001000h0h0h001h101dhhdh10h10h0010hhhhh0h0h0h1h1h0h0h0h0h0h0h0h010
101h000h1h100h0h00000000000000000000000000h0h000001010h1h1hh1111100000h0h01101010h1hh10h0hh0010hh1hh0h0h0h0h1h0h0h1h0h0h0h0h0h01
01000000110100h0h00000000000000000000000000h00000001010h0hhhh11111100h0h0h0010101hhhd010hhhh10101h10h0h0h0h1h1h0h1h010h0h0h0h010
10h000001000000h0h010h0000000000000000000000000000101000h0hhhh111111h000h01101010hhdhd01hhh1h10h010h0hhhhh1h1h0h0h0h0h0h01010101
0h00000000000000011010h0000000000000000000000000000101000000h1h11110100101111110hhhhd010hh1010h01010hhhh1hh0h1h0h0h0h0h011101010
0000000010000000000101000000000000000000000000000000h0000000010001h1010h1111111hhhhd010h0h010h0h010h1h01h101011h0h010h0101h1h101

