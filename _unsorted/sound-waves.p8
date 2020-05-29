pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end
function nsin(a) return (sin(a)+1)/2 end
function ncos(a) return (cos(a)+1)/2 end
function tan(a) return sin(a)/cos(a) end
function drw_mouse(x,y) spr(0,x,y) end
poke(0x5f2d, 1)--enable mouse
p={
	7,
	7+128,
	10,
	10+128,
	11,
	11+128,
	3,
	3+128,
	1,
	1+128,
	1,
	3+128,
	3,
	11+128,
	11,
	10+128,
	10,
	7+128
}
for i=1,#p do
	pal(i,p[i],1)
end

░=1000
dt=0.0333
t=0

cls()
::♥::
--cls()
t+=dt
mx,my=stat(32),stat(33)

for i=1,░ do
	y=rnd(128)-64
	x=rnd(128)-64
	
	c=
		 sin(y/600 + sin(t/10) + 1)
		+flr(x/10) + flr(y/13)
		+sin(x/80)
		+cos(y/56)
		+t

	c=c%#p+1 -- [1,14]
	
	circ(x+64,y+64,1,c)
end

--show_cpu(10,0)
drw_mouse(mx-1,my-1)
flip() goto ♥
__gfx__
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
