pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
█=5500
⧗=0
num=6
dist=50
shape=2

pal(2,2+128,1)
pal(13,13+128,1)

function sqr(a) return a*a end

function lerp(a,b,t) return a + t * (b - a) end

function ll(a,b,c,ym) 
	line(a.x,a.y+ym,b.x,b.y+ym,c)
	line(a.x,a.y+ym+1,b.x,b.y+ym+1,c)
end

function llc(ym,c1,c2,c3)
	--side one
	ll(pp[6],pp[16],c1,ym)
	ll(pp[16],pp[15],c2,ym)
	ll(pp[15],pp[14],c3,ym)
	ll(pp[14],pp[13],c2,ym)
	ll(pp[13],pp[12],c1,ym)
	
	--side two
	ll(pp[3],pp[11],c1,ym)
	ll(pp[11],pp[10],c2,ym)
	ll(pp[10],pp[9],c3,ym)
	ll(pp[9],pp[8],c2,ym)
	ll(pp[8],pp[7],c1,ym)
	
	ll(pp[2],pp[6],c1,ym)
	ll(pp[8],pp[16],c2,ym)
	ll(pp[9],pp[15],c3,ym)
	ll(pp[10],pp[14],c3,ym)
	ll(pp[11],pp[13],c2,ym)
	ll(pp[3],pp[5],c1,ym)
end

cls()
::⌂::
pp={}
⧗+=0.0166

if btnp(0) then shape-=1 end
if btnp(1) then shape+=1 end

rr=rnd(1)<0.1

--slight clear screen
for i=1,█ do
	x,y=rnd(108)+10,rnd(128)
	pset(x,y,0)
end

for i=1,num do
	ang=i/num
	local x=dist*1*cos(ang+⧗/4)+64
	local y=dist*0.65*sin(ang+⧗/4)+64
	add(pp,{x=x,y=y})
end

for i=0,0.9,0.2 do
 add(pp,{
 x=lerp(pp[2].x,pp[3].x,i),
 y=lerp(pp[2].y,pp[3].y,i)
})
end

for i=0,0.9,0.2 do
 add(pp,{
 x=lerp(pp[5].x,pp[6].x,i),
 y=lerp(pp[5].y,pp[6].y,i)
})
end

for i=1,num do
	x,y=pp[i].x,pp[i].y
	
	ss=(i+num/shape)%num+1
	c=7
	if ss==2 then c=1 end
	p1=pp[flr(ss)]
	p2=pp[ceil(ss)%num+1]
	
	line(x+3,y+47,p1.x-3,p1.y+40,2)
	line(x,y+40,p2.x,p2.y+40,2)
end

--llc(40+rnd(2),2,2,2)

for i=1,num do
	x,y=pp[i].x,pp[i].y
	
	ss=(i+num/shape)%num+1
	c=7
	if ss==2 then c=1 end
	p1=pp[flr(ss)]
	p2=pp[ceil(ss)%num+1]
	
	line(x,y+10,p1.x,p1.y+20,1)
	line(x,y+10,p2.x,p2.y+20,1)
end

--llc(20,1,1,1)

for i=1,num do
	x,y=pp[i].x,pp[i].y
	
	ss=(i+num/shape)%num+1
	c=7
	if ss==2 then c=10 end
	p1=pp[flr(ss)]
	p2=pp[ceil(ss)%num+1]
	
	line(x,y,p1.x,p1.y,13)
	line(x,y,p2.x,p2.y,13)
end

llc(-20,12,14,7)

circ(63,-10 + 10*sin(⧗/2+.02)+30,5,8)
circ(63,-10 + 10*sin(⧗/2)+30,5,8)

flip()goto ⌂
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000080000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000008888800000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000088888800000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000088888880000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000880000088000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000008800000008800000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000008000000000800000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000008000000000800000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000008000000000800000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000008800000008800000000000000ccc000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000088000000088000000000000ccccccc0000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000088888008800000000000ccccc0cccc000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000088888880000000000cccc0c0c0cccc00000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000088888000000000cccc0c00c0000ccc0000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000ccccc0c000000c00ee0000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000ccccc00000000000eeeee000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000cccc0cc000000000eeeeeeeee0000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000cccccccc000000000eeeeeeee0eee000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000ccccc00c00c0000c0eeee0ee000e0eee00000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000cccccc00000000000eeee00ee0000e00e770000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000cccc000c000000000eeee0ee00000000077777000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000cccc0000000000000eeee00e00e0000007777007700000000000000000000000000000
00000000000000000000000000000000000000000000000000000000ccccc00000000000eeeeee0e000000000777777707770000000000000000000000000000
000000000000000000000000000000000000000000000000000000cccc000000000000eeeeee0ee0000000077777770070077000000000000000000000000000
000000000000000000000000000000000000000000000000000ccccc000000000000eeee0e0ee00000e007777777070000077700000000000000000000000000
0000000000000000000000000000000000000000000000000ccccc000000000000eeeeee00000000000777707777000000007770000000000000000000000000
00000000000000000000000000000000000000000000000ccccc000000000000eeee00ee0000000077777777000000000007777e000000000000000000000000
000000000000000000000000000000000000000000000cccc0000000000000eeeee0e0ee0000007777770000000000000777770ee00000000000000000000000
000000000000000000000000000000000000000000ccccc0000000000000eeeee0e0000000007777700070000700000777770777ee0000000000000000000000
00000000000000000000000000000000000cc0000cccc00000t0000000eeeee000000000007777tttttttt0000007777700770700ee000000000000000000000
00000000000000000000000000000000000000ccccc00t0t0tt0000eeeeetttttttttttt777777000ttttt0t00777770000000000eee00000000000000000000
000000000000000000000000000000000c000cccc00tttttttttteeeeet000t0000t00777777000ttt0tt0t00777777070000007eeeec0000000000000000000
00000000000000000000000000000c00cctcccctttt0t00000eeeee0000000000007777777000ttttt00tt7777777700000000eeee0eccc00000000000000000
0000000000000000000c000000c0c000cccccttt00t000000eeeee000000000007777700070tt0t0000777777t0000000000eeeeeee0eccc0000000000000000
0000000000000000000000000c00ccccccctt000ttttt00eeee0000000t00007777777000tt0000t007777t007t0070000eeeeeee00e0c0cc000000000000000
0000000000000000c00000000cccccccc0ttt0t0000tteeeet00000t000007777770000tt000t00077777tt0t00t0000eeeeeee000e0e00ccc00000000000000
000000000000000000000000c0cccc0t000tt00e0eeeeeettt0000t00007777070000ttt00t0077777000ttt0000t0eeee0e0000000e00cccc00000000000000
00000000000000000c0c0ccccccc000tet0tt00e0eeee00000ttt0tt0777770000ttttt00077777700700t0tt0t0eeeeeee000e00e00cccc0c00000000000000
0000000000000000000c0ccccc0000tt00etteeeeee0000000000tt777770000tttt000t0777770007000ttt0eeeeetee0000000e0cccccc0000000000000000
00000000000000000c00cccc00000tt000eteeeee0001000000777777ttt0ttt00t0007777777700000011teeeee00et0000e000cccc0c0c0c00000000000000
00000000000000cc0ccccc00000e0t00e0eeeee000000000007777770000ttttt00077777070000000001eeeeee00e00tt0ee0cccccc00000000000000000000
000000000000000ccccc00000e00t0e0eeeet001100000007777770000tt000tttt7777000700000000eeeeee00000000t00ccccccc0c0c00000000000000000
00000000000000cccce0000e000t0eeeee11t1100110007777000000ttt0000777777tt0000000000eeeeett0000000000cccccccc00ccc00000000000000000
00000000000000ccc0000e000eeteeee0700t1111111777771100tttt0100707777000tttt00000eeeee01t11t01001ccccct0c000c000000000000000000000
000000000000000ccc0e0000e0eeee000000t011077777111111tt1100007777700000000tttteeeee0001t011000cccccc00t0c000000000000000000000000
0000000000000000ccce00eeeeee00000000tt77777700000ttt11111177777001000000000eeeett000011t010cccc0cc00c0t0c00000000000000000000000
000000000000000000cc0eeeee0000700077t7777701110tt00000077777711111110000eeeeee0ttttt011t0cccccc00c0000tt000c00000000000000000000
0000000000000000000ceeeet0000000007777700000ttt10010077777000000000111eeeee0100000tttttcccc0cc0000000000t00000000000000000000000
00000000000000000000eeet0000007007777ttt000tt0001170777701000000000eeeee0111111111000cccctt1110000000000tt0000000000000000000000
000000000000000000000eet7070077777770t0tttt000007777771001000000eeeeee0000000010011cccctttttttt0000000000tt000000000000000000000
000000000000000000t000ee00770777700t0tttt0000777777711111000000eeeee0000000000001cccc11tt00tt1tttt10000000tt00000000000000000000
000000000000000000000t0ee077777000t0ttt00770777777000001101e00eeee000000000001cccccc0011t000001tt0ttt0000000tt000000000000000000
000000000000000000000t00e77770000t1tttt077777777000000000111eeee000000000011cccccc000011tt0000110t00ttttt000ttt00000000000000000
0000000000000000000tt00t0770t0ttttt00t0777777000e000000eeeeeee100000000111cccc0000100110t0000001100t0000tttt00tt0000000000000000
0000000000000000000t000000770tttt01077t777700000000eeeeeeeee001100001110cccc001000000011t00000t01010tt000t0tttttt000000000000000
000000000000000000tt0000tt077t01170107777000000000000eeeee000000111100ccccc0010000000010t000000001000000tt00tt0ttt00000000000000
0000000000000000ttt000tt0ttt77100777777000e0000eee0eeeee000001111011cccc0100000000000010t0000000001000000000ttttt000000000000000
0000000000000000tt00000ttt000770777770t0000e0000eeeee0000011110000cccc110000000000000010tt000000001100000000tt0tt000000000000000
00000000000000000tt0tttt00101177777111t00e0e0eeeeee00000111000c0cccc00001110000000000001tt0000000001000000ttt0ttt000000000000000
00000000000000ttt0t0tt00000100077e0110t000ee0eeee0000111000c0ccccc00000001110000000000010t00000000001000ttttt0tt0000000000000000
000000000000000t0ttt00000010000eeee010tte0eeeee11111100c000ccccc0000000000001110000000011t000000000001ttt00t0tt0t000000000000000
00000000000000ttttt00000110000000eee1e0teeeee011100c0c00cccccc000000000000000011100000011t0001000000tt1t00000tt0t000000000000000
00000000000000tt0tt0tt011000t000000eeeeeeee11100c000000cccc000000000000000000000111100010t00000000tt0t110000t00t0000000000000000
000000000000000tttttttt1t0t0t0010100eeeee1100000c0000cccc00000000000000000000000000111011t00000ttttttt010000t0000000000000000000
0000000000000000tt00ttttttt00t0110011eet0000000000ccccc00000000000000000000000000000011110t00tt00t000000100tt0000000000000000000
00000000000000100tt0010ttttttt00011111ccc00cc000ccccc0000000000000000000000000000000000111ttttt00t0t000001ttt0000100000000000000
000000000000000010tt1000110ttt011100010ccc00ccccccc00000000000000000000000000000000000011tt110000000000001tt00011100000000000000
00000000000000001111t010011111tttt0t0100tccc0cccc00000000000000000000000000000000000000tt0t011110t0000000t1101111100000000000000
000000000000001010110tt1011100000tttt10tt0ccccc00000000000000000000000000000000000000ttt10t0111111000000t00111101100000000000000
0000000000000010011111t11000000000000tttttccci000000000000000000000000000000iiiiiiittt001tt0001110110000t01110111000000000000000
00000000000000011011110t0000000000000010ttttt0000i0000i00i0iiiiiiiiiiiiiiiiiii0iittt0i0i10tt00010110111t011111011100000000000000
000000000000001111100000t0000000000i001it00itttiiiiiiiiiiiiii000000000i0000000tttiiii0ii10tt0000100001t1111100111000000000000000
0000000000000011000000000t00000ii0iiii1itiii000tttt0000000000000000000000000tttii000000i10tt0000000001t1111100110000000000000000
00000000000000000000000000t0000iiii0001t0t000000000tttt0000000000000000000ttti0000000000i1tt000000011t10111111110000000000000000
000000000000000000000000000t000iii0ii0100t000000000000tttt0000000000000tttti000000000000t1it00000011t001000001111000000000000000
0000000000000000000000000000tt00iiii0010tt000000000000000tttt00000000ttti000000000000000010t00001100t000000010011100000000000000
000000000000000010000000000000tii000iit1tt000i000000000000000tttt000ttiiii000000000i000ii10tt001000t0000000111010000000000000000
00000000000000000000000000000t0tiii00001tt0000000i0000000000000tttttii00000000i00000000i010tt1101tt00000000100011000000000000000
000000000000000000100000010000iiti00i001tt000000000i0000000t000tttiitttii00000000000000ii1ttt1i00tt00000000100000100000000000000
00000000000000101011011000010ii0tt00iii1itt0000i000i00t00t000ttt0iii00ttttt000000000000i0111t00i0t000000001000000000000000000000
00000000000000010010010001000i000it00001iitii00i000000tt000ttt0ii0000000tt0ttt000000000i111tt0t0t0i00000011001000100000000000000
0000000000000011101100101100ii000i0t00t11tt0iiiiiiii0i000tt000i00i00i0t0tt0t00ttt0000001101tt00tti0i0000010010000000000000000000
000000000000001111011011111i01010ii0t0001tt000000iiii00tt000ii000000000000t0t000ttttt11ii01ttttt00ii0000110000000000000000000000
000000000000000111111111011i000000i00t0110t0t00000tttttiiiii0ii000000000000000000t011ttti11tttt0000ii000100000000000000000000000
0000000000000000011101101111111110i000tt10t00000tt0tt0000iiiiiii00000000000000000011t00ittttttt000000i01100000000000000000000000
0000000000000000000110111i0000111111010ttttt00t0ttt0000iii00000iiiiii000000000t011000ttttttttt00000000i1000000000000000000000000
0000000000000000000001111i00000000ii11111ttt000tt000tii00t000000t00ittttttttttttttttt00ti010i00000000001000000000000000000000000
000000000000000000000001i0000000001i000001tt1tt1101ttttttttttttttttt0tiiiiii11100000000ti011000000000110i00000000000000000000000
00000000000000000000000i11110000000i0000110ttttttttt1101000000000000000000011iiii0000000i0110000i0001110ii0000000000000000000000
0000000000000000000000ii00110100000iii1001000000ii00001111110100000000000110000iiiiii000i00100000000010000i000000000000000000000
0000000000000000i0000ii000001110000ii0010100000ii000000000001111111000011100000000iiiiiiii11i0i000001100000i00000000000000000000
000000000000000000i00i00000000111000i000111000i00000000000000100111111111000000000000000i0i1iii0000010000000ii000000000000000000
000000000000000000000i00000000001100i000011iii00000000000000000000010100111111100000000iii010iiiiii110000000iii00000000000000000
00000000000000000000i000000000000010ii00011i00000000000000010000010110101001001111110000ii01000iii11iiii00000iii0000000000000000
0000000000000000i0ii00000000000000011ii1ii100000000000000000000011100000000000000010111111110i0000010ii0iiii00iii000000000000000
00000000000000000i0i0000000000000000i11ii01000000000000000000010100000000000101000001001ii11110001100i0ii0iiiii00i00000000000000
0000000000000000iii00000000000000000iii110110000000000000001101100000000000000000000000011111001i11000i0000i0ii0ii00000000000000
00000000000000i0ii000000000000000iiiiii1111100000000000000000100000000000000000000011111ii0010001100000i00iiiii0i000000000000000
00000000000000000i00000000000000i0ii0ii0001100000010000000111000000000000000000111110000i00010100100000000000i0ii000000000000000
00000000000000iii0000000000i000i0i000ii0000000000000100111100000000000000000111101000000ii01110010i00000000i0iii0i00000000000000
00000000000i0iii0000000000000i0ii00000i0000010000000000110000000000001011111000000000000i001111110000000000000ii0000000000000000
000000000000iiii0000i000i000iii0000000ii0000000110001011000000011000111100000000000000000i0010110000000000000i000000000000000000
00000000000iiiiiii0i0000ii0iii00000000ii0100010010101100000000011111000000000000000000000i010111000000000000i0000i0ii00000000000
0000000000000iii0i0i00i000ii0000000000ii0001001010010011011111111000000000000000000000000i000110000000000000i0iiiii0i00000000000
0000000000000000iiiii00i0i0000000000000i0001001111100010011110000000000000000000000000000i00111000000000000i0iii00iii00000000000
00000000000000000iiiiiiii00i00000000001i110010111100111110000000000000000000000000000000ii0101000000000000iii00iiii0i00000000000
000000000000000000iiiiii0iii00000000000i1011101111111000000000000000000000000000000000000i0100000000000iiiiiii0i00iii00000000000
000000000000000000iiii00iiiiii000000000i011111111000000000000000000000000000000000000000ii0000000000iii00ii00i000000000000000000
00000000000000000iii0ii0000iiiii000i000ii01110000000000000000000000000000000000001000100ii0000000iii0i0iiiii0000i000000000000000
00000000000000000i0000i0000000iiiii00000i000000000000000000000000000000000000000000000000i00000ii0i00iiii000i0000000000000000000
00000000000000000000000ii00000000iiii0i0i00000000000000000000000000000000000000000000000ii00iiii0000000i000000000000000000000000
000000000000000000000000ii0000000000ii0iii0000000000000000000000000000000000000000000000iiiiii00000000i0000000000000000000000000
0000000000000000000000000i000000000000iiiii0000000000000000000000000000000000000000000iiii0i0000i000i0ii000000000000000000000000
00000000000000000000000000ii0000000000000iiii00000000000000000000000000000000000000iiii00ii0000000000i00000000000000000000000000
000000000000000000000000000i0000000000000i00iii000000000000000000000000000000000iii000i0ii000000000ii000000000000000000000000000
0000000000000000000000000000ii00000000000i00000iiii00000000000000000000000000iii0i0000000i00000000iii000000000000000000000000000
00000000000000000000000000000ii0000000i0ii00000000iiii00000000000000000000iiiii000000000ii000000000i0000000000000000000000000000
0000000000000000000000000000000i00000000i0i0000000000iii000000000000000iiii0000000000000iii000000ii00000000000000000000000000000
0000000000000000000000000000000ii000000000i00000000000iiiii000000000iiii000000000000000ii0i000000ii00000000000000000000000000000
00000000000000000000000000000000ii00000000i000000000000000iiii000iii00000000000000000000iii00000ii000000000000000000000000000000
0000000000000000000000000000000i00i0000000i000000000000i00000iiii0000000000000000000000i0ii00000i0000000000000000000000000000000
0000000000000000000000000000000000ii000000ii0000000000000i0iiii0iii0000000000000000000i0iii0000ii0000000000000000000000000000000
000000000000000000000000000000000000i000000i000i00ii00i0iiii0000000iii000000000000000000i0i000ii00000000000000000000000000000000

