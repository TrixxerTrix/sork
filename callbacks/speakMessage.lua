local event = game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest")
local sorkGlobal = getgenv().sork.global

print(sorkGlobal["Message to say"])
event:FireServer(sorkGlobal["Message to say"], "All")
