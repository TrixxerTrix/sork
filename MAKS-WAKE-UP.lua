if not game:IsLoaded() then
	game.Loaded:Wait()
end
game:GetService("ContentProvider"):PreloadAsync({"http://www.roblox.com/asset/?id=6021874488"})

-- == VERY Useful Stuff == --

local function new(class, parent, properties)
	assert(class, "class isn't present")
	---   ---   ---
	local new = Instance.new(class)
	new.Parent = parent
	---   ---   ---
	for key, value in next, properties do
		new[key] = value
	end
	---   ---   ---
	return new
end

local start = os.clock()

-- == IMPORTANT == --

-- putting this here because idk where to put it
local quotes = {"swag like ohio", "fumofumo", "hhhhhh", "doors players when flicker", "down like ohio", "hw t hcak: instal jjsplot", "print(\"Hello, world!\")"}

-- Services --
local rs = game:GetService("ReplicatedStorage")
local tween = game:GetService("TweenService")
local lighting = game:GetService("Lighting")
local plrs = game:GetService("Players")
local debris = game:GetService("Debris")
local core = game:GetService("CoreGui")

-- Start making the loading gui, okay? --
local started = new("BindableEvent", nil, {})
coroutine.resume(coroutine.create(function()
	local gui = new("ScreenGui", core, {IgnoreGuiInset = true})
	local blur = new("BlurEffect", workspace.CurrentCamera, {Size = 0, Enabled = true})
	local overlay = new("Frame", gui, {BackgroundColor3 = Color3.new(), BackgroundTransparency = 1, Size = UDim2.new(1,0,1,0), BorderSizePixel = 0})
	local icon = new("ImageLabel", overlay, {AnchorPoint = Vector2.new(.5,.5), BackgroundTransparency = 1, Image = "http://www.roblox.com/asset/?id=6021874488", ImageTransparency = 1, Size = UDim2.new(0.156, 0, 0.278, 0),ScaleType = Enum.ScaleType.Fit, Position = UDim2.new(0.5,0,0.5,0)})
	local title = new("TextLabel", overlay, {AnchorPoint = Vector2.new(.5,.5), BackgroundTransparency = 1, Font = Enum.Font.GothamMedium, Text = "trix_lib.exe", TextScaled = true, TextColor3 = Color3.new(1,1,1), Size = UDim2.new(0.163, 0, 0.056, 0), Position = UDim2.new(0.5, 0, 0.5, 0), TextTransparency = 1})
	local subtitle = new("TextLabel", overlay, {AnchorPoint = Vector2.new(.5,.5), BackgroundTransparency = 1, Font = Enum.Font.Gotham, Text = quotes[Random.new():NextInteger(1, #quotes)], TextScaled = true, TextColor3 = Color3.new(1,1,1), Size = UDim2.new(0.181, 0, 0.026, 0), Position = UDim2.new(0.5, 0, 0.554, 0), TextTransparency = 1})
	local icontween = tween:Create(icon, TweenInfo.new(2, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut), {Rotation = 360})
	local startedbool = false

	tween:Create(overlay, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = .35}):Play()
	tween:Create(blur, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = 24}):Play()
	started.Event:Once(function()
		startedbool = true
	end)

	task.wait(1)
	tween:Create(icon, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
	repeat
		icontween:Play()
		icontween.Completed:Wait()
		icon.Rotation = 0
	until startedbool

	local out = tween:Create(icon, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 1})
	out:Play()
	out.Completed:Wait() 

	local titletween = tween:Create(title, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0})
	titletween:Play()
	titletween.Completed:Wait()

	task.wait(2)

	local subtitletween = tween:Create(subtitle, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 0.5, Position = UDim2.new(0.5, 0, 0.528, 0)})
	local titletween_2 = tween:Create(title, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, 0.487, 0)})

	subtitletween:Play()
	titletween_2:Play()

	subtitletween.Completed:Wait()
	task.wait(3)

	tween:Create(title, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	tween:Create(subtitle, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
	task.wait(1)
	tween:Create(overlay, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
	tween:Create(blur, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = 0}):Play()
	debris:AddItem(blur, 1)
	debris:AddItem(gui, 1)
end))

-- Instances --

-- Constants --

-- Variables --

-- Functions --

-- == CORE == --

-- Start --
task.wait(15)
started:Fire()

-- Connections --

-- Loops --
