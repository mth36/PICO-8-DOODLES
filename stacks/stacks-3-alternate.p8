pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--doodle template
--micheal

█=1000
dt=0.0333

t=0

function sqrdist(x1,y1,x2,y2)
	return (y2-y1)*(y2-y1) + (x2-x1)*(x2-x1)
end

p={128,2+128,2+128,6,13,7,15+128,14+128}
for i=1,#p do
	pal(i,p[i],1)
end

cls()

::♥::
t+=dt

for i=1,█ do
	x,y=rnd(128),rnd(128)
	
	c=sin(sin(x/32)/100)
	 +ceil(x/64 + t/8)+flr(x/128)
  +ceil(y/24)+flr(y/32)
  +flr(x/128) 
  +y/32
 		 
	c=c+t
	 
	c=c%#p+1

	local k = 48*48 < sqrdist(x,y,64,64) and 1 or -1
	fillp(((t + k)%4<2) and 0b0000000011110000 or 0b0000110000000011)
	circ(x,y,1,c + 15*flr(c))
end

flip()goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000070000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777vvvvvvvvvvvvvvvvvvvvvvv0vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuuuuuuuuuu
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000v00000000000000000000000000000000000000000000000000000000000000000000000000000000000
777777770777777777777777777777777vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvuuuvvuuuuuuuuuuuuuuuuuuuuuuuuu
000000000000000000000000000000000000000000000000000000000000000000v0000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7v7vvvvvv7v7777777777777777777777v77uvuv7vuvvvuvuuvuvvvvvvvvvvvvvvuvvuvuvvuvuvuvvvvvvvvvvvvvvvvvuvvvuuggggggguuuuuuuuuuuuuuuugug
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
vvvvvvvvvvvvv7v7v7v77v7vv7v77v7v0vv7uuuuvuuuuuuvuvvvvvuvuvuvuuvuvuvvuuuuuuuuvvuuvvvuvvuuuvuvuvvvuvuvggggggugguguuguuuugugguguuug
000000000000000000000000000000000000000000000000000000000000000v00u0000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000vu00uv00uv00uu00uu00u000u000000000000000000000000000000000000000000000000000
vvvvvvvvvvvvvvvvvvvv7vvvvv7v7v7vvvvuuuuuuuuuuu0u00000000000000000000000000000u0uu0uuuuuvuuuuvuuuvuguggggggggguguggggggguuggggggg
0000000000000000000000000000000000000000000000uu00uu00uu00vu00uu00uu00uu00vu00u0000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000uu00uu00uu00uu00uu00uu00uu00uu00uv00uu000u000000000000000000000000000000000000000000
vvvvvvvvvvvvvvvvvvvv7vvvvvvvvvvvvuvuuuuuuu000000000000000000000000000000000000000000000uuuuuuuuuuuuuvggggggggggggggggggggggggggg
00000000000000000000000000000000000000gg00ug00gu00uu00gu00ug00gu00uu00uu00gu00uu00uu00uu00g0000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00g00000000000000000000000000000000000
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu00000000000000000000000000000000000000000000000000000000000gggggiiiiiiiiiiiiiiiiiiiiiiiiiiiii
0000000000000000000000000000000000uu00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gu00gu00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000uu00ug00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gu000000000000000000000000000000
uuuuuuuuuuuuuuuuuuuuuuuuuuuuu0000000000000000000000000000000000000000000000000000000000000000u0000giiiiiiiiiiiiiiiiiiiiiiiiiiiii
000000000000000000000000000000uu00uu00gi00gg00gg00ii00ig00gg00gg00gg00gg00ig00ii00gg00ii00ii000i00g00000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000gg00gg00ig00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00i000000000000000000000000000
ggggggggggggggggggggggggggg0000000000000000000000000000000000000000000000000000000000000000000000000i0iiiiiiiiiiiiiiiiiiiiiiiiii
00000000000000000000000000gg00gg00gg00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00i0000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000gg00gg00gg00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00i000ii00ii00ii00ii00ii00000000000000000000000000
ggggggggggggggggggggggg000000000000000000000000000000000000000i000000i00000000000000000000000000000000000iiiiiiiiiiiiiiiiiiiiiii
00000000000000000000000g00gg00gg00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000g00gg00gg00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00i000ii00ii00ii006i0000000000000000000000
ggig0igigiiiiggggiggg00000g000000000000000000000000000000000000000000000000000000000000000i000000000000000iiiiiiiiiiiiiii6iiiiii
00g0000000000000000000gg00ig00ig00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00i60066000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000g000000000000000ii00ii00gi00gi00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00ii00i6006i0060000000000000000000
iigggiigiiigiigigggg0000000000000000000000000000i000000000000000000000000000000000000000000000000000000000006666i6i66iii6ii6ii66
0000000000000000000i00ii00ii00ii00gi006i00i600ii00ii00ii00i600ii006i00i600i600i6006600ii00i600ii00ii0066006600000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000i00ii00ii000i00ii0066006600i600660066006600ii006600i600660066006i006i006i0066006600dd00dd00dd000600000000000000
iiiiiiiiiiiiiiiiii000000000000000000000000000000000000000000000000000000000000000000000i0000000000000000000000ddddd6ddddddddd6d6
000000000000000000ii00ii00ii00ii00ii0066006i006600660066006600660066006600660066006600060066006600i600id00dd00d00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000i00ii00ii00ii00ii006600660066006i00660066006600i60066006600660066006600660066006i00dd00dd00dd000000000000000000
iiiiiiiiiiiiiiii0000000000000000i000000000000000000000000000000000000000000000000000000000000000000000000000000ddddddddddddddddd
000000000000000000ii00ii00ii00ii00ii00660066006600660066006600660066006600660066006600660066006600dd00dd00dd00d00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000ii00ii00ii00ii00ii0066006600660066006600660066006600660066006600i6006600660066006600dd00dd00dd00d000000000000000
iiiiiiiiiiiiiiii0i00000000000000000000000000000000000000000000000000000000000000i00000000000000000000000000000000ddddddddddddddd
000000000000000000ii00ii00ii00ii00ii006600660066006600660066006600660066006600660066006600660066006600dd00dd00dd0000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000ii00ii00ii00ii00ii00i600660066006600660066006600660066006600660066006600660066006600dd00dd00dd000000000000000000
iiiiiiiiiiiiiiiii000000000000000000000000000000000000000000000000000000000i000000000000000000000000000000000000ddddddddddddddddd
000000000000000000i600ii00i6006i00id0066006d00dd006600d6006d006600d600660066006600d600dd00660066006d00dd00d700d70000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000066006600660066006600dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd007700770077000000000000000000
66666666666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070777777777777777
00000000000000000066006600660066006d00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00d000dd00dd00dd00dd00d70077007700770000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000060006600660066006600dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd00dd007700770000000000d0000000
66666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077777777770777777
000000000000000000d600dd00dd006d006d007d00dd00dd00dd00dd00dd00dd00dd00dd00dd007d00dd007d00dd00dd007d007v007700000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000d000dd00dd00dd00dd00v7007v0070007700770077007v00770077007v007v007700770077007700v700uv00uv00vv000000000000000000
d7d7d7d7d7dd770dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000vvvvvvvvvvvvvvvvuv
000000000000000000dd00dd00dd00dd007d007v007700770077007v007700vv00v7007v00vv007700770077007v00v7007u00vv00vu00u00000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000077007d00d7007d007v00v700v700v700v7007v00v700vv00vv007v00vv00v700770077007v00vv00uu00uu00uu000000000000000000
dd77d7777777d7777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000uuuuuuuuuvuvvvvvuu
000000000000000000d0007700dd007d007v00vv00vv00vv007v007700vv00v700vv00vv00vv007v00v700vv007v00vv00uu00uv00uu00000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000077007d00d7007v00v700vv007700vv007v00v700vv00vv007v00vv00vv007v00v700vv00vv00vv00uu00uu00u0000000000000000000
d777777777777777777700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000vvuuuuuuuuuuuuuuuuu
0000000000000000000000770077007d007v00vv00vv00vv00vv007v00v700vv00vv00vv00vv00vv00v700vv00v700vv00vu00uu00vv00000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000077007700d7007700dv00vv00vv00vv00vv00vv00v700vv007v00vv00vv007v00vv00vv00vv00vv00uu00uu0000000000000000000000
77777777777777777777d0000000000000000000000000000000000000000070000000000000000000000000000000000000000000uuuuuuuuuuuuuuuuuuuuu0
0000000000000000000000070077007700vd00vv00vv00vv007v00vv00vv00v000vv00vv00vv00vv00vv00vv00vv00vv00uu00uu0000000000000000000000vv
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000770077007700vv00vv00vv00vv00vv000v00vv00vv00vv00vv00vv00vv00vv00vv00vv00vv007u00u00000000000000000000000
07777777777777777777777070000000000000000000000000000000000000000000000000000000000000000000000000000000uuuuuuuuuuuuuuuuuuuuuuuu
0000000000000000000000000077007700v700vv00vv00vv00vv00vv00vv00vv00vv00vv00vv00vv00vv00vv00vv00v000vu00u0000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000077007700vv00vv00vv00vv00vv00v000vv00vv00vv00vv00vv00v000vv00vv00vv00vv00uu0000000000000000000v000000
7777777770777777777777777707000000000000000000000000000070000000000000000000000000000000000700000000u0vuuuuuuuuuuuuuuuuu0uuuuuuu
0000000000000000000000000007007u00vv00gv00vv00vg00vv00vv00gv00gv00vv00vv00vg00vv00gv00vv00vv00vv00v00000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000uu00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg000000000000000000000000000000
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu0000000000000000000000000000000000000000000000000u000000000000000igiiiiiiiiiiiiiiiiiiiiiiiiiiiii
0000000000000000000000000000000000u000gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg000g00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg00gg0000000000000000000000000000000000
uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu00000000000000000000000000000000000000000000000000000000g0ggggiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
00000000000000000000000000000000000000gg00gg00gg00gg00gg00gg00gg00g000gg00gg00gg00gg00gg00g0000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000gg00gg00gg00gg00gg00gg00gg00ig00ig00gg00gg00gg0000000000000000000i000000000000000000
uuuuguguguuuguguuuuuuuuuuuuuuuuguuuggigiiiii00000000000000000000000000000000000000000000gggggggggiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
0000000000000000000000000000000000000000000000gg00gg00gg00gg00gg00ig00ii00ig00ii00g00000000000000000000000000000000000000000000i
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000g000ii00ig00ii00ii00ig000i00ii00000000000000000000000000000000000000000000000000
gggggggggggugggguuuuugguguuuggggggigiiiigiiiiigii0i0ii0i000g00000000000g0000000iiiiggggggigigiiiigiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
0000000000000000000000000000000000000000000000000000000g000g00ii00ig000i000i0000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000g000000000000000000000000000000000000000000000000000000
ugggggggggugugugugugggggguggugggguguiiiiiiiiiiiiiigiiiiiiiiiigiiiiigiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
gggggggggggggggggggggggggggggggggigiiuiiiiigiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiigiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii6666666666666666666666666666
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
iiiiiiiiiiiiiiiiiiiiiiiigiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii666666666i6666666i6666666666
0000000000000000000000g000000000000000000000000000000000000000000000000000000000000000000000000000000000000000i00000000000000000

