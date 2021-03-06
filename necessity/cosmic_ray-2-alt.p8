pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
t=0

function palmix(bits, region, length)
	if bits==nil then
		memset(0x5f70, 0, 16)
	else
		memset(0x5f70 + region, bits, length)
	end
end

for i=0,7 do
	pal(i+8,i+8+128,2)
end

poke(0x5f5f,0x10)
palmix(0b00110011,0,16)

::♥::
t+=0.016

for i=1,1500 do
	x=rnd(128)
	y=rnd(128)

	c=sin((x-t*50)/40) 
			/ cos((y+0.3*sin(x/30-sin(y/120))*5+sin(x/87+y/86+t%1)*4+24)/50) 
			/ 20*x/32 
			- t*1.5
			+ y/128
	c=c%8+8
	--c=flr(c%2)==0 and 7 or 0
	
	if c-flr(c)<0.5 then
		fillp(0b1010010110100101)
	end
	
	circ(x,y,1,c\1 + 16*(c\1-1))
	fillp()
end
flip() goto ♥
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8ffffffffffffffffffffefff
fffffffffffd9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeecffffffff8f8f88ffffffffffffffffff
ffffffffffdfd9ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeececeffffc8f88888888ffffffffffceffe
fffffffff8fdffffffffffffffffffdffffffffffdffffffffffffffffffffffffffffffffffffffffffffffffdf9eece8ffffec888a88888ffff8ffff98cdee
ffffffffffffffffefffffff8ffbfdedff8ffffffffffdfffffffffffffffffffffffffffffffffffffffffffdfd999fffffffcfeead8d888ffa888fffb9efee
fffffffff8fffffffffffffffefeffdee8eefefffffffffffffffffff8fffffffffffffffffffffffff8fcfaffdff98ffffffffeeeeed8ebd8d8888feffe8efe
ffffffffffffffffffffffffffefffffffefefefffffffffffffffffffffffffffffffffffffffffff8f8fcf8cfffffffffffffffeedeeddbdfdfefefef8e8d8
fffffffffffffffffffffffffffffffffffefeaffffffffffffffffffffffffffffff8fff8fffffffff8fcfffffffffff8ffffffffeeedfededfefefefff88bd
fffffffffffffffffffffffffffffffffffffafaffffffdffffffffffffffffff8df8f8f8f8ffefffff8fffffffffffffffffffffffeffeffffffeffffff8b8b
ffffffffffffffffffffffffffffffffffffffffffffffffffffeffff9efff9f8d8d88eff8ffefffff8f8fcffffffffffffffffffffffffffffffffffffff8b8
ffffffffffffffffffffffffffffffffffffffffffedffefffeefeee9e9ffffcf8d8dedefefffefffff8ffffffffffffffffffffffffffffffffffffffff8f8a
fffffffffffffffffffffffffffffffffffffffffffdaefefefeeffef9ffffcffe8e8defffefffffffffffffffffffffffffffffffffffffffffffffffffff88
ffffffffffffffffffffffffffffffffffffffffffffdaefffefffffffffffffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8ff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffff8ffffffffffffffffffffffffffffffffffffffffffffffffff8fffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8fff8ffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffcff8fff8f8988f8ffffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefecfc8fffff899988f8fffffffffffffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8ffffffffffffefe88cfdfffffdfeefc88affffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffff8fff898ffffffffeefbe8888ffffffffefecfca8efffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffff8888ff989fffffdfdefef8a88ffffffffffeffcd8edef8ffffcfdfffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffff8fffff8f88fff9ff8ffafd8effb88fffffffffffffffdddfef8d8fffffffffffffffffffffffffffff
ffffffffffffffffffff8fef8fbfffffffffffffffffffff89f8f8fff8fff8efaf888f8f88fffffffffffffffffdfffed8dffffffffffffffffffffff8fff8f8
fffffffffffffffffffffefefbfbffffffffffff8fffff889f9f8ffffffffef9fff888fff8ffffffffffffffffffffff8d8efefffffffceffedffffeff8f8888
fffffffffff8ffffffffffe888fa8fffffff9fffffffff88f9ffffffffffffffffff8ffffffffffffffffffffffffffff8efefffffebbeceecebffefeff88888
ffffffffffffffffefdfffffffafa88ffff989f9f8f8ff88ffffffffffffffffffffffffffffffffffffffffffffffff8efe888fcecfebebc9c8beceffff89a8
fffffffffffffffefdfdfffffffaff8fff9f9f9ffffffaffffffffffffffffffffffffffffffffffffffffffffffffffffe88fa8acfafeb9bc988c88ffffeada
fffffffffffffffffffffffffffff8f8fff9ffffffffaffffffffffffffffffffffffffffffffffffffffffffffffffffffffffa88a9899b99888f88fffffeff
ffffffffffffffffffffffffffff8f8ffffffffffffffffffffffff8fffffff8ffffffffffffffffffffffffffffffffffffffff889898998888ffffffffffff
fffffffffffffffffffffffffffff8fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8f8898888888f8fffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff888888888888ffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff88888888888fffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffff8f8fffffffffffffffffffffffffffffffffffffffffffffffff88888888ffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffff8ffffffffffffffffffffffffffffffffffffffffffff8ffff8fff88888ffffffffffffff
fffffffffffffffffffffff8ffffffffffffffffffffffffffffffffffffffffffff8fffffffffffffffffffffffffffffffffff8ffffff88fffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffff8fffffff8fff8ffffffffffffffffffffffffffffffffff8ffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8f8ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8f8fff8ffffffffffffffffffffffffffffff8ffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffff8fffffffffffffffffffffffffffff8f8f8ffffffffffffffffffffffff8fffffffffffffffffffffffffffffff
ffffffffffffffffffffff88ffffffffffffffffffffffffffffffffffffffffffff8f8f8ffffffffffffffffffffffff8ffffffff8ff8ffffffffffffffffff
ffffffffffffffffffffffff8ffffffffffffffffffffffffffffff8f8f8f8fffffff8f8f8f8ffffffffffffffffffffffff8fff88f88ff8ffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8f8f8fff8ff88f88fffffffffffffffffffffffff8f88fff8f8f8fffffffffffffff
ffffffff8ffffffffff8ffffffff8fffffffffffffffffff8ff98fff8cfff888f8f8888f888fffffffffffffffffffffffff8f8ffffff8f8888fffffffffffff
ffff8ffffffffffff8f8fffff8f8ffffffffffffffff8ff8888a888888cf8ff8888888888888fffffffffffffffffffffff8f8f8ffff8f888888ffffffffffff
ffffffffffffffffffffffffff88ffffffff8f88fff8f88e8898a88888fffff88889888888888fffffffffffffffffffffff8f8f88f8f88888888888fffffffe
fff8ffffffff8ffffffffffff8888f88f8f888888ff888f8888888f888fffff888889888888888fffffffffffffffffffff8f8ff8888888888888f88ff8ffe8f
fffffffffffffffffffffff88f888888ff8f9ff8ff8f8f8f88f88fff8fffffff88f9888e9888888ffffffffff8fffffffffffffff888888888888cfcf8f888e8
8ffffffffffffffffffffffff8f8888ffff8fffffff8f8f88f8f8fffffffffffffff8e89e98b8888ffffffffffffffffffffffff888888888888ffcff8f8f888
f8f8ffff8fffffff8f8ffffeff8fffffffffffffffffff8f88ff8fffffffffffffffe8ee99b888888ffffffffffde8fffff8fff88888888b8f8fcf9f8f8f8f88
8f8f8ff8f8fffff8f8ffffffe8fffffffffffff8fffffff8f8f8fffffffffffffffffefff89e88888ffffffdffdecd8ffffff888888ed8eefffffffff8f8f888
fff8ffff88ffff888fffff9fffffffffffffff8fffffff8f8f8f8ffffffffffffffffffffff988888ffd98cbd9cc8c8ff8ff888888efefeefffffffff8f88888
ffffffff8fafaf8fffffffffffffffffffffffffffffff8ff888ffff8f8ffffffffffffffffff88888b98c8c88c8c8888ff8fffeeffefffeffffffff8f8f8888
fffffffff8faf8fffffffffffffffffffffffffffff8fff8f8f8fffff8ffffffffffffffffffeff88f9b88c888898888888fffffffffffffffffffff88fff888
fffffffffff88ffffffffffffffffffffffff8ffffffffff8f8f8ffffffffffffffffffffffffffff8f88888888888888f8fffffffffffffffffffff88fff888
fffff8ff8f8f8fffffffffffffffffffffffffffff88fff888fffff8ffffffffffffffffffffffff8f8888888888888888ffffffffffffffffffffff8f8f8f88
fff88f88fff8f8fffff8f8fffffffffffffffffffff88f8f8ffff8fffffffffffff8fffff8fffffff8f8888888888888888fffffffffffffffff8ffff8f8f888
8f8ff8f8ffff8ff8ffff8f8fffffffff8ff8ffffff8888f8f8ff8ff8ffffffffffffffffff8fffffff8f88888888888888ffffffffffffffffff8fff8f888888
f8ffff88fffff8fffffff8ffffffffffff8ffffffff8888f8f88888f8f8ffffffffffffffff8f8fff8f8888888888888888ffffffffffffffffffff8f8f88888
8f8ff8f8ffff8ff8ffff8fffff8ffffffff8ffffff8f8f8888888888f8f8ffffffffffffff8fff8f8ff888888888888888ffffffffffffffffffffff8f8f8888
f8888f8f8ffffffff8fffffffff8fffffff88ffff8f8f8f88888888f8ff8fffffffffffff8fffff8ff8f888888888888888f8ffffffffffffffffffffff8f888
ff88fff8ffffffff8ffff8ffff8fffffffff88ffff8f8f8f88888888f88ffffff8ffffffffffff8f88f88888888888888888f8ffffffffff88ffffffffff8888
ff88ffff8fffffffffff8f8fffffff8ffff8f8fff8fff8f88888888888ffffffff8ffffff8fff8f8f88888888888888888888fffffffffff8f8fffffffff8888
f8888ff88ffff8f8ffff8ff8f8fff8ffff8f8f8f8ffff88888888888888fffff8fffffff8fffffff88888888888888888888fffffffffff8fffffff8fff88888
888ffffff8ff8f8f8fffffff8f8f8ffffff8f8f8fffff88888888888888f8ffff8ffffffffffffff8f8888888888888888888ffffffffffffff8ffff8f888888
88ffffff8ff8f888f8f8ffffff88f8ffff8f88fff8ff8888888888888888ffff8ffffffffffffff8f8ff8888888888888888f8fff8fffffffff8fffff8888888
88fffff8888f88888888ffffffff888ff8f8ff8f8f888888888888888888fffffffffffffffffff8fff8f8888888888888888fffff8fffffffff8fff88888888
888fff88888888888888ff88fff8f8ffff8ffff88f8888888888888888888fffffffffffffffffffffff88888888888888888ffffffefffafffdfdf888888888
8888f8f88888888888ff8f8ff88ffefffffffff8f8f8888888888888888888f8ffffffffffff8fffff8888888888888888888fffffffefa9afdfdfd888888888
88888f88888888888f8ff8f888888ff9ffffff8f8f888888888f888888888f8ffffffffffffff8ffff888888888888888888f8fefffefd8a998d9d88b8888988
8888888888888e8ff8f8888d8888889f9ffffff8f888888898f8f888888888f88fffff8fffff88fff8f888888888888888888fefe89e88889888888888889998
888888888888efe8ff8f88888888888988ffffff88888889a98f88888888888f88fffffffff8ffff8f88888888888888888888ee89888888888888888aff9ebe
888888888f88feff88f888888888888888888888888f8ccf9af88f98888888f8ffffffffff8ffffff888988888888888e8f88888888c8888888888888ffffbeb
88888888fff88f888888888888888888888888888fffcfccffff89f9888888fffffffffff8fffffff88d89bf88f8e89e9f8f88e88888888888888888f8ffefbf
88888ff8fff8888888888888888888888888888888fffc8fff88f89898888f8fffffffffffffffffffdfdbffff8ffe89fff9898888888888888888888f8ffeff
88e8ff8f8f888888888888888888888888888888888ffff8f88f8f8ffd8888f8fffffffffff9b8fff8fdfffffeffeffffffff888888888888888888888ffffff
88888888888888888888888888888888888888888888ff88f888f8ffffdffc8fffffffffff9b8b888888ffffef8fffffffff8f888888888888888888888fffff
88888888888888888888888888888888888888888888888f8f888ffffdfececefaffffffe8e9b888888ffffffff8ff8ffff8f88888888888888888888888fff8
888888888888888888888888888888888888888888888888f8888ffff8effcefa8afdafa8e8f888888ff88fffffffffffff8888888888888888888888888ffff
88888888888888888888888888888888888888888888888888888ff8f88f8ff88a8898a8888888888888888ffffffff8f888888888888888888888888888ffff
8888888888888888888888888888888888888888888888888888ffffff88f88888898888888888888888888ffffffffff88888888888888888888888888f8fff
88888888888888888888888888888888888888888888888888f8ffffff88888888888888888888888888888f8ffffffffff8888888888888888888888888ff8f
888888888888888888888888888888888888888888888888888f8f88f8f88888888888888888888888888888f8f8888fff8f8888888888888888888888888fff
888888888888888888888888888888888888888888888888888888888f88888888888888888888888888888888888888f8f8888888888888888888888888f8f8
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888f888f8888888888888888888888888888888f8f
8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888fff8f8ff88888888888888888888888888888888
8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888fff8fffff8888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888f8f8fff88888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888f8f8f8888888888888888888888888888888
8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888fff8ff8888888888888888888888888888888
888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888ffffffff888888888888888888888888888888
8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888fff8ff8888888988888888888888888888888
8888888888888888888888888888888888888888888888888888888888888888888888888888888888888888fff8f8ff8feff888888888888888888888888888
888888888888ff88888888888888888888888888888888888888888888888888888888888888888888888ffffeff889efeffffe8888888888888888888888888
888888888888f88888888888888888888888888888888888888888888888888888888888888888888888fffeefe8f989888ff8fc889888888888888888888888
888888888888898888888888888888888888888888888888888888888888888888888888888888888888dff8ee888898888888f8d98d8898888888888a88f88f
888888888888989f888888888888888888888888888888888888888888888888888888e8988bdff888888d8888888888f888888e8998f9898888888888af8fff
8888888888888988f8f88888f889889888888888888888888888888f8888f8888f8c8e8e88fdfdffa888e8888888888888888888c89f9988d888888888ffffff
8888888888888888898f888888989f888888888888888888888888f8f88f8898f8f88cefff8fdff8f8888888888888888888888c8cdb989b898ca99888ffffff
888888888888888898f8888f8f888ff88f9888888888888888888f8f8888888f8ff8fffffff88888888888888888888888888888cdbff9ef999a9a9988fffbff
888888888888888888888888f888f8ddd99888888888888ff88cf8f8e88888888f8f8ffff88888888888888888888888888888888bfbfefef9fca99888ffffdf
88888888888888888888888888888ffddf8988888888f88fffcf8f88d888888888f8f88888888888888888888888888888888888ffbfffefffffff88898fddfd
88888888888888888888888888888f8ff8f88c888fff8f8ffff8888888888888888f8888888888888888888888888888888888888f8ffffffffff8f8889daddc
888888888888888888888888888888ff8f8ff8cf88f8f8f8888988888888888888888888888888888888888888888888888888888888ff8f8fff8f8f889ada9b
88888888888888888888888888888888f88f8f88f88f888888888888888888888888888888888888888888888888888888888888888888888ff88ff88888a999
888888888888888888888888888888888888f888888888888888888888888888888888888888888888888888888888888888888888888888f8fff8f888888998
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888ff88f8888888889
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

