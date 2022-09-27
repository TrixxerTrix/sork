-- fumoorbit.lua
-- important!! awts gege

-- services
local plrs = game:GetService("Players")
local run = game:GetService("RunService")

-- constants
local playertoorbit = "namehere"
local localplayer = plrs.LocalPlayer
local nucleus, elec = workspace:FindFirstChild("Players"):FindFirstChild(playertoorbit).HumanoidRootPart, localplayer.Character.HumanoidRootPart
local revpermin, rad = .25, 5

local angle1 = Vector3.new(0.9, 0.7, 0.5)
local angle2 = Vector3.new(0, 0, 1)
-- change these in some ways that are really cool!!!!

local pi = math.pi
local cfnew = CFrame.new
local v3new = Vector3.new
local cos, sin = math.cos, math.sin
local beat = run.Heartbeat
local tk = tick
local rng = Random.new

-- signals

-- variables
local u, v

-- functions
-- you can also do stuff with these functions which is very cool, just change angle1 and angle2 in the loop to u and v
function getrng(): number
	return rng():NextNumber()*2-1
end

function rngv(): Vector3
	local x
	
	repeat
		x = Vector3.new(getrng(), getrng(), getrng())
	until x.Magnitude <= 1
	
	return x
end

function rngpair()
	local a, b = rngv(), rngv()
	return a:Cross(b).Unit, b.Unit
end

-- setup
u, v = rngpair()

-- code
while beat:Wait() do
	local t = tk() * (pi * 2) * revpermin
	--local orbit = v3new(cos(t), 0, sin(t))
	local orbit = angle1 * cos(t) + angle2 * sin(t)
	elec.CFrame = cfnew(nucleus.Position + orbit * rad)
end
