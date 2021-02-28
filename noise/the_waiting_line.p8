pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
t=0
█=1000
function sqr(a) return a*a end
cls()
::♥::
t+=0.0333

for i=1,1500 do
	local y=rnd(128)-64
	local x=rnd(128)-64

	local fill = nil
	
	local c=x/16+sin((y)/200)
	c=c+abs(sin(t/16))*flr(x/60+y/64)
	c=c+sin(x/128)
		+ (sqrt((x*1.1)*(x*1.1)+(y)*(y))>60 and 1 or 0)
	c=c+t
	
	c=c%8+8
	c=c%2

	local diff = c - flr(c)
	c = flr(c) * 7
	if diff<0.2 then
		fill = 0b1111000011110000
		c = 0x67
	end
	
	fillp(fill)
	circ(x+64,y+64,1,c)
	fillp()
end

flip() goto ♥
__label__
06676700000000676777777766600000000000000006666677776777777777770066660006000000000000000006006777777777777660000000076777070000
00777070000007777777777777770000000000000070777777777777777777700000070000000000000000000070777777777777777770000000077770700000
00776600000006676777777777660000000000000606666777777777777706760000000000000000000000000006066777777777777600000000666606000000
07777770000007777777777777700000000000000077777777777777777070070700000000000000000000000007770777777777777000000000770070000000
77776600000006667777777676060000000000000666666777777777770600606000000600000000000000000066666667777777777606000006067700000000
77777000000007777777777770700000000000077777777777777777707077007070000000007000000000000077707777777777777070000000707777000000
77776000000006767777777766060000000000606666666777777777770660000006000000000000000000000006660777777777777600000000076606000000
77777700000007777777777777700000000000077777777777777777707700000000000000000000000000000077777777777777777700000000777770000007
77666600000006777777777776060000000000066666667777777777060660006006000000000000000000000066666777777777776000000007776606700060
77777700000000777777777770700000000000007777777777777777707707000070000000000000000000000007777777777777777700000007777070000007
77766600000000777777777666000000000000000666667777777676666660000000000000006000000000000006666777777777776600000777777600000000
77777000000000777777777777700000000000007777777777777777770777000000000000000000000000000000777777777777777700007077777700000000
77770000000000677777777766600000000000066666676777766666706000000000000000000000000000000000067777777777776000600777767600000000
77770000000070777777777777000000000000007777777777777777770000000070000000000000000000000000007777777777770000777777777070000000
77776000000606677777777660000000000000000666677776766666066000000000000000000000000000000000067777777777766007077777777700000000
77777000000077777777777777000000000000007777777777777770700700070000000000000000000000000070007777777777770700777777777700000000
77760600000066677777777760000000000000006666677776666667000000600000000000000000000000000606076777777777766066667777767660000000
77777000000007777777777777000000000000070777777777777777000000070000000000000000000000000077777777777777770707777777777770000000
77777060000066677777777766600000000000006667677776666767000000600000000000000000000000000006666677777777760060677777777600000000
77777700000707777777777777770000000000000777777777777777000070070000000007000000000000000070777777777777707000777777777770000000
77777060000066667777777766660000000000006066677766666666606006600000000000000000000000000006667777777777070006667777776660000000
77777707000070777777777777770000000000070707777777777777770770000000007007000000000000000007777777777770700007777777777777000000
77777700000006067777777776600000000000006077777766766666666600000060000000000000000000000006677777777707000000767777777760000000
77777000000000777777777777700000000000000707777777777777777770000700000000000000000000000077777777777000000007777777777777000000
77776600000000666777777766600000000000007777777766676667666666060000000000000000000000000006667077777000000006666777776766600000
77777700000000777777777777700000000000007777777777777777777777707000000000000000000000000007777777707000000007770777777777700000
77776660000006667777777776060000000000077777777777766666666666660000000000000000000000000000667777070000000000666777777676600000
77777770000000777777777777700000000000777777777777777777777777777700000000000000000000000007077777700000000007077777777777700000
77777670000000006777777776660000000007777777777777766666666666666606000000000000000000000000606767660000000060667777777766600000
77777700000000077777777777700000000077777777777777777777777777777770700000000000000000000000070777770000000007077777777777770000
77777060000000067777777776660000000007777777777777776766666766666766600000000000000000000000606607766000000000607677777766600000
77777777000000777777777777707000007077777777777777777777777777777700070000000000000000000000077777770700000000077777777777000000
77777676000000067777777776660000070777777777777777777766767676666000006666000000000000000000067776766000000000666777777767600000
77777777000000070777777777777700707777777777777777777777777777777700777077070000000000000007077777770070000000777777777777000000
77777660000000006777777777766006676777777777777777777777777666666766660600600000000000000007777777666600000000067777777766000600
77777700000000077777777777770707777777777777777777777777777777777777777070070000000000000070777777777000000000077777777777700000
77777770000000006777777777666060667677777777777777777777777667676666666600000000000000000707777777767000000000000677777776000600
77777777000000007777777777770007777777777777777777777777777777777777777770000000000000000777777777777000000000007007777777700000
77777776600000006677777777700006666677777777777777777777777676766666666666006000000000000777777777766700000000060677777776600000
77777777700000077777777777070007777777777777777777777777777777777777777777770700000000707777777777777770000000007777777777700000
77777666000000066667777770000060666777777777777777777777777777776776766666606660000006077777767777776777000000000667777776760000
77777777700000007077777707000007077777777777777777777777777777777777777777777770000070777777777777777777070000000777777777777000
77777776600000000667777070000000066666777777777777777777777777777776667676676666000066076777777777777770600000000077777777760600
77777777707000000077770700000000077777077777777777777777777777777777777777777777770777777777777777777777070000000007777777777000
67777767660000000067667000000000000666777776777777777777777777777777677676666666600666676777777777777776600000000006767777676000
77777777770000000707777700000000000077777777777777777777777777777777777777777777007070707777777777777777770000000007777777770000
77777777760000000067666000000000000006766777677777777777777777777777777777676660000600006777777777777776666000000070777777666000
77777777777000000007777700000000000077707777777777777777777777777777777777777770000000770777777777777777777000000007777777777700
07777777760000000777766600000000000066676777777777777777777777777777777777777600000006066667777777777776676000000006777777766660
77777777777000000077777700000000000007777777777777777777777777777777777777777700000000700777777777777777770700000077777777777070
67777777766000000777776700000000000000666777777777777777777777777777777777777000000000006667777777777776666000000006777777770600
07777777777700007777777707000000000000077777777777777777777777777777777777770000000000077770077777777777777700000000777777777000
66777777766660077777777060000000000000606767777777777777777777777777777777070000000000066606677777777776666700000000666777777660
77777777777700777777777707700000000000070777777777777777777777777777777770700000000000007070777777777777777000000000077777777777
66667777776606677777777766660000000000006060607777777777777777777777777700000000000000000006076777777776666000000000667777777676
07777777777777777777777777700000000000000707077777777777777777777777777000000000000000000070777777777777777000000007777777777777
06066777777666667777777766000000000000000060676777777777677777777777777000000000000000000606060777777777767600000000667777777776
00777777777077777777777777000000000000000000777777777777777777777777777000000000000000000070707777777777777777000000000777777777
00667777070006067777777767606000000000000006066667677777777777777777770000000000000000000006066067777777777670600000000667777777
00007770000000777777777777770000000000000000777777777777777777777777770000000007000000000000777777777777777777000000000777777770
00006770000006666777777777760000600000000006066660676777777777777777660000000000000000000000666666677777777666600000000077777606
00007777000000777777777777777000000000000000700007777777777777777777707000000000000000000000077770777777777777070000007007777070
00007776000000006777777777760606000000000000000066676677777777777766660600000000000000000000060606777777777776000000060677770000
00007777000000000777777777777070700000000000000077777770777777777777777770770000070000000000007077777777777770700000007777777000
00077760600000000777777777777666000000000000000006666660676677767666676666677060600000000000000606777777777777600000006077770600
00777777070000000077777777777777700000000000000000777777077777777777777777777707000000000000000077777777777777770000000707777000
07777777660000000076777777777766000000000000000006066666666677767667776666767660660000000000000066677777777776660000000067676000
77777777777000000077777777777777000000000000000000707777077077777777777777777707770000000000000007777777777777777000000077700700
77777776666600000006677777777770000000000000000000000666606777777777777767667667666000000000000060677777777777666000000077070000
77777777770000000077777777777777000000000000000000000070077777777777777777777777777700000000000007077777777777777700007777707000
67777776707000000066777777777766000000000000000000000000007777777777777776667767676060000000000000067677777777766060077777760606
77777777770000000777777777777777707700000000000000000000777777777777777777777777777700000000000000007777777777770700777777777070
77777777760000000066767777777776666666700000000000000000777777777777777777777777676666000000000000000767777777676070777777766600
77777777777000000070777777777777777770070000000000000007777777777777777777777777777777700000000000000777777777777707077777777700
06777777766000000006077777777777766660000000600000000077777777777777777777777767666676770000000000000067777777776060777777776606
70777777777700000000077777777777777707070000000000000777777777777777777777777777777777770000000000000770777777777700777777777770
07777777767600000000667777777777666660600000000000007777777777777777777677777777776667660000000000006066677777770006067777776766
70777777777000000000077777777777777700000000000000077777777777777777777777777777777777777770000000000707777777770070777777777700
06667777767600000000007777777777777600000000000000777777777777777777777777777777777776660660000000000060677777706006066777777000
07777777777700000000077777777777777770700000000007077777777777777777777777777777777777707070000000000007077777070700777777777700
00667777777760000000060777777777777666060600000000777777776777777777777777777777777777660666006000000066607767006000066776777777
00077777777700000000007777777777777777700070000077777777777777777777777777777777777777777777707700000077777777000000777777777777
00007777677760000000066666777777777677600060006606666777777777777777777777777777777777776660066070000006077660000000066777777777
00007777777770000000007777777777777777770777077777777777777777777777777777777777777777777700000700000000707777000000077777777777
00006677777770006000060666777777777777666666666667777777777777777767777777777777777777776760000060000000777676000000066677777777
00077777777777000000007007777777777777777770077777777777777777777777777777777777777777777777700700000007077777000000007777777777
00006777777760600000000067677777777777776606000066766707777777777777677677777777777777776666600000000077777666606000060607777777
00077777777777700000000007777777777777777770007077777777777777777777777777777777777777777777700000000777777777070700007077777777
00066677777776666000000607777777777777766600060606666677767777777776776777777777777777777766660000007777777776600000000667777777
00007777777777770000007077777777777777777000007070700777777777777777777777777777777777777777770700070777777777700000000777777777
00006677777776666000000666677777777777770000000000060666666777777777777777777777777777777767666000707677777766060600000676777777
00077777777777770000000007777777777777700000000000777777777777777777777777777777777777777777777070777777777777707070000077777777
00006667777776666000000000677777777777000000000000066666666676766777677776777777777777777767670606667767777777760600000006777777
00000777777777770000000000077777777770000000000000007077777777777777777777777777777777777777777070777777777777777000000077777777
00000077777777660000000006767777777700000000000000066606666676676777777777777777777777777777666606067777777776767000000006777777
00000777777777770000000070777077770000000000000000077770770077077777777777777777777777777777777000700777777777770700000077777777
00000077777777666000000006067777767000000000000000006060606666666777777777777777777777777777600006066677777776666000000066677777
00000777777777777000000000777777770700000000000000000707077777777777777777777777777777777777000000777777777777777070000077777777
00000067777777666606000000066776766060000000000000006060666666666660677776777777777777777777000000666767777777666600000666777777
00000077777777777770000000077777770000000000000000000707077777777777077777777777777777777700000000077770777777777700000777777777
00000607777777767606000000666676760000000000000000000000606066666666667777777777777777777070000000066767777776767600000066677777
00000000777777777070000000777777777000000000000000000000077700777777777777777777777777770700000000077777777777777770000007707777
00000007777777777600000000767776666000000000000000000000066666666666606767777777777777700000000000606067777777766000000066677777
00000077777777777070000007777777770000000000000000000000007777777007077777777777777777700000000000070077777777777000000777777777
00000006777777766606000007777776700000000000000000000000060666666060666767766767777770000000000000000677777777760000000066767777
00000077777777777700000007777777070070000000000000000000077777770707077777777777777707000000000000077777777777777000000077777777
00000066777777766000000067777676600000700000000000000000666666606660660667777677777670000006000000606767777777766600000606767777
00000007777777777700000707777777770007000000000000000000077007077777007077777777777777000000000000077777777777777700000070777777
00000006677777766000007777777776660000000000000000000000000006666606666660767777676660000000000000006667677777766760000006777777
00000077777777777000707777777777777000000000000000000000000000777777777777777777777770000770000000077777777777777700000000777777
00000606677777770606067777777776766600000000000000000000000006666066666666777777676766000000000000666667777777767000000006677777
00000077777777777070777777777777777770700000000000000000000070777777777777777777777770700000000000077707777777777700000000777077
00000066777777777660767777777777766660000000000000000000000606060666606076776777666606000000000000060666777777776060000000077777
00000077777777777770777777777777777700000000000000000000000070707070770777007777777777000000000000007770777777770700000000777777
60000007677777770060066777777777766600000000000000000000000060660606666666677777767666000000000000000666777777777000000006667777
00000007777777700777077777777777777700000000000000000000000707070077777777777777777777700000070000000777777777777070000077777777
00000006777777000666677777777776666060000000000000000000000060600060666666077777777666600000600000000666777777766606000606777777
00000007777770700077777777777777777000000000000000000000000000000707777700777777777777000070000000007077777777777777000070077777
00000066777770000006677777777776660600000000000000000000000000066066066067777776766666000606000000060676777777767600000000777777
00000077777700000077777777777777777070000000000000000000000000777777707777777777777777707000000000007077777777777070000000077777
00000006076070000606677777777776666000000000000000000000000006666066667677776766666660666000000000060767767777766600000000666777
00000007777700000070777777777777770700000000000000000000000007777777777777777777777777000000000000007077777777777000000007777777
00000060666060000606667677777777666000000000000000000000600066666666666777776777666660000000000000000777777777777000000000767777
00000707770700000077777777777777777707000000000000000007070707707770777777777777777777700007000000000777777777777700000007777777
00000066606000000000667777777776767600600600000000000006600066660676777777776767666667600060000000000676777777666600000066767777
00000077770700000007077777777777777000000000000000000070700777777777777777777777777707000707000000000777777777777700000777777777
00000777766060000067677777777776766000000000000000000006000666666677777777666667676000000060000000006677777777776600000066670070
00000777777700000077777777777777777707000000000000000000000000770777777777777777777000707700000000000777777777777700000007707007

