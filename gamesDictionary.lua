local games = {}
games.__index = games

games[9285510960] = {
	title = "sork (floppa hangout)",
	stuff = {
		{callback = "floppa.lua", type = "button", name = "kick yourself"}
	}
}

return setmetatable({}, games)
