pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

for i=0,7 do
    pal(i,i+8+128,1)
end

-->8
dt=1/30
t=0
tf=0

bk=8
hx=1.5
hy=1.5

cls()
::♥::
t+=dt tf+=1

local st256 = sin(t/256)
local st16 = sin(t/16)

local r=40
for i=1,r do
    ox=rnd(128+bk)-8
	oy=rnd(128+bk)-8
    for y=oy,oy+bk-1,hy do
        for x=ox,ox+bk-1,hx do
            local c = sin((x+st256*256)/sin((y+32)/500)/64)
             +(y/(64+16*st16))
             +t
            c = c%8+8
            diff = c-flr(c)
            if diff<0.33 then
                c+=8
            end
            circ(x,y,1,c)
        end
    end
end

flip() goto ♥
__label__
ooo8888p99999999p8p888offfoo8888p8p9q9qqq9q9p98p888oooop898p9999qqqq9q9898oooo888p8p8p9p9q9qqqqp998p8o8ooo898p999q9q99qq898pp888
ooo888ppp999999999po8oofffoooo888p9p9q9qqqqq9998888oooo8p8p98p999qqqq9q98988ooo888p8p8p9p9q9qqq9qqpq9p988o8oo8o8p8999qqq989pq899
ooo888ppp999999999p888foffooo8o8p8p999qqqqqq9999pp888ooo8888p8999q9q9qq9q89po8oofoofo8888pp9q9qqqqq9q9p9o8oooo8oo989p999999qp999
oo8888pp9999qq999p9888ooffoooo888pp999q9qqqq9q9pp8p8o8ofoo8o888p9999qqqqqqp98o88oooooo8o8p889p9qqq9qqpq98ofoo8ooo89889889p99qq99
ooo888p9p99qqq9999p88o8offoooo8o8p8p999q9qqqq9q99p888ooffoo8o8p8p999qqqqqq99o98oooooooo8o888p9pq99q9qqqqofofp88888o8o888p889p9qq
ooo8889p999qqq9999p888o8fffoooo8o8p89999q9qq9q999p9p888ofooo8o8889p9q9qqq9999o9pp888ooo88f88p8p9999q9qqqqofp8p888ooooo8o888p9p99
8o888p999999qq9q99888888o8oooooo888pp9999999999999p9888fffoooo888p9p9q9qqq9989p999p8888888888p8p8p999q9qqqaapqq888oooooo8oop88p9
88o8p899999qqqqq9qp888888oooooo8o8889p999999999qq8998p8offfooo8888p9p9q9q99988999p98p8p88888o8o88898p9999aaaqqqq9p9oo8o8o888oo88
88888pp9999qqqqqq9q8p8ppo88o8ooo8888p8p9999999qqq999p8p8offfoo888888p8p999998p8999pp8p8p8o8ofof8888p8999999qqaaqq999p98o888ooo8o
8o888p9p9999qqqqqqpp8ppp888888oo88888p8p99999q9qqq999p9pffffff8888888p8p99999qqqaa99999po88fffof88o8p899p999a9qaq9999899998p8888
o8888pp999qqqqqqqqq8pppp8888888ooo8888pp99999qq9qp9999p9pofffff88f8888p9p999q9qaqaa9q99989p8offfoo88888p99999q9qqqqq999999p9p888
8o888pp999qqqqqqqqq9ppp98p8o88ooo8o888pp9999q9q99q9q9899ooffff8888888888p9999q9qaqaq99999p9p8fooffooo888888p99999qqqqqq99q9q989p
88888p9p9q9qq9qq9q9p9p99pp88888ooo8o888pp9999q99qqqqq9999ooofff88f8888888p8p999qqqqqqqqqp9988ooofooo8o88888898p99qqqq9qqq9q9q9p9
8888ppp999qqqqqqqqq99999p8p8888fooo888p89p9999q9qqqqq99998oooff8fooooo8888p89p9q99qqqqaqqq9q9888ooooo88888888p8p99qq9q9aaaqaqaq9
888pppp999qqqqqqqqq99p998ppf88fooo8o888pp9p999999q9qq9q98oooof88o88oooo8888pp9p9999qqaaqaaqqq9p8o88ooof88f8888p89999q9qqaaaaaqaa
888ppp9p9q9qqqqq9q999p9pppp8888oofo888888pp99999qqqqqqqq98o88f88888ooo888888p8pp99999aaaaaqqqq899898o88888888888889p9q9qaaaaaaaa
8888ppp999q9qqq9q9o998p98ppo88o88f88o888p8p99999qqqaqqqqqp888op888888o8888888p899999q9qqaa9qaa9qq9999o88888888888889pp99qqqqaqaa
888p8ppp9999qq9qq9999p9p8888o888888888888p89999q9qaqaqqq99898p98p88888o88o8888p899999q9aqqaaaaqqq9999p888o88888888888899qqqaqaaa
8888p9p999qqqaqaaqa999p9888o8o888888888888pop99999qqqqq9999999pp8p88888f88o88888p8pp99qqqqaaaaoaaqqq9p998pp88888888888pppq9qa9aa
88888p999q9qaqaaaa8a9p999pp8888888888888888p99999qqqqqq99999qq999p9888o8888888888pppp9999qqaaaaaaqaqq999ppp88888888888p889p9p9q9
8888pp9999qqqapaapappp999p8p888888888888888p99999qqqqqqpq98qqq999989p88888888888o8pp9999q9qqaaaaaaqaq9998998p88888888o888ppp9p99
8888pp9999qqaaaaaaaapp899ppp888888888888o88oppp9999qqqqqqq99aq9q999pp88p8888888888888p99999qqa9aaaaaa8qq9q9p99888888888888ppp999
888pp9p999qqaaaaaaaa9p999p9p88p888888888888ppp99999qqqqqqq9aaaqqq999p8p8p88888888888p8p99999qqaaaaaaaqaqq9q999988p8p8o88oo8p888p
88pppp9999qaqaaaaaa9p99999p98p88888888888888pp9999q9qqq9qqpaaaqqq9999p99ppp8888888888p8999999a9aaaaaaaqapqqp9998ppp8p88888888888
88pppp9999qqaaaaaaaa9p899o9pfp8888888888o8888pp9999qqqqqqqqqaaqaqaq99999pppp88888888888pp9999999aa9aa9aaqaa9qq9pp989p88888888888
88ppp9p999qqaaaaaaaa98999999ppppf88o8888888888pp9999qqq9qq9aaaaaaaa9q99999pp88888888888p8p99999qqqqqqqaaaaaqqqq9999998pp88888888
88ppp99999qaqaaaaaa9a8999999p99ppp88o888888888ppp9999999aaqaaaaaaaaqq9q9999ppp8888888888p8pp99999q9qqqaaaaaqqqq999999ppppp888888
88pp999999qqaaaaaaaa9aa9q899999ppp8o8ooo888888ppp999999aaaaaaaaaaaaqqq9q99999ppp888888888pp9p99999qqqqqaaaqaqq999q9q9999ppp88888
88pp999999qaqaaaaaaaaaaqqq8oo9989popooooo88888p8p999999oqaqaaaaaaaaaaqqq9999p9ppp8888888888p899999qqqqqaaaaqa9q9qaqqq9999pp88888
88p9p999999qaaaaaaaaaaaqqqoo99999ppppooo8888888889p9999qqaaaaaaaaaaaaqaq9q9999pp88888888888888p99999qqqqqaqa9q99aqqqq9999998p888
88pp99999q9qaaaaaaaaaaa8aoof9999p9pppooo88888888pp99999qaqaaaaaaqaaaaaqaqqq999p9pp88888888888pp9p999q9qqqqaaa9qq9a9qqq99999p8pp8
88ppp999q9qaqaaaaaaaaaaaaa8o999999ppooooo8888888p999999qqqqaaaaaaaaaaaaqqqq9999p9pp8888888888ppp9p999q9qqqaaaaqqq9q999q9p998pp8p
8ppp99999q9qaaaaaaaaaaaaaa999q9999pppooo8888888p8p99999qqqaaaaaaaaaaaaaqqaqpq999ppp88888o88888ppp9p99999qqqaaaaqqq99999pp9p8p8p8
8ppp99999qqqaaaaaaaaaaaqaq99q9q999pppoooo88o8888pp99999qqqaaaaaaqaaqaaaqaaaqqq9999ppp888oo88888pppp9999qqqaqaaaq9qq9999p9p998998
p8p9p999qqqaaaaaaaaaaaaaqaq99q9999pp8ooofof8o8888p999999qqqaaaaaaaaaaaa9aaaqqq999p9ppp88oo8888888ppp9999qqqaqqq9qqq9q999999p999p
8ppp9999qqqqaaaaaaaaaaaqaq99q9999ppp888o88o888888ppp99999qqqqaaaaaaaaaaaaaa9qq9q9999p8poooo88888ppp999999q9qqqqqqqqq9q9p999q999p
pppp9999qqqqaaaaaaaaaaaqqq9q9q999ppp8888888888888ppp999999qqqqaaaaaaaaaaaaa9q9q9q9999pppoo8888888pppp9999999qqqqaqaaqaa999qq9q99
ppp9p999qqqaaaaaaaaaaaqaq9q9q9999p9p8pp8888888888ppp9999999qqaqaaaqaaaaaaaaa9a8qq99999ppo8888888p8pppp99999qqqqaaaaaaaaa99qqq9q9
pppp9999qqqqaaaaaaaaa9aa9qqq9q9999p9ppp888888o8888ppp99999qqqqaqaaaaaaaaaaaaaaqaq9q99898888888888p8pppp999999q9qaaaaaaaaa99a9qqp
ppp99999qqqqqaqaaqaa9aaaqaa9aq999p998ppp88888888888ppp999999qqqaaaaaaaaaaaaqaaaqaq9q99p988888o888888pppp9999q9qqaaaaaaaaaqaaqaa9
pp999999qqqqaqaaaaaaa9aaaaaaaqq9pp99ppp8p888888888pppp999999qqqaaaqaaaaaaaaaqaaaaqqq999p8888p888888pppppp9999q9qqaaaaaaaa9aaaaaq
pp999999qqqqqaqaaqaaq9aaaaaaqaq9pp99pppp8p88888888ppp9p9999q9qaqaqaaaaaaaaaaaaaaaqaqq999pppp8888888ppppppp999999aqaaaaaaaaaaaaa9
pp9999999qqqqqqqqqqq99qaqaa9aq99p99999ppp8888888888pppp99999q9qaqaqqaaaaaaaaaaaaaaqaqq9p9p8pp8888888pp8pp9p99999qaqaaaaaaaaaaaaa
pp999999qqqqqqqqqqaaqaaaaaaaaaq9999999pppp8888888pp8ppp99999qqqaaaaaqaaaaaaaaaaaaaaqqqq99ppppp88888888pppp9p999q9qaqaaaaaaaaaaaa
p9999999qqqqqqqqqaaaaaaaaaaaaaa99999999pppp88888pppppp99999q9qaqaaa9aaaaaaaraaaaaaaaqqq99p9ppp8888888888ppp999999qqqaaaaaaaaaaaq
9p999999qqqaaqqqqaaaaaaaaaaqaa9q999999ppppp88888pppppp99999999qq9a9q9aaaaaraaaaaaaaa9q9999p9pp8p8888888p8p9p9999999qqaaaaaaaaaaa
p9p9999qqqaaaaqaqaaaoaaaaaaaaaaaq9q999pppp8888888pp8ppp999999qqqaaa999aa9aqrqaaqaaq99q999p9p9pppp8888888p8p9p99999qqqqqaaaaaaaaa
p9999999qqqaaqqaaaaaaaaaaaaaaaaqaq9q99p9p8888888pppppp9999999qqqaaa9oaaaaaqaqqqqqq9qaqaq9q99p9ppp88888888p8pp99999qqqqaaaaaaaaaq
9p99999qqqaaaaaaaaaaaaaaaaaqaa9aaqq999999p888888pppppp99999999qqoa99a9aaaaaqaqqqqqoaqaqaq9q999ppp8p88888ppppp9999999qqaaaaaaaa9a
9999999qqqaaaaaaaaaaaaaaaaaaaaaaaqqq99999p8888888pp8pp899p999q9qaqaaaaaaaaaaq9qqaq9qaqaa9qq999p9pppp8pp8ppppp99999999qqqaa9aa9a9
99999999qaqaaaaaaaaaaaaaaaaqaaaaaqqqq9p9pp888888pppppp99999999q9qaaaaaaaaaaaaq9aqaqaaaaaqqqqq99p9ppppppppp8pp999999999qqaaaaaaaa
999999qqqaaaaaaaaaararaaaaaaqa9aa8qq9p9ppp8p88888pp8pp899p99999q9aaaaaaaaaaaqaa9aaoaaaaaqqqq9q99pppppppppppppppp99999qqqaaaaaaaa
99999q9qaqaaaaaaaaarrrraaaaaaaaaaqaqq9ppppp998pp8p888p8p9o99999qqqaaaaaaaaaaaaaaaaaqa9aa9aq9q999p99poppoppppppp99999999qqqqaaaaa
pp9999qqqaaaaaaaaararrraaaaaaaaaaaqaq99ppp999pppp8p8pop9p99999qqqaqaaaaaaaaaaaa9aa9aaaaaaaaqqq9p9999pppppp8pppp999999999qqqaaaaa
p99999q9qaqaaaaaaarraraaaaaaqa9aa9aq999pppp99ppp8pp8ppop9o99999qqqaqaaaaaaaaaaaaaaaaaaaaaaaaqq999999ppppppp8pp8p99999999qqqqaaaa
9p99999qqqaaaaaaarrrraraaaaaa9999999p999p9999p9ppppppppp999999q9qqqaaaaaaaaaaaaaaaaoa9aaqaa9a9999999o9p8ppppppppp99999999qqqqaaa
999999qqqaaaaaaaaarraraaaaaaq9999999999p999999p9ppppppp9p999999qqqqaaaaaaaaaarraraq99aaaaaaaqa9999999p9p8pppppppppp999999qqqaaaa
p9999qqqaaaaaaaaaaararrarraaqaa9q9999999p9999p99pppppppp9p99999qqqaqaaaaaaaarrrrrra999aaaaaqaq999999o9p8p8p8pp8ppp9999999qqqaaaa
999999qqqaaaaaaaaarrrrrrrrraaaaq9q99999999999999pppppppp99999999qqqaaaaaaaaarrrrrrroq999aaqqq9q99999o8888pppppppppp9999999qqqaaa
99999qqqaaaaaaaaaarrrrrrrrraaaaqa999999p99999999ppppppp999999999q9qqqaaaaaaaarrarraqqqaaaaqqqq99999p88888pppppppppppp99999qqqaqa
99999qqqaaaaaaaaaaararrarraaaaaaaa99p99pp9999p99ppppppp9999999999q9qqqqaaaaaaaaaaaaqaaaaraaaaaaq9999o88888p8pp8pp88ppp99999qqqqa
99999qqqaaaaaaaaaarrrrrrrrraaaaaaa99pppp999999ppppppppp9999999999qqqqqaqaaaaaaaoaaaaqaaraaaaaaaa999988888888888888ppp9p999q9qqqq
9999qqqaqaqaaaaararrrbrbrrraaaaqa9989899999999pppppppppp99p99999q9qqaqaaaaarraoaaaaaaaaaraaaaaaq999p888pp888888888pppp99999q9qqq
99999qqqaqqaaaaarrrrbbbbbrrraaaaaa9aq9q9999p99pppppppp99999999999qqaqaaaaarrrrraarrarrarraraaaaa9999p8ppp8p88888888pppp99999qqqq
9999qqqaqaqaaaararrbbbbbbrrraaaaaaaqaq9q999o8o8pppppp9p99999999999qqqaaaaarrrrorrrrrrrrrrraraaaap99pp8pppp8p888888ppppp999999qqq
9999qqqqaqqaaaaararrbbrbbrbaqaaqaa9aq9q99999888p9ppppp9p99p9999999qqqaaaaarrrrrrrrrrrrrrraraaaapp98pp88pp8pp888pp8ppp9999999qqqq
99999qqqqqqaaaarrrrbbbbbbbbbqq99aaaaaqqq99998889ppppp9p99999999999qqqaaaaarrrrrrrrbrbrarrrrraaaaqqp9p8p9pppp8ppppppp9p9999999qqq
99999q9qqqaaaarrrrrbbbbbbbbbqq99aaaaaqqqq998888898pp8p9p99999999999qaaaaaaarrrrrrbbbbbrrrrrraaaaqq999p9p9pppp8ppp8ppp98999999qqq
99999qqqqaqaaaarrrrrbbbbbrbr99999aaaaqqq9999888888888ppppp99999999qaaaaaaarrrrrrrbbbbbrrrarraaaqqq999889p8pp9p99999p9999999999qq
9999q9qaqaaaaarrrrrbbbbbbbrbqq99aaaaaqqqq999888888888pppp999999999qaaaaaaarrrrrrrbbrbbrbraaaaaa8aq9q9p9p9pp9p9999999999999999qqq
99999qaqaaaaaarrrrbrbbbbbbbrq9q9aaaaaaaqqq998888888888ppp999999999qqaaaaaaarrrrrrbbbbbbrbaaaaaaaaqqqq8p9p8pp9p999999p9p999999qqq
99999qqaaaaaaarrrrrbbbbrbrrroa9aaaaaaaaqqq98988888888ppppp99999999qaaaaaaaarrrrrrbbrbbrbaraaaaaaqaqqq8pp8p8999999999999999999999
999qqqqaaaaaaaarrrbbbbbbbbrrraaaaaaaqaa9qq8q888888899p99p9999999999aaaaaaaaarrrrrbrrrrrrrraaaaaaaaqqq9ppp8p999999999999999999999
99qqqqaaaaaaaarrrbbbbbbbbbbrraaaaaaaaaaqaqqqq888889999999999999999qqaaaaaaaarrrrbbbrrrrrrraraaaaaaqqq99p8ppp9p999999p9pp99999999
99qqqaaaaaaaaarrrrbbbbbbbbrbraaaaaaaaaaaqaqqq98888899p99p999999999qaaaaaaaaaarrbbbbrrrrrrrraraaaaaaq9q98ppp999999999ppp99999999q
999qqaaaaaaaaaarrbbbbbbbbbbrrrrrraaqqaaoaqqq99988899999999999999999qaaaaaaaarrrrbbrrrrrrrraraqpapaapqq9p99p99999999999999999999q
99qqqaaaaaaaaarrrrbbbbbrbarrrrrrraaaaaaaaqqqq98p889999999999999999qqaaaaaaararrrrrrrrrrrrrraraaaaaaqqqq999999p999999999999999999
99qqqaaaaaaaarrrrrbbbbbaaarrbrarraaaaaaaqaqqq99888899899p99p999999qqaaaaaaaararrrrbrbrrrrraraaaaaaaaqaa9q99p9p999999999899p9999q
9q9qqqaaaaaaarrrrbrbbbbraaabbrrrraaaaaaqaqqq9999899999999999999999qqaaaaaaaaarrrrbrbrbrrbrarrarapaaaaaaq9qo99pp9p99999999999999q
q9qqqaaaaaaaaaarrbbrbbrrarrbrbrrraaap9pqpqq899999999999999999999999qqaaaaaaaaarrrrbrbrrbrbrrrraraaaaqaa9a9999999999999999999999q
9q9qqaaaaaaaaarrbbbbbbbrrrrrbbrrraa999qaqqq9999999999p99999999999999qaaaaaaaaaararrrrrrrbrrrraraaaaaaaaaaaq9qq99999999999999999q
999q9aaaaaaaaarrbbbbbbbrrrrbbbrrrara99aqqqq99999999999p99p99p99o9999qaaaaaaaaarararrorrbbbrrrrrraaaaaaaaaq8qqq999999999999999999
9999q9aaaaaaararrbbrbbrrarrbbbrrrrar999apqqp999999999999999999999999qqaaaaaararraaaaaaabbbrrrrrraaraqaaqa9aqqq99999999999999999q
999qqaaaaaaararabbbbbbbbbbrrbbarrqr99999p9999999999p9p99999999999999qaaaaaararrrrarabbrrbbbrbbrrarraaaaaaaaqqq9q999999999999999q
9q9qqqaaaaaarrabbbbbbbbbbbbraraaaq9q9999p99999q9999999p99999999999qqqqaaaaaararrrrabbbbbbbbbbbrrrraraaaaaaaqqqq9q99999999999999q
9qq9qqaaaaarrrrbbbbbbbbbbbbaraaaarqrr9aapp999q9q99999999999999999q9qqqaaaaaarrrrrababbabbbbrbbrraaraaaaaaqaqqqqq99999999999999q9
q9qqqqaaaaarrrrrbbbbbbbbbbbbaraarqrrraaaaaq9q9q9999899999999999999qqqaaaaaararrrrbbbbbbbbbbbbbrrraaaaaaaqaaqaqqqq99999999999999q
9qqqqqqaaaaarrrbbbbbbbbbbbbbraaaabqrr9aaaaaqqq99999888999999999999qqaqaaaaaarrrrrbbbbbbbbbbbbbrrraaaaaaaqaaaqaqqqq9999899999999q
q9qaaaaaaaarrrrbbbbbbbbbbbbaaaaabbrrraaaaaqqqq999999p999999999999q9qqaqaaaaarrrrbrbbbbbbbbbrbbabaaqaaqaa9qaaaqqqq9999999999999q9
9qaqaaaaaarrrrbrbbbbbbbbbbbbaraabbrrraaaaaqqqq99999pp9999999999999qqqqaoaaararrrrbbbbbbbbbbbbbbbbaoaaaaaaaaaqqqq999999999999999q
qqqaaaaaaarrrbrbbbbbbbbbbbbbrraaabarr9aaaaaqqq999999pp99999999999q9qqqaaaaaarrrrbbbbbbbbbbbbbbbbbaqaaaaaaaaqaqqq999899p9999999q9
9qaaaaaaaaararbrbbbbbbbbbbbrrrrrbbrrraraaaqqqq99999999999999999999qqqaqaaaararrrbbbbbbbbbbbbbbbbaaaqaqaaaaqaa9q9999999999999999q
qaaaaaaaaarrrrbbbbbbbbbbbbbrrrrbbbrrrraraaqqqq999999p9999999999999qqqqaoaaaararrrbrbbrbbbbbbbbbbaa9rqraaaaaaaqqq999999999999999q
qqaaaaaaarrrrbrbbbbbbbbbbbrrrrbbbbrrrrraaaaqqq9q99999p9p9989999999qqq9ooooaaoaaobbbbbbbbbbbbbbbbaarrrraaaaaaaqqq9999999999999999
qaaaaaaaaarrrrbbbbbbbbbbbbbrrbbbbrrrraraaaaqqqq9q9999ppppppoo999999q9qoqaaaaaaaabbbbbbbbbbbbabbaaarrraraaaaaa9q99p8999999999999q
qaaaaaaaaarrrbbbbbbbbbbbbborbbrbbarraraaqaqaqqqq99999999p999999999qqqqqaaaaaaaaarbbbbbbbbbbbbbbbaa9raraaaaaaaqqq999999999999999q
qqaaaaaaarrrrbbbbbbbbbbbbrbbbbbbbrrrrrra9qq99999999999999999999999qqqqaaaaarrarrrbbbbbbbbbbbbbbbaarrrraaaaaaaqqq99999999999999q9
qqaaaaaarrrrbrbbbbbbbbbbbbbbbbbbbbrrrra99999999999999999999999999qqqaaaaaarrrrrrbrbbbbbbbbbbrbbaaarrraraaaaaa9q99pp9999999qq99qq
qaaaaaarrrrrbbbbbbbbbbbbbbbbbbbbbbrrraqa9999999q9999999999999999q9qaaaaaaarrrrrrrbbbbbbbbbbbbbbbaaarrrraaaaa999999999q99qqqqq9qq
9aaaaaaarrrbbbbbbbbbbbbbbbbbbbbbbbbrbaa999p999q9999999999999999q9qqqaaaaaaarrrrrbbbbbbbbbbbbbbbaabrarrraaaa999999989q99q9qqqqq9q
aaaaaaaarrrrbbbbbbbbbbbbbbbbbbbbbbbbrbra9999999q99999q9qq9qq9qq9qqqaaaaaaarrrrbrbbbbbssbsbbbbrarbbbrrrraaaaa99999qq8qqpqqpqq99q9
aaaaaaarrrrrbbbbbbbbbbbbbbbbbbbbbbbrbrar999999qq9999q9qqqqqqqqqqqqqaaaaaaarrrbrbbbbbssssssbbbrrabbbrrraaaaaa99p9qqqqqqqqqqqqqqqq
9aaaaaarrrbrbbbbbbbbbbbbbbbbbbbbbbbbbbr999p999qq99999q9qqqqqqqq9qqqqaaaaarrrrbbbbbbbssssssbbbbbrabbarraaaqa99p9p8qq9qqqqqqqqqqqq
qoqaaararbrbbbbbbbbbbbbbbbbbbbbbbbbbbbrr9p99999q9999qqqqqqqqqq9qqqqaaaaararrbbbbbbbbbssbssbbbbbbbbbrrraaaqqpppppqqqqqqqqq9qq9qqq
qqqaaaarrrbrbbbbbbbbbbbbbbbbbbbbbbbrbrraaapaa9999999qqqqqqqqqqqqqqaaaaaaarrrbbbbbbbbbbbbbbbbrbbrbbbrrraaaqopqqp9qqqqqqqqqqqqqqqq
9qqaaaarrrbbbbbbbbbbbbbbbbbbbbbbbbbbbbraaaaaaappp9999q9qq9qqqqqqqqaaaaaaaarbrbbbbbbbbbbbbbbbbbbbabbarrqaqoqqqq999qq9qq9qq9qqqqqq
q9qaaararbrbbbbbbbsbssbssbbbbbbbbbbbbbraaaaaaa9p9999qqqqqqqqqqqqqqqaaaarrabbbbbbbbbbbbbbbbbbbbbbbbbrrraqaaoaaqqqqqqqqqqqq99q9qqa
qqaaaaarrrbrbbbbbsssssssssbbbbbbbbbrbrrraa9aa9999999qqqqqqqqqqqqqqqaaarrrbbbbbbbbbbbbbbbbbbbbbbbrbbqrr9aaoaaaqqqqqqqqqqqqp999qqa
qqaaaaaarrrbbbbbbsssssssssbbbbbbbbbrrrraaaaaaa9p99999q9qq9qq9qqqqaaaaarrrbbbbbbbbbbbbbbbbbbbbbbbbraaqoq9oaqaaqqq9qq9qq9q99999qaq
9qaaaaarrrrbbbbbbbsssssssbbabbbbbbbbbrraaaaaaa99999999999999qqqqaaaaaarrrbbbbbbbbbbbbbbbbbbbbbbbraaaqqq9aaaaaqqqq99999999999qqaa
qqaaaaarrrrrbbrbbssssssssssbbbbbbbbbbrrrraqaa9999q9qq9qq99999qqqaaaaarrrrbbbbbbbbbbbbbbbbbbbbbbbrraqaq9qaaaaaqqqq999pq9qq9qaqaaa
aqaaaaaarrrbbbbbbsssssssssssbbbbbbbbrrrrrraaaa99qaqqqqqqq999qqqaaaaararrbbbbbbbbbbbbbbbbbbbbbbbrbrarqra9aaqaaqqq9q99qqqqqqqaaaaa
aaaaaarrrrrbbbbbssssssssssssbbbbbbbbrrrrraaaa999aqqqqqqqq9q99qqaaaaaarrrbbbbbbbbbbbbbbbbbbbbbbbbrarqraraaaaaaqqqqq99qqqqqqaqaaaa
aaaaarrrrrrbbbbbbsssssssssssbbbbbbbbrbarraaaq99q9a9qq9qq9q9qqqqqaaaararbrbbbbbbbbbbbbbbbqbbbbbbrrrarqra9aaaaaqqqqqq9qqqqqqaaaaaa
aaaarrrrrrrbbbbbbsssssssssssbbbbbbbrbbrrraaaa9q9aaqqqqqqq9qqqqaaaaararrrbbbbbbbbbbbbbbbbbbbbbbrrrrrrrraaaaaaaqqqqq9qqqqqaaaaaaaa
aaaarrrrrrbbbbbbssssssssssssbbbbbbbrbbrrraaaa99qaaqqqqqqqq9qqaqaaaaarrrbbbbbbbbssbbbbbbbbabbbbrrrarrraraaaa999999999qqqaqaaaaaaa
aaaarrrrrbbbbbbbbsssssssssssbbbbbbbrrbarraaaq9qqqaqaqqqa99qqqqaaaaarrrrbbbbbbbssssbbbbbbaaaqqaaaaaarqaa9aa999999qq9qqqqqaaaaaaar
aaaarrrrbrbbbbbsbsssbsssssssbsbbbbbrbbrrraaaa9qqaqaqaqaqaqqqqaaaaarrrrbrbbbbbsbssbbbbbbbbbobbqbbarrraaaaaaa9qq9qqqqqqqaaaaaaaaaa
aaaarrrrrbbbbbbssssssbssbssbsbsbbbbrbbrrraaaap9qpaqaqqqaq9qqaqaaararbrbbbbbbssssssbbbbbbbbbbrbbbrrrraaaaaaaqqq9qqqqqqaqaaaaaaaaa
aaaarrrrbbbbbbsbssssbbbbbbbsbsbbbbbarbarrqaa99qqqqqqqqq9qqqqqaqararbrbbbbbbsssssscbccbsbbbbrbrbbqrrr9aa9aaqqqq99qq9qaqaaaaaaaarr
aaaaarrrbbbbbbbsbssbbbbbbbbbbbbbbbbrrrraaqq999qqqqqqqqqq9qaqaaaaarrrbbbbbbsssssscscccsbsbbqbbbbbrrrrq9999qq9qq9qqqqaaaaaaaaarrrr
aaaararrrbbbbbssssssbbbbbbbbbbbbbbbrrrraqqq99p9qqqqqqqqaqaqaaaaarrrrbbbbbbbsssssccbccbsbbbbbbbbbrrrr9q99qqqqqqqqqqaaaaaaaaarrrbb
aaaaarrrbbbbbsssssssbbbbbbbbbbbbrbbarraaaq999999qqqqqqaqaqaaaaarrrrbrbbbbssssssccccccsssbbbrbrbb9rr99999qqqqqqqqqa9aaqaaaararbrb
aaaarrrrrbbbbbssbsssbssbsbbbbbbbbbbrrrraa99999999aq9qa9aqaaaaaaarrabbbbbsbsssscccccccsssbbbbbbbrrrrr9p99pqq9qq9qaqaaaaqaaaararbr
aaarrrrrrbrbbsssssssssssbsbbbbbbbbbbrrraaa9999q9aaaqaaaaaaaaaaarrrbbbbbbbsssssccccbccrsbbbbbbbrbrrrrq9qpqqqqqqq9qa9aaqaqaarrrbbb
aaaarrrarbbbbbsssssssssbsbbbbbbbbbbrbrraaa999q9qaaaaaaaaaqaaaaarrrbbbbbbsssssccccccccsssbbbbbrbrrrraqaaqqqq9qq9q9999qqqaaarrbbbb
aaarrrrrbbbbbbssssssssssssbbbbbbbbrbrrraa99999q9qaaqaaqaaaaaaaarrrrbbbbsbssssscccccccsssbbbbbrrrraaaaaaq9q99999q999qaaaarrrbbbbb
aaarrrrrbbbbbbssssssssssssbbbbbbbbbbbraaaa999qqqaaaaaaaaaaaaararrrrrrbbbsssssscsccbccrsbbbbbrbrrraaaqaaqq99999qqq9qaaaarrrbrbbbb
