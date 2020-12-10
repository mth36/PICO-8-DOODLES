pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function fflr(a,unit)
	return flr(a/unit)*unit
end

t=0
smpl=1000

for i=0,7 do
	pal(i,i+8+128,1)
end

cls()
::♥::
t+=1/30

local st16=sin(t/16)

for i=1,1000 do
	local x,y=rnd(128),rnd(128)
	local c=16 
	 + x / (32 + 16*st16) 
	 + sin((y+200)/8/(x+32)) 
	 + t/3

	local diff=c-flr(c)

	c=flr(c)
	 +0.75*flr(x/64+y/16-t)

	c=c%8+8
	if diff<0.3 then
		c-=8
	end
	
	circ(x,y,1,c)
end

print(smpl,0,0,0)

flip() goto ♥