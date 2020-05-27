pico-8 cartridge // http://www.pico-8.com
version 21
__lua__
function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end
function show_cpu(c1,c2) cp=flr(stat(1)*100) rectfill(0,0,12+4*#(tostr(cp)),6,c2) print("∧"..cp.."%",1,1,c1) end
function nsin(a) return (sin(a)+1)/2 end
function ncos(a) return (cos(a)+1)/2 end
function tan(a) return sin(a)/cos(a) end
function drw_mouse(x,y) spr(255,x,y) end
poke(0x5f2d, 1)--enable mouse
p={}
for i=1,#p do
	if p[i]~='' then
		pal(i,p[i],1)
	end
end

░=1000
dt=0.0333
t=0

cls()
::♥::
t+=dt
mx,my=stat(32),stat(33)

for x=0,128,8 do
	for y=0,128,8 do
		n=4*sin((x+t*16)/128)
		 +4*sin((y+sin(t/8)*64)/64)
		 +t*6
		
		n=n%26
		
		mset(x/8,y/8,n)
	end
end

for i=1,1000 do
	x,y=rnd(128),rnd(128)
	
	ms=mget(x/8,y/8)
	
	sx=8*flr(ms%16)+x%8
	sy=8*flr(ms/16)+y%8
	c=sget(sx,sy)
	
	circ(x,y,1,c)
end

--show_cpu(10,0)
--drw_mouse(mx-1,my-1)
flip() goto ♥
__gfx__
777777770000000000000000000000000007000000000000000000000000000070060076077777707d7d7d7d0777770007770777777777777777777700000000
77777777000000000000000000070000000760000000000000000000000000006700076070000007670707070077700777777777777777777777777700000000
777777770000000000000000000000000007d0000000000000000000000000000670760070677607707070767007007777d77706777777777777777700000000
77777777000000000000000000000000777007700000000000000000000000000067600770700707670707077700077777777777777777777777777700000000
777777770000000000000000070006000d000d0d0000000000000000000000007006007670700707707070767770007707770707777777777777777700000000
77777777000000000000000000070000000700000000000000000000000000006700076070677607670707077700700777777777777777777777777700000000
77777777000000000000000000070000000700000000000000000000000000000670760070000007707070767007770007770777777777777777777700000000
777777770000000000000000000000000000d0000000000000000000000000000067600707777770d7d7d7d70077777077777777777777777777777700000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000077777700000000000777700070007700000000070d06070700000777007007707700770770000770000000000070000000000000000000000000000
00000000700000070060707007000000707070700007000000000000770007707700077077707760777007770700070000076000000000000000000000000000
000000007067760706070d007060060707000600000700007070707007707700077077000670760007777770007d70000007d000000000000000000000000000
00000000707007070075706070077607000000000006000000000000007770000077700700000000007777000007d0007776d770000000000000000000000000
000000007070070707070700700770070700070007000600600670700007770070070077070007000077770000707d000d676d0d000000000000000000000000
0000000070677607007060707060060770707d700007000000000000007707707700077077707d70077777700700060000076000000000000000000000000000
00000000700000070d070700070000700700070000070000707070d0077000770770770077600700777007770000000000070000000000000000000000000000
0000000007777770000000000077770000000000000000000000000077000007007770070600000077000077000000000000d000000000000000000000000000
00000000000000007d7d7d7d77000077707770776777776607070767077777000077700777777777007777000000000077700777000000000000000000000000
0000000000000000670707077077770706070707777d777777777777007770070770770070677007000770000000000077600677000000000000000000000000
00000000000000007070707606077060607700d77770777707d70706700700777700077070077007700000070000000070700077000000000000000000000000
000000000000000067070707076006707777077776d0d67777777777770007777007007777777667770000770000000000006000000000000000000000000000
000000000000000070707076076006707677706777707777077d0707777000770077700777777777770000770000000000000000000000000000000000000000
0000000000000000670707070607706007070607777d777777777777770070070770770070077000700000070000000077600d66000000000000000000000000
000000000000000070707076707777077007707777767777070707d7700777007700077070067007000770000000000077600767000000000000000000000000
0000000000000000d7d7d7d7770000777777776d6777777677777777007777707007007777777d77007777000000000077d00770000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000007770077702000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000776006772a200000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000707000772aa20000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000060002aaa2000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002aaaa200
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077600d662aa22200
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077600767022a2000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000077d0077000000000
__map__
0000000000000000000000001100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000131313001313131313130000001b1b1b1b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000001313262626262626131317001b1b1b1b1b1b001b1b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000013001313262626262623232317161b1b1b1b1b1b001b1b000000001b1b1b1b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000001313132626261623132323232222231b1b1b1b1b1b1b321b1b1b000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000131326262626162313232323242424241b1b1b1b1b1b1b21000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000131326262626232323232323242424241414181b1b24000000000000000000023c3c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000262623162323232323242424241919241b1b000000003c0000000000000003000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000026261723232323232324242424191924191b2400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000262626262626232323242424241919151c1b0000000000000000010000000000000000000000000000000000000000000000000000000000000000000800080800080808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000262600000000262424242424241915151b1c000000000000000000000000000300000000000000000000000000000000000000000000000000000000080000000000000000080800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000019191924241515151c1c1b0000000000000000000101010505000000000000000000000000000000000000000000000000000008000000000000000000000808000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000191914241515151c1c1b29002a00000007001c01011c1c0000000000000000000000000000000000000000000000000000000800000000000000000000000800080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000001a2c2c1c1b1a2c2c2c2c1b1c1c1c1c1c1c1c1c000000000000000000000000000000000000000000000000000000000008000000000000000c000800080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000001a1a1a1a2c2c2c1a2c2c2c1c1c1c1c1c1c1c1c1c1c00000000000000000000000000000000000000000000000000000008000800000000000b090d0c0f0e0e080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000002c2c2c2c2c2c2c2c1c001c1c1c1c1c1c0000000000000000000000000000000000000000000000000000000000080008000000060e0e0c0d0d0e2d0d0d0d0d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000001c1c1c1c1c00001c001c00000000000000000000000000000000000000000000000000000000000008000800000006062d2d2d2d0a0a2d2d2d2d0d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000001c00000000000000000000000000000000000000000000000000000000000000000000000000000000000008000a0c0e2d0e2d0a0a0a0a1d1d2d0d0c0b0b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000808110e030e2d2d2d0a0a0a1d1d1d2d0d0b0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001111032d2d2d2d0a0a1d1d1d1d2d2d0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d2d2d2d2d0a0a1d1d1d1d2d2d0b0b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d2d2d00000a0a1d1d1d2d2d0b0b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0a1d1d2d2d0b0b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
