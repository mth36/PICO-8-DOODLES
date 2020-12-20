pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
for i=0,7 do
	pal(i,i+8+128,1)
end

t=0
::★::

t+=0.01
st3=sin(t/3)
st5=sin(t/5)

for i=1,1700 do
	x,y=rnd(128),rnd(128)
	
	c=flr(
		     (x+sin(y/30+st5*5)*6*st3)/(24 * (st3-1.8)) 
		    +y/(48 * (st3-1.8))
		    +8*t
	  )
	c=c%8+8

	if rnd(1)<1.25*st3 then
		c-=8
	end
	
	circ(x,y,1,c)
end

flip() goto ★
__label__
ooooooooooooooooovvvvvvvvvvvvvvvvuuvuvuuuuuuuuuuuuuuuuttttttttttttttttttttstssssssssssssssssssrssrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqq
ooooooooooooooooovvvvvvvvvvvvvvvuvuuvuuuuuuuuuuuuuuuuttttttttttttttttttttstssssssssssssssssssrsrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqq
oooooooooooooovovovvvvvvvvvvvvvuvvuuuuuuuuuuuuuuuuuuttttutttttttttttttttstsssssssssssssssssssrrsrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqq
ooooooooooooooovovvvvvvvvvvvvvvvvuvuuuuuuuuuuuuuuuuttttututttttttttttttsstsstsssssssssssssssrssrsrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqq
ooooooooooooooovvvvvvvvvvvvvvvvvvvuuvuuuuuuuuuuuuuttttttutttttttttttsttststtsttssssssssssssssrssssrrrrrrrrrrrrrrrrrqqqqqqqqqqqqq
ooooooooooovooovvvvvvvvvvvuvvvvvvuvvuvuuuuuuuuuuuuuututtttttttttttttstttsttstttssssssssssrssssrssssrrrrrrrrrrrrrqrqqqqqqqqqqqqqq
ooooovovoovooooovvvvvvvvvvvvvvvuvvuvvuuuuuuuuuuuuuutututtuttttttttttttttttsttttssssssssssssssssrssrrrrrrrrrrrrrqrqqqqqqqqqqqqqqq
oooooovoovvooooovvovovuvvvvvvvuvvuvuuuvuuuuuuuuuuuuuuuttututtttttttttsttssttstssssssssssrssssrrssssrrrrrrrrrrrrrqqqqqqqqqqqqqqqq
ooooooooooovooovoovovvvvvvvvvvvvvvvuuvuvuuuuuuuuuuuututttuttttttttsttttttsttttsssssssssssssssrsrssrsrrrrrrrrrrrrrrqrqqrqqqqqqqqq
ooooooooooooovoovoovvvuvvvvvvvvvvvvvuuvuvvtuuuuuuutuututuuuutttttstttttttstttstssssssssssrssssrssssrsrrrrrrrrqrrrrrrrrqrqqqqqqqq
oooooooooooooooooooovvvvvvvvvvvvvvvvuuuvvtvuuuuuutuuuuuuuuututttttstttstssttttsssssssrsssrssssssssssrrrrrqrrrrrrrrrrrqrqrqqqqqqq
oooooooooooooooovoovovvvvvvvuvvvvvvuvvuvuvuuuuuuuuuuuuuuuutututttttttttststtttsssssrssrssrrssssrssrsrrrqrrrrrrrrqrqrrqqrqrqqqqqq
oooooooooooooooooooovvvvvvvuvuvuvvvvuuvvvuuuutuuuuuuuuuututtutttttttttststtttttsssssrsssssrssrrsrrsrrrrrrrrrrrrrrqrrrrqqrqqqqqqq
oooooooooooooooooooovvvvvvvvuvvvuvvvvuvvvvuutuuuuuuuuuuuuttttttttttttttsttttttsssssssrsssssssrrrrsrsrrrrrrrrrrrqrrrrrqqqqqqqqqqq
ooooooooooooooooooovvvvvvvvuvvvvvvvvuuuvvuuuuuuuuuutuuuuuutttttsttttttstttttttsssssssssssssssrsrsrsrrrrrqrrrrrrrqrqrqqqqqqqqqqqq
ooooovoooooooovooovvvvvvvuvvvvvvvuvuvuuuuuuuuuuuuuuuuutuuuutttttsttttstttttttttsssssssssssssssrsssrrrrrrrrrrrrrrqqrrqqqqqqqqqqqq
oooooovoooooovooooovvvvvvvvvvvvvvvvvuuuuuuuuuutuuuuuuutuuuuttttttttttttttsttttsssssssssssssssssssrrrrqrrrrrrrrrrrrrrqqqqqqqqqqqq
oooooooooooooovooovvvvvvvvvvvvvvvvvvuuuuuuuuutuuuuuuuuutuuttttttttttttttststssssssssssssssssssrsssrrrrrrrrrrrrrrrrrrqqqqqqqqqqqq
ooooooooovoovoovovvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuttsttttttttttttstststsssssssssssssssssrrsrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqq
oooovoooooooovoovvvvvvuvvvvvvvvvuvvuuuuuuuuuuuuuuuutuuttttttttttttttttstststssssssssssssssssssrrrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqq
oooooooooooovovvvvvvvvvvvvvvvvuuvuuuuuuuuuuuuuuuuututttttttttttttttttstssssssssssssssssrssssssrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqpp
ovoovoooooooovvvvvvvvvvvvvuvvuuuuuuuuuuutuuuuuuuututttttttttttttttttttstssssssssssssssssrssssrrrrrrrrrrrrqrrrrqrqqqqqqqqqqqqqqqp
ooovooovvvvovvvvvvvvvvvvvuvuuuuuuuuuuuutuuuuuuuuuttttttttttttttttttttttsssssssssssssssssrrssrrrrrrrrrrrrrrqrrqrqqqqqqqqqqqqqqqpq
oooooovovvvvvvvvvvvvvvvvvvuuuuuuuuuutuuuuuuuuuuutttttttttttttttttttsstsssssssssssssssssrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqp
oooooovvvvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuututtttttttttttttttttssssssssssssssssssrsrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqpqq
oooovvvvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuuuttttttttttttttttttssssssssssssssssssrrrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqpqqppp
ooovvvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuututttttttttttttttttttsssssssssssssssssssrrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqpqppppp
ooovvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuututtttttttttttttttttttsssssssssssssssssrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqpppqpp
ooovvvvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuttttttttttttttttttttsssssssssssssssssssrsrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqqqqpppppp
oovvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuuuuttttttttttttttttttttssssssssssssssssssssrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqqqqppppppp
vvvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuuuuuttttttttttttttttstsstssssssssssssssssssrsrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqppppppppp
vvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuuutututtttttttttttttttsssssssssssssssssssssssrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqppppppppppp
vvvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuutttutttttttttttttttttsssssssssssssssssssssrrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqpppppppppppp
vvvvvvvvvvvvvvvuuuuuuuuuuuuuuuuuuuuuuuttttttttttttttttttttssssssssssssssssssrsrsrrrrrrrrrrrrrrrrrqrrqrqqqqqqqqqqqqqpqpppqpqppppp
vvvvvvvvvvvvuvuvuvuuuuuuuuuuuuuuuutuuttutttttttttttttttttssstssssssssssssssssssrrrsrrrrrrrrrrrrrqrrrrqqqqqqqqqqqqqqqpqpqpqpppppp
vvvvvvvvvvvvvvvuvuvuuvuvuuuuuuuuuuutttutuuuttttttttttttttsstststsssssssssssssssrrsssrrrrrrrrrrrrrqrrrqqqqqqqqqqqqqqqqpqpqppppppp
vvvvvvvvvvvvvvvvuvuvuuvuuuuuuuuuuutttuuuuuuuttttttttttststsstttstsssssssssssssssssssrrrrrrrrrrqrqrrrqrqqqqqqqqqqqqqqpppqpppppppp
vvvovvvvvvvvvvvvuuvvuuuuuuuuuuuuututuuuuuuuttttttttststttststtttssssssssssssssssrssrrrrrrrrrrqrrrrqrrrrqqqqqqqqqqqqppqqppqpqpppp
ovovovvvvvvvvvvvvvvvvuvuvvutuuuuuuuuuuuuuuutttttttstttttttsstttssssssssssssrrrsrsrrrrrrrrrrrrrrqrrrrrrrqqqqqqqqqqqqpqqqqqpqqqppp
vovovvvvuvvvuvvvvvvvuvuvvvvuuutuuuuuuuutuuuutttttsttttttttttstssssssssssssrrrsssrsrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqpqpqqqqqqqqqpp
ovvvvvvvvvvvvuvuvvvuvuvvvvuuuutuuuuuuututuutttttttstttstttttttsssssssssssssrrsssssrrrrrrrrrrrrrrrrrqqqqrqqqqqqqqqqqpqppqqqqqqpqp
vovvvvvvvvvvvvvvvvuvuvvvvvvuuuttuuuuuuuttututttttttttttttttttstssssssssssssssrsssssrrrrrrrrrrrrrrrqqqqrqrqqqqqqqqqqqpqqqqqpqpqpp
ooovoovvvvvvvvvvvvvvvuuvvvuuuuuttuuuuuttttuttttststtttttttttstsssssssssssssrsssssssrrrrrrrrrrrrrrrrqqqqrqrqqqqqqqqqqqqqqqqqpqppp
ooooooovvvvvvvvvvvvvvvuvvvvtuuuuuuuuuuuttttttttttttttttttttttsttssssssrsssssrsssssssrrrrrrrrrrrrrrrrqrrqrqqqqqqqqqqqqqqqqqqppppp
ooooooovvvvvvuvvvvvvvvvvvvvuuuutuuuuuuuutututtttttttttttttttttttssssssssssssssrsrsssrrrrrrrrqrrrqrrrrqrrqrqqqqqqqqqqqqqqqqqppppp
oooooouvvuvvvvvvvvuvvvvvvvuuuututuuuuuuuututttttttttttststtttttssssrsssssssssrsrrrsrrrrrrrrrrrrqrqrqqrqrrqqqqqqqqqpqqqqqqqqppppp
vooovvvvvvvvvvvvvvvvuvvuuuuuuuutuuutuuuuuutttttttttttttsttttttsssssssssssssssssrsrrrrrrrrrrrrrrrqrrrrqrqqqqqqqqqqqqqpqqqqqqppppp
ovvvvvvvvvvvvvvvvvvuvuuuuuuuuutuuuuuuuuutuutttttttttttststtsssssssssssrsssssrsrsrsrrrrrrrrqrrrrrrrrrrqqqqqqqqqqqqqqqqpqqqqpppppp
vvvvvvvvvvvuvvvvvvuvuuuuuuuuuuuuuuuuuuututttttttttttsttttssssssssssssssssssrsrsrsrrrrrrrrrrrrrrrqrrrqrqqqqqqqqqqpqqqqqppqppppppp
vvvvvuvvvvvvuvvuvvvuuuuuuuuuuuuuuuuutuuttttttttttttttttttssssrssssssssssssssssrsrrrrrrrrrrrrrrrqrrqrrqqqqqqqqqqqqpqqqppppppppppp
vvvvvvvvvvvvvuuvuuuuuuuuuuuuuuuuuuututtttttttttttttttttttssssssssssssssrsssssssrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqppqppppppp
vvvvvvvvvvvvvuvuuuuuuuuuuuuuuuuuuuuttuttttttttttttttsttsstsssssssssssssssssssrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqpqqpppppppp
vvvvvvvvvvuvuvuvuuuuuuuuuuuuuuuuuututttttttttttttttttsstssssssssssssssssssrsrrrrrrrrrrrrrrrrrqrqrrqqqqqqqqqqqqqqqqqqpqpppppppppp
vvvvvvvvvvvuuuuuuuuuuuuuutuuuuutuutttttttttttttttttsstsssssssssssssssssssrrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqqqppppppppppppppp
vvvvvvvvvvuvuuuuuuuuuuuuuuuuuttutttttttttttttttttttststssssssssssssssssssrrrrrrrrrrrrrrrrqqrrqqqqqqqqqqqqqqqpqqppppppppppppppppp
vvvvvvvvvuvuuuuuuuuuuuuuuuuututtttttttttttttttttttttstssssssssssssrsssrsrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqpqqpppqppppppppppppppppp
vvvvvvvvuvuuuuuuuuuuuuuuuuututtttttttttttttttttsttsssssssssssssssssssrrrsrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqppppppqpppppppppppppo
vvvvvvvvuuuuuuuuuuuuuuuuuuuututtttttttttttttttstssssssssssssssssssrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqppppqqqppppppppppppppo
vvvvvvuuuuuuuuuuuuuuuuuutuutttttttttttttttttttsstssssssssssssssssrrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqppqpqqpppppppppppppoo
vvvvuuuuuuuuuuuuuuuuuuuuuuuttttttttttttttttttssssssssssssssssssssrrrrrrrrrrrrrrrrrrrrqqrqqqqqqqqqqqqqqqqqqppqppppppppppppppppooo
vvvuuuuuuuuuuuuuuuuuuuuuuuutttttttttttttttttttssssssssssssssssssrsrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqpppqppppppppppppppppopoo
uvvuuuuuuuuuuuuuuuuuuuuututttttttttttttttstssssssssssssssssssssssrsrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqqqppppppppppppppppppooo
vvvvuuuuuuuuuuuuuuuuuuuttttuttttttttttttttsssssssssssssssssssssrssrrrrrrrrrrrrrrrrqqrqqqqqqqqqqqqqqqqqqqqpqpppppppppppppppppopoo
vvvvuuuuuuuuuuuuuuuuututttuttttttttttttttsssssssssssssssssssssssrsrrrrrrrrrrrrrrrqqrrrqqqqqqqqqqqqqqqqqppqpppppppppppppppppopopo
uvvuuuvuuuuuuuuuuuuuuutttututtttttttttstssttssssssssssssssssssrssrsrrrrrrrrrrrrrrrqrrrrqqqqqqqqqqqqqqqpqpqppppppppppppppppppoppo
vuuuuvuvuuuuuuuuuuuuuuutttuttttttttttttsttttttsttssssssssssssrsrssrrrrrrrrrrrrrrrrrrrrqqrqqqqqqqqqqqqpqpqpqpppppppppppppppppopop
vvuuvuvuuuuuuuuuuuuuuututtttttttttttttsttsttttttttssssssrsssssrssrrrrsrrrrrrrrrqrqrrrqqrqrqqqqqqqqqqqqpqpqppppppppppppppoppooopo
vvvvuvvvuuuuuuuuuuuuututtuttutttttttttttttttttsttstssssrssssrsssssrrsrsrrrrrrrrrqrqrqqrqrqqqqqqqqqqqqpqpqpppqppppppppppppoppopop
vvuvvvvvuvuuuuuuutuutuututuututttttttttttssttstssttsssssrsssssssssrrrsrrrrrrrrrrrqrqqrqrrqqqqqqqqqqqppqqpqpqpqpppppppppppppppopp
vvvvuvvuvuvuuuuutuuuuuuututtuuutttttttttttssstttststsssrsssssssrsrsrrrrrrrrrrrrrqrrqrqrrrrqqqqqqqqqqpqqqqpppqppppppppppppopppppo
vuvuvvuvuvuuututuuuuuuuuuuttuuuttttttttttststttttttsssssssssssssrsrrrrrrrrrrrrrrqrrrqrqrrqrqqqqqqqqppqqqpppqpqpppppppppppppppppp
vvuvvuvvvvvuuutuuuuuuuuuuuutuutttttttttsststttttttttssssssssrssrrrsrsrrrrrrrrrrrrrrrrqrqrrqqqqqqqqpqqpqpqpqpqppppppppppppppppppo
vvvvvvvuvvuuuuuuuuuuuuuuuuuututttttttttststttttttttssssssssssssrrsssrsrrrrrrqrrrqrrrrqqrqqqqqqqqqqqqqqpqpqpqppppppppppppppppopoo
vvvvvvvvvvuuuuuuuuutuuttuutuutttttttttttststttsttsssssrssssrsssssssssrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqpppqpqqppppppppppppppoppopp
vvvvvvuvuvuuuuuuuuuutututuuutttttttttttsttttttssssssssssssssrssssssrrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqpqpqqqqpppppppppppoppppppp
vvvuvvuuvuuuuuuuuuuuuttuututttttttttttttttttttsssssssssssssssssssssrrrrrrrrrrrrrrrrrrrrrqrqqqpqqqqqqqpqqqqqqqppppppppppppppppppp
vvuvvvvuuuuuuuuutuuutuuuuuuttttttttttttttttttsssssssssssssssssssssrrrrrrrrrrrrrrrrrrrrqqrqqqqqqqqpqqqqqqqqqqpppppppppopppppppppp
vvvvvvuuuuuuuuuuutututuutuuuttttttttttsttttttsssssssssssssssrsssrrrrrrrrrrrrrrqrrrrrqqqqqqqqqqqqqqqqpqqqpqpppppppppppppppppopooo
vvvuuuuuuuuuuuuuuuuutuuuututttttttttttttttttssssssssssssrssssssrrrrrrrrrrrrrrrrqrrrrrqqqqqqqqqqqqqqqqqqqqpqpppppppppppppppopoooo
vvuvuuuuuuuuuuuuuuuuuuuututtttttttttttttttttssssssssssssssssssssrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqpqpppppppppppppppooooooo
uuvuuuuuuuuuuuuuuuuuuuutttttttttststttttsttssssssssssssssssssrsrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqpqppppppppppppppppopoooooo
uuuuuuuuuuuuuuuuuuutututtttttttttttttttttssssssssssssssssssrrrrrrrrrrrrrrrrrrrqrqrqqqqqqqqqqqqqqqqqppppppppppppppppppppppooooooo
uuuuuuuuuuuuuuutuutttuttttttttttttttttttssssssssssssssssssrrrrrrrrrrrrrrrrrrqrrqrqqqqqqqqqqqqqqqqqppqpppppppppppppppppopppoooooo
uuuuuuuuuuuttuuututtttttttttttttttttstsssssssssssssssssssssrrrrrrrrrrrrrrrrqrqrrqqqqqqqqqqqqqqqqqppppppppppppppppppppoooppoooooo
uuuuuuuuuuuuuuuuuttttttttttttttttttstsssssssssssssssssrsssrrrrrrrrrrrrrrrrqrqrqrqqqqqqqqqqqqqqqqppppppppppppppppppoopooooooooooo
uuuuuuuuuuuuuuuututtttttttttttttttttsssssssssssssssssssrsrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqqqqqqppppppppppppppppoooopoooooooooo
uuuuuuuuuuuuutttttttttttttttsttttttsssssssssssssssssrsrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqqqpppppppppppppppppppoooopooooooooooo
uuuuuuuuuuuutttttttttttttttttttttsssssssssssssssssssrrrrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqpqpppppppppppppppppppooooooooooooooooo
uuuuuuuuuuututtttttttttttttttttssssssssssssssssssssrrrrrrrrrrrrrrrrrrrrrqrqqqqqqqqqqqqqqqqqppppppppppppppppppppooooooooooooooooo
uuuuuuuuuuutttttttttttttttttttssssssssssssssssssssssrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqpqpppppppppppppppppppooooooooooooooooo
uuuuuuutuuuuttttttttttttttttttssssssssssssssssssssssrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqpqpppppppppppppppppppooooopoooooooooooo
uuuuuuuuuuututtttttttttttttttstsssssssssssssssssssrsrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqppppppppppppppppppppppooooooooooooooooo
uuuuuuuuuututtttttttttttttttstssssssssssssssssrsrrsrrrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqpppppppppppppppppppopopoooooooooooooooo
uuuuuuuutuuttttttttttttttttttssssssssssssssssssrsrrrsrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqpppppppppppppppppooopoooooooooooooooov
uuuuuuutuuuuttttttttttttttttttssssssssssssssssrsrsrsrsrrrrrrrrrrrrrqrqrqrqqqqqqqqqqqqqqqqqqpppppppppppppppppoppooooooooooooooovo
uuuuuuuutuutttttttttttsstttttsssssssssssssssrrssssrrsrrrrrrrrrrrrrqrrrqrqqqqqqqqqqqqpqqqqqpqqpppppppppppppppppppooooooooooooovvv
utuuuuuuuutuutttttttststttttttsstssssssssssssssrsrssrsrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqpqqqqqqpqpppppppppppopppppoooooooooooooovvo
tuutuuuuuuuututtttttttttttttttststssssssssssssssrsrssrrrrrrrrrrrrrrrrrqqrqqqqqqqqqqqqqqqqqqqqppppppppppppopppoopooooooooooooooov
uttuuuuuuuuuuttttttttttttttttttttssssssssssssssssrsssrrrrrrrrqrrrrrqrrrrqrrqqqqqqqqqqqqqpqqqpqppppppppppoppppopopooooooooooovovo
uututuuuuuuuututtttttttttttsttttttsssssssssssssssssssrrrrrrrrrqrrrrrrrrrrrrrqqqqqqpqqpqqppqpqpqpppppppppppppopoppoooooooooooovov
uuuuutuuttuutututtttttttttttttsttsssssssssssssssssrsrrrrrrrrrqrqrrrqrrrqrrrqqqqqqqqpqqqqqpppqqpppppppppppppppoppoppooooooooooovo
uuuuuttututuuuuttttttttttttttttsttsssssssssssssssrsrrrrrrrrrqrqrrrrrqrrrqrqqqqqqqqqqqpqqqqqqpqpppppppppppppppoooppopooooooooooov
utuuuuutututuuutttttttsttttststttttssssssssrsssssssrrsrrrrrrrrrqrrrqrrrrrqrqqqqqqqqqqqpqqqqqqqpppppppppopppppooppppooooooooooovo
tuuuuuuuuutttuttttttstttttttstttttssssssssssssssssrssrsrrrrrrqrrrrrrqrrrrrqqqqqqqqqqqpqpqqqqqpqpppppppppppppppopppoooooooooooooo
tuuuuuuuuuuttttttttttttttttttttttssssssssssssssssssrssrrrrrrrrrrrrrrrqrrrrqqqqqqqqqqqqpqqqqqqqpppppppppppppppopppppooooooooooooo
utuuuutuuuuttttttttttttttttttststsrssrssssssssrrsrssrsrrrrrrrqrrqrrrrrrrrqrqqqqqqqqqqqqpqqqqqqppppppppppppppppopppoooooooooooooo
uuuuuutuuututtttttttstststttttststssssrssssssrrrrsrrsrrrrrrrqqqqrqrrrrrqqrqqqqqqqqqpqqqqpqpqqppppppppppppppppppopooooooooooooooo
uuuuutttututttttttttttttstttsttssssssssssssssrsrsrsrrrrrqrrrqrrrrrrqrrqqqqqqqqqqqqqqpqqqqpqppppppppppppppppppoppoooooooooooooooo
uuuttuuttttttttttttttttttttststsssssssssssssssssrsrrrrrqrqrqrrrrrrrrqrqqqqqqqqqqqqqqqpqqqqppppppppppppppppppopooooooooooooooovov
uuutuuuuttttttttttttttttttttttssssssssssssssrsssrrrrrrrrqrqrrrrrrrrrrqqqqqqqqqqqqqqqpqqqqqqppppppppppppppppopooooooooooooooooooo
uuuuuuuttttttttttttttttttsttttsssssssssssssssrsrrrrrrrrrrqrrrrrrrrqrqqqqqqqqqqpqqqqqqppqqqppppppppppppppppopoooooooooooooooovovo
uuutuuttttttttttttttttttstsstsssssssssssrsssssrrrrrrrrrrrrrrrrrrrqqqrqqqqqqqqqqqqqqqqppppppppppppppppppppppopoooooooooooooooovov
tuuuttttttsttttttttttttstssssssssssssssssrsssrrrrrrrrrrrrrrrrrqrrqqqqqqqqqqqqqqqqqqppqppppppppppppppppppppppoooooooooooooooooovv
ttuttttttttttttttttttttsssssssssssssssssrsrrrrrrrrrrrrrrrrrrrqrqrqqqqqqqqqqqqqqqqqpppppppppppppppppppppoppooooooooooooooovvoovvv
tttttttttttttttttttststtsssssssssssssssssrrrrrrrrrrrrrrrrrrrrrqrqqqqqqqqpqqqqqqppqppppppppppppppppppopopopoooooooooooovovvvvvvvv
ttttttttttttttttttttstssssssssssssssssssrrrrrrrrrrrrrrrrrrqqrqqrqqqqqqqqqqqqqqpppppppppppppppppppppopoooooooooooooooovovovvvvvvv
tttttttttttttttttttsssssssssssssssssssrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqqppppppppppppppppppopooopooooooooooooooovovvvvovvv
tttttttttttttttttstssssssssssssssssssrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqpppppppppppppppppppooooooooooooooooooovooovvvvvvvvv
stttttttttttttttsssssssssssssssssssssrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqpppppppppppppppppppppoooooooooooooooooovovoovvvvvvvvv
ttttttttttttttttssssssssssssssssssssrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqppppppppppppppppppppppooooooooooooooooooovovvvvvvvvvvv
ttttsttttttttttssssssssssssssssssssssrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqpppppppppppppppppppoooopooooooooooooooooovvvvvvvvvvvv
tttttttttttttsttsssssssssssssssssssrrrrrrrrrrrrrrrrrrrqqqqqqqqqqqqqqqqqqqqqqppppppppppppppppppoooooooooooooooooovooovvvvvvvvvvvv
tttttttttststttstsssssssssssssssssrsrrrrrrrrrrrrrrrrrrqqrqqqqqqqqqqqqqqqqqqpppppppppppppppppppooopooooooooooooooovovovvvvvvvvvvv
ttttttttttstststsssssssssssssssssssrssrrrrrrrrrrrrrrrqqrrrqqqqqqqqqqqqqqqqqpppppppppppppppppppoooooooooooooooooovovoovvovvvvvvvv
tttttttttststsstsssssssssssssssssssssrsrrrrrrrrrrrrqqqqrrrqqqqqqqqqqqqqqqqqqpppppppppppppppppppopoooooooooooooooovoooovvvvvvvvvv
tttttttttsststtstsssssssssssssssssrsrsrrrrrrrrrrrrrrrqqqrqrqqqqqqqqqqqqqqqqpqpppppppppppppppppopopooooooooooooooovvoovvvvvvvvvvv
ttttttttttsttssttssssssssssssssssssrsrsrrrrrrrrrrrrrrrqrqrqrqqqqqqqqqqqqqqpqpqppppppppppppppppoopoooooooooooooooooovvvvvvvvvvvvv
stttttttsstsssststsssssssssssssssssrrsrrrrrrrrrrrrrrrqrqrqrqqqqqqqqqqqqqqpqpqpppppppppppppoopoooooooooooooooooooooovvvvvvvvvvvvv

