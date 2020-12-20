pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--doodle template
--micheal

█=1000
dt=0.0333

t=0

function sqrdist(x1,y1,x2,y2)
	return (y2-y1)*(y2-y1) + (x2-x1)*(x2-x1)
end

p={128,2+128,2+128,6,13,7,15+128,14+128}
for i=1,#p do
	pal(i,p[i],1)
end

cls()

::♥::
t+=dt

for i=1,█ do
	x,y=rnd(128),rnd(128)
	
	c=sin(sin(x/32)/100)
	 +ceil(x/64 + t/8)+flr(x/128)
  +ceil(y/24)+flr(y/32)
  +flr(x/128) 
  +y/32
 		 
	c=c+t
	 
	c=c%#p+1

	local k = 48*48 < sqrdist(x,y,64,64) and 1 or -1
	fillp(((t + k)%4<2) and 0b0000000011110000 or 0b0000110000000011)
	circ(x,y,1,c + 15*flr(c))
end

flip()goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000