local Config = {
    WindowName = "michaelhook_",
	Color = Color3.fromRGB(0,102,204),
	Keybind = Enum.KeyCode.RightBracket
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))


local Tab1 = Window:CreateTab("Main")
local Tab5 = Window:CreateTab("Settings")

local Section1 = Tab1:CreateSection("Generic")
local Section2 = Tab1:CreateSection("Other")
local Section3 = Tab1:CreateSection("Extra")
local Section4 = Tab1:CreateSection("Statuses")
local Section5 = Tab1:CreateSection("Visuals")
local Section6 = Tab1:CreateSection("Environment")
local Section10 = Tab5:CreateSection("Menu")
local Section11 = Tab5:CreateSection("Game")


-------------
local Button1 = Section1:CreateButton("Reset", function()
  game.Players.LocalPlayer.Character.Humanoid.Health = 0   
end)
local Button1 = Section1:CreateButton("Castle Rock", function()
fireclickdetector(Workspace['The Eagle'].ClickDetector)
wait(12)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5811.08, 415.934, 640.337)
end)
local Button1 = Section1:CreateButton("Sell Items", function()
   fireclickdetector(Workspace.NPCs.Merchants.Merchant.ClickDetector) 
end)    
local Toggle1 = Section2:CreateToggle("Staff Detector", nil, function()
  local Mods = {
 ["EvilRagoozer"] = true,
        ["TheGreatAnubis"] = true,
        ["nijiroe"] = true,
        ["Cyanthian"] = true,
        ["naruto10123n"] = true,
        ["EtherealDreams"] = true,
        ["pedrogonzales2006"] = true,
        ["MaximumButter"] = true,
        ["KHEISGHEI"] = true,
        ["imhypershadow"] = true,
        ["EvilRagoozer"] = true,
        ["Enyberu"] = true,
        ["stuckingaia"] = true,
        ["21Bleach12"] = true,
        ["Tsubakura_Enraku"] = true,
        ["Matrodeus"] = true,
        ["CirnoBliss"] = true,
        ["senri_xfx"] = true,
        ["Yabusame_Houlen"] = true,
        ["desert_2b"] = true,
        ["Budoti"] = true,
        ["Nhodkf"] = true,
        ["ShadowLegendShock"] = true,
        ["AstralVxbes"] = true,
        ["OniTaiji"] = true,
        ["avamawe"] = true,
        ["Zionlolkahns1294"] = true,
        ["Cirnobro"] = true,
        ["Halfalt_1"] = true,
}
 
local function newSound()
    local Sound = Instance.new("Sound", game.Players.LocalPlayer.PlayerGui)
    Sound.SoundId = "rbxassetid://405321226"
    Sound.Volume = 5
    Sound:Play()
    Sound.Ended:connect(function()
        Sound:Destroy()
    end)
end
 
for k,v in pairs(game.Players:GetChildren()) do
    if Mods[v.Name] then
        newSound()
        game:GetService("StarterGui"):SetCore("SendNotification", {
           Title = "Moderator Notification",
           Text = v.Name,
           Duration = 10,
           Button1 = "Ignore"
        })
    end
end
 
game.Players.PlayerAdded:connect(function(Player)
    if Mods[Player.Name] then
        newSound()
        game:GetService("StarterGui"):SetCore("SendNotification", {
           Title = "Moderator Notification",
           Text = Player.Name,
           Duration = 10,
           Button1 = "Ignore"
        })
    end
end)
 
game.Players.PlayerRemoving:connect(function(Player)
    if Mods[Player.Name] then
        game:GetService("StarterGui"):SetCore("SendNotification", {
           Title = "Moderator has left",
           Text = Player.Name,
           Duration = 10,
        })
    end
end)  
end)
local Toggle1 = Section2:CreateToggle("Spectate Players", nil, function()
local PlayerGui = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui')
local Leaderboard = PlayerGui:WaitForChild("LeaderboardGui")
local MainFrame = Leaderboard:WaitForChild("MainFrame")
local ScrollingFrame = MainFrame:WaitForChild("ScrollingFrame")

function createButtons()
    for i,v in pairs(ScrollingFrame:GetChildren()) do
        local Player
        local TextButton = Instance.new("TextButton",ScrollingFrame)
        TextButton.Name = "SpectateButton"
        TextButton.Size = v.Size
        TextButton.Text = ""
        TextButton.Transparency = 1
        TextButton.Position = v.Position
        TextButton.MouseButton1Click:Connect(function()
            for _,otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer.Name == v.Text:gsub(" ","") then
                    Player = otherPlayer
                end
            end
            local Character = Player.Character or Player.CharacterAdded:Wait()
            workspace.CurrentCamera.CameraSubject = Character.Humanoid
        end)
    end
end

while wait(1) do
    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "SpectateButton" then
            v:Destroy()
        end
    end
    createButtons()
end  
end)
local Toggle1 = Section4:CreateToggle("Autopick up", nil, function()
 pcall(function()
    local Players               = game:GetService'Players';
    local LocalPlayer           = Players.LocalPlayer;
    local Camera                = workspace.CurrentCamera;
    local RunService            = game:GetService'RunService';
    local UIS                   = game:GetService'UserInputService';
    local NearestObject         = nil;
    local LastObject            = NearestObject;
    local LastCheck             = 0;
    local TrinketAP             = true;
    local Enabled               = true; 
    shared.Blacklist            = shared.Blacklist or {};
     
    local Clickables = {};
    local TP = {};
    local Trinkets = {};
     
     
    for i, v in pairs(workspace:GetDescendants()) do
        if v.ClassName == 'ClickDetector' and (v.Parent:IsA'BasePart' or v.Parent:IsA'UnionOperation') then
            table.insert(Clickables, v.Parent);
            TP[tostring(v.Parent.Position)] = v;
        end
    end
     
    for i, v in pairs(workspace:GetChildren()) do
        if (v:IsA'BasePart' or v:IsA'UnionOperation') and TP[tostring(v.Position)] ~= nil then
            -- Trinkets[#Trinkets + 1] = {v, }
            table.insert(Trinkets, v);
        end
    end
     
    if shared.WSDC then shared.WSDC:disconnect(); end
     
    shared.WSDC = workspace.DescendantAdded:connect(function(child)
        if (child:IsA'BasePart' or child:IsA'UnionOperation') and wait(1 / 3) then
            if child:FindFirstChildOfClass'ClickDetector' then
                table.insert(Clickables, child);
                TP[tostring(child.Position)] = child:FindFirstChildOfClass'ClickDetector';
            end
            if TP[tostring(child.Position)] ~= nil then
                table.insert(Trinkets, child);
            end
        end
    end);
     
    function GetNearestObject()
        if #Trinkets < 1 then return false; end
     
        local Closest = Trinkets[math.random(#Trinkets)];
        local Distance = (Camera.CFrame.p - Closest.Position).magnitude;
     
        for i, v in pairs(Trinkets) do
            local LDistance = (Camera.CFrame.p - v.Position).magnitude;
            if TrinketAP and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild'Head' and (LocalPlayer.Character.Head.Position - v.Position).magnitude <= 15 and TP[tostring(v.Position)] then
                fireclickdetector(TP[tostring(v.Position)]);
            end
            if LDistance < Distance and not shared.Blacklist[v] and v:IsDescendantOf(workspace) then
                Distance = LDistance;
                Closest = v;
            end
        end
     
        return Closest;
    end
     
     
    RunService:UnbindFromRenderStep'NOL';
     
    RunService:BindToRenderStep('NOL', 0, function()
        if Enabled and tick() - LastCheck > 2.5 / 8 then
            LastCheck     = tick();
            NearestObject = GetNearestObject();
        end
    end)
end)   
end)  
local Toggle1 = Section4:CreateToggle("Bagpick up", nil, function(v)
   getgenv().dag = v 
    while true do
        wait(.1)
        if not getgenv().dag then return end
for i,v in pairs(game:GetService("Workspace").DroppedBags:GetChildren()) do
wait()
if (v.CFrame.p-game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.p).magnitude<=math.huge then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
v.CanCollide = false
end
end
end  
end) 
local Toggle1 = Section4:CreateToggle("Anti Fall Damage", nil, function()
 while true do 
        wait(2)
    local char = game.Players.LocalPlayer.Character
char.FallDamage.Disabled = true
end   
end)
local Toggle1 = Section4:CreateToggle("Anti Kill Bricks", nil, function()
   for i,v in next, game.Workspace.Map.KillBricks:GetChildren() do
if v:FindFirstChild("TouchInterest") then
            v.TouchInterest:Destroy()
end 
        end 
end)
local Toggle1 = Section4:CreateToggle("Auto Charge", nil, function(v)
  getgenv().mana = v 
    while true do
        wait(1.2)
        if not getgenv().mana then return end
local args = {
    [1] = Enum.KeyCode.G,
    [2] = true
}

game:GetService("Players").LocalPlayer.Character.CharacterHandler.Remotes.KeyInput:FireServer(unpack(args))
end  
end)
local Toggle1 = Section4:CreateToggle("Auto Attack", nil, function(v)
    getgenv().atta = v 
    while true do
        wait(.1)
        if not getgenv().atta then return end
local ohBoolean1 = true

game.Players.LocalPlayer.Character.CharacterHandler.Remotes.M1:FireServer(ohBoolean1)
end   
end)
local Toggle1 = Section4:CreateToggle("Auto Train", nil, function(v)
local vuser = game:GetService("VirtualUser")
getgenv().at = v 
    while true do
        wait(1.5)
        if not getgenv().at then return end
    local args = {
    [1] = Enum.KeyCode.G,
    [2] = true
}

game:GetService("Players").LocalPlayer.Character.CharacterHandler.Remotes.KeyInput:FireServer(unpack(args))
vuser:CaptureController()
vuser:ClickButton1(Vector2.new(1735,28,3315))
end
end)    
local Toggle1 = Section4:CreateToggle("Show Health", nil, function()
local plrs = game:service'Players';

local function epic_esp(model)
local human = model:WaitForChild('Humanoid',5);
if human then
human.HealthDisplayDistance = 50;
human.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOn;
human.NameDisplayDistance = 100;
human.NameOcclusion = Enum.NameOcclusion.NoOcclusion;
end;
end;

for _,p in next,plrs:GetPlayers() do
if p.Character~=nil then epic_esp(p.Character) end;
p.CharacterAdded:Connect(function(c) epic_esp(c) end);
end;

plrs.PlayerAdded:Connect(function(p)
p.CharacterAdded:Connect(function(c) epic_esp(c) end) ;
end);game.Players.LocalPlayer.CameraMaxZoomDistance = 15000    
end)
local Toggle1 = Section3:CreateToggle("Flight", nil, function()
 repeat wait() until game.Players.LocalPlayer.Character

local fanim = Instance.new('Animation', workspace)
fanim.AnimationId = 'rbxassetid://7737928788'

local player = game.Players.LocalPlayer
local character = player.character
local humanoid = character:WaitForChild("Humanoid")
local torso = character:WaitForChild("Torso")
local mouse = player:GetMouse()

local track1 = humanoid:LoadAnimation(fanim)

local enabled = false

mouse.KeyDown:Connect(function(key)
    if key == "x" then
        if enabled == false then
            enabled = true
            if track1.IsPlaying then track1:Stop() end
            local bodyvelocity = Instance.new("BodyVelocity",torso)
            bodyvelocity.MaxForce = Vector3.new(math.huge,math.huge,math.huge)

            while enabled == true do
                if torso.Velocity.magnitude>0 then
                    if not track1.IsPlaying then track1:Play() end
                end
                bodyvelocity.Velocity = mouse.Hit.lookVector * 250
                wait()
            end

        end

        if enabled == true then
            track1:Stop()            
            enabled = false
            torso:FindFirstChildOfClass("BodyVelocity"):Destroy()
        end
    end
end)   
end)
Section3:CreateSlider("Walkspeed", 16, 250, nil, true, function(v)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end)

Section3:CreateSlider("Jump power", 50, 350, nil, true, function(jp)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = jp
end)
local Button = Section11:CreateButton("Leave Game", function()
    game.Players.LocalPlayer:Kick("  ")
end)
local Button = Section11:CreateButton("Join Lowest Server", function()
    local Request = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
local Playing, DataTable = {}, {}

for i, v in next, game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(Request)).data do
    if typeof(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
        table.insert(DataTable, v.id); table.insert(Playing, v.playing)
    end
end

local PlayingAmount = table.unpack(Playing)

local LowestPlayers; do
    if #Playing > 0 then
        for i, v in next, Playing do
            LowestPlayers = math.min(v)
        end
    end
end

--

if #DataTable ~= nil and (LowestPlayers < PlayingAmount) then
    return game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, DataTable[Random.new():NextInteger(1, #DataTable)])
end

return error("Failed to ServerHop.")
end)
local Button = Section11:CreateButton("Server Hop", function()
local request = game:HttpGetAsync('https://games.roblox.com/v1/games/'..game.PlaceId..'/servers/Public?sortOrder=Asc&limit=100')
local jobs = {};
for _,server in next, game:GetService('HttpService'):JSONDecode(request)['data'] do
   if (server.playing < server.maxPlayers) and (game.JobId~=server.id) then
       table.insert(jobs,server.id)
   end
end
game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, jobs[1])
end)
local Toggle1 = Section11:CreateToggle("Anti Afk", nil, function()
      for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
v:Disable()
end 
end)

--kiriot esp thx
local ESP = loadstring(game:HttpGet('https://raw.githubusercontent.com/zlPmxpo/eso/main/kiriot'))()

ESP:Toggle(true)
ESP.Boxes = false 
ESP.Names = false
ESP.Tracers = false 
ESP.TeamColor = false
ESP.FaceCamera = false

Section5:CreateToggle("Boxes",false,function(t)
	if firsttime == false then 
		ESP.Boxes = t 
	end
end)

Section5:CreateToggle("Nametags",false,function(t)
	if firsttime == false then 
		ESP.Names = t 
	end
end)

Section5:CreateToggle("Tracers",false,function(t)
	if firsttime == false then 
		ESP.Tracers = t 
	end
end)

Section5:CreateToggle("Team Colors",false,function(t)
	if firsttime == false then 
		ESP.TeamColor = t 
	end
end)

Section5:CreateToggle("Face Camera",false,function(t)
	if firsttime == false then 
		ESP.FaceCamera = t 
	end
end)

firsttime = false 
local Toggle1 = Section6:CreateToggle("No Fog", nil, function(v)
  getgenv().nofog = v 
    while true do
        wait(.1)
        if not getgenv().nofog then return end
game:GetService("Lighting").FogEnd = 100000   
end
end)
local Toggle1 = Section6:CreateToggle("Full Bright", nil, function()
local Light = game:GetService("Lighting")

function dofullbright()
Light.Ambient = Color3.new(1, 1, 1)
Light.ColorShift_Bottom = Color3.new(1, 1, 1)
Light.ColorShift_Top = Color3.new(1, 1, 1)
end

dofullbright()

Light.LightingChanged:Connect(dofullbright)    
end)
local Toggle1 = Section6:CreateToggle("Max Zoom", nil, function()
 game.Players.LocalPlayer.CameraMaxZoomDistance = 9e9   
end)
-------------
local Toggle3 = Section10:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
Toggle3:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
Toggle3:SetState(true)
