pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end
function show_cpu(c1,c2) cp=flr(stat(1)*100) rectfill(0,0,12+4*#(tostr(cp)),6,c2) print("∧"..cp.."%",1,1,c1) end
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
}
for i=1,14 do
	pal(i,p[i],1)
end


░=250
dt=0.01
t=3
k=sqrt(2)
pi=3.14

rectfill(0,0,128,128,10)
::♥::
--cls()
t+=dt
mx,my=stat(32),stat(33)

rr=60.98*k

for i=1,500 do
	ang,ra=rnd(1),rnd(64*k)
	if ra>rr*.2 then
		ca=cos(ang)
		sa=sin(ang)
		x,y=ra*ca,ra*sa
		--circ(x+64,y+64,1,7)
		r2=ra+3
		smpl=pget(r2*ca+64,r2*sa+64)
		if smpl~=10 then
			circ(x+64,y+64,1,smpl)
		elseif rnd(1)<0.01 then
			circ(x,y,1,0)
		end
	end
end



for i=1,░ do
	--x,y=rnd(128),rnd(128)
	--ang,r=atan2(x-64,y-64),dist(x,y,64,64)
	ang,r=rnd(1),rnd(rr)
	--r2=sqrt(r)*10
	r2=sqrt(r)*10*sin(rr)
	
	sa=sin(ang)+cos(t/2+sin(t/3))/2
	ca=cos(ang)+sin(t/2+(cos(t/3)/2))/2
	
	x,y=r*ca,r*sa
	x2,y2=r2*ca,r2*sa
	
	l=32
	--c=sin(x/l)+sin(y/l)
	--c=c+(-x/32-y/32)%2
c=sin(x/64)+sin(y/64)
	c=c%(t*2) 
	c=c+2*t --move it
	c=2*13*abs((c/16%1)-1/2)-13/2+7.5
	c=flr(c)
	c=c%14+1 -- [1,14]

	circ(x2+64,y2+64,1,c)
end

show_cpu(10,0)
--drw_mouse(mx-1,my-1)
flip() goto ♥
__gfx__
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
