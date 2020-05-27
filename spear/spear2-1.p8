pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
cc={0,5+128,7,5+128,0,0}
for i=1,#cc do
	pal(i,cc[i],1)
end

t=0
█=1000

::♥::
t+=0.016

for i=1,█ do
	x=rnd(128)-64
	y=rnd(128)-64
	
	c=(
	 (abs(x/15))
		+ 1.7*abs(y/44-t)-y/44%sin(t/16)
	)
	c=(c-t) %#cc+1
	
	circ(x+64,y+64,1,c)
end

goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
