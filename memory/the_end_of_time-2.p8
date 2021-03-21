pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function ff(y)
	local ay
	if (y+t*32)%64<24 then
		ay = 4*sin(t/8)-4
	else
		ay = 0
	end
	return ay
end

function line2(x1,y1,x2,y2,c)
	local num_steps=max(
	 abs(flr(x2)-flr(x1)),
	 abs(flr(y2)-flr(y1)))
	local dx=(x2-x1)/num_steps
	local dy=(y2-y1)/num_steps
	for i=0,num_steps do
	 pset(x1,y1,c)
	 x1+=dx
	 y1+=dy
	end
  end

function fflr(a,unit)
	return a\unit*unit
end

function perp(x,y)
	return -y, x
end

function norm(x,y)
	local d = dist(x,y,0,0)
	return 
		x / d,
		y / d
end

function dist(x1,y1,x2,y2)
	return sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))
end

-- triangle wave, period 1, range [0,0.5]
function triwave(x)
    return abs((x + .5) % 1 - .5)
end

-- "complex" triangle wave, range [center - amplitude/2, center + amplitude/2]
-- to visualize -> https://www.desmos.com/calculator/lbicgo2khe
function ctriwave(x, center, amplitude, period)
    local a, b, p = amplitude or 1, center or 0, period or 1
    local core = abs((x / p - 0.25) % 1 - 0.5)
    return 2 * a * core - a / 2 + b
end

-- "range" triangle wave, range [y1,y2]
function rtriwave(x, y1, y2, period)
    local amplitude = (y2 - y1)
    local center = (y1 + y2) / 2
    return ctriwave(x, amplitude, center, period)
end

cc={0,5+128,7,5+128}
for i=1,#cc do
	pal(i,cc[i],1)
end

t=rnd(32000)

cls()
::♥::
cls()
t+=1/30

pos = -t*16


-- GENERATE THE LINES
unit=9+sin(t/32)*4
ox=64
lines = {}
for y=pos%unit-1-32,128+unit*4,unit do

	if (y+t*16)%200>100 then
		x = ox + 8*sin(t/4 + y/128)
		y = y + 4*sin(y/128 + t) + 4*cos(t/16 +y/32)
		
		x = x + rtriwave(t/8+x/257,-8,8,1) * sin(t/16 + y/64)

		add(lines, {
			x,y,x+8+ff(x,y),y+8+8*sin(t/4),
			x,y,x-8-ff(x,y),y+8-16*sin(t/8),
			true
		})
	else
		x = ox + 4*sin(t + y/32)
		y = y + 4*sin(y/32 + t)

		x = x + sin(t/16)*16 * sin(t/16 + y/64) +y/128
		if (y-t*64)%128<8 then
			x += 32*sgn(2*sin(t/8))
		end

		add(lines, {
			x,y,x+8+ff(x,y),y+8+4*sin(t/4),
			x,y,x-8-ff(x,y),y+8-4*sin(t/8)+cos(t/16),
			false
		})
	end

	

end

-- DRAW THE LINES
for key,ln in ipairs(lines) do
	if true then
		-- ARROW SHAPE: /\
		line2(ln[1],ln[2],ln[3],ln[4],7)
		line2(ln[5],ln[6],ln[7],ln[8],7)

		-- CONNECTING LINES BETWEEN EACH ARROW
		if key~=#lines then 
			ln2 = lines[(key+1)]
			line2(ln[1],ln[2],ln2[1],ln2[2],7)
			line2(ln[3],ln[4],ln2[3],ln2[4],7)
			line2(ln[7],ln[8],ln2[7],ln2[8],7)
		end
	else
		
		line2(ln[1],ln[2],ln[1] - ln[3] + (ln[2]-64)/2+64,ln[4],7)

		-- CONNECTING LINES BETWEEN EACH ARROW
		if key~=#lines then 
			ln2 = lines[(key+1)]
			line2(ln[1],ln[2],ln2[1],ln2[2],7)
			line2(ln[1]+1.2*(-key+#lines/2),ln[2],ln2[1]+1.2*(-key+#lines/2),ln2[2],7)

		end
	end
	
end


flip() goto ♥
__label__
00000000000000000000000000000000000000000000000000000000070770707770000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000070770070777000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007707070707700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007707007070777000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007700707070007700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000770700707000777000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000770070707000077700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000070070070700070777000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000007070070700007707700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000707007070007070077000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000077007070000707007700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007700707000707000070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000770707000070700007000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000007770700070070007700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000007700007077000700000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000077007070700770000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000700770077077000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000070700000770700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000007770000007700000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000077770000007770000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000077770007700000770000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000707707000077007707000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000077000070770007707077000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000700000007707700077070700000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000077700000000077077777007700000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007700077000000000770700777070000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000070000000770000077070700707770000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000007700000000007007700070070070707000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000070000000000000770000007070070077000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007700000000000007707000007007007007700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000070000000000000070007000000707007007700000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007770000000000007700000700000700700700770000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000770007700000000070000000700000070700700070000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007000000077000007700000000070000070070070007000000000000000000000000000000000
00000000000000000000000000000000000000000000000000770000000000700770000000000070000007070070007000000000000000000000000000000000
00000000000000000000000000000000000000000000000077000000000000077000000000000007000007007007007000000000000000000000000000000000
00000000000000000000000000000000000000000000000700000000000000777000000000000007000000707007007000000000000000000000000000000000
00000000000000000000000000000000000000000000077000000000000077000700000000000000700000700700770000000000000000000000000000000000
00000000000000000000000000000000000000000007700000000000007700000700000000000000700000070700770000000000000000000000000000000000
00000000000000000000000000000000000000000070000000000000070000000070000000000000070000070070770000000000000000000000000000000000
00000000000000000000000000000000000000000707700000000007700000000070000000000000070000007777000000000000000000000000000000000000
00000000000000000000000000000000000000007000070000000770000000000007000000000000007000077000000000000000000000000000000000000000
00000000000000000000000000000000000000070000007700077000000000000007000000000000007000700000000000000000000000000000000000000000
00000000000000000000000000000000000000700000000070700000000000000000700000000000000777000000000000000000000000000000000000000000
00000000000000000000000000000000000000700000000007000000000000000000700000000000000700000000000000000000000000000000000000000000
00000000000000000000000000000000000007000000000070700000000000000000070000000000077000000000000000000000000000000000000000000000
00000000000000000000000000000000000077000000000700700000000000000000070000000007700000000000000000000000000000000000000000000000
00000000000000000000000000000000000700700000007000070000000000000000007000000070000000000000000000000000000000000000000000000000
00000000000000000000000000000000000700077000070000070000000000000000007000007700000000000000000000000000000000000000000000000000
00000000000000000000000000000000007700000770700000007000000000000000000700070000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007070000007000000007000000000000000000707700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007707700077000000000700000000000000000770000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000007077070070700000000700000000000000007000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000700707700700000000070000000000000770000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000770077770070000000070000000000077000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000077000770070000000007000000007700000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000770707070000000007000000070000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000077777007000000000700007700000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000007777007000000000700770000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000077700700000000077000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007770700000000700000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000007777070000007000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000777770000070000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000777777000700000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000077007707000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000077707770000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007700777000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007707000770000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007777000777000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000770000700770000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000770000070077700000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000070000070000770000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000077000007000077700000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007000007000070770000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000700000700007007700000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000070000700000700770000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007000070000700007000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000700070000070007700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077070000007000700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000707000007000770000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000077000000770077000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007700000707707700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000770000700077700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000007000700007770000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000777000000777000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007700000077000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007077000077700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000007007700007700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000070770077077070000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000070007700770770000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000700000077077707000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000007077000000777777000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000070000770000070707700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000007700000007000770707700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000070000000000770707070770000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000700000000000007007070070000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007000000000000777000707077000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077000000000007000700707007000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000700770000000070000070070700700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007000007700000700000070007700700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000070000000070077000000007007070070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000700000000007700000000007000770070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007000000000007070000000000700707070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000070000000000070070000000000700077070000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000700000000000700007000000000070070700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007000000000007000007000000000070007700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000077000000000070000000700000000007007700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070700000000700000000700000000007000700000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070077000077000000000070000000000707000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000700700000000000070000000000707000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000077000000000000007000000000070000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000007700000000000007000000000700000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000007700000000000000700000007000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000007070000000000000700000070000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000070000007070000000000000070007700000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000007000007007000000000000070070000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000770007007000000000000007700000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000077007007000000000000007000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000007777000700000000000070000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000777000700000000007700000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000007700070000000070000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000777070000000700000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000077707000007000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070777000070000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000070077707700000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007007770000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000007000777700000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000700707777000000000000000000000000000000000000000000000000000000000000000

