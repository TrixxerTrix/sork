local games = {}
games.__index = games

games[7363647365] = {
	title = "sork (sbf...)",
	stuff = {
		{callback = "idk_i_was_messing_around.lua", type = "button", name = "do something funny"},
		{callback = nil, type = "string", name = "Message to say"},
		{callback = "speakMessage.lua", type = "button", name = "Say"}
	}
}

return setmetatable({}, games)
