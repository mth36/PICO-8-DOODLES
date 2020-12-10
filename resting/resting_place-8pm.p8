pico-8 cartridge // http://www.pico-8.com
version 21
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