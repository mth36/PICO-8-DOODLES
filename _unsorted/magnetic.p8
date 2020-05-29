pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
█=1000
dt=0.0333
t=0

poke(0x5f2d, 1)
palt(10,true)

function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end

p={}
for i=1,#p do
	if p[i]~='' then
		pal(i,p[i],1)
	end
end

cls()

::♥::
cls()
t+=dt

mx,my=stat(32),stat(33)

for x=-4+cos(t/32)*8,128+4,11+cos(t/32)*8 do
	for y=-4+sin(t/32)*8,128+4,11+sin(t/32)*8 do
		xc,yc=mx,my
		d=dist(x,y,xc,yc)
		xa,ya=x-xc,y-yc
		s=atan2(xa,ya)
		
		k=128
		m=16
		nx=x+cos(s)*min((k/d),m)
		ny=y+sin(s)*min(abs((k/d)),m)
		
		line(x,y,nx,ny,(x/32+y/32+t*4)%8+8)
		--pset(x,y,10)
	end
end

palt(0,false)
spr(1,mx-4,my-4)
palt(0,true)

flip()goto ♥
__gfx__
00000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000700000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000777777770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
