pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--sketch
--micheal @???

#include _vec.lua

function _init()
	dt=0.01
	t=32*flr(rnd(100))
	tf=0

	pal({
		7,
		7+128,
		10,
		10+128,
		11,
		11+128,
		3,
		3+128,
		1,
		1+128,
		1+128,
		1+128,
		1+128,
		1+128,
	},1)

	cls(14)

	r = 90
end

function _update()
	
	t+=dt
	tf+=1
	st8 = sin(t/4)
	ct8 = cos(t/4)
	ct12 = cos(t/9)

	--BLUR
	for i=1,150 do
		local x,y=rnd(126)+1,rnd(126)+1
		local c = 0.5 + (boxblur(x,y,4))
		circ(x,y,1,c)
	end

	-- CASCADE
	for i=1,100+30*ct12 do
		local x,y=rnd(r*2)-r,rnd(r*2)-r

		xf = (x*st8 - y*ct12)/4 + 40*cos(t/6)
		yf = (x*ct12 + y*st8)/4 + 40*sin(t/6)+t*8
		yf=yf%128

		if not(xf<-64 or xf>64 or yf<-64 or yf>64) then
			
			local c=sin(x/64 + xf/64)+sin(yf/128)-sin(y/64 + t/4)
			c=c%(t*2) + 2*t
			c=26*abs((c/16%1)-0.5)+1
			c=c%14+1 -- [1,14]
			
			circ(xf+64,yf+64,1,c)
			circ(128-(xf+64),128-(yf+64),1,c)
		end
	end

	
end

function boxblur(x,y,width)
	sum=0
	count=(width*2+1)*(width*2+1)

	for xa=x-width,x+width,1 do
		for ya=y-width,y+width,1 do
			sum=sum+pget(xa,ya)
		end
	end

	return sum/count
end
__label__
h777nannnnnannnaanaaaaaaaaaqaaaabaaqqaqqaaaaqaannannnnnnnnnnnj3jb3b3ahhh11j33j33331rhhhhhhhqhhbhhh11b3hhhrhrh3hh1hhh1hhhhh1hhhhr
77777nnnnannanannanaaaaaaaaaqaaaaqaqaqaaaaaqaannaaanaananannn3qb3b33hhhh1j3j333331rhhhhh1hhhhjhhh31hrbhhhh133hh1h1h111hhh1h1hhbh
7777nnnnanaaaanaanaqaaaaaaaqqqaaqqqqqaqqaqqaqqaaaaaaaaananannqbqb33hhhh1h1j3333133hhhhh1h1hhhhh1hjhrhrrhh11h3hhhj1j111hjhjhh1h3r
7nnnannaaaaaaqaaaaqaqqababqqbqbbbbbqbbqqqqbqqqqqaaaqaaaananqjbqb3jjhhhhh1jjj331313jhhjhh1hhhhh1hh3hhr1hrj1hhh1hj1j1h1hjhjh11h3h3
nnnnaaaaaaaqqaqqbbbqqqqbbqbbqbrbbbbbbbbqqbqbqqbqqqqqqaaqqqqjbjbjjqjjhhhh1jjj3131rjjhhhhhhhhhhhhhhh1h1hhhhhhhh111j1j3331hhhhh1h3h
nnnnaaaaqqqqqqbbbbbbbqbbbbrrbrrrrbbbbbbbbbbbbbbqqqbqqqqqqqbbjbrrjj3hhhhhh1j1131hrjhhhhhhhhhhjhhhhhh1hhhhhhhhh11h3j33333jhhhhhhhh
nnnnnaqaqqqqbqbbbbbbrbrbbrrr3rrr3r3rrbrrbrbbbbbbqbrbqbqqqbbbbrbr3jhhhhhhhj1jj1hhhhhhhhhhhh1jjjh1h1hhjhhhhhhh1j11h33333jhjhhhhhhh
nnnnaaaqqqbqqbbrbbbrrr33rrr33333rjr33r33rrrbrrrbrbbbbbbbqbbbr3r3jjjhhhhhh1jjj3hhh1hh1hh1h1hjjh1h1h1hhhh1h1hhjjjhjhr3j3hjhhhhhhhh
nnnaaaqqqqqbbbrbrrrrrr33333333j333jj333r3r3rrrrrbrrbrbbbbrrr3rr3jjj3hqhh1j3jr1hh13111113jh33j1h1h1h1hhhhhhhhjjjj3jjj3j3h1hhh1hhh
nnnnaqqqqbbbbrbrr333r3333j3j3jjj33333333r333r3rrr3rrbrbbrrrrrr333j3h1hhhh1jrjh1hh111113j3333311h1h1hhhhhhhhhhjj3r333j3j1h1hhh11h
nnanqqbbbbbbrrr3r333j333j3jjjjjjj3jj33jj33333r33333rrrrrrrr3b3333rh111hh1j1rrrhhhhh111j3jr3333h1h1hhhhhhhhhh1j1r33j33r11hhhh111h
nanaqqqbbbrrrrrr333j3jjjjjjjjjjjjjjj1jjjjj3j3333333r3r3rrrr3333333r111hhj1jjj1hhhhhh1113rrr33jjh1hhhhhhhhhhh1jjj3j3jrrrh3hhhj13q
nnaqqqbbrrrrrr33j3j3jjjj1j1j1j11j1jjj1jjjjjjjj333333r333333r3r333j1111hh1j1jjj1hhhhh113jrrrrjrj1hhhhhhhhhhhhjjj3j3j3rrrjhj1hh3h3
nnnaqbbbbrrrr3jj3jjj1jj1j1j111111j1j111j11jjjjj333j333333333r333j3j11hh1j1jjj11bh1h1jj33rrr1rj311hhhhhhhhhq1hjjj1j33bjjrjjh1hh3h
anaaqbbbbbrr333jjjj1j111111h1111111111111111jjjj3j3333333333rr33jjh1111r1b331111111jjjj3rr3rjrjj11hhhhhhhh1h1jj1jj3jjbjjj1jh1jhh
qaaqabbbbrrr33jjjj1j11111hhhh1111111111111111jjjjjjjj33333333r3j3jj11111j1j3111111jjjj3rr3h3jjj11hhhhhhhh111j1jj13h3bj3rjj11jhhh
aaaaqbbbrrr3jjjjj11111h1hhhhhh1h11111111111111jjjjjjjj3333333rr3jj1111h11jjjr1hhhr31j33r3r3j3j1j11hhhhhhh1111jj1hh3hj3j31jrjh3hh
aaaaqbbrrr333jj11111111hhhhhhhhhhh11hhhhh11111j1jjjjjj333333r3r3jj111h1hjjj33hhhrh1j1333r3r1j1j1j11hh1hh111111hh1hhrhj31r1jjjjbh
aaaqbbbbr333jj1111111hhhhhhhhhhhhhhhhhhhhh1h111jj1jjjjjj33333r333111h1hjjj3j3rh1h111j333r31b111r1jhh1h111j111h13hjrhjh1j1jjjjbb1
aaaqbbbr3r3jjjj1111h1hhhhhhhhhhhhhhhhhhhhhhh11111jjjjjj333333r333111h1hjjjj3rj1j1h11jj33b3111111j11hh111j1j1hhhhhhhjh1jjjjjj3b1b
1aqqqrrrr33jjjj1h1h1hhhhhhhhhhhhhhhhhhhhhhh1h1111jjjjjjj333333r33j1h1h1jjj333r11h1j1jj3311j1111j111rrhj11j1jhhhhhhhhj1jjjjj3rbb1
aqaqbrrrr3jjjj111hhhhhhhhhhhhhhhhhhhhhhhhhhhh11111jjjjjjj3333333jjj1111hj3b331j1hh1j1331311131b1j1rrrrhjh1j11h1hhh131h1jjj3rrrbj
aaqbbbrrrjjjj111hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh111111jjjjj3333333jjj11111h33rjrj3hhh1333313j31bjjj3jrrj1r33111jh111j1j1h133j3rr3h
qaqqbb3r33jjjj11hhhhhhhhhhhhhhhhhhhhhhhhhhhhh111111jjjjj33333r3jjjjjj11jjr3jjjrj3hjhj3r3rj33hjj1jjrj3rr3r33111j11j1j3j1rjj3jrrjj
aqqqqrr3333jjj111hhhhhhhhhhhhhhhhhhhhhhhhhhhh111111jjjjjj33333r3jjjj1jjjjjrjjjjrhjhjjj3rjrjh3h1j1rjrrr1r3j1111hhh1jhrh3hb3j3rrb3
qaqqbbrr33jj1j11hhhhhhhhhhhhhhhhhhhhhhhhhhhhh1111111jjjjjj333333jjjjj11jj3jajjjhjh1jjjrrrjrrhrj1jjr3r1r1j1j11j1hh3hrhjhjhj33r33j
aaqbqr3r3331j111hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh111111jjjjj3333333jjjjjjj3jj33rjjjhja1jjj3r3r3jrrjjj3rbbrbrjrhj1jhjq3hjhhhj3j33q33
aaaqbrr333111111hhhhhhhhhhhhhhhhhhhhhhhhhhhhh111111j1jjjj333333j3jjjjj3j3jrr3r3jjjjjjj333b3jhjjjj3rbrrbrrr3r1j1jjjbrhh1hjj3r3rqh
aabqrrr33jj1111hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh11111jjjjj33333333jjjjjjj3j33r3rjjjjjjj3333b3hjhbjj3rrbbrbb3r331jj1jjhr1111jj3r3rh
aqqbrrr333jj11hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh11111j1jjj33333333j3jjjjjhr3333333jjjjhhh333j3hhh1j3333rbbbbr3r3jjjj1jjh1111jjrrrrr
qaqbrr3333jj1h1hhhhhhhhhhhhhhhhhhhhhhhhhhhhh1111111jjjj3333333333jjjhh3r33333333rjhjh333j3j3hh1j33333bbbrbr3rrjj1jjhhh11j1jrrrrr
aabbrrr33jj111hhhhhhhhhhhhhhhhhhhhhhhhhhhhh11111111jjjjj3333333333jjhhh3r33q3r33hrjjj3r33jr3r3qjj333b3r3brb3rrjhjhh3hhh11j1rrrbr
aqbbbr33jjj111hhhhhhhhhhhhhhhhhhhhhhhhhhhhh11111111jjjj3333333333jjj3h333333r3333jhjjj333jqrbr3jjj33jr3r3q3r3rjjh13hhhhh1j3rrbr3
aqqbr333jjjj111hhhhhhhhhhhhhhhhhhhhhhhhhhh1h111111jjjjjj3333333333j3333333333333hjjhj3j3jrjbrjhjj3jj3rr3qrr3r33j131hhhhhjjjrrrqr
qaqbr333jjjj11hhhhhhhhhhhhhhhhhhhhhhhhhhhh111111jjjjjjj333333333333333333333r3333ajj3j3rrjqhjhjhjj33rrrbrqrr33rjj1hhhhhhjjjrrqqq
aaqqbr3j3jj1111hhhhhhhhhhhhhhhhhhhhhhhhhh1h11111jjjjjj3j33333333333333333r3r33333jjjj3qrrqhrhjhj3333rrrrrrrb333jjhhhhhh1hjh3rbqb
aaqqrbr3jj11111hhhhhhhhhhhhhhhhhhhhhhhhh1111111jjjjjj33333333333333333333333r333jjjj333rr33hhrhhj33r3rrrrrrr3333j1hhhhh31j333hqh
aqaqbr333j111111hhhhhhhhhhhhhhhhhhhhh1h1111111jjjjjj3333333333333333333333333333jjjj333r3333rhrjjj33rr3rrrrrb3331j1hhhhh1j333rqh
aaqqqb333j11111hhhhhhhhhhhhhhhhhhhhh1h1h11111jjjjjjjj3333333333333333333r33333j3jjjj333ar33qjjjjj3jrr3rrrrrrrr333131h1h111j3rqqq
aaaqbrb3jjj1111hhhhhhhhhhhhhhhhhhh1111111111jjjjjjjj333333333333333333rrrb33qj3jjhj3j3r3r33j3jjjjj3rrbrrrrrrbr33331h1h111j3j3qqq
aaaqbb3r3jjj1111hhhhhhhhhhhhhhhhh1111111111jjjjjjjj3333333333333333333rrrrbq3jjjbjjj3r3b3333j33jj3j3b3brrrrrr3333j3ah1hj1jj33qqq
aaabbbr3r3jjj11hhhhhhhhhhhhhhh1111111j1111j1jjjjjj333333333333333333rrrrrrr3jrjhjjh333b3b3333h3j333r3rrrjrrrrr33r33hbh1jjhb3rbqb
qaqbbbbr333jj1h1hhhhhhhhhhh1h111111jjjjj1jjjjjjj333333333333333r3rrrrrrrrr3r3jhhjhj3333rr3333333333rrrrrrrqrrr3r333hh1j1jj3r3rbh
aaabbbrr33jj1111hhhhhhhhhh1h111111jjjjjjjjjjjjj3j333333333333rrrnbbrrrqrbb33hjjjhjjj33rrrr3333jj333brrrrbrrbrrr333hhhh1jj333rhhh
aaaqbbr3r3jj1111111hhhhh111111111jjjjjjjjjjjjj3j33333333333rrrrrrrrrrrrbr333jjjjjjjj333r3333b3jjj3j333r33rrrbb3333hj1r3j3j3rbrhq
aaabbbbr333111111111hh111111111j1jjjjjjjj3jjj333333333333333rrrrrrrrrrrrr333jjj3jjjjb3nrr3333jjjjj3r333jrrrbbq333jj1j1j3333brqha
aaqabbr3r3j1111h111hh11111111111jjjjjj3j333j3333333333333333rrrrrrrrrr3r33333jhjjjjb3rqrb33jjjjjjjj3b3rbqrqrrrq3jjjj1jh333rbqqqn
qaabbrrr333j11h1111hh111111111jjjjjjj3j3333333333333333333333rrrrrrbr3r3r333jjjjjjh3rqr333jjjjj1hj3b3rrrrrrrrrr3jjjjjhj33rbrqqqa
aaabbbr3333j111h11111h1111111jjjjjjjjj3333333333333333333333333rrrr33333333jjjjjj333333333jjjj1jj3j33rrrrrrrr3333jjjjj33r3rbqqan
aaabbbr333jj1111111111111111j1jjjjjjj333333333333333333333333333rr3333333j3jjjjjj3333r333jjjjjjhjj33b3rrrrrr33333jhjj3j3rrbqbana
aaaqbrrr33jjj1111111111111111jjjjjjj3333333333333333333333333333333333333jjjjj3j333333333hjjjjhjj3jr333b3hrr3333jhjbjj3rrrqbanan
aaaaqrrr33jj1111111111111111jjjjjjj3333333333333333333333333333333333333jjjj3333333333333jjjj11jjjr33333h333333jjjhj3j3rrrqqqana
aaaqqrrr3331jj1111111111111jjjjjjjj3333333333333333r33333333333333333333jjj31333r3r333333jjj1j11j3j333nj3333333jjjj333rrrrqqaann
qaqqqbrr333jjj111111111111jjjjjjjj33333333333333333333333333333333333333j1jj333q3r3333jjj1j1j1jjbj333qj3r33333h3jbh333rbrqqqanan
aaaqbbr3r3j1jj1111111111j1jjjjjjjj333333333333333333r3333333333333333333h3333333q3333jjj1j111j1jhr33333r3r333br3h3q333rrbbqqaann
aaabbbbr333j1j111111111j1jjjjjjjj333333333333333333r333r33333333333333333333333r3333jjjjh111h1jjj3r333r3r3r333333r333rrrbqbqaann
aaqbbbbrj3j1j1j111111111j1jjjjj33333333333333333333333333333333333333333333333333333jj1j11111jjj3333333h3333333333333rrrbbqaaaaa
aaaqbbrrr33jjjjj1111jj1j1jjjjj333333333333r33333333rr3333333333333333333333333333jjjj1j111111jj3333r33333333333333333rrbbbbqaann
aaqqqbbr3r3jjjjjj1jjjjjjjjjjjj3333333333333333333333333333333r33333333333333333rjjjjj11111111jjj333rh33h33r3r3333333rrbbbbqaanan
aaaqbqbbr333jjjjjjjjjjjjjjjjj333333333333333j3333333333333333r3333333333333333j3jjjjjj11h1h1hjjj333b33333q333333333r3rrbbbqaaann
aaqaqbbrrr33jjj1jjjjjjjjjj3333333333333j3jjj3j333333333333333333333333333333333jjjjjjjj111jhjjjj33333333r33333333333rrrbrbbqaana
aaaqqbrrr3333jjjjjjjjjjjjj33333333r333jjjjjjj3j3j3333333333333333333333333333jjjjjjjjj11111jjjj33333333rqr33333333333rrrbbqqaana
anaqbbrrrr3333jjjj3j333j333333333b33jjjjjjjjjjjj3j3333333333333333333333333jjjjjjjjjj111j111jj333b3333333333333333333rrrrbqbannn
nanqbbbbr333333jj3j33333333333r3333j3jjjjjjjjjjjj3333333333333333333333333jjjjjjjjjjjjjj1jjj3333333333333333333333333rrrbbbaaann
anqaqbbrbr3333j3jj333333333333h33jjjjhjjjj1jjjjjjj33333333333333333333333333jjjjjjjjjjjjjjjjr3333b3333333333jjj3j3j3r3rrbbbaaaaa
aaaaaqbbrrr333333333333333333h33jjjj13hhj11jjjjjj3333333333333333333333333333jj3jjjjjjjjjjjr3333333333333j3jjjjjj3333rrrbbbbaann
aaaaaqbrrrr3333333333333333bh333jjj111h11111jjjjj333333333333333333333333333333j3jjjjjjj3j333333333333j3j3jjjjjj333333rbrbbqanan
aaaaqqrbrrrr333333r3333333a3333jjjj1111h111j1jjj33333333333333333333333333333333jj3j333333333333333r3j3jjjjjjjjjj33333rrbbqqqana
nnaqqqqrrrrr3333333333333h3a3333jj111111111jjjj33333333333333333333333333333333jr3j33333333333333333j3jjjjjjjjjjjjj33r3rrbqqqaaa
naqaqqqbrrr33333333333rrh333b33jh1j1111111jjjj3j3333333333333333333333333333r3333r3333333333333333333jjjj1jjjj1jjjj333rrrrbqqqan
naaqqqqrrrrr333333r33333r3333333jj1j11111h1jjj3333333333333333333333333333333333333333333333333333jjjjjjj1j1j11jjj3j33r3rbqbqana
nnaqqqbbrrr333333333333r3q33333j31j1111111jjjjj33333333333333j33333333333333r33333333333333333333jjjjjjj1j1j111jjjj3333rbrbqqqaa
nnnaqbbbbrr33j333b3333r3rrr333jjjh11j11j3jjjjj333333333j33333333333333333r3r33333rr3r3r333333333jjjjjjjjj11111jjjjjjj3r3rbbqqqaq
nnaaqbbbbr3r3jjjh3b333rrrqrrr33jj111111jj333j3q3333j3jj3jj333333333333333rr333333r3r333r333333333jjjjjjj111111111jjjjj3rrbbbqaaa
nanaqqbbb333jjjjjh33333rrrrrr33jjj11111jj3333333333jjjjjjjj3333333333333r33rr3333333333333333333jjjjjjj11111111111jjjj3r3rbqqqaa
nnaqqqqrr3333jjjh3333rrrrrrr3r3jj111111j3333333333jjjjjjjj333333333333333333r3333333333333333j3jjjjjjj11111111111jjjjj33rrrbqaab
naqaqbrr3333qhhhb33r3rrrrrbb33jrjj1j11j3j3r3b333j3jjjjjjj33333333333333333333333333333333333j3jjjjjj1j111111111111jjjj333rbbaaaa
qnaqbbb3333jjjhhj333rrr3r3b3333jj1jhj1jj333r33333jjjjjjjj333333333333333333333333333333333jj3jjjjjj111111111111111jjj3333rbbqaqq
naqabbbr33jjjjjjbj3r3bbr3abb33hj1j1jhj333333r33jjjjjjhjj333333333333333333333333333333333jjjjjjjjjj1111111111111111jjj33rrrbqaaa
aaaqbbbrr3jjjjh3jrr3rqrbrbr333jjj1hhjrj3333r3j3jjjjjjh3333333333333333333333333333333333jjjjjjjjjjj111111111hh1h1111j3jrrrbqqqaa
aaaabbbr3jjjjhj333rrrbqrar3r333jjjh333333rr333j3jjjjh33333r3333333333333333333333333333jjjjjjjjjjj1111111h1hhhh1h111jj33rrrqqqaa
naabbbr3jjjjjj333brrbqrqrjr3333jjjj333333r33333jjjjj3333333333r3333333r3333333333333j3jjjjjjjjjjj111111hh1hhhh1h111jjj333rrbqqaa
aqabrb33jjjjjjhj3rrrarrrrrj3333jjj3333333rr333jjjjj333333333333rr3r3333333333333333jjjjjjjjjj1jj11111111hhhhhhh1111jj3j3rrbbbaaa
qabrbr33jj1jjhj3j3rrrrrrrr3r333jj3333b33r3r3jjjjjjhj3333rbr333333r3333333333333333jjjjjjjjjjjj111111111hhhhhhhhhh11jjj3rrrrbqaaa
aqabr33jjjj11jjj333rrrrrrrrr33333333333r3333jjjjj3jrr333rrrr333333333333333333j33jjjjjjj1j1jj111111111hhhhhhhhhh1111jj3rrrbraqaa
hab333jjjjj111jjj3rrrrrrrr33r333h3b333r333333jjh3j33r333rrr3333333333333333333jjjjjjjjj1j111111111h11hhhhhhhhhhhh1h11jj3rbrbqaqa
qbqr33hjjj1111jj33rrrrrrqjb33rj33b3b333qb3333jhjj3333r3nrr3333333333333333333jjjjjjjjj1j1111111h1hhhhhhhhhhhhhhh1h11j1j3r3bbbaaq
hqrrr3bh11h1131j33rrrrrrrr3br33j33j3r33r33333jjjjj3333rrh3r333333333333333j3jjjjjjjj111111111h11hhhhhhhhhhhhhhhhh1111j333rrbaaaa
rqrr3331h11hh1jjjrrrrbrrrrrr33333j3r33r33333jjjjj33rrrrhr333j33333333333333jjjjjj11111111111h1hhhhhhhhhhhhhhhhhhhh11j1j33rbqbaaa
qbqr33bh1h1hhj1j3rrrbrrbrr33r33j33r3r33r3333jjjja3rrrrrrrh3333333333333333jjjjjjj111111111111hhhhhhhhhhhhhhhhhhhh1h1jj3jrrrbqaaa
hqrrrj3bh1hh11j1jrrrrrrrq3b33333j3333r333333hjj33q3rqrqr3r3333333333333j3jjjjjjj1j1111111h1hhhhhhhhhhhhhhhhhhhhh1h1jjjj33rrbaaaa
qqqr33jr1hhhh11j33rbbrrrrb3rr33jj33j3333r33rjhj333b3rqrrr333333333333333j3jjjjj1j1111111hhhhhhhhhhhhhhhhhhhhhhhhh111jj333rbqbaaa
qqq3jjjjh1hhhh13333bbbrqrrrr33333j33jh3r3333hjj33b3rrarrr33333333333333j3jjjjjjj1111h1hhhhhhhhhhhhhhhhhhhhhhhhhhh11j1j333rrbqaaa
qqrr3jjh1hhhh1h1j33rrbqrb3rj333333hjhbb3333j333333rrrrrr3r33333333333333jjjjjjj111111hhhhhhhhhhhhhhhhhhhhhhhhhhhhh11jj33rrbqqaaa
rrbrrbrjhhhr1h1jjj3r3rqq3brrj3333hjrbb33r3j33333333rrrrrr3a3333333333333jjjjjj1111111hhhhhhhhhhhhhhhhhhhhhhhhhhhh111j3333brbaaaa
3qbbrrjrhhhq31hjjjr3r3r3brrrr33jjjjbj3333r3jh3j333rrrrrrr33r33333333333jjjjjjj111111hhhhhhhhhhhhhhhhhhhhhhhhhhhh1h1j1j33rrbqbaaa
qrqrbjj31hhjrhhjjr3r3rbr3brr333jjj3jjj33rrjjjjjjr33rnbbr3j333j3333r333j3jjjjjj11111hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh1j1j333rrrbqaaa
rqrrjjj111hhhr1h31r3b3rbbbb33333j3jjjj33r3jjjjjrj333qbr333j333b33333333jjjjjjjj1111hhhhhhhhhhhhhhhhhhhhhhhhhhhhhh11jj333rrbbqaaa
qqb3jj1111hhr1j1131r3b3bbbb33333jjhjjr333r3jjjhj333q3r3333jj33333333333jjjjjjjj1111hhhhhhhhhhhhhhhhhhhhhhhhhhhh11111jj33rrbqaaaa
qbqb3j111hhrhj11111jj3bbbrbbrr3jjbjhh333333jjhjhj3r3r33333jjjjb3333333j3jjjjjj1111hhhhhhhhhhhhhhhhhhhhhhhhhhhhh111j1j33r3rbbaaaa
hqb3r3311hhhrq1111j13j3rrbrrbr3jjjjhr3r3333jjjhj333333333jjjj3j33333333jjjjjj111111hhhhhhhhhhhhhhhhhhhhhhhhhhhhh111jjj33rbbbbaaq
q3q3333111hjh3111j1jj33jbrbbr3jjjjrj3r3r33jjjjjhj3j33333hjjjhjr333333333jjjjj111111hhhhhhhhhhhhhhhhhhhhhhhhhhhh111jjj3j33bbbqqaa
jq3333j111jhrh31h1j113j3jr1r3rjj11jhr3jrbrjjj3jjhj333333j3jhjhj3333333333jjjj1111111hhhhhhhhhhhhhhhhhhhhhhhhh111111jj333rbbqqqaa
qjq33jrj1bhrhjhh1h11113jr1rrrjr1j1h3h33jr33jjj33j3j333jjh1h1hjh333333333jjjjj1111111hhhhhhhhhhhhhhhhhhhhhhhhh11111jjj333bbbbqaaa
jq33j3jjr1jjjhjhhj1113jr1rr3rrjj1jjh333rrrjjjjjrb3333jjjjh1hhjj333333333jjjjjj111111hhhhhhhhhhhhhhhhhhhhhhhhhh1111jj3333bbbqaqaa
hbrr3jj31h1hjjhhjhj11133rjjrrjjjjj3133313j3jjjhjja3j3jjj1j1hjbj333333333jjjjjj11111h11hhhhhhhhhhhhhhhhhhhhhhh1111jj3j33rrbbbqaaa
jbbbbb3jh1hjhhhhhjh11j1hjhrrrr1j131r111313jj3hjhhjj3jjjjj111hj33333333333jjjjjj11111111hhhhhhhhhhhhhhhhhhhhh1111jjj3333rrbbbqaaa
bjbjjjjrjhjhhhhhhhhhj1jh1jhrr1j1j1111j1133j3jjhjjajjj3jj111111j33r3r3j3333jjjjj1111111hhhhhhhhhhhhhhhhhhhhh1h11jjj3j33rrrbbqaana
jbjjjjjj131hjhhhhhhh1j1jh11hh11j1111113b33jj3hh3rjb3jjj1j1111j1jq3r333333j3jjjjj11111111hhhhhhhhhhhhhhhhh11111jjjj3333rrrbqaaaan
1jrjjjj131h3hrjh31h111jh11h1hhj1311131rr33jj1hrh3hrjjjrj1hh111jj33r3333333jjjjjj1j111111hhhhhhhhhhhhhhhhhh111j1jjjj333rrbbqaaana
hrjjrj1r133h3hh1h1111111hh1hh11j1j1j133r3j3jj1h1hhjjjjjj1h1h1j1jj333333333jjjjjjjjj111111h11hhhhhhhhhhhhh11111jjjj333rrbbbbaannn
hhrhj3j13jj3hrhh1jj1111hhhh1h111j1jjj333j3jj111h1hhjj1j111r111jj33rr33333333jjjjjjjjj11111111hhhhhhhhhh111111jjj3333rrrbbbqaaann
hhhh11jjrjjjbhr1jj1j111hhhhh1hh1jjjjj33r3jjj1j11jh111r1111h1111j3rrrrr3333333jjjjjjj1j11111111hh1hhh1h11111j1jjj3333rrbrqqqqaana
hhh11j1jjjjj3b131jj1h1hhhhhhhh1h311jj3r33jjjj13j1j1111r11h1r11j3jrrrr3r333333jjjjjjjjj111j111111h11hh1h11111jj333333rrrbqqqaannn
hhhh11jjrjjbr3j13jjhhqhhhhhhhhh111jr1rrj33jj1h1hj111jj1111h1j13jrrrrrr333333333jjjjjjjjjjjj1111111111h1jj1jj3333333rrrbqqqaaaann
hh1hj11hjrrr3j3j3jjjhhhhhhhhhhhh1j1jrrrrj311hhhhh1jjj1111h111jrr3rrrrrr333rr33333jjj3jjjjjjj11j1111jjjjjjjj3333333rrrrrqqaaaanna
qrhjh1h1hrrrj3j3jjjhhhhhhhhh1hh1h1j31rrr3j11hhhhhh1jj111hh1h11r3rrrrrrrr3rr3r3333333j3jjjjjjjj1j1jjjjjjjjjj33333rrrrbrqqqqaannnn
hhrhhhhh33r33j33r1j1hhhhhhhhhh1h1h3131rh3j11hhhhhh1rrr111hh11hrb3rrrrrrrrrrr333r3r33333jjjjj3jjjjjjjjj33jj333333rrrbrbqqqqaannnn
hh1hhh1h1j33333r3jjhhhhhhhhhh1h1h1131333h31h1h1hh1h1r31jh1ha13hrrrrrrrbrrrrrbrrrr3r3r33333j333jjjjjjj33333r333rrrbbbbqbqqaaannnn
h1h1hhh1h3j3331jjjjjhhhhhhhh1h111h1j33hh3111h1r1hh1rj3113hq131r3rrrrrbrbbbbbbrrrrrrrrrr33333333j33jjjj33333rrrrrrbbbqbqqqaaannnn
hh1hhhhhjhjr3rjjjjjjhh1h1hhhhjh111jjjh1h1h11hh1hhh3jj111h3hh1r3r3rbjrbbbbqbbbbrrrrrrrr33r3r3r333r3rr333r33rrrrrrbbbqqqqqaaannn7n
hhhhhhhjhj33313jj1j13hrhhhhjhhhh1hjjj1hhhhhhhhhhhh1jj11hhhh1hhr333rbbqqqqqqqqbbbbrbrrbbr3r3rrr3r3rrrrrr3rrbrrrbbbbbbqaaaaannnn77
hhhhhhhhj3331313h111hhhhhhhhjhhhhhhjhhhhhhhhhh3rh1311j1hhh1h1qr333brqqqqqqqqqqbbbbbbbbbbbrrrrrbbrrrrrrrbrbrbbbbbbbqqaqaaaaannn77
hhhhhhhhh133313j11j1h1hhhhh1hjhhhhhhhhhhhhhhhrj31313j1jhhhh1jqrr3qrqjqqqaqqqqqqabbbqbbbbqqbbbbbbbbrrqrbrbrbbqbqqaqqqaaaaaannn7n7
1h3hh1hhhhh1hhjhjj1jrh1rbh1jhh1hhhhhhhhhhhhhhj3131333311hhhhhjb3q3qqnnqaaaaaqqaqaaqaqqaaqaqqabbqbqbqqqbbrbqaaqqqaaqaaaaaannnnn77
rhh3hhhhhh113hhjhhjrhrrhhr3h3hjhhhhhhhhhhhhhhh3313b33j3h1hhrr3bbq3qnqnanaaananananaqaaaaaqaaaaqbabqqqqqaaqaaanqaanqaannannn7n777
hrhh1h1hhh13131h1hhbr1hhhh3jh11hhhhhhhhhhhhhhj133b3bj3j1hhhrrbbb3q3qnnnannnannnnnanaaaaaaaaaaaaaaaqqqaaaaaaananananannnnnn777777
rhhhh1hhhhh13hh1hh3hrhrhhh3311hhhbhhrhhhhhhh113333b33j11hhhrrbbnq3jnnnnnnnnnnnnnnnaaaaaaaaaqaaaaaahqaqaaanaaananananjnnnnn77n77h

