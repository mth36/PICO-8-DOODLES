pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include vec.lua
#include maths.lua
#include poly.lua

points={}

function _init()
	t,dt,tf=0,1/30,0

	for i=0,7 do
		pal(i,i+8+128,1)
	end
	
	cls()
end

function _update()
	t+=dt
	tf+=1

	ct8=cos(t/8)
	ct16=cos(t/16)
	k=64 + 8*ct16
	refresh = rnd(1)<0.2
	height = 5 + sin(t/8)*3

	for i=1,1000 do
		local ox,oy=rnd(128),rnd(128)
		
		local x=ox-32+16*ct16
		local y=oy-32+32*ct16

		local ang=atan2(x,y,ox,oy)

		c=(dist(x,y,0,0)%k
		)/32 - t/2 + flr(ang*(6-sin(t/16))+t/3) + ang*(4+1*ct16)+t/3

		c=c%8+8
		local diff=c-flr(c)
		if diff<0.5+0.4*ct8 or (ang-t/32)%0.2<0.1 then
			c = c-8
		end
		
		circ(ox,oy,1,c)
	end

	cen = vec(3*cos(t/8),3*cos(t/8))

	if refresh then
		ang=rnd(0.1)+t/4
		r=rnd(8)+16
		points={}
		for i=0,1,rnd(0.15)+0.2 do
			local a=ang + i + (sin(t/8)+1)/2*rnd(1)
			local p = vec.frompolar(a,r+rnd(2)-1)
			add(points, p)
		end
	end

	polyf(points,vec(64,64+height)+cen,0)
	for i=1,height do
		polyv(points,vec(64,64+i)+cen,0)
	end
	polyv(points,vec(64,64)+cen,8)
end

-->8
function dist(x1,y1,x2,y2)
	return sqrt((x2-x1)*(x2-x1)+(y2-y1)*(y2-y1))
end
__label__
tttttttttctcscsrrrrrraraoppppppopppopp89999988888888888p8pppppppppppppppppppp9999999999999fffffofoooooooooooooooooooo88888888888
ttttttttttcccscrrrr9rra9ppppppopppoop8p89998888888888888p8ppppppppppppppppppp9999999999999fffffffooooooooooooooooooo888888888888
tttttttttttcccccrrpr9a9a9ppppopoooopop89o888888888888888888pppppppppppppppppp99999999999999ffffffooooooooooooooooooo888888888888
ttttttttttctcccrcrrr99appoppppoppooopooo8888o888888888888888pppppppppppppppppp999999999999ffffffffooooooooooooooooooo8888888888p
tttttttttttctcccrcr9r9pppppppopppproooooo88oo8o888888888888p8pppppppppppppppp9999999999cfffffffffffoooooooooorooooooo88888888888
ttttttttttttttctcrpr999pooopoooppooooooosooo888s888888888888p8cpppppppppttppp9p9999999cd9fffffffffffoooooooooososoooo8r888888888
tttttttttttttttctcrp999ofoooooooooooooososoo88888ss8sb8c888888cpcpppppptttpppp999999999dd9ffffffffffooooosoosoosoroo8o8888888888
ttttttttttttttuuctuo999fofooaooooooobsbososoo8s88srsr8c8c8c88cccpppppptptttttp9t9t9999999rffffffaffbooobooooossssosoo88s88888888
uutuuutttttttuueuueef9frrorqoboooobbbbobososss8ssrssss8c8c8888cccccpttpctttsttt9ttttt9tt99rfrfrbbbbbbbbobboossssosoos8ssr8888s8c
uuuuuuututteuuuuuueeefprrrqraobaqbrbbbbobbsrsssrrsssssssc8c88ccccccctcctctstttttttttttttdtrrrrbbabbbbbbbbbbbrbsssossssssss88sscc
uuuuuuuuuueueueuuueeo89prrrqqaqqbqbbbbbbbbbssssssrsssssssccccbccccctccccttttttttttsttttdtrrrrrbbbabbbbbbbbbsbsbssssssssssssssscc
uuuuuuuuueueeeeeueoo8op9pqqqqrqqrbbqbbbbbbbrsssrssssssssscccccccccbccccttttttstttttsttttdrrrrrrbbbbbbbbbbbbbbbsssssssssssssssscc
vuuuuueeeeeeeeveofooo99pqqqqrqrrqrrbarqbbbrrssssrssssrssrsccccccccccccctttttttttttttttttddrrrrrrbbbbbbbbbbbbsbssssssssssssssscsc
uuuuuuueeeeeeeeofofo8o999qqqqrqqrrqrrqrbbbrrssssrrsrssrrsssscccccccccctctttttttttttttttttdrrrrrrbbbbbbbbbbbbbssssssssssssssssssc
vuuuuueueeeeeeeeofooo89999qqqqqqqqrqqrrbbqqqsssssrrssssrrssccccccbcccccctttttttttttttttttrrrrrrrbbbbbbbbbbbbbrbsssssssssssssssss
uvevuvueeeeeevvveooo8889999qqqqqqqqqqqqrqrqrrsssssrrsssrrsssccccccscccctctttttttstttttttttrrrrrbbbbbbbbbbbbbrbsbsssssssssssssssc
vvveveveeeeevvvvooooo88899qqqqqqqqqqqqqqrqrrrrsssrrrsssrsssccccccccccscctstttttstssstttttrrrrrrbbbbbbbbbbbbbsbbsssssssssssssssss
vvveevvveeevvvvooooo8o899p9qpqqqqqqqqqqqqqqrrrrsrrrrrsssrssccccccbcbccccsttttttttssttstttqrrqrbrbbbbbbbbbbbbbbbssssssssssssrssss
vvevevvevevvvoooooooo89999qqqqqqqqqqqqqqqqqqqrrrrrrrrssrsrsrcbccbcccbcccctsttttttttttttttrrrrqrbbbbbbbbbbbbbbbbsssssssssssssssss
vvvevvvvevvoooooooooo8p99q9qqqqqqqqqqqqqqqqqqqrrrrrrrsrsssrsrcbscccccccccststttttttttttttrrrrrrrbbababbbabbbrbbssssssssssssssscc
vvvvvvvvvvvvooooooooo88889qqqqqqqqqqqqqqqqqqqqqrrrrrrrssrssrrrsbscccbcccsstttttsttttttstrrrrrrrrbbbabbbbbbbbbbbbrssssssssssssrsc
vvvvvvvvvvvvoooooooo8o888ppqqqqqqqqqqqqqqqqqqqqrrrrrrrrrsrrrrrrsbrbscbcrctsttttttttttstssrrrrrrrrbbaabbbbbbbbbbrbssssrsssssssssc
vvvvvvvvvvvoooooooooo8888pqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrsrsbrcrsssstttttttstqtrrrrrrrrarabbbbbbbbbbbrbsbsssssrssssssbs
vvvvvvvvvvoooooooooo8o888qpqqqqqqqqqqqqqqqqrqrqrrrrrrrrrrrrrrrrrrrrsrrsrsssssttttttttsttrrrrqrrrrababbbbabbbbbbrbssssssssssssssb
vvfvvvvvvvooooooooooo88888qpqqqqqqqqqqqqqqrqqqrrrrrrrrrrrrrrrrrrrrsrssssrssssttttsttsttsrrrqrrrrqbaabbbbbbbbbbbbrssrssssssssssss
vvvvvvvvvvoooooooooo888888pqpqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrsrrsrsrsststttttttsstqrrrrqrqrabbbbbbbbbbbbbbbsssssssrsssssss
vvfvvvvvvoooooooooooo88p8p8qqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrssrststssttttsqqrrrqrqrqbbbbbabbbabbbbbbbsssssssssssssc
fvfffvv8ovooooooooooop8pp8qqqpqqqqqqqqqqqrqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssstttssqqrqrrrqabbbbabbbabbbbsbbsssssssrrssssss
vfvfvf8v8oooooooopoopppppppqpqqqqqaaaqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrsssssssttsqrqrrqrrrabbbabbbbbabbbbbrssssrsssssrsssc
fvfvfvvoooooooooooooopppppppppqqqaaaaaqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssststrqrrrrrrqrrbrbabbbababbbrbrsssssssssssrss
ffvvvvovoooooooooooopopppppppppq99qaaaqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssssstsqrrrrqqqrrqraraqbabababrbrsssssssssssssrs
vfvfvvvoooooooooooopoppppppppqqpqqqaaaqqqqqrqqqrqrrrrrrrrrrrrrrrrrrrrrrsrrrsssssssssssqqqqrqrqqrqrqaaraqaqbararrrssssssssssssrss
fvfvvovoooooooooooppppppppppqqqqqqaqaaaqqqrqqqqqrrrrrrrrrrrrrrrrrrrrrrsrrrrsssssssssssqqqqqrqrqqrrrararaqaqrarrrrrsssrssssssrsss
ffvvovoooooooooooopppppppppppqqpqqaaaaaaqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssssssqqqqqqqrqrqrrrrqrqaqqarrrrrrrsssssssssssrss
fffooooooooopooooooppppppppppppqqaqaaaaaqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrssrsssssssssqqqqqqqrqqqrqqrqaqrqrqrrrrrrssrrrssssrsrss
ffovooooooopopoooppppppppppppqqqqqaa9aaaaaqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrsrsrssssssssqqqqqqqqqqqqqqqqrrqrrrqrrrrsrsrrsrsrrsrrbs
vovooooooooooopoppppppppppppqpqqqqaaaaaaaqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrssssssssqqqqqqqqqqqqqqqqrqrrrrrrrqrrrsrrrrsrsrrrrrb
fvopoooooooooooppppppppppppppqqqq9aaaaaaaaqqarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssqqqqqqqqqqqqqqqqqqqqrqrrrrrqrrrrrrrrrssssrrrrb
vopooooopooooopppppppp9pppppppqqaqaaaaaaaaaaaarrrrrrrrrrrqrrrrrrrrrrrrrrsrssssssssqqqqqqqqqqqqqqqqqqqqqqqrqrqqrqrrrrrrsrsssrrrbs
ooopooppopopopppppppppppppppp9aaqaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrsrssssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqqrrrrrrssssrrssss
pooopppppoppppppppppppppppp9p99aaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrsrsrsrsssss
ppoppppppppppppppppppppppppp9pa9a9aaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrsssssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrsrssrrssrs
pppppppppppppppppppppppp9pp9p99a9aaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssssssqqqqqqqqqqqqqqqqqqqqqqqqqrqqrqrrrrrrrsrsrrrrr
pppppppppppppppppppppppppp9p99999aaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqrqqrrrrrrrrrsrrrrrr
pppppppppppppppppppppppp9pp9p99999aaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrsrrrrsssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrr
ppppppppppppppppppppppppp99p9999999aqaaaararrrrrrrrrrrrrrrrrrrrrrrrrrrrrrssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrr
opppppppppppppppppppppp9p9999999999qaraaaarrrrrrrrrrrrqrrrrrrrrrrrrrrrrrrssssssqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrbr
pppppppppppppppppppppp9p9p999q999aaaaaaaararrrrrrrrrrrrrrrrrrrrrrrrrsrsrrrssssqsqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrb
ppppppppppppppppppppppp9p999q999aaaaaaaararrrrrrr888888888rrrrrrrrrrrrrrrrsqspsqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrqrrrrrrrrrrrrrrrrr
ppppppppppppppppppppppp9999999999aaaaqararqrrrrr8ooooooooo8888888888888888sppqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqrqrqrrrrrrrrrrrrrrrr
opppppppppppppppppppppp9999999999q9qqqrarrrrrrrr8ooooooooooooooooooooooooo888888888qqqqqqqqqqqqqqqqqqqqqqqqqrrqrrrrrrrrrrrrrrrrr
pppppppppppppppppppppppp99999999999qqrrrrrrrrrr8oooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrr
pppppppppppppppppppp9ppp999999q99999rarrrrrrrr8ooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrr
pppppppppppppppppppp9ppp99999999999qararrrrrrr8ooooooooooooooooooooooooooooooooooo88qqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrr
pppppppppppppppppppppppp9q999q9999q9rarrrrrrr8oooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrr
pppppppppppppppppppppppp999999999q9qqrrrrrrr8ooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrr
ppppppppppppppppppppppp9p99999999qqqqqrrrqr8oooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrr
ppppppppppppppppppppp9pp999q9q99q9qqqrrrrrq8oooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqrqqqqqqqrqrrrrrrrrrrrrrrrrrrrr
pppppppppppppppppppppp99999q9qqq9qqqqrrrqq8ooooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrr
ppppppppppppppppppqpppq99999q9qqqqqqrqrqq8oooooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrr
pppppppppppppppppqppppp9999q9qqqqqqqqrqqq8oooooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrr
ppppppppppppppppppppppppq9q9qqqqqqqqqqqr8ooooooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrr
pppppppppppppppppppppppqpq9qqqqqqqqqqqrro8oooooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrr
pppppppppppppqppppppqpqpq9q9qqqqqqqqqqqro8oooooooooooooooooooooooooooooooooooooooo8qqqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrr
ppppppppppppppppppppqqpqqq9qqqqqqqqqqqqrro8ooooooooooooooooooooooooooooooooooooooo88qqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrr
pppqppqpppppqqpppppqqqqqqqqqqqqqqqqqqqqrroo8ooooooooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrr
ppppqqppppppqpqqpqpqqqqqqqqqqqqqqqqqqqqqrqoo8oooooooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrr
ppqpqqqppppqqqppqpqqqqqqqqqqqqqqqqqqqqqqqrqo8oooooooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrr
pqpqpqpqpqqqqqpqpqqqqqqqqqqqqqqqqqqqqqqqqarao8ooooooooooooooooooooooooooooooooooo8ooqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrr
qpqpqpqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaraboo8oooooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrr
pqqqpqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaqabbbo8oooooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqrrqqqqrrrrrrrrrrrrrrrrrrrrrrrrrr
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqarabbbo8ooooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrr
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaqaqqaqqaraaaaboo8oooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrr
qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaqqqqaaaaaabb8bo8oooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqrqqqrrrrrrrrrrrrrrrrrrrrrrrrr
qoqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqaqqaqaaaabob989o8ooooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrr
oqoqqqqqqqqqqqqqqqqqqoqqqqqqqqqqqqaoqaaaao8b9999oo8oooooooooooooooooooooooooooooo8oqqqqqqqqrqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrr
oooooqoqqqqqqqqqqqqqqqoqqoqqqqqqoaoaaoaaoo8899999oo8ooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqrqqrrrrrrrrrrrrrrrrrrrrrrrrrr
ooooooqoooqqoqqqoooqoooqoqoqoqqoqooooaooo888999889o8ooooooooooooooooooooooooooooo8oqqqqqqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrr
ooooooooooooooooooooooooooooqooqooooooo8o8898989889o8ooooooooooooooooooooooooooo88oqqqqqqqqqrqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrr
ooooooooooooooooooooooooooooooooooooo8888898989899poo8oooooooooooooooooooooo8888oooqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrsrrrr
vooooooooooooooooooooooooooooooooooo8888888988p9899po8ooooooooooooooooooo888oooooooqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrsrrrrr
ooooooooooooooooooooooooooooooooo8o888888888888899999o8oooooooooooooo8888oooooooqqqqqqqqqqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
oooooooooooooooooooooooo8oooooo8888888888888888989999oo8oooooooooo888oooooooooqqqqqqqqqqqqqqqqqrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
oooooooooooooooooooooooooooooo88888888888888888898p999oo8oooooo888oooooooqqqqqqopaaqqqqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrr
oooooooooooooooooooooooooooo8888888888888888888888p9999o8oo8888oooooooqqoqqqqaqaaaaaqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
ooooooooooooooooooooooooooo888888888888888888888889p99q9o88oooooooqoooqqqqqqaqaqaaaaqqqqqqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
oooooooooooooooooooooo8o8o88888888888888888888p889p99q9qoooooooqoqqqqqqqqqqqqapaaaaaqaqqqqqrqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrr
oooooooooooooooooo8o8oo8oo8888888888888888888888p99pp9qpqooqqqqqqqqqqqqqqqqqaaaaaaaqaraqqqqqqqqqrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrrr
oooooooooooooooooo88ooooo88888888888888p888888899999qqqqqpqqqqqqpqqpqqqqqqaaaaaaaaaaqaqaqqqrqqqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
ooooooooooooooooo88o8ooo8o8888888888888888888898999qqqqqqqqqqqqpqpqqqqqqqaaaaaaqaaaaaqaqqqrqrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
oooooooooooooooooo88ooo88888888888888888888888p9p9qqqqpqqqqqqqqqpqqqqqqqqaaaaaqaaqaaaarrqrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr
oooooooooooooooooooooooo888888888888888888p8888p9ppqqpppqqpqqqqqqpqqqqqqaaaaapaaaaqaaaaarqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrss
ooooooooooooooooooooooo88888pp8888888888888p88p8pppqpqqpqpqqqqqqqqqqqqqaaaaqaaaaaaaaaaararqrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrrsrssr
oooooooooooooo8oooooo8888888888888888888888ppp8pppqpqqpqpqqqqqqqqqqqqaqaaaaaaaaaaaaaarrarqrrrrrqrrrrrrrrrrrrrrrrrrrrrrrssrrrsrrs
oooooooooooooooooooooo88o88888888888888888pppppppppqqqqpqqqqqqqqqqqqqqaaaaaaaaaaaraaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrrrrssr
oooooooooooooooooooooooooo8888p88p888888888pppppppqqqqpqqqqqqqqqqqqqaaaaaaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrsssss
ooooooooooooooooooo8oooooo88pp8888pp8pp888ppppppppqqqpqqpqqqqqqqq9aqaaaaaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrsrss
oooooooooooooooooooo8ooopo8p888888p8pppppppppppppqqqqpqqq9pqqqqqqaaaaaaaaaaaaaaaaaaraarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrs
oopoooooooooooooooooppopooo8p8888p8p8pppppppppppppqqpqqqqpqqqqqqaaaaaaaaaaaaaaqaaaraaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrssrsq
ooopopooopoooooooooooopoooop8pppp8p8ppppppppppppppppppqqqppqqqqa9aaaaaaaaaaaaqaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrsrsss
oopopoooooooooooooooppoppop8pppppppppppppppppppppqpppqqqpppqqqa9a9aaaaaaaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrrrrsrqp
opopoooopoooooooopopopppppppppppppppppppppppppppqpqppqqqppqqqq9a9aaaa9aaaaaaaaaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrsrpsrspp
poooooooopoooooopopoppoppppppppppppppppppppppppppqpppqqqpqaqq9a9aaaaaqaaaaaaaaaraarrrrrrrrrqrrrrrrqrrrrrrrrrrrrrrrrrrrrsrprpsppp
ooooooooooopooopoppppopopppppppppppppppppppppppppppqqpq99aqaaa9aaaaaaaaaaqaaaarrarrrrrrrrrqrrrrrrrrrrrrrrrrrrrrrrrrrrrrrsrprpppp
ooopopoooopopppopoppppopppppppppppppppppppppppppppq9qq9aaaaaaaaaaaaaaaaaqaaaaarararrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrprpppqp
oopppoppopppppppopppppppppppppppppppppppppppppppp9pqp9a9aaa9aa9aaaaaaaaqaaaaaaararrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrpppqppq
popppppppppppppppppppppppppppppppppppppppppppppppppp9aaa999a99aaaa99aa9aaaaaaarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrppqpqqq
opppppppppppppppppppppppppppppppppppppppppppppppppppaaaa99999aaaa9a9aaaaaaraarrrrrrrrrrrrrrrrrrrrrrrrbrrrrrrrrrrrrrrprprppqpqpqq
ppppppppppppppppppppppppppppppppppppppppppppppppppp99aa9999a99aaaa9aaaaaaaaqarrrrrrrrrrrrrrrrrrrrrbrbrbrrrrrrrrrrrrqrppppppqpqqq
ppppppppppppppppppppppppppppppppppppppppppppppp99p99999999a9a9aaaqaaaaaaarrarrrrrrrrrrrrrrrrrrrrrbqbbbbrbbrrrrrrrssrprpppppqqqqq
ppppppppppppppppppppppppppppppppppppppppppppp9p9999999999q9aa99aqaqaaaaararrrrqrrrrrrrrrrrrrrrrbbbbbbbrbbbbrrrrrrrpprppqppqqqqqq
pppppppppppppppppppppppppppppppppp99ppppp9p9pp99999999999aaaaa9aaqaqqaqaarrrrqrrrrrqrrrrrrrrrrrrbbbbbrbrbbrrrrrrrrppppqpqqqqqqqq
pppppppppppppppppppppppppppppppppp9pppppp999999999999999a9aaaqaqaaqaqqarqrrrrrrrrrrrrrrrrrrbrrbrbbbbbbrbbbbrrrrrrprppppqqqqqqqqq
pppppppppppppppppppppppppppppppppppppp9p999999999999999q9a9aqaaaqqaqqqrrrrrrrrrrrrrrrrrrqbbrrbrbbbbbbrbrbbbrrrrrprppppqpqqqqqqqq
ppppppppppppppppppppppppppppppppppppp99999999999999999999999aaqaqqrqqqrrrrrrrrrrrrrrrrrrrarrrrbbbbbbbbrrbbrbrrrppppppppqpqqqqqqq
pppppppppppppppppppppppppppppp999pp99999999999999999999999aq9qaqaaqrqrqrqrrrrrrrrqrrrrrrrrrbrbbbbbbbbrrbrbbrbrqrppppppppqpqqqqqq
ppppppppppppppppppppppppppppp9p9999999999999999999999999aaqaa9aaaqaqrqrqrqrrrrrrrrrrrrrrrrbrbbbbbbbbbbbrbbrbpbrpppppppqppqqqqqqq
ppppppppppppppppppppppp9ppppp99999999999999999999999999a9aaaqaaaaaqrqrrrqrqrrrrrrrrrrrrrrbbbbbbbbbbbbbbbbrbrbp9pppppppqqqqqqqqqq
ppppppppppppppppppppppp9p9pp9999999999999999999999q9q999aqqqaqarrqrqrrrrqrrqrrrrrrrrrrrrbbbbbbbbbbbbbbbb9b9pp9p9pqpppqqqqqqqqqqq
pppppppppppppppppppppp9p9pp999999999999999999999999qq99aq9aqqrrqrrqrrrrqrrrrqrrrrrrrbrbbbbbbbbbbbbbbbbbbb9p9999qqppqpqqqqqqqqqqq
pppppppppppppppppppppppppp9p999999999999999q9999q99999aqaaqarqrrrrrqrrqrrrrrrrrrrrrrrbbbbbbbbbbbbbbbbbbbb999999qqp9pqqqqqqqqqqqq
ppppppppppppppppppp9ppp9p9p999999999999999q9999q999999qaqqaqrrqrrrrrqqqqrrrrrrrrrrrrrrbbbbbbbbbbbbbbb9bb99999999p9p9qqqqqqqqqqqq
pppppppppppppppppppppppp99p9999999999999999q999qq999qq9qqqqrqqrrrrqrqqqrqrrrqrrrrrrrrrbbbbbbbbbbbbbb9b999999p999999qqqqqqqqqqqqq
ppppppppppppppppppppppp9pp9p9999999999999q9999999q9q9qqqqqqqqqqrrqrqqqrrrqrrrarrrrrbrbbbbbbbbbbbbbb9b99999999p999q9qqqqqqqqqqqqq
ppppppppppppppppppppp99pppp999999999999999q99999q9q9qqqqqqqqqqqrqrqrqrrrrrrrrrrrrbrbbbbbbbbbbbbbb9999999999999qqq9qqqqqqqqqqqqqq
pppppppppppppppppppppp9ppp99999999999999999q99qq9qqqqqqqqqqqqrrqrqrqrrrrrrrrrrrrbrbbbbbbbabbbbbb999999999999qq9qqqqqqqqqqqqqqqqq
pppppppppppppppppppppp9pp9p9999999999q9999q99qqqqqqqqqqqqqqqrrrrqrqrrrrrrrrrrrbrbbbbbbrbrbabbbb9999999999999q9q9qqqqqqqqqqqqqqqq
pppppppppppppppppppppppqpp9999999999q9q99999q9qqqqqqqqqqqqqqqrrqrqqrqrrrrrrqabrbbbbbbabpbrbbbbp9999p999q99999q9qqqqqqqqqqqqqqqqq
