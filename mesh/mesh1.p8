pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
█=1000
dt=0.0333
t=0

function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end

p={}
for i=1,#p do
	if p[i]~='' then
		pal(i,p[i],1)
	end
end

cls()

::♥::
cls()
t+=dt

k=64
j=16
for xa=-k,128+k,j do
	for ya=-2*k,128+2*k,j do
		x,y=xa+cos(t/6)*8,ya+sin(t/8)*16
	
		h=3*(sin(sin(y/256-t/8)+1)+1)
			+4*(sin(x/256-t)+1)
		
		--circ(x,y,1,5)
		fillp(0b1010010110100101)
		line(x,y,x,y-h+1,5)
		fillp()
		
		x2,y2=xa,ya
		x2,y2=x2+cos(t/6)*8,y2+sin(t/8)*16
		h2=3*(sin(sin(y2/256-t/8)+1)+1)+4*(sin(x2/256-t)+1)
		line(x,y-h,x2,y2-h2,5)
		
		x2,y2=xa+j,ya
		x2,y2=x2+cos(t/6)*8,y2+sin(t/8)*16
		h2=3*(sin(sin(y2/256-t/8)+1)+1)+4*(sin(x2/256-t)+1)
		line(x,y-h,x2,y2-h2,5)
		
		c=(sin(x/512)*16+sin(y/128)*4)
		c=c%15+1
		circfill(x,y-h,(sin(t)+6)/2+sin(x/17),c)
	end
end

print(stat(1),0,0,10)
flip()goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
