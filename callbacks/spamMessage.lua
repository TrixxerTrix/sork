local event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
local sorkGlobal = getgenv().sork.global

return function(state)
  sorkGlobal.Spam_Misc = sorkGlobal.Spam_Misc or {}
  if not (sorkGlobal.Spam_Misc.Binded) and (state) then
    sorkGlobal.Spam_Misc.Binded = true
    while (sorkGlobal.Spam) do
      event:FireServer(sorkGlobal["Message to say"], "All")
      task.wait(2)
    end
  end
end
