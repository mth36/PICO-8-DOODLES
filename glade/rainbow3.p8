pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
for i=0,7 do
	pal(i,i+8+128,1)
end

t=0
::★::

t+=0.01

for i=1,1400 do
	x=rnd(128)
	y=rnd(128)
	s=sin(t/3)
	
	c=flr(
		     (x+sin(y/30+sin(t/5)*5)*6*s)/(24 * (s-1.8)) 
		    +y/(48 * (s-1.8))
		    +4*t
	  )
	  +cos(x/16)*sin(y/48-t+sin(y/128)*1)
	c=c%8+8

	if rnd(1)<0.75*s then
		c-=8
	end
	
	circ(x,y,1,c)
end

print(stat(1),0,0,10)

flip() goto ★
