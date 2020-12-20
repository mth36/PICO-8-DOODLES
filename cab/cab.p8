pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
--cab 2
--by micheal

--todo: walking should start immediately. maybe delete coroutine on stop, and recreate upon movement again?

#include const.lua
#include init.lua
#include input.lua
#include main.lua
#include player.lua

__gfx__
00067777000000677770000000000000000000000000000677770000006777700000000000000000000000000006777700000000000000000000000000000000
00067067000000670670000006777700000067777000000670670000006706700000067777000000677770000006706700000000000000000000000000000000
00067067000000670670000006706700000067067000000670670000006706700000067067000000670670000006706700000000000000000000000000000000
00067777000000677770000006706700000067067000000677770000006777700000067067000000670670000006777700000000000000000000000000000000
00000600000000006000000006777700000067777000000006000000000060000000067777000000677770000000060000000000000000000000000000000000
00d7777000000d77770000000006000000000060000000d7777000000d77770000000006000000000060000000d7777000000000000000000000000000000000
0d67777d00000d7777000000d7777000000d777700000d67777d0000d67777d00000d7777d00000d777700000d67777000000000000000000000000000000000
0d67777d00000d7777000000d7777000000d777700000d67777d0000d67777d0000d67777d0000d67777d0000d67777000000000000000000000000000000000
0d67777d00000d77770000006d777000000d777700000d67777d0000d67777d0000d677770d000d67777d0000d67777000000000000000000000000000000000
0d06006d00000d60160000006d777000000d777700000d06006d0000d060060d00d0677770d000d67777d0000d06016000000000000000000000000000000000
0d07006d00000d71060000000d106000000d601600000d07006d000d0070060d00d00600600d00d06006d00000d7016000000000000000000000000000000000
0d07007d000000d10070000007d060000000d01600000d07007d000d0007070d00d00700600d00d07006d00000d7017000000000000000000000000000000000
0d07007d000000d00070000071d007000000d01070000d070070d00d00070700d0d00077000d00d007070d0000d7107000000000000000000000000000000000
0d60007d000006d00070000070d007000006d10070000d070070d00d00076000d0d000770000d0d007600d0000d7107000000000000000000000000000000000
0d60060d0000060d00700006000d070000060d007000006006000000000760000000007000000000076000000060060000000000000000000000000000000000
0070060d000007000600000600000060007000006000006006000000006070000000006600000000670000000060060000000000000000000000000000000000
00700700000070000600000700000060007000006000007007000000006700000000007600000000670000000070070000000000000000000000000000000000
00700700000070000770007000000070707700007000007707000000007700000000007707000000777000000070077000000000000000000000000000000000
00770770000077000000007700000007000000007700000007700000000770000000007770000000770000000077000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000000000003000000003000030030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111000003000003030030003030030030030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077776000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000076076000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000076076000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077776000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000600000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007777d00000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007777d00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000777d600000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000777d600000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000601d000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000060d7000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000700d1700000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000000000000000000000000000700d0700000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000070d00060000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000600000060000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000600000070000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000070700000007000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007000000077000000000000000000000000000000000000000000000000000000000000000000000000000000
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78
789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd789abcd78

__map__
0000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
