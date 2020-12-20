pico-8 cartridge // http://www.pico-8.com
version 29
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

for x=0,128,16 do
	for y=x,x+64,16 do
		x=(x+⧗*16)%128
		y=(y+⧗*16)%128
		line(x,y,x,y+16,8)
	end
end

--draw circles
for x=0,128,16 do
 for y=0,128,16 do
  r=  3.5 * sin(⧗) --cycle with time
    + 4.5 * sin(x/17) --add variation with x
    + 3.0 * sin(sin(y/a1%⧗/4)) -- uh clue, but looks good
    + 4.0 -- base radius
    + abs(x-64)/6
  circfill(x,y+sin(⧗/x),r,7)
 end
end


flip()goto ♥
__label__
77777777777777777777777777777777777777777777777777777777000777777777770007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000777777777770007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770700077777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770000007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770007777777777700000000777770000000077777777777000777777777777777777777777777777777777777
77777777777777777777777777777777777777770000777777777000000000000000000000007777777770007777777777777777777777777777777777777777
77777777777777777777777788777777777777700000007777700000000000007000000000000077777000000777777777777770777777777777777777777777
77777777787777777777777088007777777770000000000000000000000000000000000000000000000000000070777777777000777777777777777777777777
77777777787777777777777008000077777070070000000000000000000000000000000000000000000000000000777777777000007777777777777077777777
77777777877777777777777788007777777770000000007777700000000000000000000000000077777000000077777777777700077777777777777777777777
77777777777777777777777708077777777777000000077777770000000000000000000000000777777700000077777777777770077777777777777777777777
77777777777777777777777778777777777777700000777777777000700000077770000000707777777770000777777777777777777777777777777777777777
77777777777777777777777778777777777777700007777777777700070007777777000000077777777777000777777777777777777777777777777777777777
77777777777777777777777777777777777777770077777777777770000007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770077777777777770000077777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770777777777777770000077777777770000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770077777777777770000077777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770077777777777770000007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777778777777777777700007777777777700000007777777000000077777777777000777777777777777777777777777777777777777
77777777777777777777777778777777777777700000777777777000000000077700000000007777777770000777777777777777777777777777777777777777
77777777777777777777777788077777777777808000077777770000000000000700000070000777777700000077777777777770077777777777777777777777
77777777777777777777777788887777777770808800007777700000000000000700000000000777777000000707777777777700077777777777777777777777
77777777707777777777777088800877777888008800000000000000000000000000000000007070700000000077777777777000007777777777777077777777
77777777000077777777780008800888080880800800000000000000000000000000000000000000000000000000007777700000000077777777700077777777
77777770007777777777777008800877777880008800000070000000000000000000000000000000000000000000777777777000007777777777777077777777
77777777077777777777777708887777777770800800007777700000000000000000000000000077777000000007777777777700077777777777777777777777
77777777777777777777777708877777777777008800077777770000000000000000000000000777777700000077777777777770077777777777777777777777
77777777777777777777777770777777777777700800777777777000000000077700000000007777777770000777777777777777777777777777777777777777
77777777777777777777777778777777777777708807777777777700000007777777000000077777777777000777777777777777777777777777777777777777
77777777777777777777777777777777777777770877777777777770000007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777778877777777777770000077777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770877777777777770000077777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777778877777777777770000077777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777778877777777777770000007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777770777777777777700807777777777700000007777777000000077777777777000777777777777777777777777777777777777777
77777777777777777777777778777777777777788880777777777000000000077700000000007777777770000777777777777777777777777777777777777777
77777777777777777777777708877777777777888880877777770000800000000000000000000777777700000077777777777770077777777777777777777777
77777777777777777777777700807777777778808888087777788000880007000000000000000077777000000007777777777707077777777777777777777777
77777777707777777777777000000077777088800880008800888080880000000000000000000000000000000000777777777070707777777777777077777777
77777777000077777777700000000077777088080080088800088800880000000000000000000000700000000000777777777707077777777777777077777777
77777770007777777777777000007777777778008880008800888880880000000000000000000077777000700077777777777770777777777777777777777777
77777777077777777777777700077777777777008880087777788880880007000007070000007777777770000777777777777777777777777777777777777777
77777777777777777777777700777777777777700888077777778880880070000000700007077777777777000777777777777777777777777777777777777777
77777777777777777777777777777777777777770880777777777880880000077700000000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777778887777777777780880007777777700000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777777877777777777777880007777777000007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770880077777777700007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777877777777777777880077777777700007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777877777777777770880077777777700007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777877777777777770880007777777000077777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777770087777777777700880007777777000700777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770880777777777800088800077700007000777777777777707777777777777777777777777777777777777777
77777777777777777777777707777777777777708880877777778880888080800008008080077777777777070777777777777777777777777777777777777777
77777777777777777777777770077777777777000080077777778800088008880000880008007777777770000777777777777777777777777777777777777777
77777777777777777777777777777777777777700707777777777780008000888008808088077777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770088000880088888088777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777088008777778888087777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777788877777777700077777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777778777777777770777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777778777777777778777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777708077777777780077777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000000777770880007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770000000000008880000777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777700007777777777700000000000000080008877777777777007777777777777777777777777777777777777777
77777777777777777777777770077777777777700000077777770000000000000000880088880777777780008777777777777777777777777777777777777777
77777777777777777777777700700777777777000000000707000000000000000080080880808077777888000877777777777707077777777777777777777777
77777777777777777777777000007777777777700000000777700000000000070008888008880777777788800807777777777000077777777777777777777777
77777777077777777777777700077777777777700000077777770000000000000000880880807777777778808877777777777700077777777777777777777777
77777777777777777777777707777777777777700070077777770070000000077708880888877777777777808877777777777770777777777777777777777777
77777777777777777777777770777777777777700000777777777700000000777770888088877777777777008877777777777770777777777777777777777777
77777777777777777777777770777777777777770000777777777070000000777770880808877777777777808877777777777770777777777777777777777777
77777777777777777777777700777777777777700000777777777700000000777770888088877777777777808877777777777777777777777777777777777777
77777777777777777777777700777777777777700000077777777070000000077700080808877777777777808877777777777770777777777777777777777777
77777777707777777777777000777777777777000000077777777700000000000080880888807777777778800877777777777700077777777777777777777777
77777777007777777777777000007777777770700000000777000000000000000000088088800777777788800807777777777070077777777777777777777777
77777777000777777777770000000777777707000000000000000000000000000000080000800877777080800887777777770000807777777777777007777777
77777770000777777777777000000777777070000000000000000000000007000000080000800008000088080888787777708080880777777777770007777777
77777777007777777777777000000077777000000070700000000000000000000000000000000000000808880080887777788000887777777777777077777777
77777777007777777777777000007777777770000000000000000000000000000700000000000000000088800080777777777000777777777777777777777777
77777777777777777777777700777777777777700000007777700000000000070000000070007077777808080877777777777770777777777777777777777777
77777777777777777777777777777777777777777000777777777000000000000000000007007777777778800777777777777777777777777777777777777777
77777777777777777777777777777777777777770707777777777700007000777770000070077777777777008777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770700007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770000077777777770000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000777777777770007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000777777777770007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777700777777777777077777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000777777777770007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000777777777770007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770000077777777700000777777777777787777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777770000007777777000000777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770007777777777700000000777770000000077777777777000777777777777777777777777777777777777777
77777777777777777777777777777777777777770000777777777000770700000000000000007777777778000777777777777777777777777777777777777777
77777777777777777777777777777777777777700707707777707707770700000000000000077777777777007777777777777777777777777777777777777777
77777777777777777777777770777777777777777077777777777770777700000000000000777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000000777770000007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777777000077777777700007777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777770700777777777070077777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777077777777777707777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777770777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777707777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777007777777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777000077777777777777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777777777777777777700007777777770777777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777077777777777777700007777777700077777777777777777777777777777777777777777777777777777777
77777777777777777777777777777777777777777770777777777777000000777770000007777777777777707777777777777777777777777777777777777777
77777777777777777777777777777777777777770070007777707770000000000000000000777777777770077777777777777777777777777777777777777777
77777777777777777777777770777777777777000007707777700700000000000000000000707077777777007077777777777770777777777777777777777777
77777777787777777777777070077777777770000000000777700000000000000000000007000707707070000707777777777770777777777777777777777777
77777777787777777777777700077777777777000000007777700000000000000000000000000077777000000077777777777707077777777777777777777777
77777777877777777777777700777777777777700000077777770000000007000000000000007777777700000077777777777770777777777777777777777777
77777777777777777777777707777777777777700000777777777000000070077700070000007777777770000777777777777777777777777777777777777777
77777777777777777777777777777777777777770777777777777700000000777770070000077777777777000777777777777777777777777777777777777777
77777777777777777777777777777777777777770007777777777700000007777777000000777777777777007777777777777777777777777777777777777777
77777777777777777777777777777777777777770007777777777770000077777777000070777777777777000777777777777777777777777777777777777777

