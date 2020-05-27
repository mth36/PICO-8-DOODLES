pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
level=64
box={
	x1=64,y1=0,
	x2=64+9,y2=9,
	w=10,h=10,
	vy=0
}

pal(1,12+128,1)

--fillp(0b1100110000110011)

function level(t)
	return function(x)
		x=x-64
		return 64-sin(x/128-t*0.3)*(16*sin(t*0.7))
			+cos(x/32-t*0.5)*sin(t/8)*3
	end
end

t=0

function _init()
end

function _update60()
	t+=1/60

	w=level(t)
	
	wg=0.5*(w(box.x1)+w(box.x2))
	
	if box.y2>wg then
		depth=box.y2-wg
		if abs(box.y2-wg)<.5 then
		else
			box.vy-=.2
			box.vy*=.9
		end
	end
	
	box.vy+=0.08
	box.y1+=box.vy
	box.y2+=box.vy
end

function _draw()
	cls()
	--fillp()
	rectfill(0,0,128,128,12)
	
	bb=4+sin(t/8)*1.2
	for i=0-128,128,bb do
		--line(i,w(i),i+bb,w(i+bb))
		line(i,
		w(i)+sin(t)*2,
		i+128+(sin(t/16))*20+sin(i/64-t*0.7)*20,
		128+64,7)
		
		fillp(0b1010010110100101.1)
		line(i,
		w(i)+sin(t)*2
		 -(sin(t/4)+1)*.5*16,
		i,0,1)
		fillp()
	end
	
	rectfill(box.x1,box.y1,box.x2,box.y2,7)

	print(stat(1),0,0,7)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
