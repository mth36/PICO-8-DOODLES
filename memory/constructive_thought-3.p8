pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
	cls()
	t = 0

	seg = 5
	size = 128/6
	total_size = seg * size

	base_ps = {}

	for ty=0,seg do
		base_ps[ty] = {}
		local base_ps_ty = base_ps[ty]
		for tx=0,seg do
			local v = vec(tx*size - total_size/2, ty*size - total_size/2)
			base_ps_ty[tx] = v
		end
	end
end

function draw_ps(ps)
	local y_forward = angs.x%1 > 0.5
	local x_forward = angs.y%1 > 0.5

	local y_start, y_end, y_step
	if y_forward then
		y_start = 0
		y_end = #ps
		y_step = 1
	else
		y_start = #ps
		y_end = 0
		y_step = -1
	end

	local x_start, x_end, x_step
	if x_forward then
		x_start = 0
		x_end = #ps
		x_step = 1
	else
		x_start = #ps
		x_end = 0
		x_step = -1
	end

	for ty=y_start,y_end,y_step do
		for tx=x_start,x_end,x_step do
			if stat(1) < 0.90 then
				local v = ps[ty][tx]
				v = v + vec(64,64)

				if tx~=#ps and ty~=#ps then
					local v_right = ps[ty][tx+1]
					local v_down = ps[ty+1][tx]
					local v_across = ps[ty+1][tx+1]
					if v.x>-32 and v.x<128 and v.y>24 and v.y<128 then

						fillp(0b0101000010100000.1)
						polyf({v-vec(64,64), v_right, v_across, v_down}, vec(64,64), 0)
						fillp()
						polyv({v-vec(64,64), v_right, v_across, v_down}, vec(64,64), 0x7)
					end
				end

				-- if tx~=#ps then
				-- 	local v_right = ps[ty][tx+1]
				-- 	v_right = v_right + vec(64,64)
				-- 	line2(v.x,v.y,v_right.x,v_right.y,7)
				-- end

				-- if ty~=#ps then
				-- 	local v_down = ps[ty+1][tx]
				-- 	v_down = v_down + vec(64,64)
				-- 	line2(v.x,v.y,v_down.x,v_down.y,7)
				-- end
			end
		end
	end
end

function _update60()
	cls()

	h = 128

	t += 1/60

	--rect(0,0,127,127,7)
	g=64+48*cos(t/16)
	k=0
	fillp()
	polyv({
		vec(g,k),
		vec(127-k,g),
		vec(127-g,127-k),
		vec(k,127-g),
	},vec(0,1),1)
	polyv({
		vec(g,k),
		vec(127-k,g),
		vec(127-g,127-k),
		vec(k,127-g),
	},vec(0,2),1)
	polyv({
		vec(g,k),
		vec(127-k,g),
		vec(127-g,127-k),
		vec(k,127-g),
	},vec(0,3),1)
	polyv({
		vec(g,k),
		vec(127-k,g),
		vec(127-g,127-k),
		vec(k,127-g),
	},vec(0,4),1)
	polyv({
		vec(g,k),
		vec(127-k,g),
		vec(127-g,127-k),
		vec(k,127-g),
	},vec(0,0),13)

	local plane_origin = vec(0,0,0)
	local plane_normal = vec(0.4,1,0):norm()

	angs = vec(0,0,0.1+t/8)
	local ux,uy,uz = vec.u_rot_yxz(angs)

	local rot_ps = {}
	for ty=0,#base_ps do
		local row = base_ps[ty]
		rot_ps[ty] = {}
		for tx=0,#base_ps do
			local v = base_ps[ty][tx]

			w = ux*v.x + uy*v.y + uz*v.z
			w.y = ((w.y + t*16))%(h*2)-(h*2)/2

			if t%16>4 and t%16<12 then
			w.x = w.x + 1.2*sin(t/8 + w.y/32)
			end

			if w.y>0 then
				w = refl_point_across_plane(w, plane_origin, plane_normal)
			end

			w.y += h/2

			rot_ps[ty][tx] = w
		end
	end

	draw_ps(rot_ps)
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

function proj_point_to_plane(point, plane_origin, plane_normal)
	local v = point - plane_origin
	local dist = vec.dot(v, plane_normal)
	local proj = point - plane_normal*dist
	return proj, proj - point
end

function refl_point_across_plane(point, plane_origin, plane_normal)
	local proj,ref = proj_point_to_plane(point, plane_origin, plane_normal)
	return proj + ref
end

function sqr(a) return a*a end

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


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddd0000000000000000000000000000000
000000000000000000000000000000000000000000000000000700000000000000000000000000000000000000ddd1111d000000000000000000000000000000
000000000000000000000000000000000000000000000000007070000000000000000000000000000000000ddd1111111d000000000000000000000000000000
000000000000000000000000000000000000000000000000070007000000000000000000000000000000ddd1111111111d000000000000000000000000000000
0000000000000000000000000000000000000000000000007000007000000000000000000000000007dd11111111111111d00000000000000000000000000000
00000000000000000000000000000000000000000000000700000070000000000000000000000ddd707111111111100001d00000000000000000000000000000
00000000000000000000000000000000000000000000007000000007000000000000000000ddd117101711111100000001d00000000000000000000000000000
00000000000000000000000000000000000000000000770000000000700000000000000ddd1111700000711000000000011d0000000000070000000000000000
00000000000000000000000000000000000000000007000000000000070000000000ddd1111177010101070000000000001d0000000000707000000000000000
00000000000000000000000000000000000000000070000000000000007000000ddd1111111700000000070000000000001d0000000077000700000000000000
00000000000000000000000000000000000000000700000000000000007000ddd1111111117010000000007000000000001d0000000700000070000000000000
000000000000000000000000000000000000000070000000000000000007dd11111111111700000000000007000000000001d000007000000007000000000000
0000070000000000000000000000000000000077000000000000000d0d017111111111107000000000000000700000000001d000070000000000700000000000
0000707000000000000000000000000000000700000000000000000000000711111100070000000000000000070000000001d000700000000000700000000000
00070070000000000000000000000000000070000000000000d01010101010711000077000000000000000000700000000011d07000000000000070000000000
07700007000000000000000000000000000700000000000000000000000000700000700000000000000000000070000000001770000000000000007000000000
7700000070000000000000000000000007707000000d0d0101010101010000070007000000000000000000000007000000007d00000000000000000700000000
00000000070000000000000000000007770007000000000000000000000000007070000000000000000000000000700000070000000000000000000070000000
000000000070000000000000000007770000d7d010101010101000000000000007000000000000000000000000000700007000d0000000000000000007000000
00000000007000000000000000077070000000700000000000000000000000077070000000000000000000000000070007000000000000000000000000700000
0000000000070000000000000070070d01010107010101000000000000000070000700000000000000000000000000707000010d000000000000000000700000
00000000000070000000000077077000000000007000000000000000000007000007000000000000000000000000007700000000000000000000000000070000
000000000000070000000077d0701010101010100700000000000000000070000000700000000000000000000000070070000010000000000000000000007000
00000000000000700000770007000000000000000070000000000000007700000000070000000000000000000000700007000000000000000000000000000700
00000000000000700d77010171010101000000000007000000000000070000000000007000000000000000000007000007000001000000000000000000007070
00000000000000077700007700000000000000000007000000000000700000000000000700000000000000000070000000700000000000000000000000070007
000000000000d0107010171010100000000000000000700000000007000000000000000070000000000000000700000000070000d00000000000000000700007
00000000000000000700700000000000000000000000070000000770000000000000000007000000000000077000000000007000000000000000000007000000
00000d010107010101770000000000000000000000000070000070000000000000000000070000000000007000000000000007000d0000000000000770000000
00000000000000000070000000000000000000000000000700070000000000000000000000700000000007000000000000000070000000000000007000000000
d010101070101000770700000000000000000000000000007070000000000000000000000007000000007000000000000000000710d000000000070000000000
00000000000000070000700000000000000000000000000077000000000000000000000000007000000700000000000000000007000000000000700000000000
01010700000000700000070000000000000000000000000707000000000000000000000000000700007000000000000000000000710000000007000000000000
00000000000007000000007000000000000000000000007000700000000000000000000000000070770000000000000000000000070000000070000000000000
70000000000070000000000700000000000000000000070000070000000000000000000000000007000000000000000000000000007000007700000000000000
00000000007700000000000070000000000000000000700000007000000000000000000000000077000000000000000000000000000700070000000000000000
0d000000070000000000000070000000000000000007000000007000000000000000000000000700700000000000000000000000000170700000000000000000
00000000700000000000000007000000000000000770000000000700000000000000000000077000070000000000000000000000000007000000000000000000
00d00007000000000000000000700000000000007000000000000070000000000000000000700000007000000000000000000000000077000000000000000000
00000070000000000000000000070000000000070000000000000007000000000000000007000000000700000000000000000000007700700000000000000000
710d070000000000000000000000700000000070000000000000000070000000000000007000000000070000000000000000000007000d070000000000000000
07077000000000000000000000000700000007000000000000000000700000000000007700000000000070000000000000000000700000007000000000000000
00700000700000000000000000000070000070000000000000000000070000000000070000000000000007000000000000000007000010d00700000000000000
00070000000000000000000000000070007700000000000000000000007000000000700000000000000000700000000000000770000000000070000000000000
00017000000000000000000000000007070000000000000000000000000700000007000000000000000000070000000000007000000001000007000000000000
00007000000000000000000000000000700000000000000000000000000070000770000000000000000000070000000000070000000000000007000000000000
0000d700700000000000000000000007070000000000000000000000000007007000000000000000000000007000000000700000000000100000700000000000
00000070000000000000000000000070007000000000000000000000000007070000000000000000000000000700000077000000000000000000070000000000
00000d070000000000000000000077000007000000000000000000000000007000000000000000000000000000700007000000000000000d0000007000000000
00000000700000000000000000070000000700000000000000000000000007070000000000000000000000000007007000000000000000000000000700000007
000010d070000000000000000070000000007000000000000000000000077000700000000000000000000000000707000000000000000000d000000070000070
00000000770000000000000007000000000007000000000000000000007000000700000000000000000000000007700000000000000000000000000070000700
00000100077000000000000070000000000000700000000000000000070000000070000000000000000000000070070000000000000000010d00000007007000
00000000070700000000000700000000000000070000000000000000700000000070000000000000000000000700007000000000000000000000000000770000
00000010070070000000077000000000000000007000000000000007000000000007000000000000000000007000000700000000000000001000000007000000
00000000070070000000700000000000000000000700000000000070000000000000700000000000000000070000000070000000000000000000000070000000
00000001070007000007000000000000000000000700000000007700000000000000070000000000000000700000000070000000000000000100000700000000
00000000070000700070000000000000000000000070000000070000000000000000007000000000000077000000000007000000000000000000007000000000
00000000d70000070700000000000000000000000007000000700000000000000000000700000000000700000000000000700000000000000010070000000000
00000000070000007000000000000000000000000000700007000000000000000000000700000000007000000000000000070000000000000007700000000000
0000007777000000070000000000000000000000000007007000000000000000000000007000000007000000000000000000700000000000007d000000000000
777777001d000000070000000000000000000000000000770000000000000000000000000700000070000000000000000000070000000000071d000000000000
000000001d0000000070000000000000000000000000070700000000000000000000000000700007000000000000000000000070000000007001d00000000000
0000000001d000000007000000000000000000000000700700000000000000000000000000070770000000000000000000000070000000070001d00000000000
0000000001d000000000700000000000000000000007000070000000000000000000000000007000000000000000000000000007000007700001d00000000000
0000000001d0000000000700000000000000000007700000070000000000000000000000000707000000000000000000000000007000700000011d0000000000
00000000011d000000000070000000000000000070000000007000000000000000000000007007000000000000000000000000000707000000001d0000000000
00000000001d000000000070000000000000000700000000000700000000000000000000770000700000000000000000000000000070000000001d0000000000
00000000001d0000000000070000000000000070000000000007000000000000000000070000000700000000000000000000000007000000000011d000000000
000000000011d000000000007000000000000700000000000000700000000000000000700000000070000000000000000000000770000000000001d000000000
000000000001d000000000000700000000077000000000000000070000000000000007000000000007000000000000000000007000000000000001d000000000
000000000001d0000000000000700000007000000000000000000070000000000007700000000000070000000000000000000700000000000000011d00000000
0000000000011d000000000000070000070000000000000000000007000000000070000000000000007000000000000000007000000000000000001d00000000
0000000000001d000000000000007000700000000000000000000007000000000700000000000000000700000000000000770000000000000000001d00000000
0000000000001d0000000000000070770000000000000000000000007000000070000000000000000000700000000000070000000000000000000011d0000000
00000000000011d000000000000007000000000000000000000000000700007700000000000000000000070000000000700000000000000000000001d0000000
00000000000001d000000000000000700000000000000000000000000070070000000000000000000000070000000007000000000000000000000001d0000000
00000000000001d0000000000000000700000000000000000000000000077000000000000000000000000070000007700000000000000000000000011d000000
00000000000001d0000000000000000070000000000000000000000000070000000000000000000000000007000070000000000000000000000000001d000000
000000000000001d000000000000000007000000000000000000000000707000000000000000000000000000700700000000000000000000000000001d000000
000000000000001d000000000000000007000000000000000000000077000700000000000000000000000000077000000000000000000000000000001d000000
000000000000001d0000000000000000007000000000000000000007000000700000000000000000000000000700000000000000000000000000000001d00000
0000000000000011d000000000000000000700000000000000000070000000070000000000000000000000077000000000000000000000000000000001d00000
0000000000000001d000000000000000000070000000000000000700000000007000000000000000000000700000000000000000000000000000000001d00000
0000000000000001d0000000000000000000070000000000000070000000000070000000000000000000070000000000000000000000000000000000011d0000
00000000000000011d000000000000000000070000000000000700000000000007000000000000000000700000000000000000000000000000000000001d0000
00000000000000001d000000000000000000007000000000077000000000000000700000000000000007000000000000000000000000000000000000001d0000
00000000000000001d0000000000000000000007000000007000000000000000000700000000000007700000000000000000000000000000000000000011d000
000000000000000011d000000000000000000000700000070000000000000000000070000000000070000000000000000000000000000000000000000001d000
000000000000000001d000000000000000000000070000700000000000000000000007000000000700000000000000000000000000000000000000000001d000
000000000000000001d0000000000000000000000700070000000000000000000000007000000070000000000000000000000000000000000000000000011d00
000000000000000001d0000000000000000000000070700000000000000000000000007000000700000000000000000000000000000000000000000000001d00
0000000000000000001d000000000000000000000007000000000000000000000000000700007000000000000000000000000000000000000000000000001d00
0000000000000000001d0000000000000000000000000000000000000000000000000000707700000000000000000000000000000000000000000000000011d0
0000000000000000001d0000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000001d0
00000000000000000011d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001d0
00000000000000000001d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000011d
00000000000000000001d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd1
000000000000000000011d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000dddd1111
000000000000000000001d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd11111111
000000000000000000001d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd11111111111
0000000000000000000011d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd11111111111110
0000000000000000000001d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000ddd11111111111110000
0000000000000000000001d000000000000000000000000000000000000000000000000000000000000000000000000000000000dddd11111111111100000000
00000000000000000000011d00000000000000000000000000000000000000000000000000000000000000000000000000000ddd111111111111100000000000
00000000000000000000001d00000000000000000000000000000000000000000000000000000000000000000000000000ddd111111111111100000000000000
00000000000000000000001d00000000000000000000000000000000000000000000000000000000000000000000000ddd111111111111100000000000000000
00000000000000000000001d00000000000000000000000000000000000000000000000000000000000000000000ddd111111111111100000000000000000000
000000000000000000000001d000000000000000000000000000000000000000000000000000000000000000dddd111111111111000000000000000000000000
000000000000000000000001d000000000000000000000000000000000000000000000000000000000000ddd1111111111111000000000000000000000000000
000000000000000000000001d000000000000000000000000000000000000000000000000000000000ddd1111111111111000000000000000000000000000000
0000000000000000000000011d00000000000000000000000000000000000000000000000000000ddd1111111111111000000000000000000000000000000000
0000000000000000000000001d0000000000000000000000000000000000000000000000000dddd1111111111111000000000000000000000000000000000000
0000000000000000000000001d0000000000000000000000000000000000000000000000ddd11111111111110000000000000000000000000000000000000000
00000000000000000000000011d000000000000000000000000000000000000000000ddd11111111111110000000000000000000000000000000000000000000
00000000000000000000000001d000000000000000000000000000000000000000ddd11111111111110000000000000000000000000000000000000000000000
00000000000000000000000001d000000000000000000000000000000000000ddd11111111111110000000000000000000000000000000000000000000000000
000000000000000000000000011d0000000000000000000000000000000dddd11111111111100000000000000000000000000000000000000000000000000000
000000000000000000000000001d0000000000000000000000000000ddd111111111111100000000000000000000000000000000000000000000000000000000
000000000000000000000000001d0000000000000000000000000ddd111111111111100000000000000000000000000000000000000000000000000000000000
0000000000000000000000000011d000000000000000000000ddd111111111111100000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000001d000000000000000000ddd111111111111100000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000001d00000000000000dddd111111111111000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000001d00000000000ddd1111111111111000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000001d0000000ddd1111111111111000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000001d0000ddd1111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000001ddddd1111111111111000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000011d1111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000

