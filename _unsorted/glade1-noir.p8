pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
t=0
█=1000
function sqr(a) return a*a end
cls()
::♥::
t+=0.0333

for i=1,█ do
	y=rnd(128)-64
	x=rnd(128)-64
	
	c=x/16+sin((y)/128)
	c=c+flr(x/20+y/26)
	c=c+sin(x/64)
	c=c+t
	
	c=c%8+8
	c=flr(c)%2==0 and 0 or 7
	
	circ(x+64,y+64,1,c)
end

flip() goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
