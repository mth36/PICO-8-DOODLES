pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
#include palettes.lua

c=cos
s=sin

function xset(x,y,c)
	circ(x,y,1,c)
end

function xfill(x,y,c)
	circfill(x,y,1,c)
end

function fflr(a,unit)
	return a - a%unit
end

function movarc(a,r,mov)
	return a+mov/(r*2*pi)
end

function frames(sec)
	return sec*30
end

palnum=1
palette=pals[palnum]
for i=1,#palette do
	pal(i,palette[i],1)
end
pol=palette

function pcol()
	cs={}
	k=9
	local e=rnd(k)
	if e>=#pol+1 then
	 return 0
	else 
		return e
	end
end

function xy()
	return rnd(128),rnd(128)
end
-->8
t=0
ti=0
dt=1/30
q2=sqrt(2)
pi=3.1415926
r_unit=8

pts={}
add(pts,{
	r=8,a=0,v=1,c=pcol()
})

cls(3)
::⌂::
--cls()
t+=dt
ti+=1

if btnp(5) or btnp(4) then
	pal()
	if btnp(5) then
		palnum=(palnum)%#pals+1
	elseif btnp(4) then
		palnum=(palnum-1-1)%#pals+1
	end
	palette=pals[palnum]
	for i=1,#palette do
		pal(i,palette[i],1)
	end
	pol=palette

	pts={}

end

if t%10>7.5 then
	r_unit=rnd(10)+12
	r_unit=flr(r_unit)
end

if t%1<dt then
	--rectfill(rnd(128),rnd(128),rnd(128),rnd(128),3)
	circfill(rnd(128),rnd(128),rnd(45),#pol/2-1)
end

curr=1
if rnd(1)<0.6 then
	add(pts,{r=r_unit,a=rnd(1),v=rnd(1)<0.5 and 1 or -1,c=#pol})
end

if rnd(1)<0.025 then
	add(pts,{r=r_unit,a=rnd(1),v=rnd(1)<0.5 and 1 or -1,c=0})
end

for pt in all(pts) do
	if pt.r>64*q2 then
		del(pts,pt)
	elseif pt.r%r_unit==0 then
		pt.a=movarc(pt.a,pt.r,pt.v)
		if rnd(1)<0.005*(10-pt.r/8) then
			pt.r=pt.r+1
		else
		end
	else
		pt.r=pt.r+1
	end
end

for pt in all(pts) do
	local a,r=pt.a,pt.r
	x,y=64+r*c(a),64+r*s(a)
	if flr(pt.c)==0 then
		circ(x,y,2,c)
	else
		rr=rnd(1)
		if rr<0.5 then
			xset(x,y,pt.c)
		else
			pset(x,y,pt.c)
		end
	end
end

for i=1,250 do
	x,y=xy()
	sum=pget(x,y)
	  +pget(x-1,y)
	  +pget(x+1,y)
	  +pget(x,y-1)
	  +pget(x,y+1)
	  +pget(x-1,y-1)
	  +pget(x-1,y+1)
	  +pget(x+1,y-1)
	  +pget(x+1,y+1)
	avg=sum/9
	xset(x,y,avg)
end

for i=1,10 do
	x,y=xy()
	xset(x,y,0)
end


if ti<frames(5) then
	rectfill(0,128-8,128,128,0)
	print("change color scheme with ❎",1,128-7,7)
end

flip() goto ⌂
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
0000030h0h0h1hhhj3jqrhhhh0h0100101h00000030h00000hhhb73r3b1h1h0h0j0h11hhhh3hhhhh1h1hhhhj3h1h1j3j10hhhhh000000000000001j1hhhh0000
00003hh000hjhhhj3j3rjhhh0h0h00000h00000000000000001b7j7bbbb1h1h00h111111h0h3jh1hh13h1hj3j3h1j3j3jj01hhjh000000h000000j1jjhh10000
000000000h1hh1hhj37rjjhhhhh0h000h01000000000h00011h1j777bbbbqj10h0h111131h0h31h1j1j1113j3j3j3j3jj0hhh1h1h0h00000000000j00j1h1000
000000000hh11h1011j3bjj1hh0h1000hh00000000000hh1011r17b7bbbbb3j11h111jj1j1h3311j11j1113333jjj3j1hhhh1h1j1j00h000000000000731hjh0
00h00000hh1011000j3j3j1j10h1hh0hh00000000000h0h017r1rb7bbbbb333jj1113jjj1j1j111111111133j3j3jj1j1hh131j111j11h0000000000h3j33010
0000000hhh010h0001j3rjj11h1hhhhh0h000000jhj10h3j7r7r77brba0j33jj11j1jj3jj1jj111j11131j3jjjjj3j31111311h111131hh00000000h0h3j0301
000000hh01h01h000h1h1rj1h11hhhh1h0001h00hj0j13j3r7rjj3rbr3j3j331j11jjjjjjjjjj1j111jjjjjjjjjjj313113111h11111hhh100000000h1jj3j10
00000h00h0h1hjh0hhh1h0311311hhhhh0h0hhhhq7j737307r11303rjj3j3jjj1111jjjjjjjjjj11h11jjj3jj3j3jjj1j0111hhh1h111h131h00000h1h1rj1j1
000000000hh01hh0hhhh0h11133j000hhh01hhrq7q737100011j030j3jj3jjj111111jjjjjjjj3jhjhj333030j3j3j3j0jj11hhhh0h1jjj111h00001h133rj10
0000000000010h1hhhj0h0111h100000hhjh1r7rq000101000hj103jjjjjjjjj11111jj3jjj3jj3jh13j3330jjjjjjjj301j1hhh0h0hjj3111hh000113333h0h
0000000000001hhh1hhh0hhhhhhh000h0j1jb1rh000001000h01h1jjjjjj3jj310113j33131hj1j3jj1j3333jjjjjjj3j30111h000hhhjjj1hhhh0h11133r000
000000000000h1h1hhhhh0hhhhhhhhh037j71b10h0000h0000hh1h1jjjjjj33j31j3j3j131hhhj1jjjj3j3333j3jjj1j101j11100hhhh1jjjjhh0h0h1333h000
0000000000000h0hh0h00h0hhhjhhhhhr37rh1hh00h0h0h00000h113jjjjj33j3jjjjj3j10hhj1j3jjjjjjj33jjjj1j10101j131h1hh1j1jj313jjhjb33h0h00
00000000000000h00h01000h1r7j3hh33r1h1hhh1h0hhh00000h1111jjjj3jj3jjjjjjj331011j13jjjjjjjjj3j3jj1j111jjj33jh1jj1jjj10hj1jb0b30h000
000000000000000000000001j1b3j33r31h1hhhhhhhh00000000h11jjjjjjj3j33jjjjjj1311113jjjjjjjjjjj3jjjj1111jjj303j3jjjjjj0h0111h10000000
0000000000000000000000hj1jrb33j3rh1hhhhh0hh0000000003h30jjjjj1111jjjjjjj311111jjjjj33jjj33jjjjj3111jj3030333jjjjj10hh1h1h0000000
000000000000000000000h0hjrbr301j1hhhhh00h0h00000000hh30j0jjjj11113j1j0130j111jjjjj3jjjjjj33jjjjj31j3j33033jj3jjj1j1h1h1h00000000
00000000000000000000h0hj3rrb0101hhhh101000h0000000hhhjj0jjjj3111jj1j1101j1j7777jjjj33jjj3333jjj3j33j33333jjjj3j1j111h1j000000000
000000000000000000001jjjr3r3b0133hhhhh00000h0r0700j1j3jjjjj301111jj1j013jj1777j71jj3j3j3033j3j3j3333333333jj3j1j13j1111100000000
00000000000000000000jjjj3r3j31331hhhh0h00007r0rh0h1110jjjjjj3011j1j1jjjjjj3j7j71j1jj3j303333j3333333333333j3j3jjjj3j111j07000000
00000000000000000000rjjjb3111311h1hhhh0h07777rhhh111110jjj3jj3jj111h1jjjjjq771j11jj3j33033333333333333333jjj33jjjjjj1jj170700000
0000000000000000000001jb3111h1h11hhhhhh77777hhhhh11111jj3jj3j1j111h1hjjjjq7q73110j3j3j03033j3333333333333jjj333jjj1111jj17070000
0000000000000000000000137j1hhh1h1hjhj1q777700h1h1h1j1jjjj3jj1j1j11jh1j0jj3q73j101jj3j3j033jjj33333333333j3j3333331j1111111777000
00h0000000000000000000h1jhj1h1h1hj3j7qhj700011hhh31j1jjjjj3jj111jjj1j1j0j377r3j1j3j3jjj130jjjj33333333333j3333333311111111777000
0h0h0000000000000000001h7jh1111h1jj777jhj00h11hhh1j1j1jj33j3j111j3jj130jjj3rjrjjjj3j1j1j1j0jj3333333333333333333311j111111h77r0h
01h7000000000000000000h0hh131j11jj70j71jh00hh1jh101j1111333j331r3j3b33rjj37jrjjj1jj11111j0j33333333333333333j333111111111j1hrqr0
17170000000000000000000hhh33j1j1770jjjjhhhhhh111133j1j3bq33333r3rb33br3r3b73j3jjj13111j1jj33333333333333333j3j33j111111111h1qrqh
03700000000000000000000hhh333jbq7730jjjh1hjh0h111jj1j3j3b73r377rb7b777r7qaqrr33jjj11111j1j3j33330133333333j3j3jj3jj111113j1h1q73
3j3j0000000000000000000hhh333bqbqr3jjjj1h11hh0h1jjbj1j3b7b7777q77b77777qaqa7rrb3j3111111j3j3j33010133333333j3jjjjj1j1jj3jj313337
03j000000000000000000000hjj3ra7qrbr3jjjr11hhhhjjjrj0jjqrr7r3jq7q3qq777777a7rqb7b3r31j1j3331j33330133333333jjjjjjj1j1j3jjjj1h3j33
7000000000000h000000000h0jrrr7abbr3jjrrjb1hh1j1jrj3jj0j3jj3jjjq3qqqq3333a73q7qb7r3rrjjjjj1j103333333333333jjjjjj1j1j3j3jjjj1j3jj
000000000000hh0000000000jrrr7abqb31jjjjb1111hhj1r3jj0j0j3jjjjj333qqr3333333bqb7a77r3jjjj3j1010333333333333jjjjjjj111j3j3jj10hjj7
7h0000000000hhh000h000001rrr7ajbj101jjjj111h1hhr7r3bj033jjjjjj333br3r3333333brrb777r3j33jjj10133333333333jjjjjjj11111j3311hh000j
h0h000000007bhj00h0h00010br71j0jbj10r3b01111h1hjr7r33333j3j3j3j3bq7r33333333rrbrb7777a3r33jj1j333333333333jj3jj1j1113j31111hh007
0h000000000b7b1337h00000b7b101jhjr033bjb713rjhjj3r3r3333jj3j3j33rqq3333333333rrbbraba7a3r3333337733333333333333j1j1jjjj311hhhh00
000000000077b133j37a0j017b7010h1h1333jb777jjrjj3j3r3333jjjj3j3jrqr33333333jj33333bbaba7r3r333qq37333333333333333j3jjjjj33j1hh1h0
0000000007aj001j3ja7ahq7ar0h000h1h333qqa73jjj33j333333jjjjjj0jj3rq3333333jjjj333333b3aq7r333qqqq33333333333333333j3jjj33333h1hh0
00h00000ra7a0000j07a7q7arar0000hhhj3qqaq3j3j33333333jjjjjjj0j0jj7333r333jjjjjj3333j33qbq7qrbrqqrj333333333333333j3jjjjj01333hhh1
0h0h000r7ra0000000003qq7ar000000h0jrrqbar3jr3333333jjjjjjjjj0jjj3q3bbr333jjjj3333j3j03qbqqq7a7rjjj333331033333j33j3jjjj10131h1hh
00hhjhjjb77000000000q777b0000000000jrb7bjr3j33333j3jjjj33j3jjjjbq77b7373jjjjj333j3j030j3qqqa7aj3jj03j3j010333jjj330j3j3j11331hh1
h0hjhjhb7bqr10000000bqqbb00000000007q1bj0jj3j33jj3j3j33jj3jjjrbrb7a7b7377ajj3j3j3j3j0j3jrqq7aabjj03j3j3jj3j3jjj33330jbj31311311h
0h0h13jb7b313h1001hb7b7q0001000000707qh0j0jjjj11jj3333jjjjjjj3rbr37r7377a773j333j3j333jjj3raabbb0301j3jj3j3j3jjj3b3bb7bq31r31hh1
00h1hh37h31311hhh013b7q0rb1330000b7700000j3jj11113j3333jjj3j3b3r33j3r7r7r7777733333333jj333rbbbb301j1j33j3jjj3jbb33rbbrbrrr1h1h0
000hhhhh3h01hjhhhh303rbrbr333300b7b700000hj3j011jj77333jjjjj333j3j3j777rjr7bqa7q3333333j3333bbr301j1j3333jjjjj33b3b3rrbrqrrr1h00
00000hh0h0000hhhh0h3q7r3rbb337q03b7000000j1jr33j77r7333jjjj3j3j3j3jj777jrjbqb7a7q3331h3j333bbr3r3j1j333333jjj3j33j3rjj3r7q130000
0000000h00000hhh1hqa7q333b7b7q7qaa70000000hrj3a7777r3j30003j3j1jj1j1j7jjjjjbrr7qaqb1h1hjj33333r3q0j333333j3j3j33jjjjjjr3r1q10000
00000000000000h11qaqa3j333bjr7qaaaaanj000h0hra7a73j3j3000003j1010j137jjj1jj3rrraqa3j1hjjj33333jjjj3j333333j333jj3j3jjjjr7q101000
000000000000000007qaqj3j3j3jj31qqqaqan7b00hjb7a7aj3j3j03000jjj1h013q7jjj3jjj3rjra3j3j13j333333jjj3j3333333333j3jj3jjjj3j37310000
0000000000000000137q31j3jjjj313qqqqaqaq7br333b7a7aj111000000jjh0h0q7q7j3jjjjjjrj303jq3333333333jr3333333333333j33j3jjjj337310000
0000000000000000313h1h1jjjjj037bqqbqaqaqrbb33337a71j11100000j17h033q771hjjjjj1jj3377q3333333333r3r3333333333333333j3jjj33jj31000
000000000000000003h0h1hh3jj1j3brb0qqbaqqbbab33jj7bj1j1300000071700r311h1hjj31013j7777q3333333333r77333333333333333jj3j33jjjjh000
0000000h00000000070h00h0001hhjrbrrqbbbqbqabq333jb7bjr3j1000001777r3r311hj01j313jbj73q3333333333377733333333333333j3j33333jj330h0
000h00h0000h00000700000h00hhhh3rjjrbbqbq7aq7q3333b7r7r101h00101777r310000111j37bjb373b3333333333377733333333333333j3333333333h0h
00h0h00000h0h00r77h000h00hhhh3j3jjj11h0jabaqb33b3333r371h0h0010777jh000001113737b333b7br333333333777b333333333333333333333333310
3jhh0hh0011h1hr7r70h0hhh0hh0j731hj1h11h1bbbb3b3b173b3b777h0011001jhj00000r177j7373333br3r3333333377b3333333333333333333333333111
j330h3jh1111111r77j0hhhhh00j0b7h1hh1hh1jbbbqb30101nrb7777r311111311h100hrqr7j7373333337r333303333377b333333333333333333333333311
33030j31111311177j3j11131h30ara1h0hhhhjrqbqqqjj010r3r77713jj11j111j1j1hhhrq7777333333373333030333377r333333333333333333333333333
333033jr1133311j7jj111j1j1j3rrr1hh0hhj0jrqrr3rjh0j3r777rrjjjjj1j3j101jjhhq777733333333b7333303333r777r33333333333333333333333333
7j3333rrrrqr3rj7j7j110jj1rrbrrrh1hh110j0brrrr3j7jjj377r0r111j3j33303jj11j177733333333b7q73333333r3b7r3r3333333333333333333333jj3
j0j3jj3rrrr3r3117jj10j03rrbrbr0hh031jj00qb3rrr3j3jj3770r0111jj3j3331j1j113733333333333q7q33333333babar3333333333333333333333jjjj
hj0jjjjjrjqr31117j1j103r3rrbq73hhh1j1j0q033333r3j33r7qr0111j3jjjj3131j1j333733333333333q3333333333bqa33333333333333333333333jjj3
hh7hjj10hh0hhh117j113rr3rrbbq3j3hhh133b0ab3bbr3r3rrrq7qr11j3j3jjjjj101j3j3373333333333777333333333qaq333333333333333333333333j3j
h0h0h10hh0h0hhhh71j133q7rrrbaq311hjj0r3bbqbbbbbrqrrq7qr33jjj3jjjjj111h1j3337333333333r7773333333333j7r33333333333333333333333rj3
000h0h00hh00000h111303333rbbb7q10jj0r0bqbbqqbbq7rqnrqrbrjj1jjjjjj311h1h1j37773333333r3r77r33333333j3j3r3333333333333333333b3r333
00000000000000h0h1j000j03rbbbqqqq1jj0rqbqaqaqq7q7n7naqr31111jjjjjj3h0h1j3j7773333j333r37r3333333333j3r3333333333333333333bbbr31h
000000000000hhjh1jh0h01jhj3babqq1hjjjb3qaqaqaaq7a7naqr3r11111jjjjjj0hj33j3777333j3j3j37773j333333333333333333333333333333bbr3rh1
000000000003hj3jb3jh0h1hj3j3ba3101hjr3j3qarn7a7a7n7777rj11111jjjjj1jj3j3337773333jjj3j770j3j333333333333333333333333333333b7r31h
000011hh0jhj13j33b31h1r1jj3q7rj0001r3jjjq3n7n7a777n777331j111hjj11j03j333r7773333jjjj33710j333333333r333333333333333333333q73333
h111111jjjj1013nb3111hh11jq7bbr000h13jjq7q7n7q77b77777a301j1h1h111jj3jj3r3777r3333jjj07171333333333r3r3377333333333333333q7qr331
03j311jjjjj0103rb7j1hhhh1jhbbbj00hh1j1j7q773qrqb7br3q7703033110111jjjjjj3r77r3r333jjj307133333333377rb777773j3333333333333q77r13
003j3jjj313101rbrbhjhhh11h07bjbj0h1h1j337r773qj0b13q7q7a03r31j1j1jjj3jjqb777qr33333j3j7b333333333377b7r3773j3j33333333313337r331
0000j11313h117jrbbjhh00000177bj00hh113337rr30jjjjjj3q777ab3rj1jjjj33j3qa777q33333333j7bbb333333333n73r3r3330j333333333131j373331
000r11111h1h1j1jbrbh000001017700hhhh113jr77r3jjjjjjjj37a77abrj0jj0r33aa7a73333333333337bbr3333333n7n33r33303033333333331j3j73313
00h0h11110h000j1rbj10000001077qrhhh1111307r3r333jj3j0jb77a7aq0j00q03a70a7333333333r777030j33333337n733333330333333j3333jjj737331
000h0h100000000r7r30100000017qrqrhj111333j7r33j333r3r0jq77an77b7707q7070333333333r3r3730j3j333333q77q333333333j10j3jj33jj3j73333
0000000000000000r3r300000001j0qrbj111hj3j7j7jj3j333rjj3jq7n777777777q70r3333333333r373333j333333b7qq333333333j1j10jj3j333j303331
0000000000000000jr3r1000001j0j7bb7111hhhjj77jjj3337jrjj3337a77baq77q7qr33303333333333333333333333r733333333333j10333j33333073313
000000000000000jhjj1j10010hrj77brb31hh31h111j3j33r30j3333773q3qqaq33q33330303333333333333333333337r33333333333333333333333733331
000000000000000hjjjj1110j1rrrr77bjjhhhjh1h0j1j33330bbr3377733733q33333h33303333333333333333333333r333333333333333333333337373333
00000000000000001jjbb1113j0j3rr7rjjjh11hh000j1j333bqbr3j777h777033333h1hj33333333333333333333333333333333333333333333333377333j1
0000000000000000h1bbr313j3j3jrrr7jj1111100001j3r3rrbrrrrj7107770h33331hj3j333333333333333333333333333333333333333333333373733j1j
00000000000000h0jr0r3r3q3r3j3rr773h0110h0001j1r3rrrbr3rjr111777h0h333313j3333j3j3333333333333333333333333333333333333333773333j1
000000000h000h0hh0b0r3b7q3rrj3r7373h0000h0hh1jbrrrbb3r3r37100700h33333333333j3j0jj33333333333333333333333333333333333337q7b77333
0000000bh01100jjrb0babqqqbrj0j117770h0000h013bbbrrrqb337731h7j70013j333333333jjjj3j33333333333333333333333333333333333bq7q3b3337
h000h113b1111jjjjrba7qbr3rb0j00117770h01hh1313bbrrr3333333h1j7h0h3j3j33333333j3j3j33333333333333333333333333333313303337q7b33337
0hjh11113b117rjjrbqqqbqbr3rj00000077h1hhhhh13babar3j3jjj3rjhhh0h0h3j3333333333j333333333333333333333333337333331j101037773333333
h0h00113b7q7bqarrrqrqqqr31hh0000007h7h1jhhhj3r3jjrj3jjj1jj1j00h0h1333333333337333333333333333333333333333333333j1j30j337j0333333
0h0h01113qqqbbqrrrrqrqqq1h0000000007h1j1jhjjr3jjjj1hj11j1jj11000131333303333737333333333333333333333333337333333j33j3jj70j033331
00h001117qqqbbb3rh0rrqqrh00000000001111jjjjjjj3jj1h1h11111j110100133330103333773333333333333333j303jj3330j3333333333jjjjj0333333
00001j1rbqrb7r13h0h00rr0r00000000hr111j1jjjjjbj1j11hhh111jj11h000033331013333b3733333333333333j3j3jjjj30j0j33333333jjjjj33333333
000131rbrrbr01310h00000r0000000011q10013jjjrrj0j11hhh1jjj311hh000h3333313333brb7q33333333333333j3j3jj3a70j333333333jjjj333330331
0h0113jrbqr0r01000000000770000013qr000033qbr371hhhhhhh1jjj1110000h1333333333rbrq7q33333333333333j3j33a7a73333333333jjj3333303013
h11j1j33r3jr0300000000007770001313r70033bbrjr1h1hhhh1h3jjj111h00h1hj333333333r3rq733333333333333033337a3333333333333j333333jj331
1j11j71h3jjj3jj000000000070000113rbrjjjb7bjjj01hhhh1h1b3jh1111h00hj1j333333333r7r73333333333333030337333333333333333333333jjjj33
j3jj11h1hjjjjjjh00000000000001b1jrr3jjjbbajjj000hhhh111jh1hh1h00001j33333333333r7773333333333333033737333333333333373333333jj331
3j31hh1h00j71jhhh000000000000j13rj11jjjrarbj00000hhhh111hhhhh00000h3j33333333337777333333333333333737333333333333377333333333311
731000h0000001hhh00000000hh3j3j331111j133brjh00000hh1h1hhhhhhh000h0j3j3333333777773333333333333333373j33333333333737333333333311
070000000000001h1000000hhhhj3j33j111jj3333jj00000h0hhj1rhh1hhh0000h1j3333333777733333333333333333333j3j3333333333773333333333111
7100000000000h71h1000hh0hhr33j3j1j1jja3333rj0000h0h0jhh111j1h00000111j3333333773333333333333333333333033333333337733333333331011
1j100000000000h71j00hhhh3b3rj3j0j1hjjjb333rr1000000hhh1h11jj1h000001j3j33333333333333333333333j3j333030j33333r373333333333330103
j1j0j00000000000j0j11hhjb3b3jj010hhhjj3r3r31100000hhh1h11jj0h10000h03j3j333333333333333333333j3j3j3330j0j33333733333333333333033
3j3j000000000000711113j3333jjj101hhjr0rjr31hh000000h11110hhh0h00000ha3j3333303j333333333333333jjj33jjj0j3333337733333333333333j3
j3j070h00000000011113r333331jj113jjr0rjrj3h10000001111h0hhjhh000000033333330303j33333333333333j3j3j3jjj333333r733333333333013j3j
0j173h0h0000000001137333j310hh1j1rjjr0j13j1h100003j31h1h00h00000000h1333333303j3333333333333333j033j33333333r7r333333333301013j1
00h303h0000000000j07n7qjrj000hj1jjj1j11j11jhh000hj3jj1h00h0000000jh1h1r333333j313333333333333330303333333j133r333333333333013313
0h0h300h00000000h0j0qqaqj0000hjjj11j111111hhh00h1hjj7j000000000000hh1br333333013133333333333333303333333j1j333333333333333333331
00h01j10h000000h1h0q0aqajj00h1jj1j11111j11hh0000h1jrj00000000000hhhhrr7r333j03013033333333333333333333333j1333333333333333333333
000101j11100000jhbr0qqaqjj3jrjrrj10111111h00000h1j1j01000h0000000hhjjrrr33j3j333033333333333333333333333333333333333333333333333
000010111110000h3jjr31q733j3jrrrr0j11111j0000000h1j11000h000000001jjjbq3133j3333333333333333333333333333333333333333333333333333
00000000111100hjjjjj10h3773qrr7j1j11111r100000001j10h00h0hh000000h1jbrbqrj377333303333333333333333333333033333333333333333333333
00000000111311jj1jjh000h7j77q3j1j1j11jj10000000001j00h0h110100010177jb7b37r07333030333333333333333333330303j303j3333333333333033
00000000h111r3j1j1h00000j7r77q3j1hr33j1h00000000hj0000hjh1100h0017777bb7rr7r733330333333333333333333333303j3j3j3j333333333330303
0000000hjhj3b01j10000000hrb7q771j173j1h10000000hj00000jh311hh0010j77brbr3jr1h33j303333333333333333333333333j303j3333333333333033
000000h0hj3b310h0000000h0hrj77b77jq7311h000000h0hh00h003331hh00700j3rbb0j1jhhhj3030333333333333333333333333333333333333333333331
0000h10j3rj3b0h1h0000000h1h10b7bq77rrr110000000000h00h11333h000001jb3b130jjhhhh1301333333333333333333333333303333333333333333313
000h0hj1jj0jqr1h100000001h0010bq7qq7r1j1h00000000h00h1h11jh0h0000jr3b3013311hh1h113133333333333333333333333010333333333333j33331
0000hj1j1000r1j1h0h0000hh0h001h1qrqqqq11jh00h00000000h1h1rjh00000hjr3010331hhhh1101h1333333333333333333333310133333333333jjj1330
00h13jh10000jh1hhh0h00h0h0000011rqrqqq1jrjh0h000h000hhh111j00000011r33033jj11h11h1h1h333333333333333333333331333333333333jj0310h
ra133hhh0000h0hhhh030h0h000000111rjbqh7rjq0h00000000hhh11j00000000h3j333j3jj11h1h00h033333333333333333333333333333310333330100hh
ara33hhh0000000hh0j7h0h0000h0h011jrrb7h7q7q7hj001h000011jjh000000hhj3jr33jj11h1h0h0000333331333333333333333333333310113333101jhh
7a3j30h0000000000jjj7h00000hh0hh3brb1h0h777b73h7hjh001013h0h00000hh1jj3r333j11h1h00000003313133333j33j33333333333jj113113011j7jh
b3b30000000000000jjjh0000000hjhj33b1h0h170j7br3hjhj0j01j33h000000h1hjr333330jhjh0h0h00000001h3333j3jj3j3333j33331jjj31h31rr3jj10
3b3000000000000000j0000000000jj3j3jh1h103jhjr3r30jh70bbbj1707j0000hjr3r7q33j0jhjh000000000000h3333j3jj3j31j3j33131j00hhhrrqr37h1
03000000000000000000000000000jjj3j1jh00373jhjr3h0h0h7bbb7717j7j000003r3qr3j3j11h1h00000000000000013j13j3131j333010h000hrbrrq7h0h
00000000000000000000000000003hjr31j10007r7h00jh000h0h0b3jj7h7j000001h37b3r3j1111h0000000000000000010010001h0h0000h00000brbq7h0h0
00000000000000000000000000000jrjr310000r7r000h000000003j31hh0000001h3j3jr3r3111h000000000000000000h00000000h00000000h0h7b77hhh00
000000000000000000000000000001j1j00000r7rh00100000000003111h00000001j3j1j113h1h100000000000000000000100000000000000hjhjh77hhhh00
0000000000000000000000000000001j10000077h0h000000000000111100000000j3j1j1111hhh0h000000000000000000h0000000000000000hj777h0h07h0

