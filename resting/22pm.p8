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

pal(13,13+128,1)

function get_oxy()
	ox=rnd(128+bk)-8
	oy=rnd(128+bk)-8
	local ch = rnd(1)
	if ch<0.05 then
		ox-=1
	elseif ch<0.1 then
		ox+=1
	end
	return ox,oy
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
	0b1111101111011111,
	0b0111111011111111,
	0b0111101111011011,
	0b1110101111010111,--tacks
	0b0111101011010101,--fishbone
	0b1100001101000011,--longboard
	0b1000001010000010,
	0b0000000000000001,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
	0b0000000000000000,
}

░=500
dt=0.0333
t=0
bk=8

cls()
rectfill(0,0,128,128,7)

::♥::
--cls()
t+=dt
--mx,my=stat(32),stat(33)

for i=1,750 do
	x,y=flr(rnd(128)),flr(rnd(128))
	ss=sget(x-1,y-1)
	d=dist(x,y,128,128)
	if d>128+28 then
		if rnd(1)<1 then
			sset(x,y,1)
		end
	elseif ss>0  then
		k=rnd(1)<0.12 and 1 or 0
		sset(x+1,y,(ss+k-1)%15+1)
		sset(x-1,y,ss)
		sset(x,y+1,(ss+k-1)%15+1)
		sset(x,y-1,ss)
		sset(x+2,y+2,(ss+2*k-1)%15+1)
	end
end

for i=1,10+sin(t/16)*15 do
	ox,oy=get_oxy()
	for y=oy,oy+bk-1 do
		for x=ox,ox+bk-1 do
			ss=sget(x,y)
			fillp(0b1111111111111111
				-fills[flr(ss%#fills+1)])
			pset(x,y,7)
		end
	end
end

-- for i=1,250 do
-- 	x,y=rnd(128),rnd(128)
-- 	w=1
-- 	sum=0
-- 	ct=sqr(w*2+1)
-- 	for xa=x-w,x+w do
-- 		for ya=y-w,y+w do
-- 			sum+=sget(xa,ya)			
-- 		end
-- 	end
-- 	ss=ceil(sum/ct)
	
-- 	--ss=sget(x,y)
-- 	--ss=x/16+y/16
	
-- 	fillp(0b1111111111111111
-- 							-fills[flr(ss%#fills+1)])
-- 	circ(x,y,1,7)
-- end

--sspr(0,0,128,128)

--drw_mouse(mx-1,my-1)
flip() goto ♥