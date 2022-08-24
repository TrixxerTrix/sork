local event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest

if not game:GetService("Players").LocalPlayer:FindFirstChild("Sork"):GetAttribute("spamMessage_ran") then
  game:GetService("Players").LocalPlayer:FindFirstChild("Sork"):SetAttribute("spamMessage_ran", true)
  while game:GetService("Players").LocalPlayer:FindFirstChild("Sork"):IsDescendantOf(game:GetService("Players").LocalPlayer) and (getfenv().sork.global["Spam"]) do
    event:FireServer(getfenv().sork.global["Message to say"], "All")
    task.wait(1)
  end
end
