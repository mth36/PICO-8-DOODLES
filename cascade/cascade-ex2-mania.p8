pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
	░=250 --default sampling rate
	dt=0.01
	t=0

	poke(0x5f2d, 1) --enable mouse/keyboard

	pp={
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
		0,
		0,
		0,
		1,
		3+128,
		3,
		11+128,
		11,
		10+128,
		10,
		7+128 
	}
	for i=1,#pp do
		if pp[i]~='' then
			pal(i,pp[i],1)
		end
	end

	dg=100
	for i=1,dg do
		ang=i/dg
		line(64,64,
			64+64*q.k*cos(ang),64+64*q.k*sin(ang),
			rnd(#pp)+1)
	end

	--block state (don't need to touch)
	fs={b=1,t=0,rp=true} 

	init_blocks()
end

function _update()
	--cls()
	t+=dt 
	fs.t+=1/30
	_mouse()

	draw()
	check_timer()
end

-->8
--prog

q={
	k=sqrt(2),
	rr=61*sqrt(2),
	rr2=60.98*sqrt(2)
} --you can cache values here if you want.
q.rr2=61*q.k

function init_blocks()
	f={
		--{t=1,go=nil,tab={},wrap=nil,drw=nil,next=nil}
		{t=4,go=c1,nowrap=true},
		{t=4,go=c2,nowrap=true},
		{t=4,go=c3,nowrap=true}
	}
end

function c1(tab)
	for i=1,1000 do
		ang,ra=rnd(1),rnd(64*q.k)
		if ra>q.rr*.2 then
			ca=cos(ang)
			sa=sin(ang)
			x,y=ra*ca,ra*sa
			--circ(x+64,y+64,1,7)
			r2=ra-1
			smpl=pget(r2*ca+64,r2*sa+64)
			circ(x+64,y+64,1,smpl)
		end
	end

	for i=1,250 do
		ang,r=rnd(1),rnd(q.rr)
		r2=sqrt(r)*10*sin(q.rr)
		
		sa=sin(ang)+cos(t/2+sin(t/3))/2
		ca=cos(ang)+sin(t/2+(cos(t/3)/2))/2
		
		x,y=r*ca,r*sa
		x2,y2=r2*ca,r2*sa
		
		c=sin(x/64)+sin(y/64)
		c=c%(t*2) 
		c=c+2*t --move it
		c=2*13*abs((c/16%1)-1/2)-13/2+7.5
		c=flr(c)
		c=c%#pp+1 -- [1,14]

		circ(x2+64,y2+64,1,c)
	end
end

function c2(tab)
	for i=1,500 do
		ang,ra=rnd(1),rnd(64*q.k)
		if ra>q.rr*.2 then
			ca=cos(ang)
			sa=sin(ang)
			x,y=ra*ca,ra*sa
			--circ(x+64,y+64,1,7)
			r2=ra+1.5
			ang2=ang+2/360
			ca=cos(ang2)
			sa=sin(ang2)
			--smpl=pget(r2*ca+64,r2*sa+64)
			smpl=pget(x+64-1,y+64-3)
			if smpl~=10 then
				circ(x+64,y+64,1,smpl)
			elseif rnd(1)<0.01 then
				circ(x,y,1,0)
			end
		end
	end

	for i=1,500 do
		ang,r=rnd(1),rnd(q.rr)
		r2=sqrt(r)*10*sin(q.rr)
		
		sa=sin(ang)+cos(t/2+sin(t/3))/2
		ca=cos(ang)+sin(t/2+(cos(t/3)/2))/2
		
		x,y=r*ca,r*sa
		x2,y2=r2*ca,r2*sa
		
		c=sin(x/64)+sin(y/64)
		c=c%(t*2) 
		c=c+2*t --move it
		c=2*13*abs((c/16%1)-1/2)-13/2+7.5
		c=flr(c)
		c=c%#pp+1 -- [1,14]

		circ(x2+64,y2+64,1,c)
	end
end

function c3(tab)

	for i=1,500 do
		ang,ra=rnd(1),rnd(64*q.k)
		if ra>q.rr2*.2 then
			ca=cos(ang)
			sa=sin(ang)
			x,y=ra*ca,ra*sa
			--circ(x+64,y+64,1,7)
			r2=ra+2
			smpl=pget(r2*ca+64,r2*sa+64)
			if smpl~=10 then
				circ(x+64,y+64,1,smpl)
			elseif rnd(1)<0.01 then
				circ(x,y,1,0)
			end
		end
	end

	for i=1,250 do
		--x,y=rnd(128),rnd(128)
		--ang,r=atan2(x-64,y-64),dist(x,y,64,64)
		ang,r=rnd(1),rnd(q.rr2)
		--r2=sqrt(r)*10
		r2=sqrt(r)*10*sin(q.rr2)
		
		sa=sin(ang)+cos(t/2+sin(t/3))/2
		ca=cos(ang)+sin(t/2+(cos(t/3)/2))/2
		
		x,y=r*ca,r*sa
		x2,y2=r2*ca,r2*sa
		
		l=32
		--c=sin(x/l)+sin(y/l)
		--c=c+(-x/32-y/32)%2
		c=sin(x/64)+sin(y/64)
		c=c%(t*2) 
		c=c+2*t --move it
		c=2*13*abs((c/16%1)-1/2)-13/2+7.5
		c=flr(c)
		c=c%#pp+1 -- [1,14]

		circ(x2+64,y2+64,1,c)
	end
end

-->8
--control
--system helper funcs

function draw()
	(f[fs.b]).go(f[fs.b].tab or {})
end

function check_timer()
	block=f[fs.b]
	if fs.t>block.t then
		fs.t-=block.t
		fs.b=((fs.b+1)-1)%(#f)+1 --hmm
	end
end

-->8
--util
--various util

function isf(a) return type(a)=='function' end
function makef(a) 
	if not a or isf(a) then 
		return a
	else 
		return function() 
			return a 
		end 
	end
end

--math
function sqr(a) return a*a end
function dist(x1,y1,x2,y2) return sqrt(sqr(x2-x1)+sqr(y2-y1)) end
function nsin(a) return (sin(a)+1)/2 end
function ncos(a) return (cos(a)+1)/2 end
function rsin(a,r1,r2) return nsin(a)*r2 + r1 end
function rcos(a,r1,r2) return ncos(a)*r2 + r1 end
function tan(a) return sin(a)/cos(a) end

--util
function stats()
	pprint("∧"..flr(stat(1)*100).."%".."\n⧗:"..flr(t).." ("..flr(fs.t*10)/10 ..")".."\n█:"..fs.b,1,1,2,11)
end
function drw_mouse(x,y) spr(0,x,y) end
function _mouse() mx,my=stat(32),stat(33) end
function pprint(s,x,y,fg,bg)
	bg = bg or 12
	fg = fg or 4
	cursor(x,y)
	color(bg)
	print(s,x+1,y+1+1)print(s,x+1,y+2+1)
	print(s,x-1+1,y+2+1)
	print(s,x+1+1,y+2+1)
	print(s,x+1+1,y+1+1)
	print(s,x-1+1,y-1+1)
	print(s,x-1+1,y+1+1)
	print(s,x+1+1,y-1+1)
	print(s,x+1,y-1+1)
	print(s,x+1+1,y+1)
	print(s,x-1+1,y+1)
	color(fg)
	print(s,x+1,y+1)
end

__gfx__
0b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b2b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b22b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b222b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b2222b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
b22bbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bb2b000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
331303333333313n3333333jjjjj3j113133anan33ann3nn33n131n1nna3a33131a1333h313311311311313113333333333j3j33333j30jjjjj3r31313113313
33333n33333333331333133jjjjjj131133a3an3333nnnn3n3nn133nn3333ann3nna03h3313131133j3j13131333133j3333j3j3jj331jhjjj313133311133a3
333330333033131r3j313333jjjjjj11a333a33rn33nnn3n3nnnn333n3333nnnnnnn333h1j1313333331113131313133j33j3h33j3j3j1jnj31j131331113a3a
33330303030131r1r3133330j3jjjj1a1a3n3nrnnnn3nnn3jnnn313n1n3333nn3nn1n33n3131313333311133111113333313j33h3j3j10njn110j13111133aa3
3330303n3313133r133133331j1jj111a3n3nnnnnn3n3nnrn3331n03nn1n3njnnn1n13nna3a3n333331a1j33111311333131jjj3jjj1111n110110101111anan
333303303331330333331333jjj3jj11113nnnnnnnn3rn3nnj31n1n3nnn1n3nnnnn1nj3nna3n33n331a1a33331311111331j1jjj1j0111j1j11111013113aan3
3033330303n33031r3313333jjj1j1j11nn1nnn3nnnnnrnn3r0nrnnnnnnn01nnnn1njnjn3nn33n3na31a3a33111311131113j1j1j1j11j1r111111r1j3aa3a3n
30333n301333131r1r13j3310j111j1111nnnnnnnnrnrnr3r0nrnrr1nnnn1n1n1hnjnn31n3n3j33a3a33a1a11111111111113j1j11hj11111n1h11101anaa3ah
3303n3n133333101r133331j1j11a1a11nnnnnnnrrnrrnnrjrrnrr1rnrnn01nrnnjnn1nj3n3n3333a331ja13a11111113113111j110j0111n1h111110nanjahn
330n3n1n0333r1111133313j1011aannnnnrnnnnrrrrnrrnrrnrrrr1rnnn1nrnn1n3jnjnjnn3nj3nj3jj1j1a3131111313111111j010111111101110jnnn3jnh
303031nn10031r11r33333j101111annn1nn1nnrnrrnrrrrjjrrrr10rrr1nnnnrn1jnjnjn3n3j3nnna1ajaan1a111j1j3j31111j1111111h1n110hana1nhjnjn
330313n1n130310r0r33133j1111ahjn1nnnn1nnr3rnrrrrjnrrrrr1rrrnn1nrnrrrjnjn1nnn3n3naja1aaa3a1131131j101111111111111n1n100nannnnjjn3
31n03nnn1n03n1r1rr3131jjj11j1j11n1nn11rnrrjrnrrrrjjrrrr3rrnr1n10rrrrrj1jnnn3n3nnnajaraan3aa11313131j11111111111hhn1010nnnnnn1jj3
3310n1nnnn1n0n1r103311jj1111n11n11111rnrnrr3rrrrrjjrrr3r1r3nrrn0nrrrrjrjnnnj3nnnnnj1hr3njanaj13j3a31j11111111111h1h10nnnnnn1hjhn
33331n11n1n0n0010r031j1111hnjn11rr1rr1rnrrrnrrrr3jjrr3rrrrr3rnrj0rrnjrjrjnjnnnnnnnnj11n3naan1j11a3ajj111111111111h1nnnnnn3nhn3jj
3311311n1n1n0rr0r033j1jj1a1jnj11rrrrrrr3rrrrrr3jr0r33hrrrrr0rrrnjnnrnjrjnj1jnnnnnnjj1nnnana131jj1a1jjj11111111111nrrrnnannrnrjrr
3110310111n01nr3113j3jjjajan11j1rrrrr13rrrrj33330r0r1rrrrrrr1rnrn0nnjrhjjnjjnnnn3nj1j1nnna1j3na1j1jajj1111111111nanrnranannrnrrr
1311031111010r3r33j3j11jjan1n11rrrrrrrrr3r33333rjrr333rrrrnrrrrnrnnhrrnrnnnnjnnnn3nj1jnnj3j3nana1aajjjj11111111hananraaann3nrnnr
311010111010rrr3313j3j1jha1n1h1hrrrrrn03r303333rrjrr3jrrrnrr3rrrrnrn0jrnnnnjnnnnnnjjjnnn1jannna1a1aaajj1111111a1rnnraaaan3n3nnrn
31110101010010r0j3jjj3j1an11jnh1rr33303333j333r3rrr3r3rrrnrnrrrrnrn0j0jnrn3nnnnn3n3jjnnnnaja3a1anajaaajh111h1a11nrnrraarnn3n1rnr
111100110001010101jjjj1anannn1j1333333333r333r3r3r3r33rrr3nrr3r10nrr0jjjnnnnnnnnn3njnnnnnna3n3an1n1jajajh1h1hn1r1nrarrrnnrn3njr3
11100010101010101j1j3j3jannn1n131333333n3333333333rr3r3r3rnr3r3rrnrnrjnjnnnnnnnnnn3n3n3nnaj133j1n1j11ajajh1harr1aaaraarnnnnnr331
3110000100011011j1j3j3j3j3ann1rr1r3r33n3n033h3333jr1r3rrrnrnr3rrrrrrjnjnjnnrnnnnnnn0n3n1ana13j3nnn110aaahhha1araaa3aararnnnr3r13
31110010000001330jjj3j3n1nra0rr1r3r3rrnnnr033033jr1r1jrr33nrr1rrrrrnnjnjnjrnnnnnnnnnnnnnna1a13annn1j11a0ahn1a1rrararaaannnr3r3r3
33110001003013333jjjjan1nrnrrjrr3r3rr3rn3r3j333333r1j1333rrrr1r0rrnnnnnn1nrnnnnnnnn33nnnnna1aajannj1101arh1n1rnrrrraaarannnr3rr1
33101000030301jj10jjanan1nrnjrj3r3333r33r3r3333j33331333r3rrr31rrrrnnnnnn11rnnnnnnj3nnnnnnajajaj1nn10101hrh1rnrnrraaaaarnnnj3r1r
3001000000301j0jj301nan1n1nnrjjr33r333333r3333j3j333333rrr3rrrrrrrnnrnnn11nrnnnnnjnjnnnnn1aaa1j1n1aj10101h1r1rnrrr3aanjn3n3nrrrn
33110000000000j03j10an1n1nrr3r3r3333333333r1333j33333r33rrrrn3rnrnrrnrnr1nrnnnnnjnan3nnnaa1a1anhnanaj1110111nrrrrrr0nar3nnn3jrrr
333010000000010111jahaa1nrr3r333333333333333j333j333rrr3rrrnrnnrnrrnrrrrr1nnnnnnnajaj31anaa1aa1nnnann1r1r111r1rrrrraa3arnrnrnjrn
3301010000000j110111aannrrrr3333r3333j3j333333j33313rrrrrrrrnnrnrrnrnnrrr1nnnnnnnjaj3jn1anana1anj1n1111r11111r1rrraraa3r3n3njnn1
330010000000j0j010a1a3aanrrr333333r333jj333333313j33rrrrrrr3nrn3rrrnnrrr1n1nnnnn1njnnn3nhaaahajanh11111rn111111rr1ra3nr3a3n3nnnn
3030000000000jjj1a1anaanarr31333r33333j313333333jr3rrr3rrr3rrn3nrrrrrnrrn1nnrnn1nnnnj3a3naaannanhn1r11nn1n11r1r11rn3n3ra3annnrnr
0000000000000j01j1an1nnanr3r3133j3jj3jjj3j3333331jrrrrr3r3r0nrnrnrrrnrrrrnnrnrnannnnna3anhannnnnnnj111r111111r1rr1rn3n3ranjnrnnn
0003030000000jj011j1n1anrrr333r13333j3jjj33333r1j13rrr3rrnnr0rrnnrrrrrrrrnrarnanannnnnanana3ahnjnjn111n111111rr11r1131j33rr3nnnn
303000300000j0jjjj1ar13rrr33331333333jj333j33r3r1jj3rrrr3nnn0rrnrn3rnnrrrrara1rannnnnnnanhnahah11nnn10h01111r1rrr1r31r13r3nj3jnr
0300000000000jjj01a11n1rrrr331313333jj33333jjrrjjjjrrrr3r3n0r0nrnrrnnrnrnrrarr1n1nnannannrh1an111n1rnh1hn1111r1r313nr1rj3nnnnjjn
3003000300000000ja1an1nrrrrr33133333j3j33333rjrr3jrjrrrrn3rr0rrnrr33nnrnrnararrrnnanaanarnr3nnn1n1n1r1h1rr1111rr13133r33j3nnj3jj
033030303000001jajanjnrnrrrr333333333j333333jr3jj3jr3r1n3nrrrrr3r3333n0annrarrr1nnaannanarr1hn1njn1jn110r1111nrrr133n3nj3nn33jnj
3303000300000101ja1nnnnrrrr333333333333j333r3j333j33r1r1n33nrrrr3r33rranarnrrrrrnaaannnnnrnrn1n11hj11h1rrr11n1nr3r3n3n3nnnnnnnjn
003000000000001001111nnrrrr333333333333333r3jrj3333jnrrrr3n3nrnrnn3n3nnannrnrrn1aaaaannnnnrn1n11h1j1110r0rr11n1rr3rnnrn3nnnnnnnn
30000000000100000011n1nrrrnr333333333333333rrrr33rrnjnnrnn3nn3rn33n3r3nnnrnnrnranaaanarnarnrn1111j1j1h11rr11n11nnr133h11nnaannjr
000000000010110aa311nnnnrn33r3333333333333rrrrr3rrrjnnrnnnnn3n3r33nrn3aa0nnrnrrraaananaannrn111111j101111rrr1rnnn113h3111aaaajnj
00000000000110aaa11n1nnrr33333333j33j333r3rrrr3rrrr3nrnrrnn3nr3nnnnn3aaaanrnrnrranaannrhnhn1j1111110h011hrr1rnr1r1r11h1133aajnjn
30000000000101aaaa11nnnjrr333333j3jj3j3r3r3rrrr3rnrrnnrrnrnn33n3n33nrnaaarnrrarrnana13rnhnhj1111111100nnrh1111nr1r11r11313njnjn0
300000000000100aaan0nnrnrrr3333333333333r3r3rrrrn3nr3nnnnnnn333n333rnaaaanrnararrra1n1n11h101j1j11111nnnn1111n1r1r111r313n1nj33h
300000000000000ara0nnnnrrrrr333333333333jrrr33r1nrn3j3nnnnrn3333333nanaaaanaraaaraan1n11n111j1j1111110nn0n1111r1r11113r131n13331
30000000000000a0a0annnnnrrr3r333333j3j3j3rrr333nrn3n3rnnnnnr33na33nnna3anaaarrr1rr1annnn1n111j111111110nnhn1011rrr11rh131311333n
000000000000000a0a3annrrrrrr33333j333jj3j3r333r3n3n3rnnnnrnn33arann3nanaanararrrrrr1n1nhn1110111111111n0nn1h101rrrjrrrr131111a3r
300000000000000003a3rrnrrn3r333333j3j333rr3r3r3rn333rrnnnnnjnrnarnnnanaanararrrrrr1n1nh1h11110111111111n0111111hrjhjrrhr3111a3a3
33000000000000000aaannrnnrr3r3333j33313r3rr3r3rn1n333rnnnnnannrnnannnaananarnrr1rhnrnn011111111111j111000jj11101h1jn1r0313113a3n
33000000000000010aannnnnnrrr3333j3333333rrj33rr1nj33rnnnnaanannrananraraananrr1rrrr1rn1011111111111j1110jjjj10101h11j1r13111n33a
303000000000001010n3nnnnnn3rr33j33r33r33rjrjnr3rn3n3nannarnannnana3raraaaananrrrr11r1h01111101111j1111110jj1110111hj1rrr11h1rnaa
030300000000000100annnnnnnrrr3j33r3rrrr3rrrnrnr3rn3nanannnrnnnanannnrannananrrrrr1nr1n1111111011j1jjj1100001111j11j0j1r1r111n3nn
30030000000000000a0annnnnrnr3333r3r3rr3r3r3rnnnrnnnnnannnnnnnnnannnnanannnnnhnrr1nrnrnn1111111111jjjj1110j1j1jj11j1j11r11r111ran
3030300000000000h1annnnnnnnr333r3rr3r33rrrjrnnnnn3nnnnnnaanannnnnnnnnannnhnh0nnn11nr1nn11111111111jj1011j1j1jjjj11j11j1rr111rarn
33030000000000001010r1nnnnrnrrr3rr3r3rr3rj3jnnnnnnnnnnjaaaanarnnnrannrnnhnhhhhnnn1r1r11n1111101111j1j1111jjjjjjj1j1jj0j1j1r11rn1
303030000000000j01011a1nnnnrnrrrr3rrrrrr3rnjrnnnnnnnnnnraanarrnnraraannnnhh1hhhn1n1111nhn11100011j1j1j01jjjj1jjjjjjj0j011r1r111n
33003000000000j0j01101arnnnrrnrrr3rrrrrrrnjnnrrnnnnnnnrnrnnarnnnnnaananh001h1hh1n1111rnn10111101j1j1j1111jj1j1jj0jjhj11011rr11r1
330303000000000j001h11rnrnrnnnrrrrrrrrr3rrnnnnrnnnnnnnrrnnanannnarnnanhhh0h11h111111r1r1111110101j1j1j1j1jj11jjjjj1j101j11r1111r
333030300000000001011ra1nrnnnnnrrrrrrjrr3jrnnnn1nnnnnnnnnanannaanannn0hh0hh1h1111n111r1n1101110111j1j1j1jjjjjjj1j1jj0101111r1111
13300310000000000001011a1annnnnnrrr3rrjrrrrrnn1nnnnrnnnnnaaaaaaaanhnh1hhhhhh1011n1n101n11111j1111111jjjj1jjjjj101jjjj01j1111h10r
330300000000000010001111anrnnnnnrr3rrrr333rrnrn3nnanannnaaaaaaaanahh1h1hhhh1h1h10n10111n111j1j1j111j1jjj10jjjj111jjj1111j11r101a
33300000000000000101011a1aaanrnrrrrrrrrr333nrnrnnanananaaaaanaaaahh111hhhhhh1h1h1h1000111111j11jj111j1j1j10jj1jjj1jjj11j1j01r111
33030000000000000110j0j3aaaaanrnr3rrrrr3n3nnnrnnnnanananaaaanaaaan1111hhhhh0h111h1h10111111j111111111jjj1001jjjjjjjjj1j1j0j00111
333300000000000010010j31j1aanannnr3nrrrn3n3nrnrnnnnaanaaaaaaanaa11h1101hhhhhh111111010r1rjj1jj11111j1jjjj0j311jjjjjjjj1j1j0j1111
333130000000000101001j1j3j11arnnnrnrnrrnnr3nnrrnnnaaaaaaaaaaaa11111hh101hhhhhh111011010jj1jjjj1110jjjjjjjj3131jjjjjjj1j11jjjr111
33333000000000000011j1j3j31a1arnrrrnrrn3r3rnnnrnnanaaaaaaaaaaaa11111hh1h1h11010101h110j1jjjjjjj10jjjjjjjj0j3111jj1jjjj111jj0jr11
333313000000000010111j1031j1a1aa1rrnnnnn3rn3nrrrnnannnanaaaa11111111h1h1h1111111h111101j1jjjjjj000jj1jjjj30j11jj1j1jjjj11j0j0011
3331310000h0000101011j10rj3j1aaaannnnnnnnn3n3rnrnnnnaannran11111111h1h11h1111h1h10111111jrjj0jjj0jj0jjjj3j3301jjj1jjjjj1j1j0j111
3330103000000000100111jr03j31jaanannnnnnnrr3nnrnnnnaaaaanhr11111h1h1h1111h1111h1011100j1rjrjjjjjj10j0jjj133j333j3jj1jjjj1jjjj101
030313030000000000111111rr31jna1anrnnnnnrrrnnnnnnaaaaaana111111h1h1h11111111hh1111111j0jhrjjjjjj00j0301j31333333jj1j1jjjjjjjjj10
30310110000100000301111110j33jna1nnrnnnn3rrnnrnnanaaaana111111h111h111111111h1111011j0j100jjjjjj300303j1j31jj33333j1jjjjj0jjj1j1
33031101000000003000j1j10j0jn3n1n1narnnnnnnrnnnnnanaaa11111111111111111111111h11j10j0j1010jjjjjj03133j1j11jjjjj3jjjjjjjj0j0jjj11
30330010100000000010011jj0jn3n1n1na1a1nnnnnnnnrnnnana1a11111111h1h1h11111111111j1110jj000jjjjjj13j3jj0j1313jjj1j3j1jjjjjj0jjjj11
03303001000000000000101j1jrjn1n1111a1n1nnannnrrrnnna1a11111111h1h1h101111111h1j11j111j0001jjjj1j13j30j0j31jjjj3333j3jjjjjjjjjjj1
3033300000000000000001j1jrjj11nj11n111nnaaannrrnnnann1111111111h111h111111111h1jj1j1j1j01j1j33j3jj3jj0j31311j33333313jjjjjjjjjj1
0303h000h00000000310jj1j1jj1j1jjjn1na1anaaannnnaaanan111111111111111111jj111111j1jjj1j0j13j3333333j3jj3j31j33333333333jjjjjjjj11
030300000h00000001010jjjj1jjrjnjj1na1a11nananaaaaaaa1n1111111111j11111jjhj111jj1jjjj0001333333333j3j1jj31j3j33333333j3jjjjjjj1j1
30303000000000000010j0jjj1jrjrjn1111a111nnananana1a1a1111111111j1jj1jjjjj1jj11jjjjjj1j3033333jj3j31jj3j1jjj3j33333333jjjjjjjjj1j
3303000000h0000000101jjj1jjjr1h1j1111r1nanaanana1a1a11n111111jjjjjjjjjjjjjj1j11jjjj1j303131j3j3jjjj13j333j3j333333333jjjjjjjjjj1
330300000hh1001000013j3jjjjj11rj11j1ra11naaaaaan11aaan111111jjj1jjjjjjjjjjjjj11jjjj3113j31j3j31j3j33133333j33j3333333j33jjjjjj1j
30303000001010000000j3jjjjjj1r1jjj1ja1a11a1aaaan1111a1111111jj1111jjjjjjjjjj1jjjjjjj1j13333j31j3jjjjr3333jj3j3j333j3333jjjjjj1j1
00333000000100000010j3jjjjjjj1j1jjj11a1111raaan1n1111111j11j1j11jj1jjjjjjjj1j3j3jj3jj1j333333033jjjrjr333jjj3j133333j3jjjjjjjj1j
330303000b00010001003j31j11j111jrr11n11r111ar11n1111111j1jjjj11jjjj1jj010jjj3j3j33j31jj3333333333jrjr3r33jj3313131333jjjjjjjjjhj
3330303000b010010100033311j11hj1jrrn1rar111h1r111111n1njjjjj1jj1j1jjjjj01jj333j3333j0j3j3333rr033j1r1rrrrj3333133j133j3jjjjjjjj1
30000300000b001000003333jj11111j1r11rar1r1a111a11111h1jnjj11jjjj1j1jjjj0j03333133330j313333r3rr0rrrr1rrrrr3333333333j3jjjjjjjj1h
30000300000000003003333jjjj11j11rhr111111ar111111111111jjjjjjjjjj1jj01j303333j311333j3j3j3rrrr0rrrrrr1rrrrj3333333333j3jjjjhjjj1
030030300000b00101113333jj11j1111rn111111naa1a1111111111jjjjjjjjjjjjj33j33333331311j0jrj3jr3r3r1rrrr1r1rrrr333333j3313j1jjjjjjjj
30000300b0b00b00131j333jjjjj111111hn11n1nhnaa1111n11111j1jjjjjjj1jjj3033003333331r30j0j3jr3r3rrj13r031rjrr3r33333331j13jjjjjjjj1
3000000b0b0bb0103333j3jjjjj1j11j11r1n1aranha1a1aa1111111j1jjjjjjj1j303033303330jr3r1rj3r3rrrrrrrjrjr3rjrrrr3r333333j1jj3jjjj31jj
33030030000b0001133j3jj3jjjj11j1111r1araranaa1naaa111111111njjjjjjj3303333j3333r3r3rrrrrjjrrrrrrrjrjrrrrrr3r33333333j3jj1j31131j
3333030300bb0b011133jj3jj1j1jj1j11rnrnarahnnar11a1n111a1111j1j1jjjjj333333303333r31rrrr3rrrrrrrrjr3rrrrjr33333333333jjjjjj13111j
303030300bbbb0b01333j3jjjjjjj1j11h1rh1r1rnhnrh1n1n1n1a1a11jjj1j1j1j333j33333033rr0r3r1rrjrrrrrrrrrrrrrjrjj333333333j3jjjj1j31131
33030000b0bbbb0j13333jjjjjjj1j1hh1nhnr1rrhnhn1r1nnn1111111jjjj1j1j3333333333331rrrrr3rrrrjrjjrrrrjrjrrjj333333333333j1j1jj313313
303000000bb0bb000j33jjjj31j111hhhnrnrnhrrhnnnr1rn1nn111111jjjjjjj33333333333311rrr1rrrrrrrjrjrrrrrj33r33r3333333j3j33j1j1j133a31
330000000bbbbbb0j0j33jj3131j1h1hrnnrnrrrrnhnrn111nnna1111j1j1jjjj133j33331313111rrrrrjrrrrrjrrrrrr33r3rj3r333333jj333jj1jaa1a3aj
330000001bbbbbbj0j3333313111j1hrnrnnrrrrrhnhn1r111101an1n1j11a1jj11j3j3j33333013r3rrrrjrrrrrrr3rrrr33rj3j3jjj3j33331j313aaaa3ajj
333000000010bbb0j0133j11j131h1hnrnnnrnrrrrn1nrnr1101a1an1na1a1ajjj11j3j3j33313333r3rrrrrrrrrr3r3rrrr333j3jjj3j13331j13j1jaa1133n
333300000101bbb0b1j1j1j31313111nnnnrnrrrrrhrnnrn11101a1nna111ajjjj111jjj3131330133r1rr3jr3rrjr33rrrrj3r33jj3j33133j13j3j3a1a1313
33330000001hhb0b0b1j1j313j31111nnnnnrnrrrhrh1rnr1hn1n101nn1j10ajjjjjjjj3131330101333r1rrjr33rj3r3rr3333333j133133133j3n1j3aq1j3n
333010000hhhh01hbbj11313j3jn11nnnnrnnrrnrr1111rnh11n1111a111jajajjjjjjjj333j330133331rr3r3r333r3rr333j333jjjj1j31j33jnjnjjqjq331
3333010000h10101b1b11133hjhnnnnnnnnrnrnrnhr11rnnr111111a1a1najaajajjj1jj3333j33333333r1r3r33333rr3r3jjj3jj3j1j1j133n3nnj3j3rnn3r
33333000000h10111b1111313hn0n0rnnjrrrnrrhr31rnnrnr111101annanaanajaj11jjj33j3jjj333333r133j3333rj3313jjj1jj3j1j1j1nnnnnnj3rnrnr1
3333300000h1101111111113h01nn0nnnnrrnrn3nr131n3nr3111110nn1na1nanaa11jjj1jj3jjjjjj3j3313j333j33j333313jjja1n1n1n1nnn3nr03rrrnrrr
301313000000010111h111111n0n0n0nn0jrrnrnr0r1rhn1331n1111n111111a1j1jjjjjjjj1j3jjjjjjj33j3j3j3331j3313j1jj1n1a1n13rn3rr0rr3rrrrrr
3301303000000011111h1111n100n0nrrr0rrrrnrr3r3nrn3r31n31n1n1111a1a1a1j1j1jjjj1j3jjjjjjj3jj3j3333j1j1j11j1ja1a1an3r3rr3nrrrrrjnrrr
330103100000hh101111111110n00rrrnrjjrrn3nrr313nrr31n3111n1n1111a1a1j1j1j1j11j11jjjjjj3j1j3333rj3r3a1j11ja131anrr3r3jnrnrrr1rjrrr
33100101000hh101011111111n0n003n3nj3j3rn3rr131rrn1111311111j11n1jjjan1j11j1110j3jjjj11111j3j1jrrarjan1n33311nnnrrrj3rnrrr3rjnnrr
3100101000001010h1111n1111n0r0r3rrrj3rrrrrr311rnrn1133131111r11n3jnjanj1j111jjjjjjj31111j3j1j1janjnjnnnnr31jnnnrr1rj3r333r3jnjnr
33310110000001011h1nn1n10r1r0r0rrrrrjrrrr333r3jr311r313h1111jrnn1njnj11j1j111jj11jj1j111jj1a1jnrrajnnnnnarj1rn333rrjr33j333jjnrj
333011010000000101nr1r1rr0r1r0rrrrrrr3rr3r3r3r3jr1r11311111j1jn1n3njjj01jj111j111jj3311j1ja1nnrraranrnnarar0j33r33jrjr333331jn1r
333110101000000010r1r111rr1rrrrrrrrr1rr3r3r3r1j1131111h11111jj1n3n1najjjj111j1j1j1331311j111jnnrraa3arrjarrn3rrjr333r33jj3jrrjnj
0111010100000000010r11r13rrrrrrr3rr13rrr3r3rrj1j3r3r11111131j1jjnrnana001j1101111jj13131111313jj3ana333j3rnrr3r3333133rj033rjjjh
011110010000000101rrrr13rr31r3r333333rrrrrrrrrjjr3r311111r131jjnjnrnanj1j1ja101j1jjj13ja111133n3r3an3rj033rjrr3333131r1j3j33jjjr
3111101010000000101rr1r1rh1r1r33333313rrrjr3rrr13r33111111r11njjnrnrnjjj0jana111j3jj1jaja113jjjr3r3rrn1j0j0rrr3331311jj1j3j31jrj
011111011000000h010rrr11hr11r33333333r3rjr3r3rjnjn3331111111r11j3nrjnjj0j0na0101j3a1j1aaj1jjj33nr3r3n3n3033rr3330331j1jjjj31r3jr
311111110100000h000rrr1h13333333333333r333jrrrrjnj03r11111rr11j1j03njnj10n1nn01j3a3a1a3a1jn33j3jn333rn3030333r3313331jj3jjj1133j
301111101000000110r0rrr11r31313333333j1333r3rrrrj030h31r1r31311jh3n3njjj0j0n1n1jj3a1jja13njjj33n313rjr330333r3133130333j3jj11h33
33101100000000101n0r0rh1313313h3333331313r3r3jrrr30h31313313131hrn3nnjjjj0j1n1j1j3jjj3j3a3j3j3j313n3r3331r333131331333333jjh1hj0
3301110h00000000n1n030rh13r31h3j33j3j3j33jr3jjjrnr03031311333311hrnn0njjnjnjn11jjj3j1j1a3a3j3j3jjn333j11r1j333r3133j33j3jjrj31jj
33011010000000010nnrr331r13101j3j33j3j1jj3j3j3jnr0r0331333313131jrr1njjnjnjn1n1j3jj11j3ja1j333jj1j3331111h333r3r11jjj1jj3jj3133j
30011110000000001rrnrrjr1r33rjh33jjjj1j13j3j3j33nn0r313133131313rrrrhjjjjjn1n1n3j311j1111j13333j3j133rn11j3j33r3113jjjhnj1313j10
3010110100010000hnnrnr3jr3rr003j3jjjjj1j33j1333jnrnr031313313j31jrrhjjjjnj1jnnnj311111111111331jj3j0rnj1j113j33313333hnhn013jjr1
3301111a000h11000nrnn3rj3rr30j03jjjjjj03j3j013j3jnr0r01rr133331j31r1hjjnjnjnnn1nhn11311111j111j1jj0jh3nn1r3j3jr10333jh3nn113jrjj
30301010a01hh1101rnrrrj3jr3rh0jjjjjjjjj0jj3j013j3jnr0031r33333n31r1r00jrnjnjn1n1j11111111j11j13j1j1h3rrjrhr3jj1r1h3jj33nrn313jrj
h300110101a1h10h01rrrrrj3jrhjh3hjjjjjjjjjjj01jj31jj30301r3133njr33r10jj0jnnj1j1jnj11j111111j13h311j1rrrrhrrnj33r133j3j33nj033jjn
3h3h0110aa1h1110010rrrr3j33333hj3j003j11jjjjjhjjj131r01r11r133rn3r3r1j0j1n11jnnnjn3h1jjn1jj1jj3h11n1jrrjjrjr33333333j33h3nj3j303
h3h0111a1aa101101010r1rn3313n333j30jj31jjj1j0jjjjj11h3r1rr1r3hnrn3r1n0j0jrn111njn1h1h1n1nj1jj1j11n1n1jjj3jrrn33r13333jj3rnjr3030
