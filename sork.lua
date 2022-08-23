--[[export type callbackDictionary = {
	callback: string,
	type: string
}

export type defaultGameDictionary = {
	title: string,	stuff: {any}
}
]] -- these were used in studio so i can understand stuff, they wont be used in the exploit version

local repositoryPrefix = "https://raw.githubusercontent.com/TrixxerTrix/sork/main/"
local userIS = game:GetService("UserInputService")
local tweenSE = game:GetService("TweenService")
local debrisSE = game:GetService("Debris")
local callbackCache = {}
local gamesDictionary = (function()
	local rawDictionary = game:HttpGet(repositoryPrefix .. "gamesDictionary.lua")
	local actualDictionary = loadstring(rawDictionary)()
	return actualDictionary
end)()
local currentGameDictionary = gamesDictionary[game.PlaceId]
if not (currentGameDictionary) then
	error("game dictionary doesnt exist")
end
for _, c in next, game:GetService("CoreGui"):GetChildren() do
	if c.Name:sub(1, 4) == "kroS" then
		c:Destroy()
	end
end
getgenv().sork = {}
getgenv().sork.global = {}

local function generateRandomString()
	return ("."):rep(16):gsub(".",function() return string.char(math.random(32, 126)) end)
end

function dragify(frame)
	local dragToggle, dragInput, dragStart, dragPos, startPos = nil, nil, nil, nil, nil
	local dragSpeed = 0.5

	local function updateInput(input)
		local Delta = input.Position - dragStart
		local Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
		tweenSE:Create(frame, TweenInfo.new(0.30), {Position = Position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and userIS:GetFocusedTextBox() == nil then
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	frame.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	userIS.InputChanged:Connect(function(input)
		if input == dragInput and dragToggle then
			updateInput(input)
		end
	end)
end

local newGui = Instance.new("ScreenGui")
newGui.Parent, newGui.Name = game:GetService("CoreGui"), string.reverse("Sork") .. generateRandomString()
newGui.ResetOnSpawn = false
syn.protect_gui(newGui)

local backgroundFrame = Instance.new("Frame")
backgroundFrame.ClipsDescendants = true
backgroundFrame.Parent = newGui
backgroundFrame.AnchorPoint = Vector2.new(0.5, 0.5)
backgroundFrame.Size = UDim2.new(0, 0, 0, 25)
backgroundFrame.Position = UDim2.new(0.5,0,0.5,0)
backgroundFrame.Visible = false
backgroundFrame.BackgroundTransparency, backgroundFrame.BackgroundColor3, backgroundFrame.BorderSizePixel = 0.5, Color3.new(0,0,0), 0
dragify(backgroundFrame)

local scrollOptionsFrame = Instance.new("ScrollingFrame")
scrollOptionsFrame.BottomImage, scrollOptionsFrame.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png", "rbxasset://textures/ui/Scroll/scroll-middle.png"
scrollOptionsFrame.ScrollBarThickness = 5
scrollOptionsFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
scrollOptionsFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollOptionsFrame.Parent = backgroundFrame
scrollOptionsFrame.ScrollBarImageColor3 = Color3.new(1,1,1)
scrollOptionsFrame.BackgroundTransparency = 1
scrollOptionsFrame.Size = UDim2.new(0, 382, 0, 150)
scrollOptionsFrame.Position = UDim2.new(0,17,0,44)

local TEMPUiListLayout = Instance.new("UIListLayout")
TEMPUiListLayout.Parent = scrollOptionsFrame
TEMPUiListLayout.Padding = UDim.new(0, 5)
TEMPUiListLayout.FillDirection = Enum.FillDirection.Vertical
TEMPUiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
TEMPUiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
TEMPUiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top

for index, callbacksChild in next, currentGameDictionary.stuff do
	-- what type is it??????????
	local type = callbacksChild.type
	local callback
	if not callbackCache[index] then
		callback = loadstring(game:HttpGet(repositoryPrefix .. "callbacks/" .. callbacksChild.callback))
		callbackCache[index] = callback
	else callback = callbackCache[index] end
	if type == "button" then
		local newButton = Instance.new("TextButton")
		newButton.BorderSizePixel = 0
		newButton.BackgroundTransparency = 0.5
		newButton.BackgroundColor3 = Color3.new(0,0,0)
		newButton.Font = Enum.Font.Gotham
		newButton.Text = callbacksChild.name or "Button"
		newButton.TextScaled = true
		newButton.TextColor3 = Color3.new(1,1,1)
		newButton.Parent = scrollOptionsFrame
		newButton.AutoButtonColor = false
		newButton.TextXAlignment = Enum.TextXAlignment.Left
		newButton.TextYAlignment = Enum.TextYAlignment.Center
		newButton.Size = UDim2.new(0,365,0,30)
		newButton.Activated:Connect(callback)
		Instance.new("UICorner", newButton)
	end
end

local topbar = Instance.new("Frame")
topbar.Parent = backgroundFrame
topbar.Size = UDim2.new(1, 0, 0, 25)
topbar.BackgroundTransparency, topbar.BackgroundColor3, topbar.BorderSizePixel = 0.5, Color3.new(0,0,0), 0

local topbarTextLabel = Instance.new("TextLabel")
topbarTextLabel.Parent = topbar
topbarTextLabel.BackgroundTransparency = 1
topbarTextLabel.Font = Enum.Font.Gotham
topbarTextLabel.TextScaled = true
topbarTextLabel.Size = UDim2.new(0.979, 0, 1, 0)
topbarTextLabel.TextXAlignment = Enum.TextXAlignment.Left
topbarTextLabel.TextColor3 = Color3.new(1,1,1)
topbarTextLabel.Position = UDim2.new(0.021, 0, 0, 0)
topbarTextLabel.Text = currentGameDictionary.title

task.wait(.25)
coroutine.wrap(function()
	backgroundFrame.Visible = true
	backgroundFrame:TweenSize(UDim2.new(0, 400, 0, 25), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true, nil)
	task.delay(0.5, function()
		backgroundFrame:TweenSize(UDim2.new(0, 400, 0, 215), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.5, true, nil)
	end)
end)()
