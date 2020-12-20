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
	t=10

	cls()

	for mx=0,15 do
		for my=0,15 do
			mset(mx, my,
				mx + my*16
			)
		end
	end

	pal({
		7,
		6,
		5,
		1,
		15,
		13,
		1+128,
		0+128,
		5+128,
		6+128,
		13+128,
	},1)
	palt(7,true)
	palt(0,false)

	cls(7)
end

function _update()
	
	t+=1/30
	k=1

	for i=1,1000 do
		local x,y = rnd(128),rnd(128)
		local c = sin(x/64) + cos((y + 16*sin(x/64 + t/8) + t*8)/64) + (t+y/64)
		c = c%5 + 8
		if flr(c)==3+8 or flr(c)==4+8 then
			c = 4 - c + k
		end
		if (c-flr(c)<0.5) then
			local c2 = flr(c + 1)%3+8
			if c2==3+8 or c2==4+8 then
				c2 = 4 - c2 + k
			end
			c = c + 16*c2
			fillp(0b1111000011110000.1)
		end

		circ(x,y,1,c)
		fillp()
	end

	s = 64
	si = 16+15.99*sin(t/8)
	sii = s - si

	seg = 6
	size = 128*2/3/seg
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
		0,
		0,
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
			w.x = (v.x) + 6*(sin(t/6 + v.y/128))
			-- w.x = w.x + rnd(64)-32
			-- w.y = w.y + rnd(64)-32

			rot_ps[ty][tx] = {
				w,
				v
			}
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
			local v = ps[ty][tx][1]
			local v_orig = ps[ty][tx][2]
			local w = v_orig + vec(total_size/2, total_size/2)
			v = v + vec(64,64)
			--v = v + vec(64,64)

			if tx~=#ps and ty~=#ps then
				local v_right = ps[ty][tx+1][1] + vec(64,64)
				local v_down = ps[ty+1][tx][1] + vec(64,64)
				local v_across = ps[ty+1][tx+1][1] + vec(64,64)
				
				--polyf({v-vec(64,64), v_right, v_across, v_down}, vec(64,64), 0)
				--polyv({v-vec(64,64), v_right, v_across, v_down}, vec(64,64), 7)

				tquad(
					v.x,v.y,
					v_right.x,v_right.y,
					v_across.x,v_across.y,
					v_down.x,v_down.y,
					w.x/8*1.5,w.y/8*1.5,
					size/8*1.5,size/8*1.5
				)
			end
		end
	end
end

__gfx__
77777777777777777777777777777777777777777777777777777777777777777777111111177777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777771221112217777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777712211111222777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777122111111222177777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777222222222222277777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777771222226662222217777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777771211266666212217777777777777777777777777777777777777777777777777
7777777777777777777777777777777777777777777777777777777777777777221126bbb6211227777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777772111266666111127777777777777777777777777777777777777777777777777
7777777777777777777777777777777777777777777777777777777777777771263663333b666227777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777712000000000000311777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777716000000000000911777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777716000000000000312777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777116000000000000722777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777122337888088797622777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777122112b99993622122177777777777777777777777777777777777777777777777
777777777777777777777777777777777777777777777777777777777777772221126b333b622122277777777777777777777777777777777777777777777777
7777777777777777777777777777777777777777777777777777777777777722222266bbb6221122217777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777771222222666666222222227777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777712222222266666222222222117777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777711122222222266662222222111111117777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777711222222222222226222222211111111121117777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777771222221111222222266222211111111111111122177777777777777777777777777777777777
77777777777777777777777777777777777777777777777777122221111111222222222222111111111111111112221777777777777777777777777777777777
77777777777777777777777777777777777777777777777712222221111112222222222221111111111111111112222277777777777777777777777777777777
77777777777777777777777777777777777777777777777122222222222222222222222221111111111111112222222221777777777777777777777777777777
77777777777777777777777777777777777777777777772222222222222222222222222222222221111222222222222222177777777777777777777777777777
77777777777777777777777777777777777777777777722222222222222222222222222222222222222222222222222222217777777777777777777777777777
77777777777777777777777777777777777777777777222222222222222222222222222222222222222222222222222222221777777777777777777777777777
77777777777777777777777777777777777777777772222222222222222222222222222222662222222222222266622222222177777777777777777777777777
77777777777777777777777777777777777777777722222222222222222222222226666666666662222666666266222222222217777777777777777777777777
77777777777777777777777777777777777777777222221111112222222222226666666666666666666666662222222222222221777777777777777777777777
77777777777777777777777777777777777777771222111111111122222222266666666666666662222662262222222666222222777777777777777777777777
777777777777777777777777777777777777777122211111111111122222226666666bbbb33b6b3b333333622221126666622222277777777777777777777777
77777777777777777777777777777777777777122211221111111111222226666666bb3bb90000000000003222211226bb662212217777777777777777777777
7777777777777777777777777777777777777722211222111111111112222666666bbbb33b30000000000b2222111226633b6221227777777777777777777777
7777777777777777777777777777777777777122112262211111111111222666666bbb3333b3800000086222221112266b33b621121777777777777777777777
777777777777777777777777777777777777722111266621111111111122266666bbbb3333333800007662222211222666b33b61112777777777777777777777
777777777777777777777777777777777777121112666222111111111122266666bbbb33333333800966622221222666666b3362112177777777777777777777
7777777777777777777777777777777777772111226662222221111111222666666bbb333333333736662222212226b6666633b6111277777777777777777777
7777777777777777777777777777777777712111266622662221111111222666666bbb333333333bbb6622222222666bb666b336211217777777777777777777
7777777777777777777777777777777777711111266626666622111111122266666bbb333333333336622112222662163b666b3b621127777777777777777777
7777777777777777777777777777777777121112666666667162211111222666666bbb3b3999999366666621222627776366633b621121777777777777777777
77777777777777777777777777777777771211126666b66177262111112226666666bb367088800866900071226277771336b333621121777777777777777777
77777777777777777777777777777777771211126666b62777162211112222666666b33680000000b3800071226277771636b333b61121777777777777777777
77777777777777777777777777777777771211266666b61777722211111222666666bb36800000006b000031226177777636b333b62121777777777777777777
7777777777777777777777777777777777121126666bb61777716211111222666666bb363799997366636621262777771636b333621121777777777777777777
777777777777777777777777777777777772112639936617777122211112226666666bbb6666666666211112262777771336b333621221777777777777777777
77777777777777777777777777777777777121169993662777772221111222266666666b97777779662222222617777729b6b33b622217777777777777777777
777777777777777777777777777777777777221269996661777726211112222666666b63800000086222222266777771b3663336222277777777777777777777
77777777777777777777777777777777777712212b933666777716221111222666666b6b80000008622222226277771636633362222177777777777777777777
777777777777777777777777777777777777712216b3366627771622111122226666666b8000000922222222627771b366b33622221777777777777777777777
7777777777777777777777777777777777777712212b336662777222111122226666666639999336222222266177133b6b336222217777777777777777777777
7777777777777777777777777777777777777771221263366b2772621111222266666666666666666222222667713936b3b62222177777777777777777777777
77777777777777777777777777777777777777771221263366b1716211112222266666666666666622222226671b93bb36222217777777777777777777777777
77777777777777777777777777777777777777777122126936667162111122222266666666666666222222262769333362222177777777777777777777777777
777777777777777777777777777777777777777777711126996b21622111222222666666666666662222222b117333b622217777777777777777777777777777
777777777777777777777777777777777777777777772212b7369122111122222226666666666666222222231393362222777777777777777777777777777777
77777777777777777777777777777777777777777777712124763222111122222222226666666666222222662933622217777777777777777777777777777777
77777777777777777777777777777777777777777777771216736322111222222222222226666662222222666936221777777777777777777777777777777777
77777777777777777777777777777777777777777777777112396362111222222222222222226662222222699962217777777777777777777777777777777777
77777777777777777777777777777777777777777777777711646392111222222222222222222662222222679362277777777777777777777777777777777777
77777777777777777777777777777777777777777777777771296372111222222222222222222666222222679b22177777777777777777777777777777777777
7777777777777777777777777777777777777777777777777123b362111222222222222222222266222222649b11177777777777777777777777777777777777
777777777777777777777777777777777777777777777777711bb362111222222222266622222226222222649b11177777777777777777777777777777777777
7777777777777777777777777777777777777777777777777116b622111222222222666662222226622222b73321177777777777777777777777777777777777
7777777777777777777777777777777777777777777777777126b222111222222222666662222226622222b7b361277777777777777777777777777777777777
77777777777777777777777777777777777777777777777771266212111226622222666666222222662221662632217777777777777777777777777777777777
7777777777777777777777777777777777777777777777777166671211122666222666666662222266222162166b221777777777777777777777777777777777
7777777777777777777777777777777777777777777777771266271211126666222666622662222666222262b266b62777777777777777777777777777777777
7777777777777777777777777777777777777777777777712662771211226666222662777266222666622122bb226b6277777777777777777777777777777777
77777777777777777777777777777777777777777777771266277712112266662266277777262222666221227771266627777777777777777777777777777777
77777777777777777777777777777777777777777777722662777712112266622266177777162222666221227777722662177777777777777777777777777777
77777777777777777777777777777777777777777771226617777712112266622262777777722222666221227777771266217777777777777777777777777777
77777777777777777777777777777777777777777712221177777722112266622662777777726222666221221777777711217777777777777777777777777777
77777777777777777777777777777777777777777711777777777722112666622661777777716222266621221777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777722112666222627777777772222266622221777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777722112666222627777777772222266622121777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777721112666222617777777771222266622121777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777721112666222217777777777222266622121777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777721122666222277777777777222226662122777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777721122666222277777777777122226662122777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777721122662222177777777777722226662122777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121122662222177777777777722222662212777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121122662222177777777777712222666212177777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126662222777777777777712222666212177777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126662222777777777777772222666212177777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126662221777777777777771222266212177777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126622221777777777777771222266212277777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126622221777777777777777222266212277777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126622227777777777777777222266621217777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121126622227777777777777777122226621217777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121226622217777777777777777722226621217777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121226622217777777777777777722226621217777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121226222217777777777777777712222661227777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121226222277777777777777777712222662127777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121266222277777777777777777772222662127777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121266222177777777777777777772222662121777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121266222177777777777777777771222262121777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777121266222177777777777777777777222266121777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777111266222777777777777777777777222266111777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777111262222777777777777777777777122266212777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777111262222777777777777777777777722266212777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777111262221777777777777777777777722226212177777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777111662227777777777777777777777712226611177777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777211662227777777777777777777777712226621177777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777211662227777777777777777777777772226b21277777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777212662617777777777777777777777772226b61217777777777777777777777777777777777
77777777777777777777777777777777777777777777777777771212622617777777777777777777777771216461117777777777777777777777777777777777
77777777777777777777777777777777777777777777777777771216b22277777777777777777777777777212b62261777777777777777777777777777777777
77777777777777777777777777777777777777777777777777712226622277777777777777777777777777221622666217777777777777777777777777777777
77777777777777777777777777777777777777777777777777126622222277777777777777777777777771222622266621777777777777777777777777777777
77777777777777777777777777777777777777777777777771266622666217777777777777777777777772666666266666217777777777777777777777777777
77777777777777777777777777777777777777777777777122662222666661777777777777777777777726666666222266621777777777777777777777777777
77777777777777777777777777777777777777777777771226222222666666277777777777777777777126666666222222662277777777777777777777777777
77777777777777777777777777777777777777777777712622222222266666617777777777777777771266666662222222226227777777777777777777777777
77777777777777777777777777777777777777777777126622222222226666621777777777777777772226666662222222222622777777777777777777777777
77777777777777777777777777777777777777777771262222212222222222661777777777777777772222666662222222222262277777777777777777777777
77777777777777777777777777777777777777777712662221112222222222662777777777777777716622666662222211222266217777777777777777777777
77777777777777777777777777777777777777777726622211112222222226666777777777777777776662222222222111112226621777777777777777777777
777777777777777777777777777777777777777771662222111222222222666b6777777777777777772666222222222111122222221777777777777777777777
777777777777777777777777777777777777777772211226666222212226666b2777777777777777771666622111222666666211122777777777777777777777
77777777777777777777777777777777777777771211112666666211222666b27777777777777777777266622111112633b62211122777777777777777777777
7777777777777777777777777777777777777777121112266bb6621122666b277777777777777777777726622222122266662222222777777777777777777777
77777777777777777777777777777777777777771211222226662222266661777777777777777777777771266622222222222222221777777777777777777777
77777777777777777777777777777777777777777222222222222226666177777777777777777777777777772266666622666226627777777777777777777777
777777777777777777777777777777777777777771266666666666b6217777777777777777777777777777777711222266666622177777777777777777777777
77777777777777777777777777777777777777777711222666222217777777777777777777777777777777777777777777777777777777777777777777777777
__label__
llggggggggggggglgggggggggggglggglllllllgglllllllllllllllllllllllgllgggggggggggglgggglglmggggggllllglllllglglllllllllllllllllllgl
lllllggggggggggggggggggggggggllglmmmmmmmmmmlmllllllllllllllllmlllllllgggggggggggggggggggglglgllllmmmmmmmmmmmmlllllllllllllllllll
llgggggggggggggggggggggglggggglllllllllllllllllllllllllllglllllllllglggggggggggggggggggggggglglllllllllgllllllllllllllllllglllll
llllllllgggggggggggggggggglllllllllmmmmmlmllllllllllllllllllllllllllllggggggggggggggggggggllllllllmmmlmmmlllllllllllllllllllllll
glgllggggggggggggggggggggggggllllllllllllllllllllllllgllllglllglllggggggggggggggggggggggggggglllllllllllllllllllllllllllglgllllg
llllllllgggggggggggggggggglllllllllmlmlmlllllllllllllllllllllllllllllllllggggggggggggggggglgllllllllmlllllllllllllllllllllllllll
glgllgggggggggggggggggggggggglllllllllllllllllllllllgggggggglglllllgggggggggggggggggggggggggllllllllllllllllllllllgggglllggllggg
llllllllgggggggggggggggllllllllllllllllllllllllllllllllllllllllllllllllllggggggggggggggllglglllllllllllllllllllllllllllllllllllg
lllllggggggggggggggggggggglgllllllllllllllllllllllgggggggggggggllllglgggggggggggglggggggggggglllllllllllllllllllllgggggggggglglg
llllllllllgggggggggggggllllllllllllllllllllllllllllllllllllllllllllllllllllgggggggggggglllllllllllllllllllllllllllllllllllllllll
gglllgggggggggggggggggggggllglllllllllllllllllllllgggggggggggglgllgggggggggggggggggggggglglllglllllllllllllllllllggggggggggggggg
lllglllllgllglgggggggglglllllllllllllllllllllllllglllllglglllllllllllllllllllgggggggglgllllllllllllllllllllllllllllllgllgllgllll
ggglggggggggggggggggggggggllglllllllllllllllllllgggggggggggggggggglglggggggggggggggggggggggllllllllllllllllllllggggggggggggggggg
llglllllllllllggglglllgllllllllllllllllllllllllllglglllgggglglglgllllllgllllllglgglglggglllllllllllllllllllllllllgllllggglgglllg
gggggggggggggggggggggggggglllllllllllllllllllggggggggggggggggggggggggggggggggggggggggggggglglgllllllllllllllllgggggggggggggggggg
llggllglllglllllllggllglllllllllllllllllllllllllglggglggggggglglglglllllllllllllllllgllllllllllllllllllllllllllgglllllgggggglggg
ggggggggggggggggggggggggggglgggggllllggllglggggggggggggggggggggggggggggggggggggggggggggggggggllllllllllllggggggggggggggggggggggg
ggggllgllgllgllllglgllllgllllllllllgggggglgllglllllllgggggggggggggllgllllllllllllllllllllglllllllllllllllglgggllglllgggggggggggg
ggggggggggggggggggggggggggggggggllggggglgggggggggggggggggggggggggggggggggggggggggggggggggggggggglllllggglgggggggggggggggglgggggg
gggglglglgllglglllllllllllllllllllggglglglglglllllllglgggggggggggglggllglllllllllllllllllllllllllllllgggllllggllllllgggggggggggg
gggggggggggggggggggggggggggggggggglggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggglggggglggggggggggggggggggggggg
gggggggglgllglglllglllllllllllllgllggggglglllllllllllllgggggg77777gggglglllllllllgllllllllllllgllgggggggglglllllllllgllllggggggg
ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg667767ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggglgggglllgllllllllgllgggggggggggglllglllllllglglggg7677766gggggggglgllllllglglgllllggggggggggggglglllllllllllllgggggggg
glggggggggggggggggggggggggggggggggggggggggggglllgllgggggggg6666666666ggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg
gggggggggggggggggggggglgllgggggggggggggglglllllllllllglgggg66666dd6667ggggggggggglgggggglggglgggggggggggllglllllllllllllglgggggg
ggggglgggggggggggggggggggggggggggggggggggggllllglglgglgggggg676dtt6766ggggggggggggggggggggggggggggggggggggggglgggggggggggggggggg
gggggggggggggggggggggggggggggggggggggggglllllllllllllllllllg776ddd7776ggggggggggggggggggggggggggggggggggllllllllllgllllllglggggg
gggggggggggggggggggggggggggggggggggggggggggglglllgllllglggg70000000057ggggggggggggggggggggggggggggggggggggggglgllglgllgggggggggg
gggggggggggggggggggggggggggggggggggggglllllglllllllllllllll7000000000l7gggggggggggggggggggggggggggggggllgllllllmmlmllllllllggggg
ggggggggggggglggggggggggggggggggggggggggggglllllllllllglg77770000000066ggggggggggggggggggggggggggggggggggglgllglllllllgggggggggg
ggggggggggggggggggggggggggggggggggggglgllllllmlmmmmmllllll77655gg0ggld6ggggggggggggggggggggggggggggggglglllllllmlmllllllllgggggg
lgggglggggggggggggggggggggggggggggggggggllllglglllllllllgg66677dt55d6766gggggggggggggggggggggggggggggggllgllllllllllllglgggggggg
ggggggggggggggggggggggggggggggggggggllllgllmmmmmmmmmllllll66666ddtt667667gggggggggggggggggggggggggggglllllllmmmmmmmmmmllllllgggg
gggggglggggggggggggggggggggggggggggggglgllllllmlllmlllll7l7666666ddd66666677ggggggggggggggggggggggggggglglllgmglllgllllllggggggg
gggggggggggggggggggggggggggggggggggggllllllmmmmmmmlmmm77677666666ddd66667777777ggggggggggggggggggggglglllmmmmmmmmmmmmlmllllgglgg
ggggggggggggggglglgggggggggggggggggggglggllgllmlmlmmm666667766666d666777777777767gggggggggggggggggggggglllllgmmgmllllllllllggggg
ggggggggggggggggggggggggggggggggggggggglgmmmmmlmmm7766667777666666667777777777776666gggggggggggggggllglmmmmlmmmmmmmlmmmlllllgggg
gggggggggggggggggggggggggggggggggggggllglgmgmllmml77666666666666666667777777776666667ggggggggggggggggllllllllmmlmlmmmmlmlllllggg
gggggggggggggggggggggggggggggggggglglllllmmmmmmml6666666666666666666666666666666666666ggggggggggggglllllllmllmmmllmmmmmmmlllllgg
ggggggggggggggggggggggggggggggggggggglllllmlgl6l6666666666666666666666666666666666666667ggggggggggggllllmlmlmlmllllmmmmmlllllggg
gggggggggggggggggggggggggggggggglglllmgmmmmmlll6666666666666666666dddddddd66dddd6d6666666gggggggggglllmmlmlmlmmllllllmmmmlmllllg
gggggggglgggggggggggggggggggggggggglgggmlmmmllll6666777766666666ddddddddddddddd66666666667ggggggggggllllmlllmlllllllmlmmmmllllgg
gggggggggggggggggggggggggggggggggglllllmmlmlml7766777777776666dddddttt5tt55555d6677dddd6666ggggglllmlmmlmllllllllllllmmmmmmmmmll
gggggggggggglgggggggggggggggggggggglglgmlmlmlml667667777776666ddddtttt000000005566776dtd6666gggggglgllmlmllllllllllllmmmmmmllllg
llggggggggggggggggggggggggggggggggllmlmlmlmlll76766d67777777766ddddtt55t50000gd666776dt5td777gglgllllmmmlmllllllllllllmmmmmmllll
ggggggggggggggggggggggggggggggggggllglllllllll66776dd7777777766dddttt5555g000dd666766ddt5t776ggggggglmmlmllmlllllllllllmlmlmmlll
lllggggggggggggggggggggggggggglllllllmllllllll6776dd66667777766ddddtt5555555dd6666766tddd55d77lllmlmmmmmllmlllllllllllmlllmmmmll
ggggggggggggggggggggggggggggggggglllmmmllllm666776d66d667777766dddddtt555555ttd66666ddtddt5d677llllglmmmlmlllllllmllllllllmmmlll
lllglgggggggggggggggggggggggggllgllllmmmllll77776dddddddd6777766ddddttt5lllldddd666d6g55dd5td767llmgmmmlmllllllllllllllllmmmmmll
lglggggggggggggggggggggggggggggglglllmmmlllll77776ddtdl77d677766ddddt5dg0000t5006666gddd5t55t7767lgmllllllllllllllllllllllmmmlll
llllgggggggggggggggggggggggggglllllmmmmlllllll777dddtdll66677766ddddttdg0000dt0055667gddd5t55t667mmmmmlllllllllllllllllllmlmmmlm
llllgggggggggglggggggggggggggglglglmgmlmlllll7777d5lddlll7667766ddddddttddddddd7776dg55555t55d767mmmmgglllllllllllllllllllmmmmll
lmlllgggggggggggggggggggggglglllmlmmllmlmlllll667dll5ddlll66677666dddddtlggggdd6666dggglltt5td67lmmmmmllllllllllllllllllllmmmmmm
llllggggggggggggglglgggggggggglggmgmmlllmmllll777676l5ddldld677766ddddttg0000d6666d6777ddd556667llllmllllmllllllllllllllllmlmmmm
mmllllgggggggggggggggggggglllgggmmmmllllllmlllll7767t5dd6ldd6777666ddddtg0000666666d6gtt5dt5d667mlmmlmlllllllllllllllllllmlllmmm
lllllggggggggggggggggggggggggllglllmlllllllmlll7l7767d5dd6l6d777666dddddddddddd6666d7755d5t6667llmmmmlllllllllllllllllllmlllmmmm
mmlmllggggggggggggggggggggggllmlmmmmmllmlllllllllll7676d5dt77d777666dddddddddd66666dttlttd666lmmlmmmllllllllllllllllllllllllmmmm
mllllllgggggggggglgggggggggggllgmmmllllllllllllllllll777dldt7d6776666ddddddddd666667755td66glgllllmmlllllllllllllllllllllmlmmmmm
mmllllllgggggggggggggggggggllmmmmmlllllllllllllllllll6666t5d7677766666dddddddd6666667555666gglmmmlllllllllllllllllllllllllmlmmmm
mlllllgggggggggggggglggggllllglmmmmlllllllllllllllll6ll66755567766666666666dddd6666ddld67gggglmmllmlllllllllllllllllllmllllmlmmm
mmmlmllllglggggggggggggglllmlmmmmmlllllllllllllllllmlmll7775l5d77666666666666dd6666dll66glglgmmmmmllllllllllllllllllmllmllmlmlmm
mmmllllgggggggggggggggggglgllllmmlmlllllllllllllllllmllll666l5m77666666666666dd6666dlt67lglglgmmmmlllllllllllllllllmlmlllllmlmlm
mmmmmmlllllllggggggggglllllmmmmmmmlllllllllllllllllllmllmm6655d776666666666666d6666ddlt77lglmmmmmmmllllllllllllmmlmmmlmmllmlllmm
mmmmlllllgggggggggggggggllllmmmmmmmlllmllllllmlmmllmmllmlmm655d776666666666666d6666ddlt77llgllllmmmmllllllllmmmmmmmmmmmlmlllllmm
mmmmmmmlllllllgggggllllgllllmmmlmmlllllllllllmmmmmmmmmmlmmm7dd677666666dddd6666d666tt5577mlmlmmmmmmllllllllmmmmmmmmmmmmmlmmllmmm
lmmllllllllgggggggggggggllgmlmmmmmllllmlllmlmmmmmmmmmmmmmmm6d66776666666dddd6666d666tt576lgllmllglmlllllllmmmmmmmmmmmmmmmmmmmmmm
mmmmlmllllllllllllgllllllmlmmmmmmmlllmllmlmmmmmmmmmmmmmmmmdddm77766dd666ddddd666dd66d7dt67lmmmmmlmlllmlllmmmmmmmmmmmmmmmmmmmmmmm
mmmmlllllllglggggggggglllllllmmmmmllmlmllmmmmmmmmmmmmmmmmm7dd77776ddd666dd66d666dd66dt6dt6gmgmlmllmlllmlmmmmmmmmmmmmmmlmmmmlmmmm
mmmmmmmmmlllllllllllllllmlmmmmmmmmmllmlmmmmmmmmmmmmmmmmmm66d6m77776ddd6d6l6l6d66dd666ll76ddmmmmlmmmmlmlmmmmmmmmmmmmmmmmmmmmmmmmm
mmmlllllllllllgggglgllllllllmlmmmmmmmmmmmmmmmmmmmm6m66m666ddmmm7776dd66d7ll77d66dd666gl6l6d67mmmmmmmmlmmmmmmmmmmmmmmlmgmlmmmmmmm
mmmmmmmmmmlmllllllllllllmlmmmmmmmmmmmmmmmmmmmmmmmmmmmm76667mmm66776dd6ddllll6666dd6667lllml76mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
lmlmgmllllllllllllllggllgllmmmmmmmmmmmmmmmmmmmmmmm777777llllml6677ddd6ddllll77666dd667glllllmmmmmmmmmmmmmmmmmmmmmllllllllllllmml
mmmmmmmmmmmlllllllllllllmlmlmmmmmmmmmmmmmmmmmmmmmmmmmmmmlmmmmmm677dd66d6mlmlll666dd677llmmmmlmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmll
gllllllglllllllglllllglllllmllmmmmmmmmmmmmmmmmmmmgllllllllllll6677dd66d7llllll666dd677llllmmmmmmmmmmmmmmmmmmmmmmmlllllllllllllgl
mmmmmmmlmmlllllmlllmlmmmmlmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmlmmmmmm676dd666mlmmmml6666dd76mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmlmlmmmmmg
lllllllllllllllllllllllglmlmmmmmmmmmmmmmmmmmmmmmlllllllllllllll676dd666lllllll7666dd776lllmmmlmmmmmmmmmmmmmmmmmmlmlllllllllllllg
mmmmmmmmmmmmlllmlllmlmmmmmmmmmmmmmmmmmmmmmmmmmmmmmlllmmmlmmmml7676dd667mmmmmmll666dd666mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmlllmmmmlm
lllglllglllllllllllllllllggmmmmmmmmmmmmmmmmmmmllllllllllllllll7676dd667lllll7ll766dd6667lgmlmmmmmmmmmmmmmmmmmmlllllllllllllllglg
mmllmmmmmmmmmmmmlmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmlmmlmmlmlllllll7676dd66mmmlmmmmlm66dd6667mmmmmmmmmmmmmmmmmmmmmmmmmmmmmllllllllllm
glllllllllllllglllglllllllllmlmmmmmmmmmmmlllmlllllllllllllllll7676d666lllll6glll666d6666llllmmmmmmmmmmmmmlmmllllllllllllglllllll
lmmlmmmmmmmmmmmmlmllmmmlmmmmmmmmmmmmmmmmllmmmmmlllllmlllllllll7676d666mmmmmmmmlm666d666lmmmmmmmmmmmmmmmmlmmmmlmmmlmlmlmllllllllm
llggglllllllllllllllllllllllllglmmmmmmmllllllllllllllllllllgll7676d666llllllllll7666d76lgglllllmmmmmmmlmllllllllllllllllllllglgl
llllllmmmmlmlmlmmlmmmmmmmmmmmmmmmmmllmlllllmlmmmmmlmlmllllllll7666d667mmmlmlmmmmm666d76mmmmmmmmmmmmlmlmlllmmllmmmmmmmlmlllllllll
llllllllllllllllllllllllllllllglllllllllllllllllllllllllllllll76666667glllllglll7766d76llllglllllllllllllllllllllllllllllllllgll
lllllllllmllmmmmmlmmmmlmmlmmmmlmllllllllllllmlmmmmmlmmlllllll76666666lmmmllmlmlmm766d67mmmmmmmmmlmllllllllmmmmmmmmmmmlmlllllllll
glgllglllllllllllllllllllllllllllllllllllllllllllllllllllllll766d667llllllllllllll66d677lllllllllllllllllllllllllllllllllllllllg
llllllllllllmlllmlmmmmmlmmmmmmlmlllllllllmmmmmlmmmmlmmmllllll766d667llllmllmlmlml6666677mlllmllllllllllmlmmmmmmmmmlmmmmmlllllllg
ggglgglglllllllllllllllllllllllllllllllllllllllllmllllgllllgl776d66lllgllllllllll6666d77llllllllllllllllllllllllllllllllllllllgg
lllllglllllllllllllmmmllmllllllllllllllllmmmmlmmmmmmmmmmmmlll776d66llllllllllllll766d666lllmlllllllllllmmmmmmmmmmmmmmmmlllllllll
ggggggglllllllllllllllllllllllllllllllllllllllllmmmllllllllgg776d666ggglllllllllll66d6677llllllllllllllllllmmmmmmmllmmlllllglllg
llglllllllllllllllllllllllllllllllllllllmmmmmmmmmmmmmmmmmllll77dd66lllllllllllllll76dd77llllllllllllllllmmmmmmmmmmmmmmmmmlllllll
gggggggllgggllllllllllllllllllllllllllllllllmlllmlmlmllllllgl67dd666ggggglgllglllg66dt76llllllllllllllllllllmmmmmlmmmmllllllllgg
lllllllllllllllllllllllllllllllllllllmlmlmlmmmmmmmmmmmmmmmml67d6d77llgllglllllllll76d177llllllllllllllmmmmmmmmmmlmlmmmmmmmllllll
ggggggggggggggllllllglllllllllllllllllllmlmlmmmllmllmmglllll67t666gggggggggglgllll666t667lllllllllllllllmlmmmmmmllmmmlmlmllllllg
llllllllllllllllllllllllllllllllllllllmmmmmmmmlllllllmmmmm76d66666glglllllgllllll766d66dd77lllllllllllmlmmmmlmmlmllmmmmmmlllllll
gggggggggggggggggggggllglllllllllllllllmmmlmlmmlllllmlmmml6dd6dd677gggggggggggggg6dddd6ddd666lllllllllllmlmlmlllllllmlmmllllgglg
lllglggglgglllllllllllllllllllllllllmmmmmmmlmmmllmlllml666666dddd6llglllllggllll76dddd6666d66lllllllmlmmmlmllllllllllllmmmmmllll
gggggggggggggggggggggggggllllllllllllllmllllllmlllllll7d666666dddd777gggggggggg6dddd666666d6666llllllllllllllllllllllllmmlllllll
lglllggglgglgllllllllllllllllllllllllmlmlmlllmlllllll6d6667666666dddglgggggglgl66ddd66666666666lllllmmlmmllllllllllllllllmmmllll
gggggggggggggggggggggggggggggllllllllmmlmlllllmlmll76dd6677666666dddgggggggggg7d6ddd66667666d666llllllmmmmllmlmlllllllllllmmllll
glllggggggggggllgllllgllllllllllllllmmmmlmmlllmlllld66677666666ddtttlgggggggggdd666666677766667llllllmmmmmllllllllllmlllllmmmmll
lggggggggggggggggggggggggggggggllllllmmlmlmllllgllg676ddd66666dddttggtggggggggddd67766dddd67766l6lllllllmlmllllmllllmmlllmmmmlll
lllllggggggggggggggggggglglllllllmlmmlmmlmllllglgg7776ddtd6766dd66lglgggggggggg6d666766dd66666llllllmmmlmmllllllllllllllllmmmlll
lllgggggggggggggggggggggggggggglgllllmllmlmllllgl776666dd666dddddlggggggggggggg76dd666666666677l7lllmmmllllllmlmglllmlmllmmmmmll
llllllgggggggggggggggggggggglgllllllmllmlmlllggllg6dddddddt677mmllllggggggggggggggg7666dddd67llllmlmmmmlmlgggglggglllllllllmmmlm
llglgggggggggggggggggggggggggggllllmmmmlmllmgggggg766dd66677mmlllllgggggggggggggggggggggggggggglglgllmmmlggggggggggglgmlllllmmml
lmlgllgggggggggggggggggggggggglmlmmmmmmlllglgggggggggllllllllmmmmlllglgggggggggggggggggggllllllmlmmlmlmlllgglgggggggglllllllmlmm
lllggggggggggggggggggggggggggggglglmmmlllglgggggggggggllllllllmmllllgggggggggggggggggggggggglgllllgmlmlllglggggggggggggllllllllm
mmlllllgggggggggggggggggggglllllmlmmllllglgggggggglgggllllllllmmmllllggggggggggggggggggglgglllgllmmmmlllglglgggggggggglglllllllm
lllllgggggggggggggggggggggglllllllgllllglggggggggggggggglmllllllmlllgggggggggggggggggggggggglglllllllllllglglggggggggggggllllllm
mmlllllggggggggggggggggggglllllmllmmllllgggggmgggggggggggllllllmmmlmllgggggggggggggggggglgglglllllllllllllglgggggggggggglglllllm
mllllgggggggggggggggggggggggglllmllllllgmggggglggggglggglgllllllllllllggggggggggggggggggggggllllllllmlllmglggggglgggggggggllllll
mmmmlllllggggggggggggggglllglmlmmmllllmmggggggggggggglglgllllllmmmmlllllggggggggggggggglgglglllmmmllllglgggggggggggggggggggllllm
mmmglglggggggggggggggggggggglgllmllllllggggggggggggggglgglllllllmmlllllggggggggggggggggggggllllmmlmlmggggggggggglgggggggggglllml
mmmmmllllgggggggggggggglglllgmmmmlllllgggggggggggggggggglglllllmmmmmmlllglglgggggggggglllllllllmlmlllgggggggggggggggggggggllllll
llmmllllgggggggggggggggggggglglmmmlllglgggggggggggggggglggglllmlmmmlllllggggggggggggggggggggglgmmlllmgglgggggmggggggggggggglllll
lllmmmllllglggggggggglglglglmmmmmmlmglggggggggggggggggggggglllllmmmmmllllllllggggggggggllllglmmmmlllglggggggggggggggggggggggllll
lllmllllgggggggggggggggggglglglmgmgllggggggggggggggggggggglglllmlmmmmllllgggggggggggggggglgllmlmgllllgggggggggggggggggggggggllll
lmmmmmmllllllgggggglgllgllgmmlmmmlllglggggggggggggggggggggglglllllmmmllllllllllgggglglgglllmlmmllmllglglggggggggggggggggggglllll
llmmmlllllgggggggggggggglglllmgmlglglgggggggggggggggggggggggllllllmmmmlllggggggggggggggggglllmgmmlllggggggggggggggggggggggglllll
llmmmmmmlllllllglgllllllgllmlmmmmlllglgggggggggggggggggggggggllllllmmmlmllgllllgglllllllmlmmmmmmlllglgggggggggggggggggggggggglll
lllmmmmlllglgggggggggglglgllmlmllgllggggggggggggggggglgggggggllllllmmmllllglggggggggggglllllgmmlmllmgggggggggggggggggggggggglgll
lllmmmmlmlllgllglllgllllgmlmlmlmllgggggggggggggggggggggllggggllllllmmmmllllllllllllllllllmmmmmlllllglggggggggggggggggggglgggglll
llllmmmllllglggglglgglllglgllgmlmglggggggggggggggggggggglggglgllllllmmmmllllllgggglggllllmlmmmmlllgggggggggggggggggggggggggggllm
lllllmmmlmllllllllllgllllmllllllllggggggggggggggggglggglgggggllllllllmmmmmmlllllllllllllmmmmmmlllgggggglggggggggggggggggggggllll
llllllmmmlllllgglglllgllmgmllllllggggggggggggggggglglggglggglglllllllmmlmllllllgggllllllllllllmmllgggggggglgggggggggggggglglllll
mllllllmmmmlllllgllllllllmggllllmlggggggggggggggggllgglgglglglllllllmmmmmmllllllgllllllmlmmlmlmllllglggggggmgggggglgglggggllllll

