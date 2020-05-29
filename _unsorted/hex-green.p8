pico-8 cartridge // http://www.pico-8.com
version 18
__lua__

function tan(a)
	return -sin(a)/cos(a)
end

-- a function that makes hexes
-- with same width and origin
function hex_maker(cx,cy,w)
	return function(gx,gy,h,c)
		hex(cx,cy,gx,gy,w,h,c)
	end
end

--cx,cy origin
--gx,gy loc of hex in a grid
--w,h   width, height
--c     color
function hex(cx,cy,gx,gy,w,h,c)
 h2=(w/2)*tan((1/6)/2)
 
 x=cx+w/2*(gx-gy)
 y=flr(cy+h2*(gy+gx))
 y2=flr(y-h+1)--upper y

	--box
 rectfill(x,y,x+w-1,y-h+1,c)
 --box shadow
 rectfill(x,y,x+w/2-1,y-h+2,c-8)
 
 --shape shadow near top
 for i=1,3 do
 	line(x+i,y2,x+w/2,y2+h2-i,c)
 end
 pset(x+w/2-1,y-h+2,c)

	--fill in areas not in box
	levels=flr(w/4)
 for i=1,levels do
  line(x+i*2,y+i,(x+w-1)-i*2,y+i,c)
  line(x+i*2,flr(y2-i),(x+w-1)-i*2,flr(y2-i),c)
 end
 
 
 --add shadow near bottom
 for i=0,3 do
 	line(x+1,y-i,x+w/2-1,y+h2-i-1,c-8)
 end
end

-->8
⧗=0
t=0
dt=1/30

p={
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
	1,
	3+128,
	3,
	11+128,
	11,
	10+128,
	10,
	7+128
}
for i=1,#p do
	pal(i,p[i],1)
end

hexx=hex_maker(55,60,18)

rectfill(0,0,128,128,5)
::♥::
⧗+=dt
t+=dt

for i=1,500 do
	x,y=rnd(128),rnd(128)
	xa=x-64
	ya=y-64

	c=sin(y/147-t/4)*x/64
	 *cos(x/64 -t/2)*y/128
	 +(-x/32+y/32)--bars
	 
	c=flr(c%2)==0 and 5 or 13

	circ(x,y,1,c)
end

for x=0,6 do
	for y=0,6 do
		h=(sin(x/36+(y+⧗)/12+⧗/2)+2)*12
		c=(x/1.02+y/8+⧗/5)*8
		c=c%8+8
		
		hexx(x,y,h,c)
	end
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
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888777777888eeeeee888888888888888888888888888888888888888888888888888888888888888ff8ff8888228822888222822888888822888888228888
8888778887788ee88eee88888888888888888888888888888888888888888888888888888888888888ff888ff888222222888222822888882282888888222888
888777878778eeee8eee88888e88888888888888888888888888888888888888888888888888888888ff888ff888282282888222888888228882888888288888
888777878778eeee8eee8888eee8888888888888888888888888888888888888888888888888888888ff888ff888222222888888222888228882888822288888
888777878778eeee8eee88888e88888888888888888888888888888888888888888888888888888888ff888ff888822228888228222888882282888222288888
888777888778eee888ee888888888888888888888888888888888888888888888888888888888888888ff8ff8888828828888228222888888822888222888888
888777777778eeeeeeee888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66556555655565556655656566666555688886666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
65666566656565656566656566566665688886666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
65556556655565566566655566666665688886666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66656566656565656566656566566665688886666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
65566555656565656655656566666665688886666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666616666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666171666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
1111111111111ee11e1e1e1e11111177111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111e111e1e1e1e11111177711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1111111111111eee1e1e1eee11111177771111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111177111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1ee11ee1111111111111711111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111ee11e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e111e1e1e1e111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111eee1e1e1eee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1ee11ee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111ee11e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1e1e1eee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111ddd1ddd1dd11dd11ddd1ddd111111dd11dd1ddd1dd111dd1111111111111111111111111111111111111111111111111111111111111111
11111111111111111d1d1d111d1d1d1d1d111d1d11111d111d111d1d1d1d1d111111111111111111111111111111111111111111111111111111111111111111
11111ddd1ddd11111dd11dd11d1d1d1d1dd11dd111111ddd1d111ddd1d1d1ddd1111111111111111111111111111111111111111111111111111111111111111
11111111111111111d1d1d111d1d1d1d1d111d1d1111111d1d111d1d1d1d111d1111111111111111111111111111111111111111111111111111111111111111
11111111111111111d1d1ddd1d1d1ddd1ddd1d1d11111dd111dd1d1d1d1d1dd11111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee11ee1eee1111161611111616166111111616166611111ee111ee11111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111161617771616116111111616111611111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111
11111ee11e1e1ee11111166611111666116111111666166611111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111617771116116111711116161111111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111
11111e111ee11e1e1111166611111666166617111666166611111eee1ee111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e11111111661616166111111bbb1b111bbb11711bbb1bbb1b1b11711ccc11111616166117711616117711711171111111111111
111111111e111e1e1e111e1e1e11111116111616116117771b111b111b1b17111bbb1b1b1b1b17111c1c11111616116117111616111711171117111111111111
111111111e111e1e1e111eee1e11111116661161116111111bb11b111bb117111b1b1bbb11b117111c1c11111161116117111666111711171117111111111111
111111111e111e1e1e111e1e1e11111111161616116117771b111b111b1b17111b1b1b1b1b1b17111c1c11711616116117111116111711171117111111111111
111111111eee1ee111ee1e1e1eee111116611616166611111b111bbb1b1b11711b1b1b1b1b1b11711ccc17111616166617711666117711711171111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111112222211111111111111111111111111111111111
111111111e1111ee11ee1eee1e11111111661616166611111bbb1b111bbb11711bbb1bbb1bb111711cc11ccc2ccc211116161666177116161177117111711111
111111111e111e1e1e111e1e1e11111116111616111617771b111b111b1b17111bbb11b11b1b171111c1111c222c211116161116171116161117111711171111
111111111e111e1e1e111eee1e11111116661161166611111bb11b111bb117111b1b11b11b1b171111c11ccc222c211111611666171116661117111711171111
111111111e111e1e1e111e1e1e11111111161616161117771b111b111b1b17111b1b11b11b1b171111c11c11222c217116161611171111161117111711171111
111111111eee1ee111ee1e1e1eee111116611616166611111b111bbb1b1b11711b1b1bbb1b1b11711ccc1ccc222c271116161666177116661177117111711111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e1111111166111111661166161117171cc11c111111116611661611111111111111111111111111111111111111111111111111
111111111e111e1e1e111e1e1e11111116111777161116161611117111c11c111171161116161611111111111111111111111111111111111111111111111111
111111111e111e1e1e111eee1e11111116111111161116161611177711c11ccc1777161116161611111111111111111111111111111111111111111111111111
111111111e111e1e1e111e1e1e11111116111777161116161611117111c11c1c1171161116161611111111111111111111111111111111111111111111111111
111111111eee1ee111ee1e1e1eee11111166111111661661166617171ccc1ccc1111116616611666111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e111111116616661166166111111bbb1b111bbb1171117111661616166111111cc1117111171ccc117111111111111111111111
111111111e111e1e1e111e1e1e111111161616111611116117771b111b111b1b17111711161116161161117111c111171171111c111711111111111111111111
111111111e111e1e1e111eee1e111111161616611666116111111bb11b111bb117111711166611611161177711c1111711711ccc111711111111111111111111
111111111e111e1e1e111e1e1e111111161616111116116117771b111b111b1b17111711111616161161117111c1111711711c11111711111111111111111111
111111111eee1ee111ee1e1e1eee1111166116111661166611111b111bbb1b1b1171117116611616166611111ccc117117111ccc117111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111e1111ee11ee1eee1e111111116616661166166611111bbb1b111bbb1171117111661616166611111cc1117111171ccc117111111111111111111111
111111111e111e1e1e111e1e1e111111161616111611111617771b111b111b1b17111711161116161116117111c111171171111c111711111111111111111111
111111111e111e1e1e111eee1e111111161616611666166611111bb11b111bb117111711166611611666177711c1111711711ccc111711111111111111111111
111111111e111e1e1e111e1e1e111111161616111116161117771b111b111b1b17111711111616161611117111c1111711711c11111711111111111111111111
111111111eee1ee111ee1e1e1eee1111166116111661166611111b111bbb1b1b1171117116611616166611111ccc117117111ccc117111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111bbb1bbb1bbb11bb1bbb1bbb11711ccc1c1c1c111ccc1ccc1ccc11111171161617171c111c1c11711111116616661166166111111166111111661666
111111111bbb1b111bbb1b111b1111b117111c1c1c1c1c111c1c1c1c1c1c11711711161611711c111c1c11171171161616111611116111111611111116161611
111111111b1b1bb11b1b1bbb1bb111b117111c1c11c11ccc1c1c1c1c1c1c17771711166617771ccc1ccc11171777161616611666116111111611111116161661
111111111b1b1b111b1b111b1b1111b117111c1c1c1c1c1c1c1c1c1c1c1c11711711111611711c1c111c11171171161616111116116111711611117116161611
111111111b1b1bbb1b1b1bb11bbb11b111711ccc1c1c1ccc1ccc1ccc1ccc11111171166617171ccc111c11711111166116111661166617111166171116611611
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111bbb11bb1bbb1bbb11711166161616611111161611111166117111111111111111111111111111111111111111111111111111111111111111111111
111111111b1b1b111b1111b117111611161611611111161611111611111711111111111111111111111111111111111111111111111111111111111111111111
111111111bbb1bbb1bb111b117111666116111611111166611111611111711111111111111111111111111111111111111111111111111111111111111111111
111111111b11111b1b1111b117111116161611611171111611711611111711111111111111111111111111111111111111111111111111111111111111111111
111111111b111bb11bbb11b111711661161616661711166617111166117111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
111111111bbb11bb1bbb1bbb11711166161616661111161611111166117111111111111111111111111111111111111111111111111111111111111111111111
111111111b1b1b111b1111b117111611161611161111161611111611111711111111111111111111111111111111111111111111111111111111111111111111
111111111bbb1bbb1bb111b117111666116116661111166611111611111711111111111111111111111111111111111111111111111111111111111111111111
111111111b11111b1b1111b117111116161616111171111611711611111711111111111111111111111111111111111111111111111111111111111111111111
111111111b111bb11bbb11b111711661161616661711166617111166117111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1ee11ee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111ee11e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111e111e1e1e1e1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111eee1e1e1eee1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1ee11ee111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1ee11e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1e111e1e1e1e11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
1eee1e1e1eee11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
82888222822882228888822882228882822282828888888888888888888888888888888888888888888888888222822282828882822282288222822288866688
82888828828282888888882882828828828282828888888888888888888888888888888888888888888888888288828882828828828288288282888288888888
82888828828282288888882882828828822282228888888888888888888888888888888888888888888888888222822282228828822288288222822288822288
82888828828282888888882882828828828288828888888888888888888888888888888888888888888888888882888288828828828288288882828888888888
82228222828282228888822282228288822288828888888888888888888888888888888888888888888888888222822288828288822282228882822288822288
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

