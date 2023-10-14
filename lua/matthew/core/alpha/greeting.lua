return function(name)
	local hour = os.date("*t").hour
	local index = 0
	local greetings = {
		[1] = "  Sleep well",
		[2] = "  Good morning",
		[3] = "  Good afternoon",
		[4] = "  Good evening",
		[5] = "  Good night",
	}
	if hour == 23 or hour < 6 then
		index = 1
	elseif hour < 12 then
		index = 2
	elseif hour >= 12 and hour < 18 then
		index = 3
	elseif hour >= 18 and hour < 21 then
		index = 4
	elseif hour >= 21 then
		index = 5
	end
	return greetings[index] .. ", " .. name
end
