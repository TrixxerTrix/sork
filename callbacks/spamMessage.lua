local event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest

return function(state)
  print(state)
  getgenv().sork.global.Spam_Misc = getgenv().sork.global.Spam_Misc or {}
  if not (getgenv().sork.global.Spam_Misc.Binded) and (state) then
    getgenv().sork.global.Spam_Misc.Binded = true
    while (getgenv().sork.global.Spam) do
      event:FireServer(getgenv().sork.global["Message to say"], "All")
      task.wait(2)
    end
  end
end
