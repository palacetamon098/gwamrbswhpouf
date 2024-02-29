spawn(function() 
    repeat
        task.wait()
    until game:IsLoaded()
    repeat
        task.wait()
    until game.Players
    repeat
        task.wait()
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Team ~= nil 
    wait(.3)
    require(game.ReplicatedStorage.Notification).new("<Color=Purple> ty for using mbm Hub <Color=/>"):Display()
    require(game.ReplicatedStorage.Notification).new("<Color=Yellow>Discord : https://dsc.gg/m1m <Color=/>"):Display()
    require(game.ReplicatedStorage.Notification).new("<Color=Blue> Have fun:) <Color=/>"):Display()
end)


local AutoJoinTeam = "Marines" -- "Marines" or "Pirates"

local function setPlayerTeam(teamName)
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local player = game:GetService("Players").LocalPlayer
    local playerGui = player.PlayerGui
    local backpack = player.Backpack
    local character = player.Character

    replicatedStorage.Remotes["CommF_"]:InvokeServer("SetTeam", teamName)

    local elementsToShow = {
        "RaceEnergy", "Compass", "Energy", "AlliesButton", "Code",
        "CrewButton", "HomeButton", "Mute", "Settings", "MenuButton",
        "Beli", "Fragments", "Level", "HP"
    }

    local chooseTeamFrame = playerGui.Main:FindFirstChild("ChooseTeam")
    if chooseTeamFrame then
        chooseTeamFrame:Destroy()
    end

    for _, elementName in pairs(elementsToShow) do
        local element = playerGui.Main[elementName]
        if element then
            element.Visible = (elementName == "RaceEnergy") and (backpack:FindFirstChild("Awakening") or character:FindFirstChild("Awakening")) or true
        end
    end

    local camera = game:GetService("Workspace").CurrentCamera
    camera.CameraType = Enum.CameraType.Custom
    camera.CameraSubject = character.Humanoid
    camera.CFrame = character.HumanoidRootPart.CFrame
end

setPlayerTeam(AutoJoinTeam)
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
	Title = "mbm Hub",
	SubTitle = "https://dsc.gg/m1m",
	TabWidth = 100,
	Size = UDim2.fromOffset(400, 300),
	Acrylic = true,
	Theme = "Rose",
	MinimizeKey = Enum.KeyCode.LeftControl
})

game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetTeam","Pirates")

wait(0.1)

if not game:IsLoaded() then repeat game.Loaded:Wait() until game:IsLoaded() end

if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
    repeat wait()
        if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main").ChooseTeam.Visible == true then
            if _G.Team == "Pirate" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
                    v.Function()
                end
            elseif _G.Team == "Marine" then
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
                    v.Function()
                end
            else
                for i, v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do                                                                                                
                    v.Function()
                end
            end
        end
    until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded()
end

local onTabs = {
    Main = Window:AddTab({ Title = "Chest Farm", Icon = "11825955075" }),
}

onTabs.Main:AddButton({
    Title = "discord server link",
    Description = "join",
    Callback = function()
        setclipboard("https://discord.gg/X9pFnURqTS")

                    end
                })

    onTabs.Main:AddButton({
        Title = "hop server",
        Description = "",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/m1M-Plqer819/hop/main/server/every"))()
    
                        end
                    })

    local Chest = onTabs.Main:AddToggle("Auto Chest", {Title = "Auto Chest bp", Default = true })
Chest:OnChanged(function(toggled)
	if toggled then
		_G.ChestBypass = true
	else
		_G.ChestBypass = false
	end
end)

spawn(function()
	while wait() do
	if _G.ChestBypass then
	pcall(function()
	for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
	  if string.find(v.Name, "Chest") then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
		  wait(.15)
	  end
	end
	game.Players.LocalPlayer.Character.Head:Destroy()
	for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
	if string.find(v.Name, "Chest") and v:IsA("TouchTransmitter") then
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0) --0 is touch
	wait()
	firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1) -- 1 is untouch
	end
	end
	end)
	end
	end
	end)
	
	spawn(function()
	while task.wait() do
	if _G.ChestBypass then
		local ohString1 = "SetTeam"
		local ohString2 = "Pirates"
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
	 end
	end
	end)	
repeat wait() until game:IsLoaded()
aut = true

function totarget(CFgo)
    local tween_s = game:service"TweenService"
    local info = TweenInfo.new((game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.Position - CFgo.Position).Magnitude/250, Enum.EasingStyle.Linear)
    local tween, err = pcall(function()
        tween = tween_s:Create(game.Players.LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = CFgo})
        tween:Play()
    end)
    if not tween then return err end
end


function thisCode()
    repeat task.wait() until game:IsLoaded()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                    wait(4)
                end
            end
        end
    end
    
    function Teleport()
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    local veryImportantWaitTime = 0.5
    task.spawn(function()
        while task.wait(veryImportantWaitTime) do
            pcall(function()
                for i,v in pairs(game.CoreGui:GetDescendants()) do
                    pcall(function()
                        if string.find(v.Name,"ErrorMessage") then
                            if string.find(v.Text,"Security kick") then
                                veryImportantWaitTime = 1e9
                                Teleport()
                            end
                        end
                    end)
                end
            end)
        end
    end)
    
aut = true
    
function auto()
    if aut == true then
    task.spawn(function()
        while aut == true do
            if aut == true then
                local hasChar = game.Players.LocalPlayer:FindFirstChild("Character")
                if not game.Players.LocalPlayer.Character then
        
                else
                    local hasCrewTag = game.Players.LocalPlayer.Character:FindFirstChild("CrewBBG",true)
                    if hasCrewTag then hasCrewTag:Destroy() end
                    local hasHumanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
                    if hasHumanoid then
                        local Chest = game.Workspace:FindFirstChild("Chest4") or game.Workspace:FindFirstChild("Chest3") or game.Workspace:FindFirstChild("Chest2")
                        
                                                if Chest then
                            game.Players.LocalPlayer.Character:PivotTo(Chest:GetPivot())
                            firesignal(Chest.Touched,game.Players.LocalPlayer.Character.HumanoidRootPart)
                        else
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
         aut = false
                            Teleport()
                            break
                        end
                    end 
                end
            end
            end
            task.wait()
            end
    end)

end
end
end
thisCode()
auto()
task.spawn(function()
while wait() do
    if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
         aut = false
end
end
end)

task.spawn(function()
    while wait() do
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Character:FindFirstChild("Fist of Darkness") or game.Players.LocalPlayer.Backpack:FindFirstChild("God's Chalice") or game.Players.LocalPlayer.Character:FindFirstChild("God's Chalice") then
             _G.ChestBypass = false
    end
    end
    end)

join = game.Players.localPlayer.Neutral == false
if _G.Team == nil then
    _G.Team = "Pirates"
end
_G.Team = "Marines"
if (_G.Team == "Pirates" or _G.Team == "Marines") and not join then
    repeat wait()
        pcall(function()
            join = game.Players.localPlayer.Neutral == false
            if _G.Team == "Pirates" then
                for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton[v])) do
                        v.Function()
                    end
                end
            elseif _G.Team == "Marines" then
                for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
                        v.Function()
                    end
                end
            else
                for i,v in pairs({"MouseButton1Click", "MouseButton1Down", "Activated"}) do
                    for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Marines.Frame.ViewportFrame.TextButton[v])) do
                        v.Function()
                    end
                end
            end
        end)
    until join == true
    game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Visible = false
end
--15582682098--mbm  x  Hub
print("made by minh hub")
print("mbm x hub")
print("join my discord server : https://dsc.gg/m1m-link")
print("bio : https://bio.site/m1m")
print("ty for using - have fun")
print("sk")
print("wait ,.,")
print("LCTSV - .,.")  

task.delay(1.5 * 30,function() -- hop every  min
   
    loadstring(game:HttpGet("https://raw.githubusercontent.com/m1M-Plqer819/hop/main/server/every"))()
       end)
function AntiBan()
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "General" or v.Name == "Shiftlock"  or v.Name == "FallDamage" or v.Name == "4444" or v.Name == "CamBob" or v.Name == "JumpCD" or v.Name == "Looking" or v.Name == "Run" then
                v:Destroy()
            end
        end
     end
     for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerScripts:GetDescendants()) do
        if v:IsA("LocalScript") then
            if v.Name == "RobloxMotor6DBugFix" or v.Name == "Clans"  or v.Name == "Codes" or v.Name == "CustomForceField" or v.Name == "MenuBloodSp"  or v.Name == "PlayerList" then
                v:Destroy()
            end
        end
     end
    end
    AntiBan()
    spawn(function()
        while wait() do
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name == "red_game43" or v.Name == "rip_indra" or v.Name == "Axiore" or v.Name == "Polkster" or v.Name == "wenlocktoad" or v.Name == "Daigrock" or v.Name == "toilamvidamme" or v.Name == "oofficialnoobie" or v.Name == "Uzoth" or v.Name == "Azarth" or v.Name == "arlthmetic" or v.Name == "Death_King" or v.Name == "Lunoven" or v.Name == "TheGreateAced" or v.Name == "rip_fud" or v.Name == "drip_mama" or v.Name == "layandikit12" or v.Name == "Hingoi" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/m1M-Plqer819/hop/main/server/every"))()
                end
            end
        end
    end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("mbm hub")
SaveManager:SetFolder("auto chest")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()
