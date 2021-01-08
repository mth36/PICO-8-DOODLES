pico-8 cartridge // http://www.pico-8.com
version 29
__lua__



function _init()
	cls()
	t = 0
end

function _update()
	t += 1/30

	fillp(0b1010101010101010.1)

	for h=-0.99,0.99,0.026 do
		local num = -abs(h)*8+10
		for ang=0,1,1/num do
			ang = ang-t/8-2*abs(h)/16
			if abs(ang%1)<0.5 then
				local p = sphere_point(h,ang)*48+vec(64,64)
				circ(p.x+sin(t/16),p.y,1,flr((t+ang*3)%2)*7)
			end
		end
	end
	fillp()

	for i=1,350 do
		local h = (rnd(1)<0.5 and 1 or -1) * sqr(rnd(1))
		local ang = rnd(0.5)
		local p = sphere_point(h,ang)*32+vec(64,64)
		local c = flr((p.y-64)/32+t)*8 + flr(h+t/4) + ang*5 + t
		c = flr(c%2)*7
		circ(p.x,p.y,1,c)
	end

	

	fillp(0b1111000011110000.1)
	local x = 64
	local w = 48+rnd(16)-8+9*sin(t/8)
	local y = (t*128/3)%128
	rectfill(x-w/2,y,x+w/2,y+16,0)
	fillp()
end

function sqr(a) return a*a end

function sphere_point(height, ang)
	local v = vec(sqrt(1 - height*height),height,0)
	local roty = v:rot_y(ang)
	return roty
end

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

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
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
00000000000000000000000000000000000000000000000000070000000707000000000700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000000000000000000000000000000707000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700000000000707070707070707000000000000000007000000000000000000000000000000000000000000
00000000000000000000000000000000000000070000000000000700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000007000000000000070700000707070707070707070700000000000700000000000000000000000000000000000000
00000000000000000000000000000000000707000000000007070700000707000000000000000000000707000700000000000000000000000000000000000000
00000000000000000000000000000000000700000000000000000000000707000000000007070707070707070707000000000000000000000000000000000000
00000000000000000000000000000000070000000000000000000000000000000000000000000000000000000007070000000000000000000000000000000000
00000000000000000000000000000007000000000000000000000000000000000000000000000000000007070707070000000000000000000000000000000000
00000000000000000000000000000000000000000000070000000000000000000000000000000000000000000007070700000000000000000000000000000000
00000000000000000000000000000700000000000007070707070707070700000000000000000000000000000000070007000000000000000000000000000000
00000000000000000000000000000700000000000707070707070700000000000000000000000000000000000000000700000000000000000000000000000000
00000000000000000000000000070000000000000000000707070707000007070707070707070707000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000707070700000777070700000000000000000000000000000000000000000000000000000000000000
00000000000000000000000007000000000000000000000000000000000070707000000000000007070707070000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000777070700700000000000000000000007070000000000000000000000000000000000
00000000000000000000000000000000000007070000000000000000077777777777707700000000000007070707070707000000000000000000000000000000
00000000000000000000000000000000000707070707070700000077777777777707077777000000000000000007070707070700000000000000000000000000
00000000000000000000000000000000000707070707070000000777777777777777707770700000000000000000000707070007000000000000000000000000
00000000000000000000000000000000000007070707070707007777777777777777777777070000000000000000000000070707000000000000000000000000
00000000000000000000000000000000000000000000000000007770777777777777777770707000000000000000000000000707000000000000000000000000
00000000000000000000000000000700000000000000000000000777777777777770777777070000000000000000000000000007000000000000000000000000
00000000000000000000000000000007070000000000000007007777777777777070707777700000000000000000000000000000070000000000000000000000
00000000000000000000000000000007070707070000000000707777777777707770777070700070000000000000000000000000000000000000000000000000
00000000000000000000000000000707070707070000070707077777777777777077707070000700000000000707000000000000000700000000000000000000
00000000000000000000000000000707070707070007000070707777770777777707770777000070000000000000070700000000000000000000000000000000
00000000000000000000000000000000000700000000070707777777777777777777777777770007000000000007070707070000000000000000000000000000
00000000000000000000000007000000000000000000000077777777070777707707077777777070700000000000000707070700000000000000000000000000
00000000000000000000000000070700000000000000700777777777777777777077707777770007000000000000000000070707000000000000000000000000
00000000000000000000000007070707070000000000000700077777770770777777700070770000000000000000000000000007070000000000000000000000
00000000000000000000000007070707070000000007070777777777777070777070700077707077000000000000000000000007070707000000000000000000
00000000000000000000000707070707070007070000007070077707000700070707777070007777707000000000000000000000070700000000000000000000
00000000000000000000000007070707070007000000000707777777777777777070777770777777070700000000007000000000000707000000000000000000
00000000000000000000000000070707000007070707070007077777707000070000777770007070707000000000000000000000000007000000000000000000
00000000000000000000070707000000000000000007707777777777777777777777777777777707770700000000000000000000000007070000000000000000
00000000000000000000070707000000000000000000007077000707007070770000777700070077077000000000000000000000000000000000000000000000
00000000000000000000070707070700000000007700070777777777777777777777777777777000770700000000000000000000000000000000000000000000
00000000000000000000070707070707070000000000000000000000000000000000000000000000000000000000000007000000000000070000000000000000
00000000000000000000070707070707000007007000077777777777777777777777707770777770000000000000000000070000000000000000000000000000
00000000000000000007070707070707000707000000000000000000000000000000000000000000000000000000000000000707000000000000000000000000
00000000000000000707000707070700000007000000070777777777777777777077777770777770707000000000000000000007070000000000000000000000
00000000000000000007070000000700000007000000000000000000000000000000000000000000000000000000000000000007070700000000000000000000
00000000000000000007070700000000000070000700007707077777770777777777777770707707700000000000000000000000070700000000000000000000
00000000000000000007070707070000777707000000000000000000000000000000000000000000000000000077700000000000000700000000000000000000
00000000000000000007070707070707777777077777770000000707070000000000000000000000707070777777777070000000000000000000000000000000
00000000000000000007070707070707777777000000000000000000000000000000000000000000000000000077777770000000000000000000000000000000
00000000000000000707070707070707777777777777770000000000070000000000000000000000000077777777777770000000000007070000000000000000
00000000000000000007070707070707777777000000000000000000000000000000000000000000000000000077777770000000000000000000000000000000
00000000000000000007070707070007777777777777770000070700000000000000000000000000007777777777777770000000000700000000000000000000
00000000000000000007070707000007777777000000000000000000000000000000000000000000000000000077777770000000070700000000000000000000
00000000000000000007070000000707777777777777070000000000000000000000000000000000077777777777777770000000070000000000000000000000
00000000000000000007000007070707777777000000000000000000000000000000000000000000000000000077777770000007070000070000000000000000
00000000000000000000070707070707777777777777070000000000000000000000007000000000070077777777777770000707000000000000000000000000
00000000000000000000070707070707777777000000000000000000000000000000000000000000000000000070777070070700000000000000000000000000
00000000000000000000070707070707777777777700000000000707000707000707000000000000007077777070777707000000000000070000000000000000
00000000000000000000070707070700777777777707000000000707000700000000000000000070000777777777777700000000000000000000000000000000
00000000000000000000070707000000777777777770700707000707000000000007000000000000007077777077777700000000000007000000000000000000
00000000000000000000070700000000077777777707070707070000000070000000700000000000707077777777777000000000000007070000000000000000
00000000000000000000000000070707077777777707070707000000000000000000000000000070707070777777777000000000000007000000000000000000
00000000000000000000000707070707077777777707777000000000000000000000000000700007707777777777777000000000000707000000000000000000
00000000000000000000000007070707077777777700777700000000000000000000000000700070707777777777770000000000070707000000000000000000
00000000000000000000000007070707077777777077777770000000000000000700000000707000070777777777700000000007070700000000000000000000
00000000000000000000000007070707000777777700777707000000000700000000007007070700007777777777700000000707070000000000000000000000
00000000000000000000000000070700000777777770777770700700070000000700000770707070077777707777700000070707000007000000000000000000
00000000000000000000000000000000000077777777077707070700000700000000000707000070707070707770000007070700000000000000000000000000
00000000000000000000000000000000000007777777770700070700000000000000000000000770777770707770070707070000000000000000000000000000
00000000000000000000000000000707070707777777777770000000000000000000000000000777707077777707070707000000000700000000000000000000
00000000000000000000000000000707070707777777777777070000000000700000000000007070707777777707000000000000000700000000000000000000
00000000000000000000000000000707070707077777777777707000000000000000000070000077707777777000000000000000000000000000000000000000
00000000000000000000000000000707070700007777777777070000000007000000007000700777777777770000000000000000070000000000000000000000
00000000000000000000000000000000000000000077777770000000000707070000700000077777777777700000000000000007070000000000000000000000
00000000000000000000000000000000000000000007777770070007000007000000000000777777777770000000000000070707000000000000000000000000
00000000000000000000000000000000000000070707777777077700000000000000000007077777777700000000000007070707000000000000000000000000
00000000000000000000000000000000000707070707077777777707000000000000000070777777777000000000000007070707000000000000000000000000
00000000000000000000000000000000000707070707070777777770000000000700000700777070700000000007070707070700000000000000000000000000
00000000000000000000000000000000000007070700000077777777000700707770000007777770000000070707070707000000000000000000000000000000
00000000000000000000000000000000000700000000000000777070000000077770007070777000070707070707070700000000000000000000000000000000
00000000000000000000000007000000000000000000000000000700000000007777070007770707070707070700000000000700000000000000000000000000
00000000000000000000000000000000000000000000000007070707007000070770000007070707070000000000000000000000000000000000000000000000
00000000000000000000000000070000000000000707070707070707000000070707070707000000000000000000000000070000000000000000000000000000
00000000000000000000000000000000000000000007070707070707070707070707070700000000000000000000000007000000000000000000000000000000
00000000000000000000000000000700000000000007070707070707070707000000000000000000000000000000070700000000000000000000000000000000
00000000000000000000000000000000000000000007070707000000000000000000000000000000000000000707070700000000000000000000000000000000
00000000000000000000000000000007000000000000000000000000000000000000000000000000000000070707070700000000000000000000000000000000
00000000000000000000000000000000070000000000000000000000000007070000000000000000070707070707070000000000000000000000000000000000
00000000000000000000000000000000000700000000000000000000000007070000000007070707070707070707000000000000000000000000000000000000
00000000000000000000000000000000000007000000000007070700000007070707070707070707070707000700000000000000000000000000000000000000
00000000000000000000000000000000000007000000000000070707000000070707070707070707000000070700000000000000000000000000000000000000
00000000000000000000000000000000000000070000000000000707070707070707070000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000700000000000007070700000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007000000000007070000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007000000000707000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007000000000007000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007000707070707000000000000000000000000000000000000000000000000000000000000
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
