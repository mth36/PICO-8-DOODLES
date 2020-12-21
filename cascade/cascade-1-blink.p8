pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--sketch
--micheal @???

#include _vec.lua

function _init()
	dt=0.01
	t=1
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
		0,
		0,
		0,
	},1)

	cls()
end

function _update()
	--cls()
	t+=dt
	tf+=1
	st8 = sin(t/8)
	ct8 = cos(t/8)

	for i=1,250 do
		local xo,yo=rnd(128)-64,rnd(128)-64

		x = xo*st8 - yo*ct8
		y = xo*ct8 - yo*st8
		
		local c=sin(x/64)+sin(y/64)
		c=c%(t*2) + 2*t
		c=26*abs((c/16%1)-0.5)+1
		c=c%14+1 -- [1,14]
		
		circ(x+64,y+64,1,c)
	end
end
__label__
1111111jj1jjjjjqqqaaaqaaqaqaqaqa33r3rrrrr0rrrr0rr3r3r03r3r30000n000aann0nqq0q0ba0aqbqbaaqbaaqan0jnj1j033333333333jj3j333j3j3jj11
h11111jjjjjjjjaqqqqaqaqqaqaqnqqnnq3r3rrrrrrrrrr0rr3rrr03r30303nan0n0nannqqqa0aaqa0bqbaqabbabaaannjnj1jj333333333333j3jjjjj33jj1a
11j1j1jjjjjjqqqaqqqaqqaaqnqnqqqqqaq3r3rrrrrrrrrr033rrr33333j3n3nnnnnqnqqqqa0aaaaaaqbqaaqaabaaaaqann1j3j33333jjj333333jjj1j3j3naq
1j1j1j3jjj33qqqqa3aqaqaaqqnqaqqqqb3r3r3rjrrrrrrrr0rrrr333333n3nannnnnqnqqnqaqaaaaaaqaqaaqbabaanaqnan3j33333j3j33333333j3jj13nana
11j1jjjjjj333qq33a3n3aqqqqqnqaqqqqbbr3r3rrrrrrrr3r3rr3r333anananannnannnnqnbaqrqaaqaqaqqqqqnqnannannq3j33j33j3j33313333j3jnnnnaa
1113jjjjj3j33q3q33a3q3aqqqnqnqqqqbbbb33rrrrr3rrrrrr3rr3r33naannannnnnnnnnnanbbqaqa3raqaqaqnnnannannnnjnjj3jj3j33333133j3jjnnnaaq
11jj33jj3j33r3q33333333qqqqqqqqqqbbbb3r3rrrrrrrrrr3rrrr333aanaannnnnnbnnaanabaqqarqqbaaaqannnnnnnannnnjn333j33j33jjjjjjjnnnnanna
jj1jj3j3j33333333333333q3qaqqqqqbqbbbbabarrr3rrrjrrrrr33qnnaaanannnnnnbaaaabaqaabq3qqaaaaqnnnnnnannnqnnn3333j33j33jjjjjnjnnannan
1jjjjj3j3j33333333333333q3qqaqqbqbqbbbbbb3r3rrr3r333r33q3qaqaaannnnnnnnnaaaanaanabqqqqaaaqanannnannnnnnnn31j3j33313j3jnjnnannbna
jjjjj333j33333333333333a3qqjqqjqbqbbbbbbbbrrrrrrrr3r3rj3qaqaanannqnnnnnnnnanqnnanrbqqaaaqn3annnnannnnnnnaq1hj333j3j3j3jnnnnnanbb
jjjj3jj3333r33r33rr3r3a3q3jqjjqjabbbbbbbbbbrrrrrrrr3r3aaaaaqnannnnqnnnnnnananaanqb3aaaaanrnqannanannnaaaaahn13331j3j3jnnnnnanana
jjj3jjjj33r3333r3rr33r3q333jqjjqqqbbbqbbbbbr3rrrrjrrbaaaqqaqannnnnnqnnnannarabaqaaaaaaaannqqqnrnanannaaaaaaanj3j33j3jnbnnnqnnnaa
jjj33jj33333333333333333333jjjjjbqbbbbbbbbbbrrrrjrjrjbaqqqqaqarannqnqnananqnqaqaaaaaanannnqqqanaaannnnaqaaaaaj333331nnnnnnnnnnqa
bjb3a333333r33r333r33333333jjjjjbbbbbbabqbbqbrrrrrrnbqqqqqqnananannqnbnbnnnanq0aaaranannnnqanqaqaannnnaanaaaa3j333jnnnnnnnqbnqar
qbbqq33333r3rrrr3rrrr333333jjjjjjbqbbb1abbbbqbrrrbrbbbbqqqnananannnnnnbnnnnnaqaaabaqanqnnaannnqnaqnnnnanannana33j3nnnnnnnnnnqaqa
qqqj3q33r3rrrrrrrrrrrr333333jjjjbbjbb111bbbqbrrrrrbbbbbbqqqqannnnannnnnnqnnaqaaaaaaanqnnaarnnnnannqnnaaannqaanaj3nannannnnnnnqaq
qqjqj3q33r33r3rr3brrrr33333jjjjbjjbj11111bbbrbrrr3qbbbbqnqqbqnnnanannnnqnnnnanannnanannananannanannnnaaannanaananaaaanannnnnrnqa
qqqj3q3q33333r33r3rrr3r33333jj3jjb111111r1bbrrbr333bbqqqqqnqqqqnnanbnannnnnanannnnnannanannnaanannnnnnannaaanaa3naannnnnnnnbnqnq
qqqqq3a3333333r33rrrrr3r333bj3qjb111111rhrrrrrr3r3rrbqqqaqqnqqqqnnrnnnnnnnqnanannnqnrbnannnnnnnnnnnnnannaaaaaj333jnnnnnnnnbnanqa
nqnqqa333333r33rrr3rr3r3333jjjjbjr111r1hrhrqrrrr3rrrrqbqqbqnqqqaqaannnannnnnnabqbqnqbnbnnnnnnnnnnnnnanannaaa1a33333nnnannnnanaaa
qnqqaqq333333r333333rr33333jjjjjjj1j1111hrqqqrrqrrrrnbqbbqbqqqaqaaaannnnnnnnnnqanqnabannnnnnnnnnaannnannnqaq33333333nanannnnanaa
qaaaqqq3q333r333333333333333jjjjjjj1111hrhqqqrarqjr3rqbbbbqqbqqnaaaaannnnnnnnnnnananaanannannnnaaaanannqqnq3133jj3331jannnaanana
aqqqaqjq333r3333333333333333jjjjj1jr1113hb3qbarabb3rrrrbbbqbqqqqqnnqnnaannnnnnnnnnnannanannnnnanaaaannqnqq3133j3j331j1jaqnnnnnaa
qqqqqjqj3q3q333333333333333j3jjj1j11111qqqqqbbabbarbrrrrbbbqbqqqqqqnqaaaannnnnnnnnnnnnnannnnnanaaaanqanqn33333333333j3j1jnnnnnqq
aqqqaajqa3q333rr333333333jjjjj1j11111hqqqqqqaabbabaabrrrrbqbqbabqqqqqaaanannnnnnnnnnnnnnnannqrannanqqq3nqr3r3333333j3j3jnjnnnrna
qaqaqqaaqq333333333333jjjjjjjj1111h1h1hqqaqaaaabaaababrrrrbqbqbabqqqqqanananannnnnnnnnnnanaqaaannnnqqqq3r3rrr33333j333jjjnnannnn
aqaqqqqqqqj333j3333333jjjjjjj1111h1h1h1qaaaaaaaaaaaaabrrrrrrrbbbaqqqqqnnnananannnnnnnnnnnanaaananaqqqqr33rrrrr333rjr333jjjjnnnnn
nqqaqqqaqjqjqj3jj33b3jjj3jjj1j1111hqh1qaqaaaaaaaaaaaaabrbrrrrrqbbaqnqaaannnnaaannnnnnnnnanaaaaaqaqqqqr3rrjrrr3rrr3rjr33j3jjnnnna
qqqqqqqqqajqj3jjjj33jjj3jjj1111111qhqqaqaaaaaaaaaaaaaabbrbrrrrbrbbqqqaanaannaaannannannananaaaqaqbqq33rr3rrrrrrrrrrr3r3333jnnnaq
qqqqaqqqnqqjqjjjjjjjjjjjjjj11111hqqqqqaaaaaaaaaaaanaaarbbbbrbrrbrbqqqbaaaaanaqaaaaaanaaaananqqaqbqb333rrrrrr3rrr3rrrr3rr3333n1qq
qqqaqqqqqqqjjajjjjj3jjjjjjj111jh1hqqaaaaaaanaaaaannnaaaaababbbarbbbbbqbaqaqaqaqaqanaaaaqaanqaqqqrbr3rrrrrrrrr3rr3rrr3rrrr33j3jjn
qqqaqaqqqqjqjqjjjjjjj1jjjj1j1jj1hqaqaaaaaanannaannnnnaaaaababbrqrhbbbbqbnqqqaqnaaaanaaqaqaqaqqqbqr3r3rbrrrrrrbrbb3b3r3rrr3j3jj1j
nqaqaqaqqqqjqjjjjjjj1j1jj1j111qqqaqaaaaaanannnnannnnaqaaaqabaarrhhhrbbbnqqqqaaaqaaaanqaqqqqqqqb3bjr3rbbbrbbbbbbbbb3bbrrrrr3j3jjj
3anqqaqqqqqqjbjjjjj1j1j111111qqqaqaaanannannnnnnqnnqnaaaaaaaababhhhhrrb1nqbaqaqqqqaaqqqqqqbqqqrb3rrrbbbbrbbbbbbbbrbbrbrrrrj3j3jj
r3qaqaqqqbbqbjbbbj1j1j1111111qqqqaaanannnnnnnnnannnnqnaaaaaababbbhhrrb1q1bqbnbqqqqqaqqqqbbqbrrrr3rrbrbbrbbbrrbrbrbrbbrrrrrj3333j
3rnqqqqbbbbbnbbbj1j1111111111qqqaaaaannnnnnnnnnnnnnnnnnnnaaaababaararrq1b1bqbbbqqqbbaqbbqbbrrrrrrrbrbrrbbbb3brbrbbbrrrr3rr333330
r3rq3qbqbbbabbqbbj1111111h1h1qqaaaananannnnnnnnnnnnnnnnnnaanqabaaaarbqrb1bbbbbbbqbbbbbqbbbbnrrrrjrrbbrbbbbbbrbrbbbbbrrrrrrr33333
3333qjabqqaaaqbqqb111111h1hqqaaaaanannnnnnnnnnnnnnnnnnnnnnnnnaaaaaabbrqrbbb1qbbqbqbbbqbbbnbrrrrrrrbbrbbbqbbbbrbrbbbbbrrrbrr33333
r3003rrqqbqaabbbqbr11r1hqqqqaaaaaaannnnnnnnnnnnnnnnnnnnnnnnnanaaaababqrrhr1b1qbbbbabqbqqjrr3rbrrrbrbbrbqbqbbqbbbbbbqbbrbrbrr3j33
3r33rrrrbbbaabbbrhrrrrr1qqqqaaaaaannnnnnnnnnnnnnnnnnnnnannnnnaaqaaabqbahrhh1bbabbbbabbrar3rrbrbrrrbbbbrrqbqqbqbbbbqbqbbrbrrrr333
rrrr3rrrbbbqbqbrhrhrrhrq3qqqqaaaannnnnnnnnnnnnnnnnnnnnnnnnnnanqaaaabbaqahhrhrhbbbbnbbrbrrrrbrbb3bbbbbbqqbqbqqqbqrqbqbbbb3rrr3r33
rrrrrrr3rbrbqbqqrhrhhrhrqaqaqaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaqabbabaqbrhrhrhhbqbbbbrrrrbrbbbbbbbbbqqqqbqbqbqrqrqbbqqrb3b3r3r3
rrrrr3rr3rbrb0bnrrhbhhbbaqaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnqaqaabaqarrrhrhhrhqnrrrrrrrjbbbbbbbqbqbqqqbrqqqqqbqqbqqqqrbrb3r33
r0r3rr33r3rbrbnrnrbhbqrbqaaaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnqaaaaaaqqqqbhrhhqhr3rrrbrbrbbbbbbbqqbqbqqbqqqqqqqqbqbqqbbrbrr3rr
rr3rrrr33r3rbqbbrbrbqrqabqaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaaaqbqqbhrrhrhrrrrrbrr3bbbbbqqqqbqqqqqqqqqqbqqbbbbbr3rbbrrr
0rrrrrrrr3r3qbrbbrrrrqabajaaanannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaqaaaqaq3brrrhrhrrrrarbbbrbbbbbqqbqqqqqqqqqqqqqqqbbqbbb0bbbbrr
r3rrrrrrjr3rrrbrbrrrrrbaaaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaabaaaqqbrrqbrhrrqra3abbbbbbbbqbqqqqqqqqqqqqqqqqqqqbqbb3bbbrr3
rrr3rr3rrrrrrrrbq3rrrbbabaaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaarqbqrqqqhrhqqqharbbbbbbrbrqbqqqqqqqqqqqqqaqqqqqbbbbrbr3rr
rr3rrrrrrrrrrrrq3arrrbbbaaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaabqqqqqqrhrqqqbrbrrrbbbbrqqqbqqbqqqqqqbqaqaqqqqqbbbbbrr03
rrrrrrr3rrrrrrbnaq3rrrbrbaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaabaqqqqqhhrrqqq3bbbbrrbbbqqqqqqbbqqqqqbqqqaqqqqqbqbbbrbr0r
r3rrrrrrjjr3rb3bb3qrrrrbabaaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaabqqbqqhhhhhrhq3qbbbrbbbbbbqqqqqqqqqqqqbqqqqbqbqqqbqbbbr3r0
3rrrrrrrjrjrq3bbbbrrrr3rbabaaabannnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnaqaaaaabqqqh3hhhhhrhqrrbbbrbbbbbbqbqqqqqqqqqbqqrqqbqqqqqbbrb3333
03rrrrrjr3rq3qnbbbbrr3r3rbabbbannnnaannnnnnnnnnnnnnnnnnnnnnnnnnaaaaaaaaqqqqhhhhhhhhrhrrrbbbbbbrbbbqqqqqqqqqqqqqqqqqrqqqqbrbrr330
0r3rrrj33ra3qqanbbbbbabrbabaaaqannnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaaaqqqqqh3hhhhhhrhhhrrrbarbrbbbbbrqbqqqqqqqqqqqqqqrqqbrbrrr303
00r33jj333qaqaqbqbbbab3rrbqabaaaannnnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaqqqqqq1h3hh1h1hhhhrrqababbrbbbbqbqbqqqqqqqqqqqqqqqrrbbbr3r30
03j3j0333qqqqqaqbqqqbarbrqbqabbqaannnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaaqqqh1h1h1r11h11hhrqbqabbbbbbbqbqbqqqqqqqqqqqqqbqqqrbbbbr3r3
0j3j333q3qqqqqqqqqqbqbbrbbqaaabbbqaqnnnnnnnnnnnnnnnnnnnnnnnnnnnaaaaaqqqh1h1h11111111h1hrqbqrbrbbbbbqbqbqqqqqqqqqbqbqqqqbbbbr3333
03333333qqqqqqqqqqbqbbbbrrbaaabaabqnannnnnannnnnnnnnnnnnnnnnnnaaaaaaqqhqh111111111111h11rqrqrbrrbrbbbrbqqqqqqqqqqbqbqqqbbbr3r330
33333anqaqqaaqaqaqqbqabrrrrbqbaaaaqannnnnnnnnnnnnnnnnnnnnnnnaaaaaaaqqqqh1111111111111111rrqrqrrbrbbbbbqrqqqqqqqqbqbqbbbbbrbr3333
3333aqanqqaqqaqqaaqqaqqbrrrqbqbaabqqannnnnnnnnnnnnnnnnnnnnnaaaaaaqqqqqh1j111r1j11111b111rrrqrrbbbrbbbbbqbqqqqqbqbqbbbbbbrrrr3303
030naaananqaaqqaqnqnqqbqbbbrqbrbbbbaaannnnnnnnnnnnnnnnnnnaaaaaaaqqqqq11j1j1r1r11111b1b1111hhhrbbbbrbbbbbbbqbqqbbqbqbbbbrbrrr3330
000anaaanananqaqaanaqqqbbbbbbqbqqbbaanannnnnnnnnnnnnnnnnnnaaaaaaqqqq111111j1rjj111j1j11111hhhrrbbbbrbbbbbbbqqqbbbqbbbbrbrrr3333j
000nannnanannaqaaaaqqqqqabbbqjqqqqaaaannaqnnnnnnnnannnnaaaaaaaaqqhqh1111111jj3jjjj1j1j1111111rrrbb3bbbbbbbbbqbqbbbbbbbrr3r3r333j
n00nnnnanaaaananaaaaqqqaqqbaqbrqqrbaaaaabnqnnannnnnnnnaaaaaaaaqqqqh111111jjj3jjjjjjjj1j1b1111rqrbrbbbbbbbbbbbqbbbbbbbrbrr3r3r3j0
0nnanaananannananaaaaqaqqqqbqrbrrrbbaaqaqrnqanannnannaaaaaaaaaqqq1111j1j1jjjjjjjjjjjjj1b111111rbrrr3brbbbbbbbbbbrbbrbbr3rr3rj30j
nnnnannannnnnnananaaaaqnqqbqbqrbrrbbaaaaaaqaaaaqnaaaaaaaaaaaah1h111111j1jjjjjjjjj3jjjjqjj111111rrhrrjbbbbbbbbbbrbbbbrbrr330330j0
nnnannnnnnnnnnnnnannaanqnaqbqqqrarhbaaaaaaaaaaaaaaaaaaaqaaqqq1h1h111111jjjjjjjj3j33jjjjjjj1b1111hrhrrbbbbrbbrbbbbbbbbrrr333333n0
nnnqannnnnnnnnnnnnnanannaqqqqqbbrhbhbabaaaaaaaaaaaaaaaqaaqqqhq1h11111jjjjjjjjj3j3j33jjjjjjj1b11b1hrrrrbbbbrrbbbbbbbjrrrrrj033n0n
qn0nabannnnannnnnnnnaqnnnqqqqqbqbbhbbbrbaaaaaaaaaaaabaaaqaqhqh11111j1jjjj3jjjjj3j3r3jjjjjjjjjbb1bahrrbrbbbrrrbbbbbrrrrr3333n3nn0
nqnnaannnnnnannnnnnnnnqnaaqqqaqbbbbbbrbbbaabbaaaaaaaaaqqaqqhh111j1j1jj3jjj3jjj3333333jj3j3jjjbqbbhrhrrbrrrrrrrrrrrrrrr3r3aq3nan0
annannannnnaqannnnnnnnnnaaaaqqbqbbbbbqrrbbrrabaaaaaaaqaqq1h1h11j1j1jj33jjj3333r33333333jjbjjjjbbbbhrrbrrrrrr3rrrrrrrr3r3aqaqannn
0a0naanaanaannanannnnnnananqqqqbqqbbqbrrrqrqaaqaaaqaqaqqh11h111jj1jjj33j333r33r3333333jjjjjjjbbbbbb1brbrrrrrrjrrr3rr3rjqqaqnannn
a0nanaqaaaannnnannnnnnananaaqqqqqqbqbb1rqbqaqaaqqqbqqqqh1h1111j1jjjjjjj3j3r3333r3333333jj3jjjjbb1b1b1hbqrrrrjr3rrr3rr3rjqqaa0nn0
aa0nnqbbaqqannqnnnnannnanaaaqqqqqqqbq1b1bqbqabqqqqqqqqhhh1111j1jjj3jjjjj333r33r3r3333r33333jjbj1b1b1hrhbrbrrr3rrrrrj3r3qanannnan
aaqnanbaqaanaqannnnnnnannnaaaqaaqqqabb1brbbrbrbqqqqqqhhhh1j1j1jjjjj3jj3333333r3r3rr33rr333jjjjbj1bbbrhrbrrbrr33rrrr13bnannnnnan0
aqaanaaqaananarnnnnnnnannnnnaaaqaqaaab1rbhbhrbqqqqrqh1hh1r1j1jjjjj3j33333333r333r3333333rjjjjjjjjbbb1r1rbrbrbrrrrr1rb3bqqnnn0n0n
qaananaaqaannqnnnnnnnabnnnnananaqaqqq1a1hrhrhqqqqqqhhh1111b11jjjj3j333333r3r33r33rr3333333jjjbjjjbbbr1bbrrrbrbrrr3bb3bqqqqnna0n0
aaaanarbrqbnqnnnnanaaqnnnnnnannnqqqqqb1hrhrhrqqqqqhhhh111r11j1jj3j3j33333333333rrr3r3r33333333jjbjbbbbqbrrrrbbrr3babbabqqqnaaann
aaaqqqaqqrabnqnnannannnnnnnnnanqqqqqbbbbhrrhhhqqqh1hh11111111jjbj3j3j3333333333rrrr3rrr3r3333jbjjjj1rr1qrrrbbqbbb0babbabqnqaannn
qaaqqaqaqararqqannnnannnnnnnanaaqqababbbqbhrhhhqh1h131r111111jjjjj3j3j3333333333r33r3r33333333jjjj1111b1brbbqbbbbbabqbbaqqnannn0
aaqaaqaqababb3aannnnnanqnnnnqaaaqnqqbabbbarhrhqqqh1r1r1r111111jjjj33j3333r33333r3r33r3333r3b333jj1111b1r1bbbbbbb3rbqbbqqaqaann00
aqaaaaqaqaqqbaaaannnnnannnnaanaqnqqaqqbbbrbrbrqqqqq1r1r11111111jj3j3brr3rr33333rr3rr3r3333r33j3jjj1111r1rrbbbqb3rbrbbqbqqaananna
qaqaaaaqanqnnaaanbnnannnnnanaannqnaqqqbbbbrbrqqqqqqq1r11111j111jjj3bj33333r3r3r3r3r3r3333r3rj3jjjj1111111rrbbbr33rbrqbbqqaaannna
0qaqaaaqnqnnnnan3nnnnnnnnnnaannqnqqqqqbbbbbrrqqqrqqqh11r111111jjbjjj3j33333r33333r3333333rrj3jjrjjr111111rrrrr3rrrrrrbbbqqnnnann
qaqqaaabqnqnnnnan3nnnnnnnnqannanqqqqqbqbbrrbrqqqrqqhrqr1r11111jjjjjjj33333333333333333333333jjjjrjj1j1r1rrrqbrrrrrrrrbbqqaqnanan
aqabaaabrqannnnnqnnnnnannannnanqqqqqabbbrbrrrbqrqrqrqrqh1h111jjjjjjjjj33333r33333r3333333333jjj3jj111111r1qbq3rbrrrrrraqaqqanann
aabana0abnbrnnaqnqnnnnnnnnannaaaqqaqbbbbbrrrbrbrrqbrrqhqhrh111jjjjbjj333333r3rr3r3r333333j3j3j3jj1111111qq1qbabrbrrrrrraqqqqannn
anbnanabnbnaaaqaqnaannnnnnnnanaaqaqaqbbarrrrrbrbrbbbraqhqh1b11bjjjj3b3j3333333rr3r333333j3j3jjjjjj111h1qqqqbababrbrrrrrrqqqqqnan
nannnanaanbaaaqnbqqnqnnbnnnanaanaqqqqbbbrrrbbbbrbbbbaraqbrr11111jjbj3j3j333333333333333jjj3jj3jjjjj1h3hqqabqbababbbbrrrrrqqqnana
annannananabaanbnbnqnnnnnnanqanaaqbqqbbbjrbbbbbbbbbbraqbqrrrh1111bjbj3j3333333r33333333jjjjj3jj1j11h1hqqaqabaaabbbbbbrrr333aaqan
qannaanananqnqanbnnnnnnnnnnqaqaaabqbqrbrrbrbbbbbbbbbbrbqrqrhrh111jbjj33b3j3333333333333jjjjjj11111h1hhqqqaaaaaabbbabbbr3rr33qqqn
anqnabnannqnqnn0nnnnnnnnnnnnqanaaabrr3rrrbbbbrbbbbbbbbrbqrqbhrb1rbjjbjbjjjj33j33333j3jj3j3jj1j11111hhaqqaaaaaabbaababbbrrrraqqqa
qanqanqnnnnqnnannnnnnnannanaaqaqbararrrbrbbbrbbrbbbbbbbbbqrrrr1r1rbbjbqjjjj3j3j33333jjjj3jjjj11111q1aqaaqaaaaaaaqaabbbbrrrrjn3an
nqaaqqnnnnqnqanbnnannanaanaaqaqbqbarrrbrbrbbb3rbrbbbbbbrbrrbrrb1hb1rbbjjjjqj3jjjj33jjjjjjjj1j1j11q1qqaaqaaaananqaqbqbbbbbrbr333a
nnnqannnnqnqanbnnanqnqanaaqaaqaqb3rrrrrbrbbrbb3bbbbbbbbbbbbrbrqhbh11r11jjjjbjjjjjj3jjjjjj31j1111q1qqqaqabaananqnnbqqqbbbbbrbr3rn
jnqnnannanaannnnnnqnnnaanqnqaababrrrrrrbbrbbbrbqbbbbbbbbbbrbrqrqh11111j11j1jjjjjjjjbjjjjjjj11h1j1qqqaaaaaqnnnqnnnnqqqbbbbrbrrr0r
jjnnananqannnnnnnqnnnanaaaqaqaqb3rrrrrbbbbbbbbqbqbbbbbbbbbbbbrqrrr1hr111b1j1jjjjjr1jjjj1j1jjhhhqqqqaaaaaannnnnqnnnqnnqbrbbrrrrr3
jajnnbnqannnnnnnnnnnnnanaaaqqq3qr3rrbbrbbbbbbqrqbbbbqqbbbbbbbbbrrrhrh1br1b1j1jjj11r1j11j1111hhhqqqaaaaaannnnnqnnnnnnnnqbbbbrrrrr
jjnannaannnnnaannnnnnnanaaqqqrr33rrbrbbbbbbbbbqbbbbqqqqqbbbbbbrbrrbh1r1babb1j1q1b11b1j111111qhqqqaqaaaaaannnnnqannnnnnqbqbbbrrrr
j1jnnnnnnnnnnnnnannanananaqqrrrr3rbbbbbbbbbbbbbqbbqqqqqbqbbbbbbrrbbbbhbrbb1r1b1b11j1j1j11111qqqqaaaaanaannnnnnannnnnnqnnbqbrbrbr
1jjjnnnannnnnnnnnnanananaqn3rrrrrbrbbbbbbrbbqrqqqqqqqqqqbqbbbbbbb3brhrhqrbr1r111r11j1111111qqqqaaaaanannnnnnnnnnnnnnannnnbrbrb3b
jj3j3njnnnnnnnnqnnnannnanaqnrrrrrrbbbbbbbqbqrqqqqqqqqqqbqbbbbbbbrbrrrhrrar1r11b1111111111qqqqqqaaaaannnnnnnnnnnnnnnnnnnnqbbbbbbb
j3j3j3nannnnnnbnnnnnaannarnr3rrr3bbbbbbbqbqbqqqqqqqqbqqqb3qbbbbrbrbrrrrqrnh1b11111111111bqqqaqaaaannnnnnnnnnnnnnnnnnannaqbbbbbbb
33333j3jannnannnanaaaaaar3r3rrrrrbbbbbbbbqbqqqqqqqqqqqqqqqbqbbbbrbbrbrrrnhbh1q1111r1r111qqqqaaaaanannnnnnnnnnnnnnnnnnnnnqnqbqbbb
333j33jjnannnnaananbaaanar3r3rrr3rbrbbqbrbqqqqqqrqqqqqqqqbqbbbbrbbrbrrrrrbhbb1bb1rrr111qqqqaaaaaaanannnnnnnnnnnnnnnnnnnnnqnqqqbb
33j3jjjjjnnnnanaannnna333rrjrjrrrrbrrqbqbqqqqqq3qqqqqqqqqqbbbbbbbbbrrrrrrrbrbbbrbrrarrqrqqaaaaqaanannnnnnnnnnnnnnnnnnnnnanqnqqbb
3jjjj3jj1jnnanannaana333rrrr3rrbrbrbrqqqqqqqqqqqqqqqqqqqqqqqbbbbbbrbr3rrrrrrrbrbrbhhbrqqaaaaaaqanannnnnnnnnnnnnnnnnnnnnanqnqqqqb
33jj3j33j33a3aanaaaa3333rrrrrrbrbrbbqbqbqqqqqqqqqqqqqqqqqqqqqbbbbbbrbr3rrrrrbqbrbhhhhqqqqaaaaqaqannnnnnnnnnnnnnnnnnnnnnnnnanqqqb
33jj33333333a3nanaaj333j3rrrrrrbrrbbbqbqbqqqqqqqqaqqqqbqqrqqqbbbbbbbbrr3rrrrqrararhhrrqqaaabqaqaqnnnnnnnnnnnnnnnnnnnnnnnnnnnnqqq
3jj3j333j33h31annn33j3j3jrrrrrbbbbrbbbqqqbqqqbqqaqaqrqqqqqqqqrbbbbbbrb3rrrrrrrrbrarrrrarbabbaqqqnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnqq
331j3jjjjjjj3nnnn3n33333r3rr3rbbbbbrrbqqqqbqqqbqqaqqqbqqqqbqbqbbbbbrb3rrrrrrrrbrbrrrrarabbaaaaaqnnnnnnnnnnnnnnnnnnnnnnnnnannnqqb
3313j3jj3jj3j3hnj3333333rr3333rbbbbbbqbqqqqqqqqbqqqqbqqqqqqbqbrbbbbbrbrrrrrrrrrbrrrrjrabraraaaqaqnnnnnnnnnnnnnnnnnnnnnnnnnannnqq
333j3j3333jj333j3j33333r3r33rj3rbbbbqbqbqqqqqqbbqqqbqqqqqqqbbrbrbbbrbrrr3rrr3rbrbrrrrrrrarabaaaqnqnnnnnnnnnnnnnnnnnnnnnnanannnqq
3333j3j333jj333nj3j33333r3rr3rrbrbrbbqbqbqqqqbqbqqqqqqqqbqbbrbbbrbrrrrrrrrrr3bbbrbrrrrrrbabaaqaqqnnnnnnnnnnnnnnnnnnnnnnnnnnnnnqq
33333jj333j3n3nnnj33333j3rjrrrrrbr3brbqbqbqbqqbqqqqbqqqqrbrbbbbbbrrrrrrrrrr33bbbbrbrrjrbrbbbbaqbnnnnnnnnnnnnnnnnnnnnnnnnnnnnnqqq
333331313j3jannnnan333j333rr3rrrrr33bbbqbbbqqqbqqqrqqqqrbqbbbbbbbbrrr3rr3r3rbabbnbr33r3rbrbbbbaqbnnnnnnnnnnnnnnnnnnnnnnnnnnnqnqr
j3331313jjjanannannj3q3j33r3rr3rrr3rbrbb3bbqqqqbqqqqqqbqqbqbbbrbbrbr3r33rjrbqbqqqqnqr3rrrbbbbabaqbnnnnqnnnnnnnnnnnnnnnnnnnnnnnnn
3333j3311jnnanannannq3q3333rr3r3rjr3rbr3bbbbqqqqqqqqqqqrbqbbbbbbbbrrr3r3jrb3bqqqqqq0arrrrrrbbbabrnqnqqnannnnnnnnnnnnnnnnnnnnnnna
133j3j31bnannnnnnnaqnn3n33333r3r3r3r3rrrbbbbqqqqqqqqqqbbbbbbbbbbbrrrrr333n3bqqqqqqaaqabr3rrbrbbbnqnnqqqannnnnnnnnnnnnnnnnnnnnnnq
13j3j3jnnanannannnrnnnn33333333rr3r33rbrbbbqbqqbrqbqqbbbbbbbbbrbrrrrrrr31nnaaaqnqaqqab3b33rrbrbbbnnqnqqannnnnnnnnnnnnnnnnnnnnnaa
3j3j1jnjnnannnqannaqnnnnn33333r3r333rbrbrbrbqbbbbbbbbbbbrbrbb3rrrrr3rr31nnnaaaaaaqqqqab33rrrrrrbbbbnqqqqanaannnnnnnnnnnnnnnanana
j33jhjjnabnnnnnannnnannnjnjj333r3j33rrbrbrb3bbbbbbbbbbbbbrrrr3rrrr3rj3nnnnanaaaaqaqqaaaqrbrrrr3bbbbbqqqqnqnannnnnannnnnnnnnaanaa
j3j3jbnannnnnnaannnnnanannn3j313j33rrrrrrb3bbbbbbbrbbbbbrrrrrr3r33333a3ananaaaanaqnnaaanbrb3r33rbrrbbqqqqnqnannnnnannnnnnnanaaaa
3j3jajqnabnnnaannnnnnnannnnj3j3j3333rrrrrrbrrbbrbrrrbrrr3r3rrrr03333a3ananannanaanaanaqnabq333rrrrrrqbqrqqqqnannnnnnnnnnnanaaaaa
jjjajaaabqbbaanannbnnnnnnnaaj3j3j333033rrrrrrrrrrrrb3br00333rrrrj3333aaan0nnnnannannaqaqnqnq333rrrrbrqbqrqqqqnaqnnnnnannaaaaaaaa
jjjjaaaqabbbbaanqqabnnnanannaj3jjj3j30j0r3rrrrrrrrrrbr3333333rr33n3naaan0nnnnnnnnnn0naqaanqna333rrrrbb3bqqqqqbqqqnnnnnnanaaaaaaa
jjnaqqqaqbbqqbqqqqbaqqanannannjj1jj30j033r3rrr3rrrrrr3r33333j33j3nnn0a0nn0nnannnnnnnnnan0nnaa33303r333brbbqbbqqqnnnnnnnnaaaaaaaq
jjaqqqaqbqqqqqqqqraqaqqaqbannqnqnj3130303333r3r3rrrr0r3333333jj3j0n0n0nnnnnnnanannnn0nn0nn0nna30303r3rrbrbbbbbqnqnnqnqqaaaaaqqqq

