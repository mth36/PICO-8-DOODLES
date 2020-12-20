pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end
function show_cpu(c1,c2) cp=flr(stat(1)*100) rectfill(0,0,12+4*#(tostr(cp)),6,c2) print("∧"..cp.."%",1,1,c1) end
function nsin(a) return (sin(a)+1)/2 end
function ncos(a) return (cos(a)+1)/2 end
function tan(a) return sin(a)/cos(a) end
function drw_mouse(x,y) spr(0,x,y) end
function xset(x,y,c)
	sset(x,y-1,c)
	sset(x,y+1,c)
	sset(x-1,y,c)
	sset(x+1,y,c)
end
poke(0x5f2d, 1)--enable mouse
p={}
for i=1,#p do
	if p[i]~='' then
		pal(i,p[i],1)
	end
end

fills={
	0b1111111111111111,
	0b1111111111111111,
	0b1111101111011111,
	0b0111111011111111,
	0b0111101111011011,
	0b1110101111010111,--tacks
	0b0111101011010101,--fishbone
	0b1100001101000011,--longboard
	0b1000001010000010,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
}

░=500
dt=0.0333
t=0

cls()
rectfill(0,0,128,128,7)
::♥::
--cls()
t+=dt
--mx,my=stat(32),stat(33)

for i=1,500 do
	x,y=rnd(128),rnd(128)
	
	--c=c%3
	--c=c+(y-t*8)/16+x/8
	c=sin(sin(x/36)/24)
	 	+ceil(x/32)+flr(x/64)
		+ceil(y/36)+flr(y/64)
		+flr(x/16) 
		+y/13
	   + (sin(t/16)+2)*(sin(x/32)+sin((y+t)/64))
	   - t
	c=flr(c) + 2*(- x/16 + y/16) 
	c=c%(#fills)+1
	
	xset(x,y,c)
end

for i=1,500 do
	x,y=rnd(128),rnd(128)
	w=0
	sum=0
	ct=sqr(w*2+1)
	for xa=x-w,x+w do
		for ya=y-w,y+w do
			sum+=sget(xa,ya)			
		end
	end
	ss=sum/ct
	
	fillp(fills[flr(ss%#fills+1)])
	circ(x,y,1,7)
end

--sspr(0,0,128,128)
flip() goto ♥
__label__
07077777777777777777770777777777777777777777077777777770777777777777777777770777777070777777777707770777007707777777777777770077
70777777777777777777707777077777777777777777777777777777770777777777777777077777777707777777770777077700770777077777777777077707
07777777777777777777077777777777707777777777077777777777777777777777777077777777777777777777077707770777707707777777777777770777
00077777777777777777707777007777777777777777777777777777770777077777777777777777777777777777770777777707770077077777777777077700
00777777777777777770077777777777777777777777077777777777777777777777777777777777777777777777077777770077007700770777777777770777
07777707777777777700070777777777777777777777777777777777777777777777777777777777777777777777770777777700770777077777777777777700
07777777777777777700007077777777777777777777777777777777777777777777777777777777777777777777707777770077777707777777777777770777
00777777077777770770777707077777707777777777777777777777777777707777777777077777777777777777770777777707770777077777777777777700
00777777777777007000077070077777777777777777777777777777777777770777777777777777777770077777777777777777777707777777777777770777
07070777777777700070000000707777777777777777777777777777777777707777777777777770777770000777777777777707770777777777777777777707
00707077777777770700000007077777770777777777777770777777777777777777777777777777777000700077777777777777777707777777777777770777
00070777777777770000000000077777077777777777777777000777777777777707777777777770770007070777777777777777770777777777777777777707
00007777777770770000000000777777077777777777777770000077777777700077777777777777700000777777777777777777777777777777777777777777
00000770777700777000000000077770007777777777777707000077707077777077777777777777700000777777777777777777777777777777777777777707
00000007777707077000000000000777000777777777777770000700070777777707777777777777700000077077777077777777777777777077777777777777
00000070777770700000000000007070000007777777777700000000707077777070070777777777770000707707777777777777777777777707770777777777
00000007070700000000000000070700000000777077777000000000070777777000777777777777700000077077777707777777777777777700007077770777
00000000007000000000000000007070000000770777777700000000707777770707777777777777000000000777777777777777777777777000000007777777
00000000000700000070007000700700000000007077777000000000077777770000700007000770000000000777777070077777777777770000700000777777
00000000000000000000000000000000000000000077770000000000000777707000000000000000000000000077777700000777777777770007000000707777
70000000000000000000000000000000000000000000700000000000000000770700000000000000000000000000777700000777777777777000000000070777
00070000000007000700000007000700070007000000000007000000000000777700000000000000000000000000077000007077777777777000070000000077
00000070000000000070000000700070007000700000000000700070000000770000000000000000007000000070070000000777777777770000007000000777
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007770707000000000000000070
70007000000000000000700000000000000000000000000000000000700000000000000000000000000070007000000000000000070000000000000000000000
00070000070007000700070700000700000700000000000000000707070000000000070000000700070700070000000000000000000000000700070007000000
00700000007000700070007000000070000000700000007000700000007000000070007000000070007000000070007000700000000000000000000000700000
70007000000000000000770007000000070000000000000000000700070000000000000000000000070000000700000000000000000000000000000000000000
00077000700070007007000070000000700070000000000070000000700000000000700000000000700070007000700000000000000000007000000070007000
07000007070007000700070007000700070000070007070700000700070000000700070007000707070000000707000000070000000007070000070700000000
00700000007000700070007000700070007000000000007000700070007000700070007000700070007000700070000000700070000000000070007000000000
70007000000000007000700077000700700000000000070000007700070000000700070000000000770070000700000000000000000000000000070000000000
70070007000070000007700700070007700000007000700070077007700770007000700070007000000700000000700070007000000070000000700770007000
07070700070007000707070077070700070007000700070007070707070700070700070007000700070007070700070700070007070000000700070000070000
77700070007000707070007700707070007700700070707000700077007000000070007000700070007700700070000000000000007000000070000000000000
77707770707070707777000070707700770077000070000070007700707070707070700077007007700070707000707070707000000000000770700070700000
77777077707700700777077707070077770770000000000777070077700700070000000070007077700770077007000000000007000700077077000700007000
77077700770077007777777777077707770777070707770777007700770077077700770707077707770777077700070077000700070007070700770707070700
77777777707700777777077707777770077770770070007707777777707770770077007700770077077770770777007000700070007000700077707770700070
77077770770777077707777777077777770077077770700777077700770077077700700070007007770777077700700070707070700070707000770777707700
77777777077707777777777777770777077700770007707777777777777700777777007770077777777777777077000770000070700070077077077700077000
77777777770777777777777777077770777777077707770777077777770077077707770077077707777777777700770777000707070707077707770777070700
77777777777777777777777777777777077707770777707777777777077777777777077770777777777777770777777700707070007000700777077707770070
77777777777777077777777777777770777777077707770777777777777777007777770077077707777777777777770077007770707077777707770777007770
77777777777777777777777777777777777777770777077777777777077707777777077700770777777777777777707707777700707000770777077707770770
77777777777777077777707777777707777777077707770777777777777777077777770777077777777777077777770777077707770077077707777777007700
77707777777777777777077777777777777777770777777777777777777700777777777777777777777777777770707707777777007770770777777777777777
07070777777777777770007777777707777777077707770777777777777777077777770777077777777777777777770777077707770077077777777777077700
70707777777777777770000777077777777777777777777777707777707777777777777707770777777777777777777777770777007700777777777777770077
07777777777777707770777000777777777777777707777777777777777777777777777777777777770777707077770777077707770077077777777777077700
07077777777777777700777007777777077777777777077777777777777777770777777707770777707070770777077707777777077777777770770777777077
00777777777777777707070700777777707777777777777777707777777777077777777777777777700707777777770777777707770077077777777777777707
00777777777777777700707070777777077777777777077770770707777777777777777777777777777077777777077777777777077707770777777777770777
00077777777777007007000707777777777777777777777707077077777770777777777777777777777707077777770777777707770777077777777777777700
00007077777077770000000070777777707777777777777770777777777077777077777777777777777777707707777707777777077707777777777777777777
00000777777777700000000007077077000777777777777770777777777707077707777777777777777777777770777777777707770777777777777777777770
00077777777777770000000000707777707777777777777777777777777070777077777777777777707777777777777777777777777777777777777777777777
00777777777777770700000007077777070777777777777777777777077777777077777777777770770700707777777777777777770777777777777777777777
00007777707777777000000000007770007707777777777770700700777777777777777777777777000007077077777777777777777777777777777777777777
00000770070777700000000000070770077777777777777777070077077777777077777777777777000070777707777777777707770777777777777777777777
00000007707070070000000000007777077777777777777707000777770707770777777777777770700007077707777777777777777777777777707777777777
00000007777707000000000000007777777777777777777070000777777077777077777777777777000070077070777777777707777777777777777777777777
00000000770770700000000000077770777777777777777770000077700777770777777777077707000000707007777777777777777777777777777777777777
00000000707770000000000000707770007077707077777707000007007777707077707777707070000000070000070700777777777777777077070777707777
70000007070700000000000000000000000770777777077070700000707707070700077777770700000000000007077707777777777777707000707007077777
00000000000000000700070000000000000007777700000007000000000070770700070777707070000000070070777077777777777777070000000000777777
00700000000000000070007000000000000007777777070000000000000077700000007007070700000000000707777707700777777777707000000007777777
00000000000000000000000000000000000000707770777000000000000707700000000070707000000000000070777700000777777777777000000000777777
00000000000000000000700000000000000000000700070000000000000077770000070000070000000070000000077070007777777777070700000007077077
07070000000000000000000000070000000000000000000007000000000007077700707000000000000000000000007700007777777770707700070000770777
00000000000000000070000000000000000000000000000000700000000000707000000000000000007000000000077700007707700777000000007000707777
07000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007000070777070077000000000000070077
70000000000000007000700070000000000000000000000000000000700000070000000000000000700070007000000000007000700700000000000000000007
07000007070007070700070700070700070007000700070007000007070000000700070000000707000700070000070700000000007070000000070700000000
00700000000000000070007000000070007000700070007000000070000000000000000000000070000000000070007000700000000700000070007000000000
77000000000000007700070007000000000000000000000007000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700000000007000070000000000070000000000070007000700070000000000000000000700070007000000000000000000000007000700070000000
07070007070007070700070000070707000700000700070700000007000707000007000007070700070700070700000700000000000000000007000707000700
00700070007000000070007000000000000000000070000000700000000000000000000000700070007000700070000000000000000000700000000000700070
70007700000000000000700007000000070000000000000000000700070007000000000000000000070007000000000000000000000000000000070000000000
70077000700070007007000000007000700070000000700070077007700070000000700000007000700070070000700070000000000000000000700070000000
07070700070007000700070007000700070007000707070700000700070000000707070707070007070007000707000707000700070000070700070000070700
70700070007000700070007000700070007000700070007000700070007000700070007000000000007000700070007000700070007000000070007000000070
77707000770007007070707070000700700007000000070000700070700000007700070007000700707070007000000000000700000000000700000007000000
70707007000070077000700000000007000770007000000000000007700770077007000070077000700070070007000000007000700070007007000070007000
77007700070007070707770007000700070007000700070007000707070007070700070007000700070707070700070007000700000700000700070007000700
70770070007000707077707700700070007000700070007000700070007000000070007000700070007000700070007000700070000000700070007000700070
77007070707070007700777070707070700070000700700070707000700000007070700077007000777077007000770077000700000000007000700000000700
70777000700000070777077700070007000700007007000700707007000000000000700770070000000000777007000700077000700070070000700070077000
77007707070777007707777007070700770707070700070777000700770007000707070707000700770777007700070007000700000007000707070707000700
70777070007700777777077700707077007000700070007700707077007000707770007000700070707770777070007000700070007000700070007700700070
77077700700077077707777777777777777070707070707077077700770077007700707070707000770777007770700070707000700000007000700077707000
77770777007700770777777707770770077770007000007700700777007700070777700070007007077707770070000770070007000000077007070770770000
77777700770777007777770777077700777707070700070777077777770007007700770707070707770777077700770007000700070007007700770777070700
77777777707700777777777777770070777700770077707707777777777770700777077000707077077777770777707000700070007070700077777777770070
77777770770777777777777777077777770777007007770777777777770077007707770077007707770777777700770077007700707070007707770077007700
77777777077777777777777777770777077707777077077707777777077707700077077700770077077777777777007700770777000070770077777707770070
07777777777777777777777777777707770777077700770777777777777077770777770777007707777777777707777077007700070707007777777777007700
70777777777777777777777777777777777777777777777777777777777777777777777707770777777777777777077777777777007700777777777777777077
07077777777777777777777777777777777777077707777777777077777077077777777777777707777777777777777777707707770077007777777777007700
00707777777777777777777077707777777777777777777777770777777707777777777707770777777777777777777777770777007700770777777770777077
00000777777777777777770777077777770777777707777777777777777777777777777777777707777770777777777777777707770777077777777777777707
00707077777777777777077707777777777777777777777770777777777777777777777777777777777707077777777777770777007707777707777777777777
00000707777777077770700070777777777777777777777777777777777777777777777777777777777770777777777777777707770777777077777777777777
00000000777077700700000007077777777777777777707777777777777777707777777777777770707077707777777777777777777707777707777777777777
00000000077777770000000000707007777777777777777070077777700777770777777777777707007700070777777777777777777777070777777777777777
00000000007777707000000000000077770777777707777707000770000077700070777770777770070700000007777777777777777777700077777777777777
00000000000777070000000000000077700777777070777770000000000077770007077707007770007000000000707777777777770707700777707707077777
70000000000077000007000000000077700070707707077000000000000007777000000770000700000000000000007000007777777070770077000070707777
00070000000000000700070000000700000000070770000000000000000000777000000000707070070000000000070700000777777707777000000000070777
00000000000000000000000000000000000000007000000000000070000000070000000007070700007000700000707000000777777770777000000000000777
70000000000000000000000000000000000000000000000000000000000000000000000000700000000000000000070000007070077707070000000000000777
70000000000000000000700070007000000000000000000000000000000000000000000000000000000000000000000000000770077700000000000000000077
07000700070007000700000700000000000700000000000000000007070000000000070000000000000000070000000000000707077000000000000000000777
00700070007000700070000000700000000000000000000000700070007000000000000000000000000000000070000000000070000000000000000000000777
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000070
00007000000000007000700070000000000070000000000000007000000000000000000000000000700070000000000000000000000000000000000000000070
07000700070000000000070000000700000707000000070007070700070000000700070000000000000700070007000007000000000000000700070000000007
00700000000000000070007000000070000000700070007000000070000000700070007000000000000000000000000000700000000000000070007000000000
07000000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
70007000000070007000700070000000000000000000000000007000000070000000000000000000700070007000000070000000000000000000000070000000
07070007070007070700070000000700070707000700000000000700070007000700070000000700000700070000070707000000000000000700000700070000
00700000007000000070007000700070007000700000007000700000007000000070007000000070007000000070000000700000000000000000000000000000
70007700000000007000000077000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700000007007700070007000700070000000000070007000700000000000000000007000700000007007000000000000000000000000000070000000
07000007000707070707070007000707070700000707000700000707000000000007070000070000070007070700000007000000000000000700070000000000
00700000000000000070007000700000007000700070000000700070007000700000007000700000007000700000000000700000000000700000000000700000
70000000000000000000770007000700000000000000000070000000070000000000000000000000070007000000000000000000000000000000000000000000

