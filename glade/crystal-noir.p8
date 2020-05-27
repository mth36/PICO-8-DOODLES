pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--doodle template
--micheal

█=1000
dt=.016

t=0

p={}
for i=1,#p do
	pal(i,p[i],1)
end

cls()
a=16

::♥::
t+=dt
if t%1<0.3 then
	a=rnd(10)+13
end

for i=1,█ do
	x,y=rnd(128)-64,rnd(128)-64

	c=(sin(x/36)/9) / cos(y/36)
	c=c+(flr(1.7*x/(sin(t)+a))+flr(y/(sin(t)+a)))

	c=flr(c%2)==0 and 7 or 0
	circ(x+64,y+64,1,c)
end

flip()goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
