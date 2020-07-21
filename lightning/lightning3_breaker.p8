pico-8 cartridge // http://www.pico-8.com
version 19
__lua__
--doodle template
--micheal

function pow4(a)
	return a*a*a*a
end

dt=1

t=0

p={}
for i=1,#p do
	pal(i,p[i],1)
end

cls()

::♥::
t+=dt

pie=1
for i=1,pie+(sin(t/8))*1 do
	if rnd(1)<1 then
		ang=rnd(1)/pie*i
		ang2=-(ang-0.25)+0.25
		d=64
		
		line(cos(ang)*d+48,sin(ang)*d+64,
		 cos(ang2)*d+48,sin(ang2)*d+64,
		 7)
	end
end

for i=1,2500 do
	x,y=rnd(128),rnd(128)
	x=x

	cc=pget(x-1,x)
	if cc==7 then
		if rnd(1)<1 then
			c=7
		end
	else
		c=0
	end

	circ(x,y,1,c)
end

flip()goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
