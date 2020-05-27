pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
█=1000

⧗=0
a1=50

::♥::
if ⧗>5 then
	⧗=-5
end
⧗+=0.0167---rnd(⧗)*0.05

--reset param every 1 sec-ish
if ⧗%1<0.05 then
	a1=rnd(50)+25
end

--partial screen clear
-- = fade effect
for i=1,█ do
	x,y=rnd(128),rnd(128)
	circ(x,y,1,0)
end

--draw circles
for x=0,128,16 do
 for y=0,128,16 do
  r=  3.5 * sin(⧗) --cycle with time
    + 4.5 * sin(x/17) --add variation with x
    + 3.0 * sin(sin(y/a1%⧗/4)) -- uh clue, but looks good
    + 4.0 -- base radius
  circfill(x,y,r,7)
 end
end

--cpu usage
--print(flr(stat(1)*100),0,0,12)

flip()goto ♥
