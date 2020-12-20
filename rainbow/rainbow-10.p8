pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

#include maths.lua
#include vec.lua
#include poly.lua

function drw_player_moving(self)
	local v = t/8
	local r = 12
	local aa = (63/64)*v
	local a = aa + t/12
	local va = -t
	local angs = vec(aa/1.2, -aa/2,a/4)

	local polys,points = polly.cube(r*2)

	local ux,uy,uz = angs:u_rot_yxz()
	foreach(points, function(p) 
		p:set( ux*p.x + uy*p.y + uz*p.z )
	end)

	for key,pol in ipairs(polys) do
		local normal = polly.normal(pol)
		if normal.z>0 then
			local light = -normal.y

			local fill_col = v*4 + -8*flr(light) + t*2 - light
			local bord_col = (fill_col-8)

			polyf(pol, vec(64,64), fill_col)
			polyv(pol, vec(64,64), bord_col)
		end
	end
end

for i=0,7 do
	pal(i,i+8+128,1)
end

function _init()
	dt=1/30
	t=0
   tf=0

	cls()
end

function _update()
	--cls()
    t+=dt
    tf+=1

	for i=1,1000 do
		local v = vec(rnd(128)-64,rnd(128)-64)
		local ang,r = v:polar()

		local c = 
			  (ang*(8 - r/64) + t/32)
			+ r\8*8
			+ flr( r\8*0.01 - t/4 + ang*11) 
			+ t/4
		
		diff = c - flr(c)

		if 0.2<diff and diff<0.24 then
			c = c + 8
		elseif diff<0.33 then
			c = (c - 8)%8
		end
	

		circ(v.x+64,v.y+64,1,c)
	end

	drw_player_moving()
end
__label__
oeuuuttttutttttdddddddddddddddtttttttttttttttttdttstssssssbssbsbbbrbbbbbrbrrrbbrrrrrrrrqrqrqqqqqqqqaqaqqqqqqqqqqoqqqqqqqqoqqqqq9
euuuutttutttttdddddddddddddddtttttttttttttttttdtdttstsssssssbsbbbbbbbbbbbrrrbrrbrbrrrrqrqrqqqqqqqqqqaqqqqqqqqqqqqqqqqqqqqqqqqqqq
uuuuuututttttddddddddddddddttttttttttttttttttttdttttsssssssssbbbbbbbbbbbbbbbrbbbbrbrrrrqrqrqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
uuuuuuuuttttdddddddddddddtttttttttttttttttttttttttttsssssssssbbbbbbbbbbbbbbbbbbbbbbbbbrqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
uuuuuuuutttddddddddddddtdttttttttttttttttttdtttttttttssssssssbbbbbbbbbbbbbbbbbbbbbbbbbqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq
uuuuuuutetudddddddddtttdttttttttttttttdtdddtdttttttttsssssssssbbbbbbbbbbbbbbbbbbbbbbbbbqqqqaqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqpqp
uuuuuuuutedeedddddddtttttttttttttttttdddddddtttttttttstscssssssbbbbbbbbbbbbbbbbbbbbbbbbbaqaaaqqqqqqqqqqqqqqaqqqqqqqqqqqq9qqqqqpp
uuuuuuueeedeedddddtddtttttttttttdttddddddddtdtttttttstscssssssssbbbrbbbbbbbbbbbbbbbbbbbaaaaaqaqqqqqqqqqqaqaqqqoqqqqqqqqqq9qqqqpp
uuuuueueededdddddtdtttttttttttdttdddddddddtddttttttttsossssssssbbbrbrbbbrrrbbbbbbbbbbbabaaaaaqaqaqqaqqqaqaqqaqqqqqqqqqqqqqqqqppp
uuuuuueeeededddddttttttttttttdtdddddddddddddddttttttccsssssssssrrrrrrrrrrrrrrbrbbbbbbabaaaaaaaqaqaqqqqqqaqqaqaqqqqqqqqqqqqqqqqpp
ouuueeeeeeeeeddtttttttttttttoddddddddddddddtdttttttccccssssssssrrrrrrrrrrrrrrrrrrrrbbbaaaaaaaqqaaqqqqqqqqqqqaqqq9q9qqqqq99qqqppp
uuuueeeeeeeeeetdttttttttttttddddddddddddddtttttttttttcstsssssssrrrrrrrrrrrrrrrrrrrrrqqaaaaaaaqaaaqqqqqqaqqqqqqqqq9qqqqq99q999ppp
uuueeeeeeeeeeeetuttttttttttddddddddddddtddtttttttttttttstssssssssrrrrrrrrrrrrrrrrrrqqqqqaaaaqaaaaqqqqqqqqqqqqqqqqqqqqq9qq999pppp
uueeeeeeeeeeeetutttttttttdddddddddddddttttttttttttttttttssssssssrsrrrrrrrrrrrrrrrrrqqqqqqaqaaaaaqqqqqqqqqqqqqqqqqpqqqqq999999ppp
eueeeeeeeeeuuuutttttuudttddddddddddddtttttttttttttttttctsssssssrsrrrrrrrorrrrrrrrrrqqqqqqqqqqaaqaqqqqqqqqqqqqqqqpqqqq99999999p9p
ueeeeeeeeeeuuuuuutttudddddddddodddddtttttttttttttttttctcssssssssssrrrbrrrrrrrrrrrrqrqqqqqqqqqaqaqqqoqqqqqqqqqqpqqqqqq9p9999999p9
eeeeeeeeeeuuuuuuuuttdudddddddddddddtttttttttttttttttttcsssssssssssrbbrbbrrrrrrrrrrrqqqqqqqqqaqaqqqqqqqqqqqqqqqqqqqqqqp9p99999999
eeeeeeeeeuuuuuuuuututddddddddddtdttttttttttttttttttttsstsssssssssbbbbbbrbrrrrrrbrqqqqqqqqqqqqqqaqqqqqqqqqoqqqqqqqqqqqpp99999o999
eeeeeeeueuuuuuuuueutddddddddodtdtttttttttttttttttdddstsssssssbssbbbbbbbbbbbbrrbbqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqpqqqqqppp99999999
eeeeeeeeuuuuuuuuuueeeddddddddttttttttttttttttdttdddddssssssssssssbbbbbbbbbbbbbbbbqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqppppp99999998
eeeeeeeuuuuuuuuuueeeeddddddddttttttttttttdttdtddddddtsssssssssssbsbbbbbbbbbbbobaoaqaqaqqqqqqqqqqqqqqqqqqqqqqqqpqpqpppppp99998988
eeeeeeeuuuuuuuuueeeeeedddddtttttttttttttdtdtdddddtdtttsssssssssssbbbbbbbbbbbbbabaoaaaaaqoqqqqqqqqqqqqqqqqqqqq9qpqppppppppo889888
eeeeeeuuuuuuuuuuueeeeeeeddtdtttttttttttdtdtdddddtdtdttttssssbsssssbbbbbbbbbbbbbabaaaaaaaqqqqqaqaaqqqqqqqqqqq99qqpqppppppo8o88888
veeveuuuvuuuuuueeeeeeeeedudttttttttttdtddddddddddoddtdttssstsssssbrbbbbbbbbbbbabaaaaaaaaaaqqqaaaqaqqqqqqqqqq9q99qppppppopo8o8888
vvveveuvuvuvueeeeeeeeeeeudutttttttttdtdddddddddddddddtdtssssssssbsbrbrbrbbbbbbbaaaaaaaaaaqqqaqaqaqqqpqqqqqq999q99ppppoooopo8o888
vvevvvvvvuvuveeeeeeeeeeuuuuuttttttddddddddddddddddddddtttssosssrsrrrrrrrrrbbrbbaaabaaaaaaaqaqqaaqqqqqpqqq9q9999999p9opooooooo888
vvvvvvvvvuuveeeveeeeeeeuuuuttttttdtdddddddddddddddtddtttssssssssrrrrrrrrrrrrbrbbaaaaaaaaaqaqqaqaqqqqqqqqqq9q9999999ppooooooo8888
vvvvvvvvvueeeevvvvveeeuouuutttttdtddddddddddddtdtttttttstssssssssrrrrrrrrrrrrbbqaqaaaaaaqaqqqqaqqqqqqqpqqqqp999999898ooooooooo88
vvvvvvvvvuuvvevvvevveuuuuuutttuteddddddddddddtttttttttstsssssssssrrrrrrrrrrrqqqqqaqaaaaaaqaqqqqqqqqqqpqqqpp9p999889888ooooooooo8
vvvvvvvvvuvvvvvvevvvuuvvuuuutuedddddddddddddtttttttttttssssssssssrrrrrrrrrrqqqqqqqqqaaaaaaqqqqqqqqqqqqqqqppp99888888888ooooooo88
uvvvvvvvuvvvvvvvvvvuvvvvvvuuuedddddddddddddttttttttttttstsssssssrsrrrrrrrrrqqqqqqqqqqqaaqqqqqqqqqqqqpqqqpppp9888888888o8oooooo88
vvvvvvvvvvvvvvvvvvvvuvvvvvvueueddddddddtdtttttttttttttttstcssssrsrbrbrrrrrqrqqqqqqqqqqqqqqqqqqqqqqqqqpqppppp9o888888888ooooooooo
vvvvvvvvvvvvvvvvvvvvvuvuvvueueveedddddddtttttttttttttttttcssssssbsbbrbrrrqrqqqqqqqqqqqqqqqqqqqqqqqqqqqppppppooo888888888oooooooo
vvvvvvvvvvevvvvvvvvvvvuvuveveveveedddttttttttttttttttdtdctcssssssbsbbrbbrrqqqqqqqqqqqqqqqqqqqqqqqqq9ppppoppoooop888888888ooooooo
vvvvvvvvvvvvvvvvvvvvvuvuvevvveveveettttttttttttttttttddddcsssssssssbbbbbbbaqqqqqqqqqqqaqqqqqqqqqqqq999popooooooo888888888ooooooo
vffvfvvvvvvvvvvvvvvvvvvvvvvvvveveeettttutttttttdtdtddddddststsssssssbbbbbbbaaqqqqqqqqaqaqqqqq9q9qqqq8998ooooooo8o888888888oooooo
fvfvvfvvvvvvvvvvvvvvvvvvvvvvvvvovvvuttuttttttttdddddddddddstsssssssbbbbbbbbbaaqaqqqqaqqqqqqqqqqqqqq888888ooooooo888888888o8ooooo
ffvvvvvvvvvvvvvfvvvvvvvfvvvvvvvvvvvvuutttttttttdddddddddddtssssssbsbbbbbabaaaaaaaqqqqqqqqqqqqqqqqq9888888oooooooo8888888888ooooo
ffvvvvvvvvvvvvfvfvvvfvfvfvvvvvvvvvvvuuutttttttddddddddddddssssssbsbbbbbbaaaaaaaaaqqqqqqqqqqqqqqq99898888o8ooooooo8888888888ooooo
ffvfvvvvvvvvvvvvvvvfffffvvvvvvvvvvvuvututtttdddddddddddddddcssssssbrbbbbbaaaaaaaqaqqqqqqqqqqqqqp889888888oooooooooo888888888oooo
fvvvvvvovvvvvvvvvvvvvfvvvvvvvvvvvvvvuvutuudddddddddddddtddcscssssssbrbbbaaaaaaaaaqqqqqqqqqqqqpq8p8888888888ooooooooo8888888ooooo
vvvvvvvfvvvfvvvvfvvvvvvvvvvvvvvvfvvvvvvuuuudddddddddddddtttcsscsssrrrbbraaqaaaaaaqqqqqqqpqqqpqop8888888888o8oooooooo88888888oooo
vvvvvvfvfvfvvvvvvvvvvvvvvvvvvvvvvfvvvvvvuuudddddddddddtttttsscscssrrrrrrqqaqaaaaqqqqqqqqpqpqqopo8o888888888ooooooooo88888888oooo
vvvfvvffvfvfvvvvvvvvvvffvfvvvvvvvfvvvvvvvuvvddudddddttttttttsscssrsrrrrqrqqqaaaqqqqqqqq9p9qpppooo8oo8888888oooooooooo88888888ooo
vvffffffvvfvvvvvvvvvvffffvfvvvvvvvfvvvvvvvvvvudddddtttttttttscccrqqqrrqrqrqqqaqqqqqqqq99989opooooooo88888888ooooooooo888888888oo
vvfffff8vvvvvvvvvvvvfvffffvfvvvvvvfvfvvvvvvvududddtttttttttssccqqaqqaprqrqqqqqqqqqqqqq99998oooooooo8888888888oooooooo88888888ooo
vvvfffvvfffvvvvvvvvfvfvffffvfvvvvvffvvvvvvvveuvudttttttttttssqqaaaaqqapqqqqqqqqqqqq9q9q988oooooooooo88888888ooooooooo888888888oo
vvvfffffffffvvvvvvfvffffffffvvvvvfvvvvvvvvvvvvuvutttttttttdqqaaaaaaqaqapqqqqqqqqqqqq8q988888ooooooooo88888888ooooooooo88888888oo
vvfffffffffvvvvvvffffffffffvvvvvvvvvvfvvvvvvvvvuuttttttttqqaaaaaaaaqaaqqqqqqqqqqqqqpq888888o8ooooooooo888888o8ooooooo88888888ooo
8fffoffffffvvvvvvvffffffffvvvvvvvvfvfffvfffvvvvvvvvtttqqqaaaaaaaaaaqaaaaqqqqqqqqqqp9p8888888oooooooooo8888888oooooooooo8888888oo
f8ffooofofovvvvvvfffffffffvvvvvvvvvvfffffffvvvvvvvvuqqqaaaaaaaaaaaaaqaaaaqqqqqqqpqop88888888ooooooooo88888888oooooooooo888888ooo
8ffoooooov8vvvvvfvfffffffvfvvvvvvvfffffffffvvvvvvqqqqaaaaaaaaaaaaaaaqaaaaaqaqpqpoooo888888888oooooooo88888888ooooooooooo888888oo
8ooooooov8v8v88vvffoffffffvvvvvvvvffffffffvvvvvqvqqaaaaaaaaaaaaaaaaaqaaaaaaqaqoopooo888888888oooooooo8888888888oooooooo888888o8o
8oooooooov888888vfoffffffffvvvvvvvffffffffvvvqqqqaaaaaaaaaaaaaaaaaaaaqaaaaaaqoqoooooo8o8888888oooooooo8888888888oooooooo8888o88o
8ooooooooo8888888ofoffffffv8vvvvvvfffffffvfvvqqaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqaoooooooo88888888ooooooooo88888888ooooooooo88888ooo
oooooooooo88888888oooffofv8vvvvvvfffofffvfvvvqaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaaqooooooooo88888888ooooooo88888888o8ooooooo8888888oo
oooooooo888888888oooooooo888v88vfffffffffvfvvvqaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqoooooooo88o88888oooooooo888888888ooooo8ooo8888888o
ooooooo888888888o8oooooo88888888vfofffffffvvvvqaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqoooooooooo888888ooooooooo8888888ooooo8o8ooo8oo8o8o
ooooooo8888888888oooooo8o888888v8oooofoof88vvvqaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqaooooooooo88888o8oooooooooo888888ooooo8oo8ooo8o8oo
oooooooo88888888oooooooo88888888ooooooooo88vvvqaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaaqoooooooo88888o88ooooooooovooo88ovooovooovoooo8voo
ooooooo888888888ooooooooo888888oooooooooo888v88qaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqooooooooo88oo88o8ooovooovvvoooovooovvvovovooovovo
ooooooo888888888oooooooo8888888oooooooooo888888qaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqaoooooovo8oooov8voovovoovvvvfovovovvvvvvvovovfvof
oooooooo8888888o8ooooooo88888888oooooooo8888888qaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaaqovvvvvovovoovfvvvovvvvvvvvffffvovovvvvvvvovfvffo
ooooooooo8888888ooooooooo888888oooooooo8o8888p8oqaaaaaaaaaaaaaaaaaaaaaaaqaaaaaaqvvvvvpvp99vvfvfvopovvvvvvffff9f9pvpvpvvvvvppffpf
oooooooo8888888o8ooooooo88o88888popooppp8pppp8ppqaaaaaaaaaaaaaaaaaaaaaa9qaaaaaaqpvvppvpp9999v999ppppppvv9f9f9f9pppvppppvvpppppfp
ooooooooo8888888ooooooo8888888pp8pppppppppppppppqaaaaaaaaaaaaaaaaaaaa99ppqaaaaaaqpppppp9p9999999pppppppp99999999ppppppp9pppppppp
oooooooo88888888ooooooop88pp8pppppppppppppppppppaqaaaaaaaaaaaaaaaaa99pppppqaaaaaqppppppp999999999pppppp99999999ppppppppp9ppppppp
oooooooo888888888ooooopop8ppppppppppppp9ppppp999pqaaaaaaaaaaaaaaa99ppppppppqaaaaqppppppp99999999ppppppp9p999999ppppppp99pppppppp
oooooooo88888888ooooooop8pppp8pppppppp9p9ppp9999pqaaaaaaaaaaaaa99pppppppppppqqaaqpppppp999999999pppppppp999999ppp9ppppp9pppppppp
8ooooooo88888888oooopoppp8ppppp8ppppppp9p9pp9999aqaaaaaaaaaaa99ppppppppppppppaqaaqppppp99999999ppppppppp99999pppppppp99ppppppppp
8ooooooo8888888o8ooppppppppppppppppp9ppp9p99a9aaaaqaaaaaaaa99pppppppppppppppppaqaqpppp999999999ppppppppp999ppppppppp9ppppppppppp
o8ooooooo8o8888888opppppppppppppppppppppp99a9aaaaaqaaaaaa99pppppppppppppppppppppqqppppp99999999ppppppppp999pppp9p9p999pppppppppp
8ooooooooo8p88888pppppppppppppppppppppppqpp9aaaaaaqaaaa99ppppppppppppppppppppppppqqpppp9o99p999pppppppppp9pppp9p9p9o9ppppppppppp
88oooooooop8pp8pppppppp9ppppppppp9pppppqpqaaaaaaaaaqa99pppppppppppppppppppppppppp9q9ppppppp9p9pppp9ppppppppppppp99pppppppppppppp
88oooooooo8p88pppppppp9p9ppppp9p9p9ppqppqaaaaaaaaaa99pppppppppppppppppppppppppp999q89opppppp9pppp9ppppopppppppppppppppppppp8pppp
8oooooopopp8p88ppppppp99ppppp9p9paqpqpqqqqaaaaaaaaaa9pppppppppppppppppppppppp9999pooopopppppp9pp9ppppppppppppppppppppppppppp8ppo
8ooooopoppppppppppppp9p9pppqpp9aaqaqqqqqqqqaaaaaaaorr9ppppppppppppppppppppp9999ooooooopopppppp9pppppppppppppppppppppppppppp8p8po
88ooooopppppppppppppp99pppqpapaaaaaqqqqqqqqqaaaaaoarrs9pppppppppppppppppp99f8ofooooooooppppppppppppppppppppppppppppppppppp8p8p8o
8ooooopopppppppppp9ppqp9pqqapaaaaaaaqqqqqqqqaaaaaarrrss99pppppppppppppp999ffffoffffooooopopppppppppppppppppp8pppppppppp8pp88888o
8oooopoppppppqpppp9pqpqaqqaaaaaaaaaqaqqqqqqqaaaaarrrsscsp9ppppppppppp99eefffffffffvfoooooooppppppppppp8pppp8pppppppppppp888888oo
88ooppppppppqppppqqapqqqqqqaaaaaaaaaqqqqqqqqqaqaarrrsssccp9pppppppp99ueeeffffffffvfvvooovooooopoppppppp8pppppppppppopp88888888oo
888ppppppppppqppqqqqqqqqqqqaaaaaaaaaqqqqqqqqqqqqrsrrssscc8p9ppppp99uuueeeefffffvfvvvvvvvvvfoofopopppppppppp8oppoooppoo888888o8oo
888oppppppqpqpqqqqqqqqqqqqqqqaaaaaaaaaqqqqqqqqqrqrsrsscccc8p9pp99uuuuuueefefffvfvvvvvvvvvfvffffofpovpp8ppp88ooooooooo88888888ooo
p88ppppppppqpqqqqqqqqqqqqqqqaqaaaaaaaaaqqqqqqqqqrsrssccccccc999duuuuuuueueeeffvvvvvvvvvvvffffffffovov8v8p8888ooooooooo8888888ooo
8pppppppppqpqqqqqqqqqqqqqqqqqaaaaaaaaaaqqqqqqqqrsrsssccccccoccduduuuuueueeeefvvvvvvvvvvvvffffffffvov8v8v8888ooooooooo8888888o8oo
p9qpppqpqqqqqqqqqqqqqaqqqqqqqaqaaaaaaaaaqqqqrqrrssssssccccccccdduuuuueueuuuuvvvvvvvvvvvvffffffffffvvv8v8vvooooooooo88888888o8ooo
qpqqpqqqqqqqqqqqqqqaaqaqqqqqqqaaaaaaaaaaqqqrrrrsssssssscsssccccduduuuueuuuuuuvvvvvvvvvffffffffffvvvvvvvvvvvooooooo888888888ooooo
pqqqqqqqqqqqqqqqqqaaaaaqqqqqqqqqaaaaaaaaaqqrrrssssssssssssscccddduutuuuuuuuuuvvvvvvvvfvffffffffffvvvvvvvvvvooooooo88888888o8oooo
qqqqqqqqqqaqqqqqqqaaaaaaqqqqqqqqqaaaaaaaaaaqrrsssssssssssssscsddtdtuuuueuuuuuuvvvvvvvvffffffffffvvvvvvvvvvfooofoo8888888888ooooo
9qqqqqaqqaqqqqqqqaaaaaaaaqqqqqqqaaaaaaaaaaarrsrsscssssssssssssstttttuueueuuuuuvvvvvvffffffffffvvvvvvvvvvfoffoffffo88888888oooooo
qqqqqaqaqqaaqqqaqaaaaaaaaqqqqqqqqaaaaaaaaaasssssssssssssssssssttttttouueuuuuuuuvvvfffffffffffvfvvvvvvvvfffffffffof888888888ooooo
qqqqqqaqqqqqqqaqaaaaaaaaqaqqqqqqqqaqaaaaaasssssssssscssssssssssttttttuuuuueuuuufvfffffffffffvfvvvvvvvvvffffffffff888888888oooooo
qqqqqqqqqqqqaqqqaaaaaaaaaqqqqqqqqqqaqaaaaaassssssssssssssssssststtttttuuueuuuuvvffffffffffffvvvvvvvvvvffffffffffo888v88888oooooo
qqqqqqqaqqqqqqqaaaaaaaaaaaaqqqqqqqqqaaaaaasssssssssssssssssssssttttuttuueueuueuoefffffffffffvvvvvvvvvffffffffff8vvvvvv8vo8oooooo
qqqqqqaqaqqqqqqqaaaaaaaaaaqaqqqqqqqqqaaaabssssssssscsccccsssststttutuutuueuueueefefffffffffvvvvvvvvvfvffffffffvvvvvvvvvvvooooooo
qqqqqqqaqqaqqqqqqaaaaaaaaaaqqqqqqqqqqqqaassssssssscscccccccocsdstttutduuuuuuueuvefffffffffvvvvvvvvvfvffffffffffvvvvvv8vvvooooooo
qqqqqqqqqqqqqqqqqqaaaaaaaaaqaqqqqqqqqqqqsbssssssssscccccccccccsddddtduuuuuuuuuuuufufffffvvvvvvvvvvvffffffffffvvvvvvvvvfvfooooooo
qqqqqqqqqqaqqqqqqqqaaaaaaaaaqaqqqqqqqqqqqsbsssssssssccocccccccdddddddduuudduuuvuuuufvfvfovvvvvvvvfffffffffffvfvvvvvvvvvfffoofooo
qqqqqqqqqaqaqqqqqqaqqaaaaaaaaqaqqqqqrqqqrrssssssssccsccccccccddddddddduuuuuuuuuvuufuvvfvvvvvvvvvfffffffffffffvvvvvvvvfffffffof88
qqqqqqqqqqaqqqqqqqqqqaaaaaaaaaaqqqqqqrorrrssssssscsccccccccccdddddddduduuuuuuuuuuuuvvvvvvvvvvvvvffffffffffffvvvvvvvvvvffffffff88
qqqqqqqqqqqqqqqqqqqqaqaaaaaaaaaaqaqrqrrsrrsssssssscsccccccccccdddddddddduuuuuuueuueuvvvvvvvvvvvfvfffffffffvvvvvvvvvvvvfffffffof8
qaqqqqqqqqqqqqqqqqqqqqqaaaaaaaaaaarqrrsrssssscsssssccccccccccdddddddddduduuuuueueeuevvvvvvvvvfffffffffffvvvvvvvvvvvvvfffffffffvv
aqqqqqaqqaaqqqqqqqqqqqqaaaaaaaaaaaarbrrssssssscsssssccccccccccdddddddddduuuuuuueeueuvvvvvvvvffffffffvffvvvvvvvvvvvvvfffffffffvvv
qqqqqaqaaaaaqqqqqqqqqqqqaaaaaaaaaabarbrsssssssssssssscscssccccddddtddddtuuuutuuuueuvuvvvvvvfffffvffffvfvvvvvvvvvvvfvffffffffvovv
aqqqqqaqaaaaaaaqqqqqqqqqqaaaaaaaababbrrssssssssssssssossscssctddttttttttutttuuuuuuuuuuuvvvvvfffvfffvffvfvvvvvvvvvfvffffffffffvvv
qaqaqqaaaaaaaaqaqqqqqqqqqqaaaaoobabbbbbsssssssssssssssssssssstttttttttttttttuuuuuuuuuuvvvvvvvfvffffffvfvvvvvvvvvfvfffffffffvvvvv
qqqqaaaaaaaqaaaaaqqqqqqqqqaqqoabbbbbbbsbsssssssssssssssssssstttttttttttttttttuuuuuuuuuuvvvvvvvvvvfvvvfvvvvvvvvvfvfvfffvfffvvvvvv
qqqqqaaaqaaaaaaaaqqqqqqqqqqqqqbabbobbssssssssscscsssssssssssttttttttttttttttttttuuuuuuuvvvvvvvvvvvvvvvvvvvvvvvvvffffvfffvffvvvvv
qqqqqqqqaaaaaaoaaqqqqqqqqqqqqqabbbbbbsssssssscccscsssssssssssttttttttttttttttttuuuuuuuuvvvvvvvvvvvvvvvvvvvvvvvvvfvfvfvfvfvfvvvvv
qqqqqqqqaaaaaaaaaaqaqqqqqqrqqqrrbbbbbbsssssssssscsssssssssssttttttttttttttttdtuuuuuuuuuuvvvvvvvvvvvvvvvvvvvvvvvfvfvvvfvvvvvfvvvv
qqqqqqqqqaaaaaaaaoaaaqrqqqqqqqrrbrbbbbbsssssssssssssssssssssttttttttttttttddtddduuuuuuueevvvvvvvvvvvvvvvvvvvvvvvfvvvvvfvvvvvvvfv
qqqqqqqqqqaaaaaaaaaaqaqqqqrqqrrrrbrrbbsssssssssssssscssssssccttdtttttttttdddddddduuuuuuuvvvevvvvvvvvvvvvvvvvvvvvvvvvvfvvvvvvvvvf
qqqqqqqqqqaaaaaaaaaaaqqqrqqrrrrrrrrbrbbssssssssssssccccsccccccddddtdttddddddddddodduuuuuuvvvvvvvvvvvffvvvvvvvvvvvvvvvvfvvvvvvvfv
qqqqqqqqqqqaqaaaaaaaaaaqqrqrrrrrrrrrrrsssssssssssscccccccccccddddddddddddddddddddddduuuuuvvuvvvvvvvfvffovvvvvvvvvvvvvvvfvvvvfvvv
qqqqqqqqqqqqaaaaaaaaaaabaqrqrrrrrrrrrsrssssssssssssccsccccccddddddddddddddddddddddddduuuuuuvuvvvvvvvfvovvvvvvvvvvvvvfvfvvvvfvfvv
qqqaqqqqqqqqqoaqaaaaaaaabaqrrrrrrrrrrrsssssssssssssssscccccddddddddddddddddddddddddttduuuuuuuvvvvvvvvvvvvvvvvvvvvvvvvfvvvvfvfvvv
qqqaqqqqqqqqqqqaqaabaaaaabbrrrrrrrrrrsrsssrsssscsssssscccccddddddddddddddddddddddtttttuuuuuuuuvvvvvvvvvvvvvvvvvvvvvvvvvvvvvfvvvv
qqaaqqqqqqqqqqqqaaaaaaaabbbbbrrrrrrrsrsrsssssscscssssccccccddddddddddddddddddddttttttttuuutuuvvuvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
qqaaaqaqqqqqqqqqqqaaaabbbbbbbbrbrrrrrsrsssssssscsssssscccccdddddddddddddddddddttttttttttttutuvuvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
qqaaaaaaqqqqqqqqqqqaaaabbbbbbbbrbrrrrrrsrsssssssssssscssssdtdddtttdddddddddttdtttttttttttottutvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
qqqaqaaaaqqqqqqqqqraaabbbbbbbbbbbbrrrrsrsrsrsssssssssscssssttdtttttttdtdttttttttttttttttottttddvvvvvvvvvvevvvvvvvvvvvvvvvvvvvvvv
aqaaaqaaqqqqqqqqqqrrabbbobbbbbbbbbrrbsrsrrrsssssccssssssssttttttttttttttttttttttttttttttttttddddvvvvevvvevvvvvvvvvvvvvvvvvvvvvvv
qaaaaaaaqqqqqqqqqqrrbrbbbbbbbbbbbobbbrssbssssssccccsssssststtttttttttttttttttttttttttttttttddddeeveevvvvvvvvvvuovvvvvvvvvevvvvvv
aaqaaaaaaqbqqqqqqrqrrbrbbbbbbbbbbbbbbbsbssssssscccsssssssststtttttttttttttttttttttttttddttddddddeeeeevvvvvvvvvuuvvvvvvvvvvevvvvv
oqaqaaaaaabqqaqqrqrrrrrrrbbbbbbbbbbbbbbssssssssscssccsssssstttttttttttttttttttttttttttddddddddddeeeeeevuuvvuvuuvuvuvvvvvvveevevv
qaqaqaaaaaababarqrrrrrrrrrbrbbbbbbbbbbbsbsssssscsccsscsssssttttttttttttttttttttttttttdddddddddddeeeeuuuuuuuvuuuvvuvvvvvvvveevevu
qqqaaaaaaaaababqrrrrrrrrrrrbrbbbbbbbbbbbsbsssssscssccscssstttttttttttttttttttttdtdtddddddddddddeedeueuuuuuuuuuvuveveevvvvvevevev
qqqqaaaaaaaabbbbbrrrrrrrrrrrrbrbbbbbbbbbbsbssssssssoscssssdtttttttttttttdtdtdtdddddddddddddddddededeuuuuuuuuuuuveeeeeeeeveeeveuu

