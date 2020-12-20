pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--cascade 3
--by ???

-- press ❎/🅾️ to swap palette

pn=0
p={
	[0]={7+128,10,10+128,11,11+128,3,3+128,1,1+128,1+128,1+128,1+128},
	{7+128,10,9,9+128,8,8+128,2,2+128},
}
for i=1,14 do
	pal(i,p[pn][i],1)
end

t=rnd(10)
k=sqrt(2)
rr=60.98*k
pi=3.14

cls()
::♥::
--cls()
t+=0.01

if btnp(4) or btnp(5) then
	pn=(pn+1)%2
	for i=1,#p[pn] do
	pal(i,p[pn][i],1)
end
end

for i=1,500 do
	ang,ra=rnd(1),rnd(64*k)
	if ra>rr*.2 then
		ca,sa=cos(ang),sin(ang)
		x,y=ra*ca,ra*sa
		
		r2=ra-1.5
		ang2=ang+2/360
		ca,sa=cos(ang2),sin(ang2)
		smpl=pget(r2*ca+64,r2*sa+64)
		
		if smpl~=10 then
			circ(x+64,y+64,1,smpl)
		elseif rnd(1)<0.01 then
			circ(x,y,1,0)
		end
	end
end

for i=1,250 do
	ang,r=rnd(1)+t/8, rnd(rr)
	r2=sqrt(r)*10*sin(rr)
	
	sa=sin(ang)
	 + 0.5 * cos(-t/2 + sin(t/3))
	ca=cos(ang)
	 + 0.5*sin(t/2 + 0.5*cos(t/3))
	
	x,y=r*ca,r*sa
	x2,y2=r2*ca,r2*sa
	
	--this is just cascade.
	c=sin(x/64)+sin(y/64)
	c=c%(2*t)+2*t
	c=26*abs((c/16%1)-1/2)-13/2+7.5
	c=flr(c)+x/16
	
	l=#p[pn]
	a=l+0.5
	c=2*a*abs((c/a/2)%1-1/2)+1
	
	--c=c%(#p[pn]+1)+1

	circ(x2+64,y2+64,1,c)
end

flip() goto ♥
__gfx__
01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17710000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17771000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17711100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
0j0j0aq1aqjnjnnajbbnbn3jbbjnrnrnnnn0annaj333nnnnn3hhqnaaabnbhhqbn111h1h11q1qhjhjjhnjhjjhjhjjjjh0jj01hh000hhh0hh0hh0h00h001000100
00j0araaqnqannnnqbbbnb3bbqnnnrnjnn000jajaj3njnnh3q3qnqaaaabhhhhq11111b11q1jhjhjj11hjjhhhhjhjjjjhjjjhhhhhhhhhhhhhhhh0hh1010000h10
00jjra1rnqanannqqbbbbnjjqnjnarjnnn000anajnajnjnhh3qqqaaaanhqh1q1h111111h1jhjhjjqj1rrhhhhhhhjjjhjhjhhhhhhhhhhhhhhhhhhhhhh0110h1h0
0j0j0aqqannabnjbqqb31jjjjjnararrn000ajanjannnnhnnnqjqaa1nqnhah1h111h1qj1jjj1jaqjqrrrrjhhhjhhjjhhjhhhhhhhhhhhhhhhhhh0hhhhh1hh1hhh
bjj0aqaaananaqbbb1n33bjjjr3rarrnr303jajjajhnnnnnqqjqjq1a11qaha11a1hh1jjjjjqhaqaqjrrrrjhjjhjhjhjhhhh1hhh1hhhhhhhhhhhhhhhhhhh1h1hh
j0j33a3ananaqrbbbn33bjjjr3r3rqrr303j3jnn3nanjnn3qqbjbbj11111a11ahah1j1jj1aaaharjjjrrqjjjhjhjhjhh1h1h1h1hhhhhhhhhhhhhhhhhhhhh1hhh
000q331aanaqrqbabn1r1bbrjr3rraar0333jaa3a3njnj3q3bbbjj1j111hjhahah1j1jjaaaaajjrjjqjqjqjjjhjhhhh1hhh1hhh1hhhhhhhhhhhhhhhhhhhhhh1h
00003a3aaaarqaababr1rbjbrr3raran333n33na3nnjjn31b1bjnjj111111jhah111j1abaaqjqjjjqjqjqjhjjj1jhhhhhh1h11hhhhhh0hhhhhhhhhhhhhhhh1h1
0003a3aaaaraaqabbrnrbabjq3rarrn3n3n3333nbnjnj31b1b1bjaa1111111a1j1131jbabjqqjqqjjqjhhjjjjjj1jhh1h1h1h11h1hhhhhhhhhhhhhhhhhh0hh1h
a3333aaaarabrabbbbr3hrj3rnaarnrn33nn33nbabnj1nj1a1jaajaja1j1jjhjjj313bbbjbjqjqjjjjrhjjjjjj1j111h1h1h1111h0hhhhhhhhhhhhhhhh0h00hh
00333a3anabrbqrbbqahrhr33aaaar3333333n3nban13j1aajajjjjajj1jjjjjjj131b3jbjjjjjarjjjrjjjjj1j1j111h1h1h10h0h0h0hhhhhhhhhhhhjh0j100
00qaa3aqrrrbqnbnrnjahrn333aa3nn333ja33njbnq3r3jaaajjaj1j11111qjjj1h1j3j3jjjjjjjjjjjjjjj1j11j111h1h1h1h0hh0h0h0hhhhhhhhhhhhjh1j11
0qaqaaqrrrbqbarrnrnnnnq3ra33a3n33jnj333bnbrr3ra3a3aaj1j1111111qjhh1h3j3jjjjjjjjjjj3jjjjh1h11h1h1h1h11hhhhh0h0h0hhhhhhjhhhhhjh1j0
0nqaaqaqrqqbqranrnnbhq3r3raa33qn33ja333jbrrrr3ba3a3aa31111111jjhjhhj3333jjjjj1jj3111jjj11j1j1j1h1h11h1hhhhhhhhhh00hhjhhjh1hhjjjj
0nnaaaqrqbqqarrnnnbqr3q3rha3333q3333r3rbqrr33aa3a3aa3a3n111hj1jjhjh3j33jjjj3jj1311111j1j1jjjj1j1h1hh1hhhhhhhhhh0n00h0hjhjhhhhjjj
n33aaarqrqbqrannnbqrqrr333q3r3rqr3ar3rnjrqrrraa33333aj3j1111hj1qhhjj33jjjj3j31j11111jqjjjjjjjjhh1hhhhhhhnhhhhhhn0nhh0jhjjjjh30hh
0qa3qqqrqqqqannnnnnqrrqr333r3r3rqrrnrnnrqrrrrraa3333j3j1j11hj1qhjjjrjj1jjjj31j1jhjhjhjjjjjjh1h11hhhhhhhhhhhhhhhhn1h1j0jhjjhjhh3h
qnbqqqbqrbqjannnnn3qaqrr3ra3r3r3r3nrnnrrrrrrrrrar3333jrj1jhjhjjjjjjjj1j1jbj1j1jhjhjhjhjjjhh0h11h1hhhhhhhhhhhhhhhhjhj1jhjhhjhhhhh
nbqbqbrbnrbqnnnrn333qarrrnrrjrqqaqrnnanrrrbnrrrrrr3ajbnjjjhhj1hjjjjj1jjjjjj11jh3hhj1hjhjhj0hhh11hhhhhhhhhhhhhhhhhhhhjhjj1jj1hhhj
abbqnqbbqnqrqnrnn333rjjrrrbjrjnajaabrnrrrbnbnrrrrrarbnj3j3jj1j1j1hbhjjjjjjhjha313j1j11jjn0jqhhhqhhhhhhhhhhhhhhhh1hhhjjjjjj1j1jjh
ba3nbnbqraa3rr3rar3rjjjjrbjbjrrjajbnbrrrbbbnrnbarrrrrbnj33j3j1jjjbhb3jjjjjjhaha3j1j11jjjjjqjqhhhqhhqhhhhhhhhhhhhh1h13h1jjjj11j3j
b0nbqbnrarba33rabarnrjjrrjbjbrjarbjbnrrbbbbnbbabrrrrbbr3333jjjjrbhb31jjjjjhahahjjj1jj1jjn1jqhhhhhhqhhhhhhhh1hhhhhh1hh1h131h113jh
0b0qbnqnrbabn33babbrjrrbrrbbjjjjbrbbbnrnbbbbbbbbrrbbbb3r3333rjrjjb3131jhj1j11r1jj3jj1n1n11h1qhhhhhhhhhhhhh1h11hhhhh1hh1h1h111jhh
b0b3nqnrrabn33aabbrbrjbqbbbbajjjqbbbbbbbnbabbbbbbbbbbbb3b33rrrjjbj311hhjjj1111r13j3jj1a1h11h1hhhrhhhhhhhhhhhh111hjhhjhh1h1h1h1hh
nb3b3nrrrrbb3n3annb3nbqbqnbajbjbnqqnbbbbbnbabbbbbbbbbbrb3br3rjrbj3jj1jhj1j11111313jjjh1h1hh1hhhhhrhhhhhrhhhhh1111hh1hqjq1hqh1hhh
03b3nrnrrrbbb3nannnn3nbqnbabbjbnbqnqbbbbnbabbbbbbbbbbrbrbr3rjrj33j3jrj31j11r11313qjjhj11111hhhhhrhhbhhrhhhhh11111h1h1jqjqq3qh11h
nn3nrarqrbbrr33nanrbrbnbqbbaqbbbqbqbnbbbbababbbbbqqbbbrb3rr3rj33j3j3jrj311rrr3h31hhhj1j11111hhjhhnbhbnhr1hh11111r1h1jjjq3jqh1j11
nnnrarr3barrrrrajabrbnbqbqbqabqbqqbnbbbbbaabqbbbqqqaqrbr3rrrrr33rj3jrj33nrjr3rjhh11h111h111njjhjn3nbh3nj3311111r1r1rjj13133jj111
nnrnrrrrnbrbrrabqn3bnbbbqbqbbbbqqqqbqqbbbbbqbqqqrqaqrbr3r333r3r3333bjbj3jjrjrjhjh1h1111jhjhjnjj33n3hhh3333311101r0rrjrj13133jj11
nnrrnrrrbrbrbbbqqqqqqbbbaqbbbbbqqqqqqqaqbbbbqqbrqrrrqrbr33333r333rrbbj3jjjj3jhjh3hj1111hjhjjjhhhh3hhhhhj33r311h3hhjrrjrr1j33jjq1
nnnrrar3rbrbbb3qqqqqqbbbqqqqbbqbnqbqqqqqqbbqqbqrrrrqrqraa333r333rrrrb33jjjqjj3h3h3hh11hhh1jjjhhhqhqhhhhhhh3r1h1hhhhjjrjbj3jjjjrj
nnnrararbrbnbbrnq3q3bbbbqbqqnqbnqnqqqbqqqqbqqbrbrrrrqra33a3rrb3rbrrrj3j3j3jjah3h3hh1hhhhhhhjqhhqhqhqhhhhhhhr11b1hh1jjjbj0j33jrrr
nnr3raabrbbbbnbqnq3a3bbqbqqbqqqqnnbbbqbqqbqbqarr3rrq3bra333rbrr3brr3bj3j333ajhh1hhhhh1hhhhhhhqhhhhhqh1hhhhrhrb1b1jjjj3jrjr0h3hrr
nn3rrababbrbnbrnqnq3abqbqbqqbqqqnqbqqbbbqqbqqra3r3rr3rbr3333rr3rr33333j333a3hjhhjhhr1h1hjhrrhhhhhhhhhhhhhhhr1rb111jjjrjrr3r0h1rr
nnnrrrabaqbbnraannq3qannbqqqnaqqqbbqbqbbqqaqrrrr3rr3r3rb3333rr3r3r333333333a3hj3h1hh11h1hrrrhhhhhhhhhhhhqhh1r1r11111j1rjrb3r1h1r
nnnrrrrnnabbbbnnnbnqnnnnnqqaaqqnqbbbqbbqbqbrrrrarrqr3brbb3333rrrr333r3j33a331j1jhhh1h11hrrrhhhhhh1h3hhhqjqjq1j11111j1jjrj3bjb13r
rn3rrranaaabbnbnbnbnqnnnbnanaaqbbqbabaqbqbabrrrarr3b3b3b3a33r3rrr3r3rj3j333331jhjh1hr1hhhhrqhhhh1h1hb11jqjqjjjj1jbj1j1bjjbjjj3j3
narnrbbaaabbbbbbnbnqnbnbnbqaaabqqbqabqaqqababaa3a3q33333333r3rr3rr3rj3j3j33jjrjjh1h111hh1qqrhhh1h1h11111hjjqhjjjbj1jjbjjjjjjjj3j
3nnrbbbbnabbbbqbbnbqqnbnbqqqbqaqqqqqaaabaqaba33a3q3q333333j33r3r3r3jjj3j3jjjjjhjjj1hr11111qqhhhh1h1h1h11hhhhjhjjj1b1bjjjjjjjjjjj
brqrbbbbqaabbbbnbbnbqnnbbbqbqbqqqqqqaqaabaraa33333qq3b33333jrj33r333jjj3jjjjjhjhj1jh1hh11h1hhhhhhhhhh1h11hhhhjj1jj1jjbbjjjjjjrj3
rqrqbbbababbbbbbbbbbnqqbbbaabqqqqqqqaaqbaraaaa33r3q3q333333jj3j3333jjjjj3jjbjbhj1jhhhhhhhhhhhhhhhhhhhh1111hhhbhj1hjjjbjbjjj33jjr
qrqqqbabbbbbbbbabbbbqnbqbqbaqqqqqqqaaaab3qraa3333q3qb33333j3jj3j33j3jjjjbjbj1jb1j1hhhhhhhhh1qhhqhhhh1hh1h1hbbhbhhbhjjjbjbjjjjjrj
bqqqbqbbnbbbbbabaabbqaqbqbqqaqqqqqaqaababbbaaa3r3q3qj333r33jjqj3j33jbjjjjjj1j13jjjjhh3hhhrhhhqhhhhh1hhhh1hnbnbhbhhbjrjjbbbjj1jj3
nbqqqbbbbnqqnbbaabaqababaqbaqaqbqqqqaaabbbbraaa3a3qjjj3r33333j3j333bjjjjj1jj13bjjjh33h3hhhhhhh1hhh1h1hh1h1h11hbhbbjrj11rbbb3j111
qnqqqqbbrbbnqbbabqbqbabaqbrbaqbqqqqaraaaqbr3raaa3a3jj3r333q33qj33j3jjjjj1j13b1jrjj3hhhhhhhhhhhh1hhh1h11h1j1j111b1b1j1jrjrb3j31j1
bqnqnqbrbrnqbbanaqbbbbabbrbrqqqqqqar3r33bb3r3qaaa33j3j3rrq3q3jjjj3jjjjjjr1331j11333hhhhhhhhhhh1hhhhhhh11j1j1jbhbb1b1j1j1jj1jjj1j
rnqnqbqbrbbnbbbaqbqbqbbabbrqqqqqqaa3r3333bj3arqaa33jj3jr3rj33jjj3jjrjjjr3j33311j1hhhhhhhhrhhhhhhhhhhhhh111hjhhbhhb1b1j1jj1j1jjjj
qrqqbbrqrbbbnbaqaqbqbbbaaabqqqqqrqaa3n333jrjrrrabaj3jj33r33j33jjj1jjjjjjj3j1j3j1hhhhhhhrrhrrrhhhh1hhhhqq1qbhbhhhhhbbbjjj1j1jj1bj
rqbqbbbrbrbbbnbabbqabbbbaaabaqqrqraaaa3qb3jrrrrbjjrjjjjr33j3j3j31j1rjjjjjj131jjhjhhhhhrhbhrrhhhhhhhhhhh11h1bhbh1hbbbbjjjj11j1j1j
qrrbrbrrrbbanbnbbqbbqbbbababqaqqraaaa3qqqr3jqrrjbjjrjjjj33jj3j3jj1jjjjjjj311j1j1jhbhhhbbhbhhhhhhh1hhhh1111h1bhh11hbbjhjj1j11jj3r
rrrrrrrbrraranbnbbqqbbbbbabqbqqraaaa3aqqq3jqjqjjjbrrbjjjjj3jj3j3jjr3jjbjj1jj1j1j1jhhbbhbbhhhhhhhhhhhhh11111hjhjhjhjhbjhjj1jjj3jj
rrrbrrarrrbaaabbbbbrbrbbbbabqqrqraaa33qq33bjqjjjjjrbrbjjjjjrr331r33j3j1j1jj1j1j1j11bhhbhb1hhhhhhhhhhhhh111h11jhjjjhjqbbhbjj1jjj1
qarnra3rrrbraaabbbrbrbrbbabbbqqrrra3qbrbb3j3j3jjjjjrbbrjjjr3r31313j3j1j1j1111j1111hhhhhbhb1hhhhhhhhhhhhh1b1111hj1hjqbbhbjbjj111j
arrrr3arrrrarabbbrbrbrrbbabbbbrrrrbabrbrb3jj333jjjrr3rjjjr3r3j31jajjjj13131111111h1hhhhhb1b11hhhhhhhhhhhh1b11bh1h1h3b3bhbjh11j11
arrrrr3rrrarrnabaarbbrbrbrbbbbrrrrrjqbrrbjjjj3jjjjj3r3jjjjr3jbjjjjjjj111b3h11h1111hhhh1hhbh1h1hhhhhhhhhhhh1hb1bh1h1h3b111hhrj1jj
jrrjrararnra3raraarrbbrbrbrbbbrrrrrrbbbbrrjjjj3jjj3j3r3jjj3rb11jjjjj31113hhhhhh11hhhh111hh1h1h11hhhhhhhhhhhh1b11b13h3h1h1jjhrj1j
rjrrjaarnraarjrarrrbbbbrbrbrbbqrrrrrrbbrrrrjjjjjjjjrj33rj3jj1111j1nj331h1hh1h1hh1hhh1h1111hhh1hhhhhhhhhhhhhhh1hb1bb3b3h1hhhjhrjr
jrrjrjaarraajraqrajbbjbbrbrbbrbqrrrrbrrrrr3jjjjjjj3jrjrrrjjj1113131331h1111h1h1hhhhhh1111111hhh1hhhhhhhhhhhhhhb1b1hb1b1bhjhhhrrj
rajrjjjrrrrraaqrqrbjjbjbbrbbbrrbbrrrrrrrr3j3jjjj3333j3j3jjjjj1q131j11h1111h1h1hhhhhhh1111111111h11111hhhhhhh1hh11111b1bhbhhj1hr1
nrnjjjrrrrraraaqrajbjjbjjbbbrbrbbbjjrrrr3r3j3jjjj333jj3jjjj13jjqjj111111111h1h11hhhhh11111111111h11111hhh1h1h1hh11h11bhbh1jhj11r
rnbnjjjrrrarabjanqarjbjbqbbrbrbrbjjjjrrbrjj3rjjjj33j3jj3jj131bjjjj1111111hh1h1111h11h11111h111111h111hhhhh1h1h11b11h1hbr1h11h1h1
nbnbnjjrjjrabaabrar3rjbqbqrbr3rbjbjjrrrjrrjr3rjj33r3jnbrbj31rjbjjh11111111h1h11111111h1h1h11111111h1hhhhhhhh11111b1bhhhhh11q1hhh
rnbnrbrjjrjraaarbr3rbrj3rb3r3r3rbjbbjrjrjr3rrr333r3b3nrbjr113rjqh11111111h1h1h111h1111hhh11111111h11hhhhhhhhhh1111bhhhhhhhq13hhh
3rnbrrrqrbrrrqbbrr3qrr3r33b333bbjjjjbjrjr3j31333r3r3j3br111111jh1h11hh1111h11111hjhjh11h111111h1111h11hhh1hhhhh1hhrhrhhhhqhqhhhh
33rrjr3rbnbrqrqrr3r3rrr3rr33r3rbjjjjjrjrjjr1r11333rj3j3131111j11h11h1h1111h1h111hhjh11111111111111h11h1hh1hhhhhhhhhhhhhhhhhhh3hh
331jr3j3rbrjrqr3rr3rrrrarjbr3rrrb3j3jqrjrrjr11313qjjj33r1j3j31jh1hh1hh111h1h1h1hhhhh11111111111111hhh1hhhh1hhhhhhhhhhhhhhhhh3hhh
3n3bjj3jbabrnaqr3rrrrr3rabrjjrrr333j3bjrjrrrrr131jjjj133j3jbj3hhhhhhhhh1h1hhh1hhhhh1h111111111111h11hh1hhhhh1hhhhh1hhhhhhhhhb3hh
33bnnqjqabaqararrrrrr3r3bajjjjrjb3q3bjbjrrrrrrr1j1jj131jjjjjhhhhhh1h11h11h1hhhh1h1hh111111111j1111h1hhh1hhhhhhhhhhhhhhhhhhhhhbhh
33nnnnqqq3rbrar3rrrrrr3rrbajjrjrrqrqr3jjjjjrrr1j1333a13jjjjjhhhhh111111111h1hh1h11jhjh1hhh1hj1j11hh1hhhhh1h1hhh3hhhhh1hhhhhhbhbh
33nnnnnq3j3r3rarjrrrrr3r3jbj3jrjbrqr3r3jjjjjjjj1rb1b3r11j3j3hhhhh11111111h1h1hj11hhjh1hh1hjhhh1j1jjhhhhh1h1hhhhhhhhh1h1hhhhhhbhh
3r3nqnnqj3r3r3rarnrrr3b3b3jrj3jajrjrr3rrrbjjjbjjb131a111133hhhhhhh11h11h11h1hjh1h1hhhhh1hjhjhhhjjj1jhhh1h1hhhhhhhhhhh1hjhjhhjhhh
r3jqnqnrqjq33r3rnrrrrr3b3brbb3bjrrrjjbrjrrjjj3jjj313r111hqhhhhhhhh1h11h1h11hhhjj1h1hhhhh1hhhhhjjj1j1jhhh11hhhhhhhhhh1h1hj1hhjjhh
3qq3qjrrrqr3333rr33rrrrrbrrr3r3jrjrrrj1rjjbjjjjj3j3rjr1hhh1hhhhhh1h111111hhhjhj1j1hhhjh1hhhhhhhjj11jjjhhhh1hh11hhhhqq1qhqqhjhjjr
3q3q3brrrrqr333333333rrrrrrrr3jrjrjrj1r1j3jjjjjjb3b3rjhhh1h1hhhhhh1h11111hhjhjhj1jjhhh1hhjhhhhhhhh1jjjhhhhhh1h1hhhh1hhhqhq1hjjjj
33q3qrbrrrr33333r3333331rrrrrrrjrjrj3j131j3jjjjbbbhb3hh1hh11h1hhh1h111111hhhjh1hjjjjhj11jhjhhhhhhhhhjhjhhh1hhhhrh11hhhhhqh010jjb
3q3arqrr3r3r33333r33331r1rrrrrrrjjj3j331j1jjjjhhbhhhhh1h1h1h1h1hhh1h11h1hhhhhhh11jjjj1j1jjh1hhhhhh1hhhhjhhhhhhhhrhhhhhh1hh3h0h0j
q3qqqrr333r3r33r33333r31r13rrarrj1j13jj3jjjjjhjjhh1hhhh1h1h1h1hhhhhhhh1h1hhhjhjhjjjjhjjjjjjhhhhhhhhjh1jhh1hhhh1r11hhhhhhh3h0h0hh
bqbaqrq333rr3r33333rr3r313131rarrj1jjjrjjjjjhj1jj1h1hhh1hh11hhhhhhhhhhh1hhhjjjhjhjjhhj1jjjjjhhhhhhjhh11j1hhhhhr1rhhhhhhhbhhh0000
qbbbarr33r3r13r3r3r3rrrrr33rjrrrrrbrbjjjjjjhj1j1111hhhh1111h1hhhhhhhhhh1hhhhjhjhhhjhh1jjjjjjjhjhhhh1hhjhh1hhh1hr11hhhhhhhh3h0000
qqbbrqr3r31j33333r3rrrrr33rrrrrrrrrbjrjjjjj3hj1h1h1hhh1h1111hhh1h1hh1h1h1hhhhhhhhhhj1h1hj3jjjhhhhh1h1jjh1h1hhh1h11hhhhhhb3h3h000
q3bqbrqrqrj3333333333rrr333rrrrrrrrrrjjjjjj1hjhhh1hhhhh1111hhh1h1h11h1h1hhhhh1hhhj3jj1j13j3jhj3hhhj1jjjjh1hh1hh1111hhhhbhb3hhhh0
hqqbqqq3rr3r33333333333333qrjrrrr3rrrrrjjj1h1hhhhhhhhh1h111hh1h1hhhh11hjhh1j1j1hh3j3jj1hj311j3j3h3h11j1jhhhhh1111h1hhhbh1hhhhh00
b3qqqq3q3qr3333333333313333rr3r3jjjrrrrbjjh1hhhhhhhhh1h1111h1h1hhhhh1h1hjjjh11hhhh3jjjhjh1j11j3j331111j11hhhj111h1h1h1h1hhbhh0h0
bb3qqqq3qjqr3h333333333333r3333jjjjjrrjjbjjh1hhhhhhhhh1hh1hhh1hhhhhhh1hjjjjjh1hhhhj1j1jhjj1jhjj333311j1j1h1j1j1h1h1h1h1hhhhhhh00
bbr3q3qqqqjbh3h333333331313r3333jjjjjjrjjrh1h1hhh1hhh1hh1hhh1111hhhhh1hhjjj1j1hh3hjjjj1hh3j3j3jjj31j1jj1j1h1j1j1h1h1hjh1hhbhhhhh
3r33333qqqqqbh333hhh333313133bbjbj1jjj1jjjr11hhhhhh1hhhhhhh11111hh111hhh1j1j1113hjhj1j11h3333j3jjj1jjj1j1h1hhj1jhjhhjhhhhhhbbbhh
33333b3bqqq3qbjhhhh3h3333133bbjbj1j1j1j1jh1h1hh1h11h11hh1hhh111h1h1hhhhhh1h1j1hh3hj1j111333333hh3333jjjjjh111111jhhhhhjh1h1hbhhh
r3b3r3b3bqbqbjqj3h3h3331333bjbbjbb1bj11h1111hh1hhh11h1hhhhhhhhh1h1h1jhhh1h1j111hhh3j111hj3333h333333j1jjhhhh1111hhhhjjhjh1hhbhh0
33br3b333bqq3qj3j3h33133333j1jrrb3r1r1h1111hhhhhhh1h1h1hhhhhhh1h1h1hhj1hh1111313h31311j1hjj3133h33331jj1hhh1h1111hhhhjjjj1hhh0hh
1b3brj3j3brbj33j3j331331333jjrjrrr1r1r1h11hhhhhhh111h11hhhhhhhh1hhhhh1h11111113h3h31j11j11jj331313j111111hjh1111hhhhhhjjhh1h1h00
rrb3jnj3jrjrbj3jj3jh3j13b3jrjjrrr1r111r1111hhhh11111111hh1hhhhhhhhhhhh111j111113h1j11jj1j113333j3jj111j111h1111hjhhhhhhhhhhh10hh
rrrrrjnjbjrjbjjjjj33j3jj3j3jr3rr1r1111111111hh111111111h1h1hhhhhhhhhh111j1j11j3j111jjjjjj1j3331jj3j31j1j11hh1h1jhjjhhhhhhhh1h1hh
qrrrbrbbjbjbjrjjjjj33j3jj3jj1r31r1111h11111h11111111111hh1hhhhhhhhhh1jhhhjjhjh1j1113j11j131j3jj13jj111jj1hhhhhhjjjjh1hhhhhhh10hh
rqb1rbrb3jbjbj3jjjjjj3jj3131j1111111111h11h1h111111111hh1hh1hhhhhhh1j1jhjj1jh133j13j3j1331hhj3j1jjj3313jhjhhhhjhjjjhjhjhhhhhhh00
q0qrrbb3r3jjj333jjjjhj3313111111131111111h11hh1111111hhhh1hhhhjhh1hhjjjjhjj313331313j131311h3j11j13j331h1h1hhhhjhjhhhjhhhhhhh0hh
0q0rbr3r3baaa33j3rj3j1333131111111h11111111h11111111hhh11hh1hjjjhhhhjj3jjj13311331jj1h13jjhj33111jj3j3j1hhh1hh1hhj0hjhjhhhhh0h0h
r0q0r3b3baaaajajj1311113111j111j3hjhh111111h1h111h11jjh1111hjjjj1hhhj3j311313jh1jjj1j1333j13j3111j1j311jj1h11hh1jjhhhjjhjhhhh0hh
rr0bq33brbaajajj1j1311111111j3j1jjhj1111h111h1h1h11jjjj111111jjj11hj113111j3jj11jjjjj33331h13111h1j11j1j1h1111hhhhhhh1hjhhjhhhhh
rr003j3r13bbbjabj131j111113j3j1j1hjh111h111hhh1h1h11jjh11111j1jjj1j11j1j1jjjj1111jjjjj331h1h1j1j3j31j11jh1h11hhhhhhh1hjhjjhhhhhh
rr0rr3jr0j1b1bbjjjj111j1j311jrr11rh1hh11h1hhhhh11111111111111jjj1j1j31j1jjjj1j11j3jjj13j311h11jjj3jjj13jhhjhhhhhhh0hhjhjjhjhj1h0
rrr3rrrqr131b1j11j13111jhj1111r1h11hhhhh1h1h1h1111111111h11j1j1jj1j3j31j1jj1j13j3j3113j311h1h1j1jj3hj31hjhhh1hhhjhh0jhjjjjhhhhh0
rr3rrrrrq31a1j1j11313111jrq11hj11hh11hh1hqh1hq11111111111j11j1j1jjjj3jj1jhhjjjj3j3j11j331h1h1j1jj3hjhjjjhjj1hjbjjj0hh1jjjjhhhhhh
3b3rrr3ra3a3a3j11j1313h11qbqh11j1qh1j1jhqhqqqq1q11111111j1jjjj1j1jj1j13jhjjjjjjj3j13jj31h1h1j1jj3jjhjjjjhjjjjhhjj00hhh1jjrrhhhhh
j3brrrrn333a33a3j3j13j3h3bhbrb1j1rrj1jjhhqqqq1q11111111j1j1j1j11jjj113hhjhhjjhjhj13j333313jhj113jh3jjjjhhhjhhhhhj000h1h1jrhrhhhj
3j3nrrnr3jj33a3j3j33j3j3j3b3rrjbjjbrjqhj1q1qqq1q111q1111j111j111jjjj1h3hhh3j3jhj1hj333333j3j1j1jjjjjjjjhhhajjhhb0j0j111j3jrhhjh0
n3nanna3jjajr313333q3jq33b3r3bjjjqjqq1qhqhq1q11aha11111111111111jjjjjhhhhhj3j3jhjjjjj333h3jjj1hjjh3jjjjjhjjajhbbj01h1113jhhrhhrh
rranrnna3jja313333qqqq33q3b3qjqjqjqqq1r1hq1111a1a1h111111111j1111jjjh3hhhhjj333hjjjjhj3h3hjj1jj3h3h3jjjhjhajhhbhb1h1j13131hrrjhr
3rrrnrannn3njq3j3qj3qbqq3q3q3qj1bqbh1r1111h1h11a11111111111j1111j1jhjjhhhjjj333jjj3hj333h11jjjhh3h3jjjhjhjhjahbbhh1h1hj31311jjj0
rrrrqr3nqnjjqjqqjq3q3q3bq3jbqbnb1bbbrj1r1h1h1h1111111b111111j111jjhjjhjhj3j3j3jjj3hj3j33j1jjjhj3hjjj1jjhjhjjjbhbh1h1h11h311h1jr0
nrrqrqrqnqnjjqqqqjq3q333bjbjjqjnb1qrjrj1r1h1111h1111b1b1j1111j1jjjhhjjhj3j3j3jjjj3jhj3jj1j1jjj3j3jj1j1jhjjjjqhbh1b1b11h1h1r1jhjr
rnnrqr3qqnqqnqqajqjqq333jnjbjjnjnnbqrjhbhh1h11h111111jjjjjj11hjhjhjhjjj3j3j3j3jj333jhhj1j1jjjhj3jjjj1ahhhhaj1hhh11bjhh1hhh1hhjh0
nnrnr3njqqqqqjaqajqaaq3jnjnj3qjnjbnnqqbhb1j1hh1haa1bjjjjjj11j1hjjjhjjj3h333j3h3jj3jhhjjjj0jjjjhjjjjjjjhhhjj1j1h1b1bbjhhh1h1jjhjr
nnnrn33n33qqqqqaqrqaaa3qjn3qq3njqqqqqqhbhj1j1h1aaab1bjjjj1hjhjjjjjjjj3hhh33hh33j3jhhjjjjjjjjj1jj1jjjjh1hj11j1hhb1bb1br11h101jj10
an3n3n33q3qqnjanjqrqnaq3aqqqqqqqqqqjq11hn1j1anan1a1b1bjjjh1hjjjj1jjjjjjhj3hhj3j3j3jj1jjjjjjj1j11j1jjh1h11111h1jhbhhb11111h11j101
naq3a333333njnjjnjqnaq3aq3qqqaqjqqj1j1111b11nan11111111jh1h1jjjjjjjjjjjj3jhj3j3j3jj1j10jjjj1j1jb1jjjjh1hj11h1h10jhh1hr11hh1j1010
aqnana33333n3jqnja3aa3qqaq3qrq3qj11j1111bbj11n111111111h1hjjjjjjjjjjjjjjh1jhj3j3hj1j10jj0j1j1jbjjjjjja1jhhhhh1qj0h0hrjrhhhh11h0h
njrnaan3a333n3qqn3a3a33nq3qrq3q31311j111bj1j111q1b1a11h1hjjjjjjjjjjjhjjh1h1j1j3hjhj1h100j0h11bjbjjjjjja00hhhjjjhh11hjrjhhhj1110h
qnnranbaaaa33qqqqq3a3a3a3q3q3q3q313qq1111jj111q1q1q11h11jhjjjjjjjjjhjjjjh1j1j113hjjh10000hj1j1j1jjjjja00013hjjjh1h110jhhhh0110j0
nqrnqbnbaa3abbqq33qba3qnq3n3q3qnq3q3q31qj1j1r11q1q11111j1jjj1jjjjjhhjjjjjj1j13hhjh110000hjhhjj1jjj1j1a101h133j0hhj10jhhhhjh11j00
qnnqn3ba3babbbb33bbabbnqnnnn3qnqnn3q3a3aqj13rrrq11q11111jjjjj1hjjhhhjjjjjjj13j3jh111100h1hhjhjjjjjj1h1a111h3jqj01hjjhjhhjhj01100
jh0n3ba3aa3aabrbbabbb3bnqnnbnnanaaa3a3anaa3j3rj1h11q11h111jj1j1hj1hjjj1jjjjjj3jhjh1100h0h1hhjjjjjj1h11113h3hqjq10113jh0hhjh1010j
3j0jj33a33a3aaarqbabqabqbababanabaqanaaaa3j3jj1b13qh1h11111hj1hh11jjjjj1jjj1hjhjj1h11j0h1hjhjj1j0hh11a1hh3hhjh1h110130hh0h1110j0
j3ajjaj3jn3aarrqnqbaaqabaaababaaabaaaabn3b3bb1b13hh1h11111h1h1h1111jjjjj111jhhjjjj1h1h11hjhjh1j0h0hja1a3hjhjhqhj0010hhhhh011100j
3a3aa0ajarjarrrrqaqqaaqnanaaqaaraaraa3nbbbbbbb13hjhh11111h1h3h1111hjjjjh111hhhjhjhh1h1111jjhj01a1hhaaa11hhjhqhq0j00h0hj0h3010000
b3abbanrrjrjarrnbq3aqaqanaqqaqaarrar333bbbbqbqhhjhja1j1hh1hh1h3h11h1jjha1111hjhjhhhh1h1j1j1h0101ajaaaa1h1hhhhqh0010hhj0j0r30jjj0
br03bbrb0rjbbanbn3q3aqrqqqqqqaaaqara333a3bqaqhhbhjajj1jh1h1rh33311111ha111h1hhjhhhhhh1j1jhh1h011j3jaa1110hhhhh0000hhh1j3r00jjjjj
r0r03rb0b0bbbbrnqq3nqrqqqqqqqqaqrnraa3r3r3qqanhhb3qjhjh3h1ah3h3111111111111h1hhhhhh1hh1jhjhh111j1jhhh111ha1hhjj001hh1j3j3jjjjjj0
0r03r0rb00bbrrbrqrqqqrqrqrqqqq0rqraraaar3rrqrn3r3qjhjh3hbjbah311111111111111hhhhhhhh1h11jhhh1111jahhhh11h1r1hjjj0hhh11j3jjj1jj03

