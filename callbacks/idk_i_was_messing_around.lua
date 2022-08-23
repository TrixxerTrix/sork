local fumoNames = {"Reimu", "Cirno", "Elly", "Youmu", "Marisa", "Yuyuko", "Hecatia"}
local sizes = {"Doll", "Shinmy", "Base", "Deka"}
local event = game:GetService("ReplicatedStorage").Req

event:InvokeServer("ChangeFumo", {Fumo = fumoNames[Random.new():NextInteger(1, #fumoNames)], Hat = "None", Scale = sizes[Random.new():NextInteger(1, #sizes)]})
