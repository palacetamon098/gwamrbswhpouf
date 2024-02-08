--- tao biet may la 1 skider nho doi ten 
--[[
_G.Team = "Pirates" -- "Pirates" or "Marines"
_G.FpsBoost = true -- fps booster
_G.Stoplegend = true -- stop when get legend items (God's Chalice , Fist Of Darkness)
_G.TimeReset = 1.5 -- time to reset
]]--

if _G.FpsBoost == true then
	pcall(function()
		game:GetService("Lighting").FantasySky:Destroy()
		local g = game
		local w = g.Workspace
		local l = g.Lighting
		local t = w.Terrain
		t.WaterWaveSize = 0
		t.WaterWaveSpeed = 0
		t.WaterReflectance = 0
		t.WaterTransparency = 0
		l.GlobalShadows = false
		l.FogEnd = 9e9
		l.Brightness = 0
		settings().Rendering.QualityLevel = "Level01"
		for i, v in pairs(g:GetDescendants()) do
			if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then 
				v.Material = "Plastic"
				v.Reflectance = 0
			elseif v:IsA("Decal") or v:IsA("Texture") then
				v.Transparency = 1
			elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA("Explosion") then
				v.BlastPressure = 1
				v.BlastRadius = 1
			elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then
				v.Enabled = false
			elseif v:IsA("MeshPart") then
				v.Material = "Plastic"
				v.Reflectance = 0
				v.TextureID = 10385902758728957
			end
		end
		for i, e in pairs(l:GetChildren()) do
			if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
				e.Enabled = false
			end
		end
		for i, v in pairs(game:GetService("Workspace").Camera:GetDescendants()) do
			if v.Name == ("Water;") then
				v.Transparency = 1
				v.Material = "Plastic"
			end
		end
	end)
end


--// Start Team
repeat wait() until game.Players
repeat wait() until game.Players.LocalPlayer
repeat wait() until game.ReplicatedStorage
repeat wait() until game.ReplicatedStorage:FindFirstChild("Remotes");
repeat wait() until game.Players.LocalPlayer:FindFirstChild("PlayerGui");
repeat wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main");
repeat wait() until game:GetService("Players")
repeat wait() until game:GetService("Players").LocalPlayer.Character:FindFirstChild("Energy")

wait(0.5)

if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

--// Farm Chest [Main]
_G.AutoFarmChest = true
   spawn(function()
        while true do 
                if _G.AutoFarmChest then
                    for i,v in pairs(game:GetService("Workspace"):GetChildren()) do 
                        if v.Name:find("Chest") then
                        	if (game:GetService("Workspace"):FindFirstChild(v.Name)) then
                            	game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
                            	if string.find(v.Name, "Chest") and v:IsA("TouchTransmitter") then
								   firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
							    end
                            end
                        end
                    end
                end
            end
        end)    
                        task.delay(1.5 * 30,function() -- hop every  min
   
                            loadstring(game:HttpGet("https://raw.githubusercontent.com/m1M-Plqer819/hop/main/server/every"))()
                               end)
                               spawn(function()
                                while wait() do
                                for i,v in pairs(game.Players:GetPlayers()) do
                                    if v.Name == "red_game43" or v.Name == "rip_indra" or v.Name == "Axiore" or v.Name == "Polkster" or v.Name == "wenlocktoad" or v.Name == "Daigrock" or v.Name == "toilamvidamme" or v.Name == "oofficialnoobie" or v.Name == "Uzoth" or v.Name == "Azarth" or v.Name == "arlthmetic" or v.Name == "Death_King" or v.Name == "Lunoven" or v.Name == "TheGreateAced" or v.Name == "rip_fud" or v.Name == "drip_mama" or v.Name == "layandikit12" or v.Name == "Hingoi" then
                                        loadstring(game:HttpGet("https://raw.githubusercontent.com/m1M-Plqer819/hop/main/server/every"))()
                                    end
                                end
                            end
                        end)
    spawn(function()
        while true do 
                if _G.AutoFarmChest and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Head") then
                	wait(_G.TimeReset)
					if _G.Team == "Pirates" or _G.Team == nil then
                		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
					elseif _G.Team == "Marines" then
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Marines")
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam", "Pirates")
					end
                end
			task.wait()
        end
    end)

--// Stop With Strange Item
spawn(function()
	while wait() do
		if _G.Stoplegend == true then
			if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
				_G.AutoFarmChest = false
			end
		end
	end
end)
   
--// Function Tween
function topos(Pos)
	Distance = (Pos.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
	if Distance < 25 then
		Speed = 5000
	elseif Distance < 50 then
		Speed = 2000
	elseif Distance < 150 then
		Speed = 800
	elseif Distance < 250 then
		Speed = 600
	elseif Distance < 500 then
		Speed = 300
	elseif Distance < 750 then
		Speed = 250
	elseif Distance >= 1000 then
		Speed = 200
	end
	game:GetService("TweenService"):Create(
		game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
		TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
		{CFrame = Pos}
	):Play()
end

--// Fast Attack
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CombatFrameworkR = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework)
y = debug.getupvalues(CombatFrameworkR)[2]
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if FastAttack then
            if typeof(y) == "table" then
                pcall(function()
                    CameraShaker:Stop()
                    y.activeController.timeToNextAttack = 0
                    y.activeController.hitboxMagnitude = 60
                    y.activeController.active = false
                    y.activeController.timeToNextBlock = 0
                    y.activeController.focusStart = 1655503339.0980349
                    y.activeController.increment = 1
                    y.activeController.blocking = false
                    y.activeController.attacking = false
                    y.activeController.humanoid.AutoRotate = true
                end)
            end
        end
    end)
end)
spawn(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if FastAttack then
            if game.Players.LocalPlayer.Character:FindFirstChild("Stun") then
                game.Players.LocalPlayer.Character.Stun.Value = 0
                game.Players.LocalPlayer.Character.Humanoid.Sit = false
                game.Players.LocalPlayer.Character.Busy.Value = false   
            end    
        end
    end)
end)

local CurveFrame = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts:WaitForChild("CombatFramework")))[2]
local VirtualUser = game:GetService("VirtualUser")
local RigControllerR = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework.RigController))[2]
local Client = game:GetService("Players").LocalPlayer
local DMG = require(Client.PlayerScripts.CombatFramework.Particle.Damage)
local CameraShaker = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShaker:Stop()
function CurveFuckWeapon()
    local p13 = CurveFrame.activeController
    local wea = p13.blades[1]
    if not wea then
        return
    end
    while wea.Parent ~= game.Players.LocalPlayer.Character do
        wea = wea.Parent
    end
    return wea
end

function getHits(Size)
    local Hits = {}
    local Enemies = workspace.Enemies:GetChildren()
    local Characters = workspace.Characters:GetChildren()
    for i = 1, #Enemies do
        local v = Enemies[i]
        local Human = v:FindFirstChildOfClass("Humanoid")
        if
            Human and Human.RootPart and Human.Health > 0 and
                game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 5
         then
            table.insert(Hits, Human.RootPart)
        end
    end
    for i = 1, #Characters do
        local v = Characters[i]
        if v ~= game.Players.LocalPlayer.Character then
            local Human = v:FindFirstChildOfClass("Humanoid")
            if
                Human and Human.RootPart and Human.Health > 0 and
                    game.Players.LocalPlayer:DistanceFromCharacter(Human.RootPart.Position) < Size + 5
             then
                table.insert(Hits, Human.RootPart)
            end
        end
    end
    return Hits
end



abc = true
task.spawn(function()
    local a = game.Players.LocalPlayer
    local b = require(a.PlayerScripts.CombatFramework.Particle)
    local c = require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)
    if not shared.orl then
        shared.orl = c.wrapAttackAnimationAsync
    end
    if not shared.cpc then
        shared.cpc = b.play
    end
    if abc then
        pcall(function()
            c.wrapAttackAnimationAsync = function(d, e, f, g, h)
            local i = c.getBladeHits(e, f, g)
            if i then
                b.play = function()
                    end
                    d:Play(0.25, 0.25, 0.25)
                    h(i)
                    b.play = shared.cpc
                    wait(.5)
                    d:Stop()
                end
            end
        end)
    end
end)
function AttackHit()
    local CombatFrameworkLib = debug.getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))
    local CmrFwLib = CombatFrameworkLib[2]
    local plr = game.Players.LocalPlayer
    for i = 1, 1 do
        local bladehit = require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},60)
        local cac = {}
        local hash = {}
        for k, v in pairs(bladehit) do
            if v.Parent:FindFirstChild("HumanoidRootPart") and not hash[v.Parent] then
                table.insert(cac, v.Parent.HumanoidRootPart)
                hash[v.Parent] = true
            end
        end
        bladehit = cac
        if #bladehit > 0 then
            pcall(function()
                CmrFwLib.activeController.timeToNextAttack = 1
                CmrFwLib.activeController.attacking = false
                CmrFwLib.activeController.blocking = false
                CmrFwLib.activeController.timeToNextBlock = 0
                CmrFwLib.activeController.increment = 3
                CmrFwLib.activeController.hitboxMagnitude = 100
                CmrFwLib.activeController.focusStart = 0
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(CurveFuckWeapon()))
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit", bladehit, i, "")
            end)
        end
    end
end

--// UI

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "mbm hub", HidePremium = false, SaveConfig = true, ConfigFolder = "mbm hub"})

local ifTab = Window:MakeTab({
	Name = "info",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local acTab = Window:MakeTab({
	Name = "auto chest",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

ifTab:AddButton({
	Name = "join my discord server!",
	Callback = function()
      		setclipboard("https://discord.gg/qGKmRGtkgk")
  	end    
})

ifTab:AddButton({
	Name = "my bio",
	Callback = function()
      	setclipboard("https://bio.site/m1m")
  	end    
})

acTab:AddToggle({
	Name = "auto chest",
	Default = true,
	Callback = function(Value)
		_G.AutoFarmChest = true
	end    
})

acTab:AddToggle({
	Name = "stop when get legend items",
	Default = true,
	Callback = function(Value)
		_G.Stoplegend = true
	end    
})

acTab:AddToggle({
	Name = "fps boost",
	Default = false,
	Callback = function(Value)
		_G.FpsBoost = true
	end    
})


