pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

-- todo: test rotup()
-- todo: implement draw_objs()
--         should have drawing order for lines

function _init()
	angz=0
	angy=0
	angup=0
	sc=10

	orig = pt(0,0,0)

	⧗ = 0.00
	pi = 3.14159
end

function _update60()
	⧗ += 1/60
	--if ctr==1 then ctr=0 end

	angz = sin(sin(2*pi*⧗/200)/2)
	--angz = angz + 0.01
	angy = angy + 0.005
end

function _draw()
	rectfill(0,0,128,128,0)

	--circfill(64,64,3.5*sc,13)
	draw_obj('head', objects, {x=64,y=64}, sc, angy, angz, 13)
	draw_obj('left_eye', objects, {x=64,y=64}, sc, angy, angz, 6)
	draw_obj('right_eye', objects, {x=64,y=64}, sc, angy, angz, 6)
end

function draw_obj(name, objs, loc, scale, ay, az, color)
	local obj = objs[name]
	local verts = obj.v
	local lines = obj.l

	local rotverts = {}
	for vert in all(verts) do
		local scalevert = scaled(vert,scale)
		local rotvert = roty(scalevert, orig, ay) -- rotate about z
		local rotvert = rotz(rotvert, orig, az) -- rotate about y

		add(rotverts, rotvert)
	end

	for ln in all(lines) do
		local v1 = rotverts[ln[1]]
		local v2 = rotverts[ln[2]]

		line(v1.x+loc.x,(v1.z+loc.y),v2.x+loc.x,(v2.z+loc.y),color)
	end
end

function pt(x,y,z)
	return {
		x=x,
		y=y,
		z=z
	}
end

function scaled(point,a)
	return pt(
		point.x*a,
		point.y*a,
		point.z*a
	)
end

function rotz(point, origin, ang)
	local sina,cosa=
		sin(ang), cos(ang)

	local p = pt(
		point.x-origin.x, 
		point.y-origin.y, 
		point.z-origin.z)

	return {
		x = p.x * cosa - p.y * sina + origin.x,
		y = p.x * sina + p.y * cosa + origin.y,
		z = p.z + origin.z
	}
end

function roty(point, origin, ang)
	local sina,cosa=
		sin(ang), cos(ang)

	local p = pt(
		point.x-origin.x, 
		point.y-origin.y, 
		point.z-origin.z)

	return {
		x = p.z * sina + p.x * cosa + origin.x,
		y = p.y + origin.y,
		z = p.z * cosa - p.x * sina + origin.z
	}
end

objects = {
	left_eye = {
		v = {
			{x=0.87,y=-3.27,z=0.70},
			{x=1.53,y=-3.00,z=1.00},
			{x=0.60,y=-3.38,z=-0.00},
			{x=0.87,y=-3.27,z=-0.70},
			{x=1.53,y=-3.00,z=-1.00},
			{x=2.18,y=-2.72,z=-0.70},
			{x=2.45,y=-2.61,z=-0.00},
			{x=2.18,y=-2.72,z=0.70}
		},
		l = {
			{2,8},
			{8,7},
			{7,6},
			{6,5},
			{5,4},
			{4,3},
			{3,1},
			{1,2}
		}
	},
	right_eye = {
		v = {
			{x=-2.18,y=-2.72,z=0.70},
			{x=-1.53,y=-3.00,z=1.00},
			{x=-2.45,y=-2.61,z=-0.00},
			{x=-2.18,y=-2.72,z=-0.70},
			{x=-1.53,y=-3.00,z=-1.00},
			{x=-0.87,y=-3.27,z=-0.70},
			{x=-0.60,y=-3.38,z=-0.00},
			{x=-0.87,y=-3.27,z=0.70}
		},
		l = {
			{2,8},
			{8,7},
			{7,6},
			{6,5},
			{5,4},
			{4,3},
			{3,1},
			{1,2}
		}
	},
	head = {
		v = {
			{x=0.00,y=-0.00,z=3.50},
			{x=1.23,y=1.23,z=3.03},
			{x=2.14,y=2.14,z=1.75},
			{x=2.47,y=2.47,z=0.00},
			{x=2.14,y=2.14,z=-1.75},
			{x=1.23,y=1.23,z=-3.03},
			{x=0.00,y=3.03,z=-1.75},
			{x=0.00,y=1.75,z=3.03},
			{x=1.74,y=-0.00,z=3.03},
			{x=3.03,y=0.00,z=1.75},
			{x=3.49,y=0.00,z=0.00},
			{x=3.03,y=0.00,z=-1.75},
			{x=1.74,y=0.00,z=-3.03},
			{x=1.23,y=-1.23,z=3.03},
			{x=2.14,y=-2.14,z=1.75},
			{x=2.47,y=-2.47,z=-0.00},
			{x=2.14,y=-2.14,z=-1.75},
			{x=1.23,y=-1.23,z=-3.03},
			{x=0.00,y=0.00,z=-3.50},
			{x=0.00,y=-1.75,z=3.03},
			{x=0.00,y=-3.03,z=1.75},
			{x=0.00,y=-3.49,z=-0.00},
			{x=0.00,y=-3.03,z=-1.75},
			{x=0.00,y=-1.74,z=-3.03},
			{x=-1.23,y=-1.23,z=3.03},
			{x=-2.14,y=-2.14,z=1.75},
			{x=-2.47,y=-2.47,z=-0.00},
			{x=-2.14,y=-2.14,z=-1.75},
			{x=-1.23,y=-1.23,z=-3.03},
			{x=-1.74,y=0.00,z=3.03},
			{x=-3.03,y=-0.00,z=1.75},
			{x=-3.49,y=0.00,z=0.00},
			{x=-3.03,y=0.00,z=-1.75},
			{x=-1.74,y=0.00,z=-3.03},
			{x=-1.23,y=1.23,z=3.03},
			{x=-2.14,y=2.14,z=1.75},
			{x=-2.47,y=2.47,z=0.00},
			{x=-2.14,y=2.14,z=-1.75},
			{x=-1.23,y=1.23,z=-3.03},
			{x=0.00,y=3.03,z=1.75},
			{x=0.00,y=3.49,z=0.00},
			{x=0.00,y=1.75,z=-3.03}
		},
		l = {
			{8,35},
			{38,7},
			{39,19},
			{1,35},
			{34,19},
			{1,30},
			{29,19},
			{1,25},
			{24,19},
			{1,20},
			{1,14},
			{13,19},
			{1,9},
			{40,3},
			{4,41},
			{6,42},
			{6,19},
			{42,19},
			{7,42},
			{41,7},
			{8,40},
			{1,8},
			{36,40},
			{41,37},
			{42,39},
			{40,41},
			{37,32},
			{33,38},
			{39,34},
			{30,35},
			{36,31},
			{38,39},
			{37,38},
			{36,37},
			{35,36},
			{34,29},
			{25,30},
			{31,26},
			{27,32},
			{33,28},
			{33,34},
			{32,33},
			{31,32},
			{30,31},
			{20,25},
			{26,21},
			{22,27},
			{28,23},
			{24,29},
			{28,29},
			{27,28},
			{26,27},
			{25,26},
			{14,20},
			{21,15},
			{16,22},
			{23,17},
			{18,24},
			{23,24},
			{22,23},
			{21,22},
			{20,21},
			{9,14},
			{15,10},
			{11,16},
			{17,12},
			{13,18},
			{18,19},
			{17,18},
			{16,17},
			{15,16},
			{14,15},
			{10,3},
			{4,11},
			{12,5},
			{6,13},
			{9,2},
			{12,13},
			{11,12},
			{10,11},
			{9,10},
			{2,8},
			{7,5},
			{5,6},
			{4,5},
			{3,4},
			{2,3},
			{1,2}
		}
	}
}
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
0000000000000000000000000000000000000000000000000000000000000dddd000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000dddd0dd0dddddd000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000ddd00000d0dd00000dddddd000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000ddd00000000d000d0000000000ddd000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000dddd00000000000d0000d00000000000dd00000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000dd000000000000000d00000dd000000000d0d0000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000ddd000000000000000d0000000d000000000d0d000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000d0d0d0000000000000ddddddddddddddddd00d00d00000000000000000000000000000000000000000000
000000000000000000000000000000000000000000d00d00d0000000000dd00d0000dd00ddddddddddddd0000000000000000000000000000000000000000000
000000000000000000000000000000000000000000d00d000dd000000dd0000d00dd0000d00000000dd00dd00000000000000000000000000000000000000000
00000000000000000000000000000000000000000d0000d0000d000dd0000000dd0000000d0000000d0dd0dd0000000000000000000000000000000000000000
0000000000000000000000000000000000000000d00000d00000ddd000000dddd000000000d0000000d00dddd000000000000000000000000000000000000000
000000000000000000000000000000000000000d000000d000dd0d00000dd0660d000000000d000000d0000ddd00000000000000000000000000000000000000
00000000000000000000000000000000000000d0000000d0dd0000d00d66660066000000000d0000000d0000ddd0000000000000000000000000000000000000
0000000000000000000000000000000000000d00000000dd0000000666000000006000000000d000000d00000ddd000000000000000000000000000000000000
000000000000000000000000000000000000d00000000d0d00000060d000000000d6600000000d000000d00000ddd00000000000000000000000000000000000
000000000000000000000000000000000000d0000000d00d00000d60d0000000000d060000000d000000d0000dd0d00000000000000000000000000000000000
00000000000000000000000000000000000d0000000d0000d000d6000d0000000000d600000000d000000d0dd00ddd0000000000000000000000000000000000
0000000000000000000000000000000000d0000000d00000d00d600000d000000000d0600000000d00000dd00000dd0000000000000000000000000000000000
000000000000000000000000000000000d0000000d0000000dd06000000d000000000d6000000000d00dd0d0000dddd000000000000000000000000000000000
000000000000000000000000000000000dd00000d0000000dd060000000d000000000d6000000000ddd0000d00d0ddd000000000000000000000000000000000
000000000000000000000000000000000d0dd00d0000000d00d600000000d000000000600000000ddd00000d0d00d0d000000000000000000000000000000000
00000000000000000000000000000000dd000dd0000000d000d0600000000d00000000d600000dd000d0000dd0000ddd00000000000000000000000000000000
00000000000000000000000000000000d0d00dd000000d00000d600000000d0000000006000dd000000d00d00d000d0d00000000000000000000000000000000
00000000000000000000000000000000d0d0d00dd000d000000d6000000000d00000006d0dd00000000d0d0000d00d0d00000000000000000000000000000000
00000000000000000000000000000000d0dd00000d0d0000000060000000000d00000060d00000000000d000000d0d0dd0000000000000000000000000000000
0000000000000000000000000000000d00d0000000d000000000d60000000000d00006dd0d00000000dd0d00000d0d00d0000000000000000000000000000000
0000000000000000000000000000000d00dd00000d0d00000000060000000000d0006d000d0000000d000d000000dd00dd000000000000000000000000000000
0000000000000000000000000000000d0d0d00000d0d000000000d66000000000d0d600000d00000d00000d000000d00dd000000000000000000000000000000
0000000000000000000000000000000d0d00d000d000d000000000d06000000000660000000d00dd000000d00000d0d00d000000000000000000000000000000
000000000000000000000000000000d00d00d000d0000d00000000d00660006666d000000000dd000000000d0000d00ddd000000000000000000000000000000
000000000000000000000000000000d00d000d0d000000d00000000d0006660d000d0000000dd0000000000d000d0000ddd00000000000000000000000000000
000000000000000000000000000000d0d0000d0d000000d00000000d00000dd00000d00000d00d0000000000d00d0000ddd00000000000000000000000000000
000000000000000000000000000000d0d00000d00000000d00000000d000d00000000d000d0000d000000000d0d00000d0d00000000000000000000000000000
00000000000000000000000000000d00d00000d000000000d0000000d0dd000000000d0dd00000d0000000000dd0000d00d00000000000000000000000000000
00000000000000000000000000000d00d0000d0d00000000d00000000d000000000000d00000000d000000000d00000d00d00000000000000000000000000000
00000000000000000000000000000d0d00000d0d000000000d00000dd0d000000000dd0d00000000d00000000dd0000d0d000000000000000000000000000000
00000000000000000000000000000ddd0000d000d000000000d000d0000d000000dd000d000000000d000000d0d0000d0d000000000000000000000000000000
00000000000000000000000000000ddd0000d000d0000000000ddd00000d00000d000000d00000066d000000d00d00d00d000000000000000000000000000000
000000000000000000000000000000ddd00d00000d00000000dd00000000d00dd0000000d00666600660000d000d00d00d000000000000000000000000000000
000000000000000000000000000000d00d0d00000d0000000d00d00000000dd000000000066000000006000d0000d0d0d0000000000000000000000000000000
000000000000000000000000000000dd00d0000000d0000dd0000d000000d0d0000000006d000000000066d00000d0d0d0000000000000000000000000000000
000000000000000000000000000000dd00dd000000d000d0000000d000dd00d00000000060d000000000d06000000d00d0000000000000000000000000000000
0000000000000000000000000000000d00d0d000000ddd00000000d0dd00000d0000000600d0000000000d6000000d00d0000000000000000000000000000000
0000000000000000000000000000000dd0d0d000000d00000000000d00000000d0000060000d00000000d0600000dd0d00000000000000000000000000000000
00000000000000000000000000000000d0d00d0000d0d00000000dd0d00000000d000060000d0000000d006dd00d0d0d00000000000000000000000000000000
00000000000000000000000000000000ddd000d00d00d000000dd000d00000000d0006000000d00000d000600dd00d0d00000000000000000000000000000000
00000000000000000000000000000000ddd0000dd0000d000dd000000d00000000d0060000000d000d0000600dd000dd00000000000000000000000000000000
000000000000000000000000000000000ddd00ddd00000ddd00000000d000000000d060000000d00d0000060d00dd0d000000000000000000000000000000000
000000000000000000000000000000000ddd0d00d0000ddd0000000000d000000000d600000000dd0000006d00000dd000000000000000000000000000000000
000000000000000000000000000000000dddd0000d0dd00d0000000000d000000000d60000000dd0000006d0000000d000000000000000000000000000000000
0000000000000000000000000000000000dd00000dd00000d0000000000d0000000006000000d00d0000060000000d0000000000000000000000000000000000
0000000000000000000000000000000000ddd00dd00d00000d000000000d0000000006d0000d000d000060000000d00000000000000000000000000000000000
00000000000000000000000000000000000d0dd0000d00000d0000000000d0000000060d00d00000d0060000000d000000000000000000000000000000000000
00000000000000000000000000000000000ddd000000d00000d0000000000d00000000660d000000d0d60000000d000000000000000000000000000000000000
000000000000000000000000000000000000ddd00000d000000d000000000d000000000d60000000d660000000d0000000000000000000000000000000000000
0000000000000000000000000000000000000ddd00000d000000d000000000d000000dd0066006666d0000000d00000000000000000000000000000000000000
00000000000000000000000000000000000000d0dd000d000000d000000000d0000dd00000d66d000d000000d000000000000000000000000000000000000000
000000000000000000000000000000000000000dddd000d000000d000000000d0dd0000000dd00000d00000d0000000000000000000000000000000000000000
0000000000000000000000000000000000000000dd0dd0d0000000d0000000ddd000000ddd00dd000d0000d00000000000000000000000000000000000000000
00000000000000000000000000000000000000000dd00ddd0000000d0000dd00d0000dd0000000d000d00d000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000dddddddddddddd0dd0000d00dd0000000000d00d00d000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000d00d00ddddddddddddddddd0000000000000d0d0d0000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000d0d000000000d0000000d000000000000000ddd00000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000d0d000000000dd00000d000000000000000dd000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000dd00000000000d0000d00000000000dddd00000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000ddd0000000000d000d00000000ddd000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000dddddd00000dd0d00000ddd000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000dddddd0dd0dddd000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000dddd0000000000000000000000000000000000000000000000000000000000000
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

