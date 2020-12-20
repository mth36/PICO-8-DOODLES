pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
-- basic template

#include maths.lua
#include poly.lua
#include vec.lua
#include subpixel.lua
#include tex.lua

function _init()
	t=0

	cls()
end

function _update()
	cls()
	t+=1/30

	if rnd(1)<0.2 then
		local x,y = 8+rnd(8),rnd(8)
		sset(x,y,rnd(1)<0.5 and 7 or 0)
	end

	s = 64
	si = 16+15.99*sin(t/8)
	sii = s - si

	seg = 6
	size = 64/6
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
	ps = base_ps

	angs = vec(
		-1/16,
		1/8,
		0
	)
	local ux,uy,uz = vec.u_rot_yxz(angs)

	local rot_ps = {}
	for ty=0,#base_ps do
		local row = base_ps[ty]
		rot_ps[ty] = {}
		for tx=0,#base_ps do
			local v = base_ps[ty][tx]
			local uv1 = v
			local uv2 = v + vec(size,size)

			w = ux*v.x + uy*v.y + uz*v.z
			w.x = (v.x + v.y/8) + 16*mid(-1,0.75,sin(t/4 + v.y/64))

			rot_ps[ty][tx] = w
		end
	end

	draw_ps(rot_ps)
end

function rotate_ps(ps, angs)
	local ux,uy,uz = vec.u_rot_yxz(angs)

	local rot_ps = {}
	for ty=1,#ps do
		local row = ps[ty]
		rot_ps[ty] = {}
		for tx=1,#ps[1] do
			local v = ps[ty][tx]

			w = ux*v.x + uy*v.y + uz*v.z

			rot_ps[ty][tx] = w
		end
	end

	return rot_ps
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
			local v = ps[ty][tx]
			local w = v + vec(total_size/2, total_size/2)
			v = v + vec(64,64)
			--v = v + vec(64,64)

			if tx~=#ps and ty~=#ps then
				local v_right = ps[ty][tx+1] + vec(64,64)
				local v_down = ps[ty+1][tx] + vec(64,64)
				local v_across = ps[ty+1][tx+1] + vec(64,64)
				
				--polyf({v-vec(64,64), v_right, v_across, v_down}, vec(64,64), 0)
				--polyv({v-vec(64,64), v_right, v_across, v_down}, vec(64,64), 7)

				tquad(
					v.x,v.y,
					v_right.x,v_right.y,
					v_across.x,v_across.y,
					v_down.x,v_down.y,
					w.x,w.y/8,
					size,size/8
				)
			end
		end
	end
end

__gfx__
37063706000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706000000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706700000770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706070777000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
37063706000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010100010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101000001010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000100010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
