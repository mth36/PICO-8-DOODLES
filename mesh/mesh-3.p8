pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
█=1000
dt=0.0333
t=0

function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end

cls()

::♥::
--cls()
t+=dt
 
fillp(0b0101101001011010.1)
k=64
j=17+sin(t/4)
for xa=-k-sin(t/3)*8,128+k,j do
	for ya=-2*k,128+2*k,j*.4 do
		x,y=xa+cos(t/6)*8,ya+sin(t/8)*16
	
		h=3*(sin(cos(y/256-t/200)+1)+1)
			+4*(sin(x/128-t)+1)
		
		x2,y2=xa+j,ya
		x2,y2=x2+cos(t/6)*8,y2+sin(t/8)*16
		h2=3*(sin(sin(y2/256-t/8)+1)+1)+4*(sin(x2/256-t)+1)
		
		--line(x,y-h-1,x2,y2-h2-1,5)
		line(x,y-h,x2,y2-h2,7)
		
	end
end
fillp()

for i=1,1300 do
	x,y=rnd(128),rnd(128)
	circ(x,y,1,0)
end

flip()goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
