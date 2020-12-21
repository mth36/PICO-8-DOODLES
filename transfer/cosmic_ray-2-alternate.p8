pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
t=0

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
	
	circ(x,y,1,c)
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
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeefeffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefefffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeefffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffefffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeefffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffefeffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeefffeffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefefefffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeffefeffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefeefffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeefffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefeeeffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeefefefffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefeffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeefefffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefefeeefffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefefeffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeefefefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeefeffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefffeefefefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefefeeeffeffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeefefffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeefeeeffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeefeeeefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeefeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeefefefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeefefefefeffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefffefeffeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefefffeeeefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeffffffffffffffffffffffffffffffffffeefeeeeefeeefff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeffffffffffffffffffffffffffffffffeeeeeeeeeefeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeffffffffffffffffffffffffffffffffeeeeeeeeeeeefffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefffffffffffffffffffffffffffffffffeeeefeeeeeeeeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeffffffffffffffffffffffffffffeeeeeefeeeeeeeffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeefffffffffffffffffffffffffffffeeeeefeeefefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeefffffffffffffffffffffffffffffffeefeefeeefeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeefeeefffffffffffffffffffffffffffffeeeefeeeeeefefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeffeeefffffffffffffffffffffffffffffeeeeeeeeeeeeffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeefffeffffffffffffffffffffffffffffffeeeeeeeeeeeeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeefeffffffffffffffffffffffffffffffffeeeeeeeeeeeeffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefefeffffffffffffffffffffffffffffffeeeeeeefefeefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefefefffffffffffffffffffffffffffffeeeefefefeeeeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeffeeffffffffffffffffffffffffffffeeeeeeeefeeeeeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeffeeeefffffffffffffffffffffffffffefeeeeeeeeeeeeefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeefffffffffffffffffffffffffffeeeeeeeeeeefeeefff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeefefffffffffffffffffffffffffeeeeeeeeeeefffefeff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeefeefeffffffffffffffffffffffffffffeeeeeeeeeefefefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeefeefffffffffffffffffffffffffffefeeeeeeeeeefeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeefffffffffffffffffffffffffffeeeeeeeeeeeffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeefffffffffffffffffffffffffeeeeeeeeeeeeefffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeefffffffffffffffffffffffffefeeeeeeefeeeeeefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeffffffffffffffffffffffffffefeeeeeeeeeeeeeefeff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeeeffffffffffffffffffffffffffeeeeeeeeeeeeeefefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeeeeefffffffffffffffffffffffffefeeeeeeefeeeeefffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeeeeefefffffffffffffffffffffffffefeeeeeeeeeeeffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeefefffffffffffffffffffffffffefeeeeeeeeeeefeeffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeeeefefffffffffffffffffffffffffeeeeeeeeeeefeeeefff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeefeeeffffffffffffffffffffffffeeeeeeeeeeefeeeefff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeeeeeefeffffffffffffffffffffffefeeeeeeeeeeeeeeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeeeefeeeffffffffffffffffffffffffeeeeeeeeeeeeeefffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeefeeeeeeeeefffffffffffffffffffffffeeeeeeeeeeeeeefeffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeefefffffffffffffffffffffefeeeeeeeeeefeeeeeeff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeefefefffffffffffffffffffffffeeeeeeeeeefeeeeeefef
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeefeefeeefefffffffffffffffffffffefeeeeeeeeeefeeeefeff
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeefffffffffffffffffffffffefeeeeeeeeeefeeeefff
ffffffffffffffffffffffffffffffffffffffeffffffffffffffffffffffffffffffffeeeeeeeeeeeeefffffffffffffffffffffffffeeeeeeeeeeeeeeeffff
fffffffffffffffffffffffffffffffffffffefeffffffffffffffffffffffffffffffefeeeeeefeefefefffffffffffffffffffffffeeeeeeeeeeeeeeefeeff
fffffffffffffffffffffffffffffffffffffeeffffffffffffffffffffffffffffffffeeeeeeeefeefefeffffffffffffffffffffffffeeeeeeeeeeeeeeefef
ffffffffffffffffffffffffffffffffffffefeffefffffffffffffffffffffffffffffeeefeeeeeeeeeefeffffffffffffffffffffffeeeeeeeeeeeeeeeeeff
fffffffffffffffffffffffffffffffffffffefeefefffffffffffffffffffffffffffefeeeeeeeeeeeeeefffffffffffffffffffffffeeeeeeeeeeeeeeeeeff
fffffffffffffffffffffffffffffffffffffeefeefffffffffffffffffffffffffffffeeeeeeeeeeeeeefffffffffffffffffffffffeeeeeeeeeeeefeeeeeef
ffffffffffffffffffffffffffffffffffffeeeeffffffffffffffffffffffffffffffefeeeeeeeeeeefeffffffffffffffffffffffeeeeeeeeeeeeeeeeeeeff
fffffffffffffffffffffffffffffffffffeeeeffffffffffffffffffffffffffffffffeeeeeeeeeeefefffffffffffffffffffffffeeeeeeeeeeeeeeeefefff
fffffffffffffffffffffffffffffffffefeeeefffffffffffffffffffffffffffffffefeeeeeeeeefefefefffffffffffffffffffffeeeeeddddeeeeeeefeff
ffffffffffffffffffffffffffffffffffeefeeefffffffffffffffffffffffffffffffeeeeeeeeeeefefefefffffffffffffffffffffeeeedddeeeeeeeeefff
ffffffffffffffffffffffffffffffffffefeeeefffffffffffffffffffffffffffffffeeeeeeeeeeeeeefefffffffffffffffffffffffdededddeeeeeeefeff
ffffffffffffffffffffffffffffffffeeeeeeeeeffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeeffffffffffffffffffffeffeddeddddddefeefefff
fffffffffffffffffffffffffffffffffeeeeeeeeefffffffffffffffffffffffffffeeeeeeeeeeeeeeeeffffffff8fffffffffffefefeddddddddddeeffffff
fffffffffffffffffffffffffffffffefeeeeeeeeeeffeffffffffffffffffffffffeeeeeeeeeeeedeefeffffffff8f8f8fff8ffffefededccddcddddeefffff
ffffffffffffffffffffffffffffffffeeeeeeeeeeefefeffff8fffffffffffffffffeeeeeeeeeededeefeffffffff88888f8f8ffffeeecdcbcccddddefeffff
fffffffffffffffffffffffffeffffefeeeeeeeefeeffeffffffffffffffffffffffeeeeeeeeeeeeddeeeeffffffff888888f88f8feeecdcbc9cbcddddffefff
ffffffffffffffffff888ffffffefffeeeeeeeeefefeefffffff8ffffffffffffffffeeeeeeeeedddeddefefff8ff888888888f8f8fedeabcbe9cccddddefeff
ffffffffffffffffff88888fffefffeeeeeeeeeeffeeeefffffffffffffffffffffffeeeeeeedddddddedefff8f8888888888f8f8fede9aabe9ecccddddeefff
fffffffffffffffff9d88888fcfffeeeeeeeeeefeefeeefffffff8ffffffffffffffffeeeeededdddedcdddeff8888888888888ddefeebabaae9acadddeeefef
ffffffffffffffff9a9dce8ecdcfefeeeeeeeeeeefefeeffffff8f88f8fffffffffffffeeeeededeedcecde8e88888888888888ff9dfaebbceabadabdedeeefe
ffffffffffffffffa9eddceedcdffeeeeeeeeeeeeefeeeefffff88888f8fffffffffffeeeeeeededdadc9dee8f8888888889888f9d9debbbbaeadadcddeeeee8
ffffffffffffffff8eceeeeeedf8deeeeeeeeeeeefeeeefff9f9888988ffffffffffffeeeeedeebbdeacce88889888889899988ed9febf8bcead8dffcceeeeef
fffffffffffff8f8eeeeeeeefeed8eeeeeeeeeeeeeeeefff8f889aa9888fffffffffffeeeedcdbbbeeeccdf8f9a98889899999ed9f8ff8f8aaa8dbffccceeeff
ffffffffffffff8eeeeeffefeeeedfeedeeeeeeeeeeeeffff88caaab98888ffffffffeeeeecdcbbcceac8fffbf9aa8a899a9a99f99ef8f89999bb8befccddfff
ffffffffffffffeeeeeeffeeeeeffcefe8deeeeeeeeeeeef8f88cab9b888f8ffffffeeeeeecc8eceed98bffffcafaaaaaa9a9af9fefeff9888998b88ddadddff
fffffffffffffeeeeeeefefefeffff8eddceeeeeeeeeeefff88cc8a88a888ffffffeeeeeedd888eade898bfecefafaaaaaa8ac8f9ceff8f8888a988dddacdfef
ffffffffffdfedeeeeeffeefeffff8bdba9edddeeeeeeeeafdccba8989a888fffffeeeeedddb8ca9a9988fefeeefc8aaababcecfcf8f8f888889a99bdacade98
fff9fffffdedeeeeeefeeeeefefffffbaf9dddddeeeeeeafaedbdc989aeb8f8fffffeeeeedbccdca99d8f8feeee9be8ff8feecbcffff8888888999babdadbd89
fffffe8f9edeeeeeefefeeefeffffffff9ccddddddc88dfaeeedddc9a8bcb9ffffffeeeedccbdc998f8d8fefeeedebfd8f8eabcbffeff8888888999bb8dbdbd8
fffff8e8f9eeeeeefefeeeffffffffff8cccc8ddd9e888fffeedddda8ecbcb9ffffffeedd9d9888888ffeffeeeeebfbf98eaecdfeefeff888888999babdebd8d
ffffff8f9fefeeeeefeefefffffffffff8cc8c8d9b988ffffeeeddedacccb9feffffdedddcaa898888fffeeefeec8bf999fccdddfeeffff88888899abaede8d8
ffffffeefffefeeeeefeefffffffffff8facc899b99f8ffffeeeeeeecccc8f8effefeded9aa998888f8fffefefccc8d99bceddddeffffff88888898aaaab8888
ffffffffffffefeeefeeffffffffffffff8ac9989998f8ffffeeeeeedcddf8cbfffeee8a8b999988f8fffffefedcbdddbccddddfeefffff888888898aabab88c
ffffffffffffffffffefeffffffffffffff88888899f8feffeeeeeeedddddcbcbbded8d8bab998888fffffefedeccdddddcddddeeeffffff8888888888ab88cc
fffffffffffffffffffeffffffffffffffff888888f8fffefeeeeeeeedddd8cbbfcded8faba988888ffffffeeeeedddddcddddeeeeefffff8f88888888888efc
ffffffffffffffffffffffffffffffffffff8888ff8ffeffefeeeeeeeeeddcadfcfc8f9ada988888ffffffffeeeeedddcdddeeeeeefffffffff8888888888fef
fffffffffffffffffffffffffffffffffffff8fffffffffffefeeeeeeeeedd8edfc8f889998888fffffffffefeeeeedddededefeffefffffffff8888888888fe
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeedddddedef8888888888ffffffefefefeeeeeeededefefeefffffffff8888888888fff
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeedddedefff8889888fffffffffefefeeeeeeeeedeeefefffffffffff8f88888888fff
fffffffffffffffffffffffffffffffffffffffffffffffffefeeeeeeeeeeeeeeff8f888888fffffffffffefefeeeeeeeeeeeeeeefffffffffff88888888f8ff
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeefeeeeeeff8f8888ffffffffffffefeeeeeeeeeeeeeeeefffffffffffff88888f8efe
fffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeeefeffff88f8ffffffffffffffeeeeeeeeeeeeeeefeffffffffffff8ffffefff
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeefeefffffff8fffffffffffefffeeeeeeeeeeeeeeeeffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeefeeffffffff8fffffffffffffefefeeeeeefeeefeeefffffffffffffffffffeffe
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeefefffffffffffffffffffffffefeeeeeeeeeeeefefefffffffffffffffffffffe
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeefeffffffffffffffffffffffeeeeeeeeeeeeeeeeefefffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeeeeeeeeeeffffffffffffffffffffffefeeeeeeeeeeeeeeeeeffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeeefefeeeffffffffffffffffffffffffeefeeeeeeeeeeeeeefffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffefeefeefeeeeeffeffffffffffffffffffffffffefeeeeeeeeeeeeffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffeffeefeeeeeeeeeefffffffffffffffffffffeffeeeeeeeeeeeeeffffffffffffffffffffffff
fffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeeeeeefeefffffffffffffffffffffffeeeeeeeeeeeeeefefffffffffffffffffffffff
ffffffffffffffffffffffffffffffffffffffffffffffffffffffeffeeeeeeffffffffffffffffffffffffffefeeeeeeeeeeeeefeffffffffffffffffffffef
fffffffffffffffffffffffffffffffffffffffffffffffffffffffffeeeeeffffffffffffffffffffffffffefefeeeeeeeeeeffeffffffffffffffffffffffe
ffffffffffffffffffffffffffffffffffffffffffffffffffffffffefeeeeeffffffffffffffffffffffffffefeeeeeeefeefeffffffffffffffffffffffffe

