pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
local t=0

function sqrdist(x1,y1,x2,y2)
	return (y2-y1)*(y2-y1) + (x2-x1)*(x2-x1)
end
function pxset(x,y,c)
	circ(x,y,1,c)
end

pal(1,12+128,1)
pal(2,1,1)

fillp(0b1010010110100101)
cls(1)

fill1 = 0b1010010110100101
fill2 = 0b0101101001011010.1

::♥::
t+=1/30

if rnd(1)<0.01 then
	fillp(rnd(1)<0.5 and 0b1010010110100101.1 or 0b0101101001011010.1)
	local x,y = rnd(32)+16,rnd(32)+16
	rectfill(x,y,128-x,128-y,2)
	fillp()
end

if rnd(1)<0.01 then
	local x,y = rnd(128),rnd(128)
	rectfill(x,y,128-x,128-y,0)
end

for i=1,10 do
	local x,y=rnd(128),rnd(128)

	local c = 0x1

	if pget(x,y)==0 then

		fillp(rnd(1)<0.5 and fill1 or fill2)
		circfill(x,y,rnd(2)-1+5,c)
	
		fillp()
	end
end

for i=1,50 do
	local x,y=rnd(128),rnd(128)

	if pget(x,y)~=1 then
		local r = rnd(1)
		if r<0.25 then
			pxset(x+1,y+1,0x1)
		elseif r<0.5 then
			pxset(x-1,y-2,0x2)
		elseif r<0.15 then
			pxset(x+1,y-1,0x1)
		else
			pxset(x-1,y+1,0x1)
		end
	end
end

for i=1,3000 do
	local x,y=rnd(128),rnd(128)

	if pget(x,y)~=0
			and (pget(x-1,y)~=0
			or pget(x+1,y)~=0
			or pget(x,y-1)~=0
			or pget(x,y+1)~=0
			or pget(x-1,y-1)~=0
			or pget(x-1,y+1)~=0
			or pget(x+1,y-1)~=0
			or pget(x+1,y-1)~=0) then
		pxset(x,y,0)
	end
end

flip() goto ♥
__label__
0s0s0s0s0s0s0s0s00s00s0s0s0s0s0s0s0s0s00s0s0100s0s0s0s0s0s0s00100s0s00s0s0s0s0s0s0s00s010100s00s00010s0s0s0s00010s00s0001000s0s0
s0s0s0s0s0s0s0s00s0000s0s0s0s0s0s0s0s0s00s0s0000s0s0s0s0s0s0s000s0s0s00s0s0s0s0s0s0s00s010s00s000000s0s0s0s0s01010s000s0000s0s0s
0s0s0s0s0s0s0s00s001000s0s0s0s0s0s0s0s00s00000s01s0s0s0s0s0s0s0s0s0s00s000s0s000s0s0s00s0s0s00s0000s0s0s0s0s0s010s00s00100s0s0s0
s0s0s0s0s0s0s00s0s000s00s0s0s0s0s0s0s0s000s00s0101s0s0s0s0s000s000s00s00s0000s0s00000s0000s00s0s0s00s0s0s0s0s0s000s00s00100s0s0s
0s0s0s0s0s0s0s00s0s0s0s00s0s0s0s0s0s0s00s00s00s010000s0s0s00s000s000s0s00s0s00s0000s0000s000s0s0s0s00s0s0s0s0s000s0s000s00s0s0s0
00s0s0s0s0s0s0s00s0s0s0s00s0s0s0s0s0s00100s0s00s000s00s0s00s0s0s00100s0s0000s0000100s00s0s0s0s0s0s00s0s0s0s0s0s000s000s00s0s0s0s
000s0s0s0s0s0s00s0s0s0s0000s0s0s00000s000s0s0s000s00s00s00s0s0s0s000s0s0s0s00s0s000s0s00s00010s0s00s0s0s0s0s0s00s00s0s00s0s0s0s0
s0s0s0s001s0s00s0s0s0s00s0s0s0s00s0s000100s0s00s000s00s0s0000s0s0s0s0s0s0s0s00s0s0s0s00s00s0000s0s00s0s0s0s0s0s000s0s00s0s0s000s
0s0s0s00100s0s00s0s0s0s00s0s0s0s00s0s0000s0s00s0s0000s0s0s0100s0s0s0s0s0s0s00s000s0s0s000s0s0s00000s0s0s0s00s000s00s0s00s0s000s0
s0s0s0s000s0s0s00s0s0s00s000s000100s0s00s0s00s0s00s0s0s0s0s00s000s0s0s0s0s00s00s0000s00s0000s00s00s0s0s0s00s0s0000s0s0s00s00s00s
0s0s0s0s0s0s0s0000s0s00s001000s00100s0s00s00s0s00s0s00s00s00s00s00s0s0s0s0s000s00s0s0100s00s0s00s00s0s0s0s00000s0s0s0s0s000s0s00
s0s0s00000s0s00s000s00s0s1010s0s000s0s00s0s00s0s00s0s00s00000s00s00s0s0s0s0s0s00s0s0s0000s00s0s00s00s0s0s000s0s0s0s000s0s0s0s0s0
0s0s00s0s00s00s0s0100s0s0s1s00s0s0s000s00s00s0s0s00000s00s0s000s0s0000s0s0s0s00s0s0s0s01000s0s00s0s00s0s0s000s0s0s00s00s0s0s0s0s
s0s0s00s0s000s0s0s0s0000000000000s00s00s00s00s0s0s0s0s00s0s0s0s0s0s0s00s0s0s00s0s0s0s0s01000s0s0000100s0000s00s0s0100s00s0s00000
0s0s0s00s0s0s0s0s0s0s0s0s0s00s0s000s00s00s0s00s0s0s0s00s0s0s0s0s000s0010s0s0s00s0s0s0s0000s00s010s000s00s0s00s0s0101000s0s00s00s
s0s0s00s0s0s0s0s0s0s0s0s0s00s0s0s0s0s000s0s0s00s0s0s00s0s0s0s0s0s0s001010s0s0s00s0s0s0s0s000s01010s0s00s0s0s00s0s0100010s0s000s0
0s0s00s0s0s0s0s0s0s0s0s0s0s00s0s0s0s0s0s0s0s0s0000000s0s0s0s0s0s0s0s0000s0s0s0ss0s0s0s0000s000010s0s00s0s0s00s0s0s00s000000s0s0s
s0s0s00s0s0s0s0s0s0s0s0s0s00s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s0s0s0000s0s00s0s00s00000000s0s0s0s00s0s00s0s0s0100s0s0
0s0s0s00s0s0s0s0s0s0s0s0s00s0s0s0s0s0s0s0s0s0s0s0s0s0s000s0s0s0s0s0s010s0000s0s0s00s0s00000s00s0101000s0s0s00s0s00s0s000100s0s0s
10s0s0s00s0s000s0s0s0s0s00s0000000s0s0s0s0s0s0s0s0s0s00s00s0s0s0s0s010s0s0s0000s0s00s0s0s0s00s0s0100s00s0s0s00s0s00s00s001s0s0s0
000s000s00000s000000s0s0s000s0s0ss0s0s0s0s0s0s0s0s0s0s00s00s000s0s000s0s0s0s0s00s00s0s0s0s0s00s0s00s00s0000s0s0s0s000s01000s0s0s
00s00100s0s0s010100s0s0s0s0s0s0s0ss0s0s0s0s0s0s0s0s0s0010s00s0s000s0s0s0s0s0s0s100s0s0s0s000s00s0s00s000s0s0s0s0s0s000s0s000s0s0
0s0s00100s0s010s00s000s0s0s0s0s0s0s00s0s000s0s0s0s0s0s0s100s0s00s00s000s0s0s0s1s0s0s0s0s0s0s00s0100s0s0s0s0s0s0s0ss00s0s0s00000s
00s00100s0s0s000s000s0000s0s0s0s0s00s0s00ss0s0s0s0s0s0s0s0s0s00s00s00s00s0s0s0s0s0s0s0s0s0s0s001010000s0s00s00s0ss0ss0s0s00s0s00
1000s0000s0s0s0s0s0s0s0s00s0s0s0s0s00s00s00s0s0s0s0s0s0s0s0s0s000s0s000s0s0s010s0000000s0s000100s000s00s00000s0s00s00s0s00s0s0s0
00s00s00s0s0s0s0s0s0s0s0s00s0s0s0s0s00s000s0s0s0s0s0s0s0s0s0s00s00s0s0s0s00000s0s00s0s00s000s0100s0000s0s0s0s0s0000000s00s0s0s0s
0s0s00s00s0s0s0s0s0s0s0s0s00s0s0s0s0s00s0s010s0s000s0s0s0s0s00s0s0000s0000s0s00s0s00s0s00s0s0s00s00s000s0s0s0s00s000s00100s0s0s0
s0s0s000s0s0s0s0s0s0s0s0s00s0s0s0s0s0s00s0100000s0s0s0s0s0s00s0s000s000s0s0s0s00s00s0s0s00s0s0s000s0s0s0s0s0s0100s0s00s0s0000s00
0s0s0s0s0s0s0s0s0s0s0s0s00s0s0s0s0s0s00s0000s010000s0s0s0s00s0s0s0s00s00s0s0s00s00s0s0s00s0s0s0s0s0s0s0s0s0s010100s00s0s0s00000s
s0s0s0s0s0s0s0s0s0s0s0s0s00s0s0s0s0s0s000s0s00010s00s0s0s00s0s010s0s00100s0s0s000s0s0s0s00s0s0s0s0s0s0s0s0s00s100s0s00s00000s0s0
0s0s0s0s0s0s0s0s0s000s0s0s00s0s0s0s0s0s0s0s0s000s0s00s00s0101010101001001010101000s0s0s00s0s0s0s0s0s0s0s0s00s0s0s0s0s000s0s00s0s
s0s0s010s0s0s0s0s00100s0s000000s0s0s0s000000000s0s0s0s0s000001010100s00101010100s0000s0000s0s0s0s0s0s0s0s0s00s0s0s0s0s0s0s00s000
0s0s0100000s0s0s0s00100100100100s0s0s001010101s0s000s0s001010010100s001010100001010100010101010100s1010s0s0s00s0s0s0s0s0s00s0s00
00s0s0010100s0s0s0s1s0s0010010100s0s0s001010101s10100000001001010100s0010100101010101010101010s00s0010s0s0s0s00s000s0s0s00s0000s
100s0s00000s0s0s0s0s0s01000s010100s000s00101s10101010100100100001010001010s00101010101010101010s00s00s0s0s0s0s000s00s0s0s00s0s00
0100s0s0s010s0s0s0s0s0s010s0s01010001000101s1s101010001000s01010010101000s0s001000001010101010s0s00010s0s0s0s0s0s0s00s0s0s00s0s0
100s000s0s0s0s0s0s0s0s01010s0s0001010100000ss1010100s000010001001010100s0ss0s00010s001010101010s0s010s0s0s0s00000s00s0s0s0s00s0s
00s00s00s0s0s0s0s0s0s0s0s0s0s00s0010100s0s00s010000s010100000001010100s0s0s00s010s0s001010101010s010s0s0s0s0s00s000s01000s00s0s0
0100s00s010s0s0s0s0s0s0s0s0s00s00s010100s00s0100s0101010100100001010010s0s00s01010s001010101010101010s010s000s00s0s0000s000s0000
10100s001010s0s0s0s0s0s000s0s000s010100s0s00000s0s010101011010100s010000s00101010000101010101010101010101000s0s000000s000s000s0s
0000s0s0010s0s0s0s0s0s00s00s0s01010100s0s0s0s000s010101010110000s0001010001010101101010101010101010101010s0s0s0s0s00s0s0s0s0s0s0
0s000s00s0s0s0s0s0s0s0s000s0s0100010100s0s0s001001010101010100100010010101010101001010101010101010s0101010s0s0s0s00s0s0s0s0s0s0s
s000s00s00000s0s0s00ss0s0s0s0s00s00100s0s0s0010010101010101010010100101010101010100101010101010s0s0s010100000s0s0s00s0s0s0s0s0s0
000s0s000s0s00s0ss0s00s0s0s0s0ss00100s0s0s0s0010000s010100000010s010010101010101001010100010s0s0s0001010100100s0s0s00s0s0s0s0s0s
00s1s0s0s0s00s0ss0s00s0sss0s0s0s01010000000001010100s010010s0s0s0s00s0s01010101010010100s00s0s0s001001010s000s0s0s0000s0s0s0s0s0
s01s10000s0s000s0s0s00sss0s0s0s01010101010101010000s01010010s010000s0s0s0101010s001000s00010s0101000101010s0s0s0s0s0s00s0s0s000s
0s010s0s00s0s0s0s0s0s00s0s0s01010101010101010100101000101000000010s0s0s0s01010s0s000s00s00000101011101010s0s0s0s0s0s0ss0s0s0s000
s00100s00s0s0s0s0s0000s0s0s01010101010001010100101001001010101010s0s0s0s0s01010s00s000s00s0s00101010s010s0s0s0s0s0s0s0s00s0s00s0
0s001000s000s0s0000s0s01000s0101010000s001010100100101001000101010s000s0s010100s0s0s010100s00101010s0s010s010s0s0s0s0s0s00s0s00s
s0s000s00s000s00s0s0s0s010s0s010100s0s001010101000100001001001000s00s0s0ss0100s0s0s0s010100010101010s010101000s0s0s0s0s00s0s00s0
0s0s0s0s000s000s0s0s0s01000s0000010000010101010100001010s001000s00s00s0s0010100s0s0s0s0101010101010101010100s00s0s0s0s00s0s00s0s
s0s0s0s0s0s0s0s0s0s0s0s00s00000s000s000s1010100001s1010s00s0s0s0s00s0ss0s00100s0s0s0s010101010s0s0s01010100s00s0s0s0s0s00s00s0s0
0s0s0s0s0s0s0s0s0s0s0s00s00s0s00s0s0s0s0s00000s010101010s00s0s0s0s00ss0s0s00100s0s0s0s0101010s0s0s0s010100s00s0s0s0s0s0s00s00s0s
s0s0s0s0s0s0s0s0s0s0s00100s0s0s00s0s00000s0s000101s1000000s0s0s0s0s0s0s0s00100s0s0s0s0s01010s0s0s0s0s010100000s0s0s0s0s0s000s0s0
0s0s0s0s0s0s0s0s0s0s00000s0s0s0s00s0s0010s00001010100s0s0s0s0s0s0s0s0s0s0100100s01000s0s010s0s0s0s0s0s010s0s000s0s0s0s0s00s00s0s
s010s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s0s00s0s0ss01000100s0s0s0s0s0s0s0s0s000010010100s00s01010s0s0s0sss00010s0s0s0s0s0s0s0s000s0s0
010s0s0s0s0s000s0s0s0s0s0s0s0s0s0s00s0s00s0ssss00s000s0s0s0s0s0s0s0s0s00s000010100s00001010s0s0s0s00s0s00s0s0s0s0s0s0s0s0s0s0s0s
s0s0s0s0s0s00100s0s0s0s0s0s0s0s0s00s0000s0s0s0s000s000s0s0s0s0s0s0s0s0s000101000100001001010s0s0s00s0s0010s0s0s0s0s0s0s0s0s0s0s0
0s0s0s0s0s0s000s0s0s0s0s0s0s0s0s00s00s0s0s0s0s001000100s0s0s0s000s0s0s0s0100001001010001010s0s0s0ss0s1010s0s000s0s0s0s0s0s0s0s0s
000000s0s0s0s0s0s0s0s0s0s0s0s0s0s00010s0s0s0s0s001010100s0s0s00100s000s010010001001010101010s0s0s0ss0s1010s0s0s0s0s0s000s0s0s0s0
0100s00s0s0s0s0s000s0s000s0s0s0s00010s0s0s0s0s001010100s0s010s000s0s001001000s0010010101010s0s0s0s00s0s00s0s000s0s0000100s0s0s0s
100s0s0000s0s0s00s0000s000s0s0s0ss0010s0s0s0s0s001010010s010100100s0s00100001001001010101010s0s0s00s0s0s00s0s000s00s0s0100s0s0s0
00s0s000s00s0s0s00s0s001000s0s0s0ss0010s0s0s0s0100100s0000010010000s001010100100010s0101010101010000s0s00s0s0s0s0ss0s0s00s0s0s0s
0s0s0s0s0s00s0s0s10s00s0101010s0s0001010s0s0s0101001000101000100s0s001010001001000s0s0101010101010s00s00s000s0s0s00s0s00s000s0s0
s0s0s000s00s0s0s00100s010101010s0s0101010s0s0101001010101000100s0s0s001001000100100s0101010101010s0s000000s00s0000s0s0s000s00s0s
000000s00000s0s0s000s0s010101010s010101010101010ss01010000s000s0s0s0s001001010010010101000101010s0s0s0ss0s00s00s0s0s0s0s0s00s0s0
0s0s0s0s0s000s0s000s0s0101010101010100000101010ss01010s10s0s0s0s0s0s0s001001010010010100s000010s0s0s0s0s000s0010s0s0000000s00s0s
10s000s000s000s0s0s0s0s01010101010100s0s0010101001010s1s10s0s0s0s0s0s0s0010010100s00100s0s0s0010s0s0s0s0s0s0s0000s00s0s0s0s0s0s0
0000s000s000s00s0s0s0s0101010101010100s001010101001010s1s0000s0s0s0s0s001010010100010100s0s0s00s0s0s0s000s0s0s0s00000s0s0s000s00
010s0s0s0s0s0s00s0s0s0s01010101010100s00101010100101001s0s00s0s0s0s0s001010100100s0010000s0s0010s0s0s00s0000s0s0s010s0s0s0s0000s
10s0s0s0s0s0s0s00s0s0s01010101010100s0s00101010100101000s0100s0s0s0s0s001010010010s000s0s0s001010s0s0s000s0s000s010s0s0s0s0s00s0
000s000s0s0s0s0s00s0s0s010s01010000s0s001000100001010100010s00s0s0s0s00101010001000s0s0s0s00101010s0s0s010s0s0s0s010s0s0s0s0000s
00s0s0s0s0s0s0s00s0s0s010s0s0100100000s0000000s010101s0s0010s00s0s0s000010100s00100000000001010s010101010s000s0s0s010s0s0s000s00
s00s0s0s0s0s0s00s000s000s0s0101000101000s0s00s01010100s0s00000s0s0s010s0010100010010101000101ss0s0101010s00s00s0s0s0s0s0s0s0s00s
00s0s0s0s0s0s0s00s0s00s00s010100s001010s0s0s000010101s0s0010010000010s00101010s0100101001001010s010s010s0s000s0s010s000s0s0s0s00
0s0s0s0s0s0s0000s0s00s001010100s0s0010s0s0s0s0s001010010010010010s0010s001010s0000s010010100101010s0s0s0s0s0s0s0s0000s000010s0s0
s0s0s0s0s0s00s0s0s0s00010101000000010s0s0s0s0s00101010010010001000010000101010010s0s001000010100010s0s0s0s0s0s0000s0s0s0s0000s0s
0s0s0s000s00s0s0s0s0s0s0101001001010s0s0s0s0s001010100s010010000101001010101010010s010001010100s000010s000s0s00s0s0s0s0s0s0s00s0
s0s0s0s0s0ss0s0s0s0s0s010101001001010s0s0s0s0s0010100s0s01000s0100001010101010100101010101010100s0s00000100s00s0s0s0s000s0000s0s
0000000s100s00s0s0s0s0s0101010001010s0s0s0s0s0s0010100000010s0s00101010101010000101010101010100s000s0s0s0s0000000s0000s000s0s0s0
0s0s0s010100s0000s0s000s010101010s010s0s0s0s0s0010100010100s000010101010s0100101010101010s0101000100s0s0s0s0s000s00s0s0s0s000s0s
s0s0s0s0100s0s0s00s00s0000101010s0s010s0s0s0s0010100100100s0s0010100010s0s01001s00101010s0s0101010100s0s0s0s0s0s00s0s0s0s00s00s0
0s0s0s00s0s0s0s0s00s0000s00101010s01010s0s0s010010100010010s0010100s0000s0100100s00101010s01010100s0s0s0s0s0s0s00s0s0s0s0s00s00s
s0s0s00s0s0s0s0s0s00s0s00010101010101010s0s010100100s101001001010010s0s00101000s00101ss0101010100s0s0s0s0s0s0000s0s0s0s0s0s000s0
0s0s00s0s0s0s0s0s0100001010101010101010101010101000s0s1001001010s1010s001000101010010s0s0101010100s0s0s0s0s00s0s0s0s0s0s0s0s010s
00s0s00s0s0s0s0s0s000s001010101010101010001010100010s1010001010s0s101001001001010s0000s000101010100s0s010ss0s0s0s0s0s0s0s0001010
s00s00s0s0s0s0s0s00s00010101010101010100s0010100000s001010101010s00100100101001000s0s000010101010100s010100s0s0s0s0s0s0000s0010s
0s00s00s0s0s0s0s0s00s0s0101010101010000s0010s010s0s0s001000101010010010100101000100s00100010000s00s00s0100s0s0s0s0s0s00s0s0s0000
s0s00s00s0s0s0s0s0010s01010101000100s000010s00010s0s0s00010010100100s0100101010100s00s00s000s0s0ss0s00s0000s0s0s010s00s0s0s0000s
0s00s0s000000s0s00100000101010010010001000100s00s0s0s0s0000101010010010100s010100000s0s000100s0000s0100010s0s0s0s0100s0s0s00s0s0
s00s0s0s0s0s00s000000s0101010s000101010s0s01000s0s0s0s0s0s001010100100s0100s010010010s0101010001000101010s0s0s0s0s00000000s00s0s
00s0s0s0s000s00s00s0s0s01010s0s0s01010s0s0s00s00s0s0s0s0s001010000100s0s00s01001001010001000101010s01010s0s0s0s0s0s000s0s00s00s0
s0000s0s001000s00s0s0s01010s0s0s0s010s0s0s0s00s00s0s0s0s0s001s010101000000010100000100s000s001010s0s010s0s0s0s0s0s0s0s0s0s00s00s
0s00s0s0s000s000s00000s010s0s0s0s0s0s0s0s0s0ss0ss0s0s0s0s010s0s01010101010001010s0100s0s0000101010s01010s0s0s0s0s0s0s0s0s0s000s0
s0s00s0s0s0s0s0s0000s0010s0s0s0s0s0s0s0s0s0s00s0000s000s01010s01010101010010000s0s0100s00s0101010101010s0s0s0s0s0s0s0s0s0s00s00s
0s0000s0s0s0s0s000s000s000s0s0s0s0s0s0s0s0s00s0010s0s010101010101000s01001010100s0101000s01010101010s0s0s0s0s0s0s0s0s0s0s0s000s0
s00s0s0s0s0s0s000s0s0s00s00s0s0s0s0s000s0s0s00s0000s000s0s0s0s0s0010000010101010000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s00s
00s0s0s0s0s0s0s0s0s0s0s000s0s0s0s0s00s00s0s00s01010000s0s0s0s0s0s0000s0001010000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s000s0s0s0s0s000s0
000s0s0s0s0s0s0s0s0s0s0s000s0s0s0s00s0s00s0s0000s0s00s0s0s0s0s0s0s01s00s00000s0s0s0s010s0s0s0s0s0s0s0s0s0s0s0s00s00s0s0s0s0s0s0s
0s0010s0s0s0s0s0s0s0s0s0s000s0s0s0100s00s0s000s00s0s00s0s0s0s0s0s0101ss0s0s0s000s0s01010s0s0s0s0s000s0s0s0s0s00s0s00s0s0s000s0s0
00s00s0s0s0s0s1s0s0s0s0s01010s0s0100s0s00100s00010s0s00s0s0s0s0s0s010s0s0s0s00s00s0s010s000s0s0s000s0s0s0s0s0ss000100s0s000s0s0s
s00010s0s0s0s101s0s0s0s0s0100s00000s0s0010100s010s0s0100s0s0s0s0s0s000s010s00s0s00s000000100s0000s00s0s0s0s0s000010100s0s0s0s0s0
0s000s0s0s0s00100s0s0s0s0000s0s0s0s0s000000s000000s0s00s0s0s0s0s0s001001010s00s00s0s0010000s00s0s0ss0s0s0s0s0s00s0000s0s0s0s0s0s
s0s000s0s0s0s000s0s0s0s0s00s0s0s0s0s00s00s00s0s0s00s00s0s0s0s0s0s0s0010010100s00s0s0s000s0s0s00s0s0ss0s0s0s0000000s0s0s000s0s0s0
0s00s00s0s0s0s0s0s0s0s0000s0s0s000s0s00s00s00s0s00s00s0s0s0s0s0s0s0s000s0100s0s00s0s000s0s0s0s00s0s00s0s0s00s00s0s0s0s00100s0s0s
000s0s00s0s0s0s0s0s0s00s0s0s0s00s00s0s00s000s0s0000s00s0s0s0s0s0s0s0s0s0000s0s0s000000s0s0s0s0s0000s00s0s0ss0ss0s0s0000100s0s0s0
s000000s0s0s000s0s000s0000s0s0s000s0s0s000000s0s0s00s00s0s0s0s0s0s0s0s0s0s00s0s001010s0s0s0s0s0s0s00s000s0s0s00s0s000010100s0s0s
00s0s0s000000s00s0s0s0s0s0000s0s0s000s0s0s0s00s0s0s000s0s0s0s0s0s0s0s0s0s0s00s001010s0s0s0s0s0s0s00000000s0000s00000s00s00s0s0s0
0s0s0s000s0000s0000s0s0s0s0s0000s00s00s0s0s00s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s000101000s0s0s0s0s0s00000s0s000s0s0s00s000s0s00s0s0s
s0s000s0s0s0s00s0s0000s0s0s0s0s00s000s0s0s0s0000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0001s0ss0s0s0s0s0s000s0s0s0s0s0s0s0s00s0s0s0000s0s0
0s00s00s0s0s00s0s0s010010s0s000s0000s0s0s0s0000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0000s0s00s0s0s0s0s0s0s0s0s0s000s0s0s0s00s0s000000s0s
10s000s0s0s0s000000000s010100100s0s00s0s0s00s000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s0s0s00s0s0s0s0s0s0s0s0s00s00s0s0s00s0s0s0s000000
0000ss0s0s0s0s0s0s0s0s0s0101000s0s0s00s0s0000s0s0s0s0s0s0s1s0s0s0s0s0s0s0s0s000000s0s00s0s0s0s0s0s010s0s000s0s0s0s0000s0s0s0s0s0
00s000s0s0s0s0s0s0s0s0s0s010s0s0s0s0s00s00s0s0s0s0s0s0s0s1s0s0s0s0s0s0s0s0s0s0s0s00s0000s0s0s0s00s0010s0s0s0s0s0s0s0000s0s0s0s00
1000s00s0s0s0s0s0s0s0s0s0s0s000s0s0s00s00s0s0s000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s000s0s00s0s0s00s0s0s0s0s0s0s0000s0s0s0s00s
0s000ss0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s00s0s0s1s0s0s0s0s0s000s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s0s0s00s0s0s0s0s0s0s0s00s0s0s0s0s00
s0s0s0s00s000s0s0s0s0s0s0s0sss0s0s0s0s000s0s0s0s0s0s0s0s0s00s00s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00s0s0000s0s0s0s0s0s0s0s0ss0s0s0s00s
0s0s0000s0s0s0s0s0s000s0s0s0sss0s0s0s0s0s0s0s0s0s0s0s0s0s0100s0000s0s0s0s0s0s0s0s0s0s0s0s0s0s00s000s00s0s0s0s0s0s0s0s00s000s0000
s0s0s0s00s0s0s0s0s0s0s000s00ssss0s0s0s0s0s0s0s0s000s0s0s0000s0s0s00s0s0s0s0s0s0s0s0s0s0s0s0s0s000s00s00s0s0s000s0s0s0s000s0000s0
0s0s0s0s0s00s0s0s0s0s00s0s0s0s0ss0s0s0s0s0s0s0s0s000s0s0000s0s0s0ss0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s000s0s0s000s0s000s0s0s000s00s
s0s0s0s0s00s0s0s0s0s0s00ss00s0s00s0s0s0s0s0s1s0s00s00000s0s0s0ss0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s000s0s0s000s0s00s00000
0s0s0s0s00s0s0s0s0s0s0sss0s0ss00s0s0s0s0s0s1s1s000000s0s0s0s0s00s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s0s00000s0s0s000s0s0s0000s0s
s0s0s0s00s0s0s000s0s0s0s0s0s0ss00s0s0s0s0s0s1s000s00s000s0s0s0s000ss0s0s0s0s0s0s0s0s0s0s0s0s000s0s0s0s0s0s0s0s0000s00s00000s0000
0s0s0s00s0s0s0s000s0s0s0s0s0sss000s0s0s0s0s0s000s00s00s00s0s0s0s0s00s0s0s0s0s0s0s0s0s0s0s0s00s00s0s0s0s0s0s0000s0s00s00s0s00s000
s0s0s0s0000s0s0s0s0s0s0s0ss0ss00s00s0s0s0s0s0s0s0s00s000s0s0s0s0s00s0s0s0s0s0s0s0s0s0s0s0s00s00s0s0s0s0s101010s0s0ss00s0s0ss00s0
0s0s000s0s0ss0s0s0s0s0s0s00s000s00s0s0s0s0s0s0s0s00s0s0s0s000s0s00s0s0s0s0s0s0s0s0s0s0s0s00s0s00s0s0s0s001010s0s0s00s0000s00s000
00s00s00s0s00s0s0s0s0s0s00s0s0s0s00s0s0s0s0s0s0s0s00s0s0000s00000s0s0s0s0s0s0s0s0s0s0s0s00s0s00s0s0s0s0s000000s0s0s00s0s00s0000s
s000s00s0s0s00s0s0s0s0s00s0s0s0s00s0s0s0s0s00000s0s00s00s0s00s00s0s0s0s0s0s0s0s0s0s0s0s00s0s00s0s0s0s0s000s0s00s0s0s00s00s0s0s00
