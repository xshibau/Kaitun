getgenv().Settings = {
     Startwebhookv2 = nil,
     Webhook = nil, FullBlack = nil, FullWhite = nil,
}
local FileName = tostring(game.Players.LocalPlayer.UserId).."_Settings.json"
local BaseFolder = "AuraHub"
local SubFolder = "AuraHubSave"

function SaveSetting() 
    local json
    local HttpService = game:GetService("HttpService")
    
    if writefile then
        json = HttpService:JSONEncode(getgenv().Settings)

        if not isfolder(BaseFolder) then
            makefolder(BaseFolder)
        end
        if not isfolder(BaseFolder.."/"..SubFolder) then
            makefolder(BaseFolder.."/"..SubFolder)
        end
        
        writefile(BaseFolder.."/"..SubFolder.."/"..FileName, json)
    else
        error("ERROR: Can't save your settings")
    end
end

function LoadSetting()
    local HttpService = game:GetService("HttpService")
    if readfile and isfile and isfile(BaseFolder.."/"..SubFolder.."/"..FileName) then
        getgenv().Settings = HttpService:JSONDecode(readfile(BaseFolder.."/"..SubFolder.."/"..FileName))
    end
end

LoadSetting()

game.StarterGui:SetCore("SendNotification", {
    Title = "Aura Hub",
    Text = "Success Loading",
    Icon = "rbxthumb://type=Asset&id=131484641795167&w=420&h=420",
    Duration = 5,
    Callback = function()
    end
})
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Aura Hub- Build a Zoo Kaitun [Premium]" ,
    SubTitle = "Ziugpro",
    TabWidth = 130,
    Size = UDim2.fromOffset(505, 345),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})
local Tabs = {
    Main = Window:AddTab({ Title = "Tab Kaitun", Icon = "" }),
    
}
task.spawn(function()
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

Lighting.GlobalShadows = false
Lighting.FogEnd = 1e8
Lighting.Brightness = 1
Lighting.OutdoorAmbient = Color3.fromRGB(127,127,127)
Lighting.ShadowSoftness = 0
Lighting.ColorShift_Bottom = Color3.fromRGB(127,127,127)
Lighting.ColorShift_Top = Color3.fromRGB(127,127,127)
Lighting.Saturation = 0
Lighting.ClockTime = 12

for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") then
        v.Material = Enum.Material.Plastic
        v.Reflectance = 0
        v.CastShadow = false
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Enabled = false
    elseif v:IsA("Decal") or v:IsA("Texture") then
        v.Transparency = 1
    elseif v:IsA("Texture") then
        v:Destroy()
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    for _, v in pairs(Workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
            v.CastShadow = false
        end
    end
end)
end)

  Tabs.Main:AddButton({
        Title = "Start Kaitun",
        Description = "",
        Callback = function()
		local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local hrp = character:WaitForChild("HumanoidRootPart")
      local targetCFrame = CFrame.new(-464.9268798828125, 14.486897468566895, -53.86560821533203)
   
      local UIS = game:GetService("UserInputService")
       local VIM = game:GetService("VirtualInputManager")

      spawn(function()
          while true do
              if (hrp.Position - targetCFrame.Position).magnitude > 1 then
                  hrp.CFrame = targetCFrame
              end
              wait(0.05)
          end
      end)

      spawn(function()
          while true do
              VIM:SendMouseButtonEvent(0,0,0,true,game,0)
              VIM:SendMouseButtonEvent(0,0,0,false,game,0)
              wait(0.1)
              end
            end)
        end
    })
local Main = Tabs.Main:AddSection("Webhook")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local Input = Tabs.Main:AddInput("Webhook", {
    Title = "Webhook URL",
    Default = getgenv().Settings.Webhook or "",
    Placeholder = "",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        getgenv().Settings.Webhook = Value
        SaveSetting()
    end
})

local Toggle = Tabs.Main:AddToggle("Startwebhookv2", {
    Title = "Start Webhook",
    Default = getgenv().Settings.Startwebhookv2 or false,
    Callback = function(Value)
        getgenv().Settings.Startwebhookv2 = Value
        SaveSetting()
        if Value and getgenv().Settings.Startwebhookv2 then
            HttpService:PostAsync(getgenv().Settings.Webhook, HttpService:JSONEncode({username="Aura Hub", content="Startwebhook"}))
            for _, player in pairs(Players:GetPlayers()) do
                local function TrackCharacter(char)
                    local humanoid = char:WaitForChild("Humanoid")
                    local root = char:WaitForChild("HumanoidRootPart")
                    local lastPos = root.Position
                    humanoid.Died:Connect(function()
                        if getgenv().Settings.Startwebhook then
                            HttpService:PostAsync(getgenv().Settings.Webhook, HttpService:JSONEncode({username="Aura Hub", content=player.Name.." died"}))
                        end
                    end)
                    RunService.Heartbeat:Connect(function()
                        if getgenv().Settings.Startwebhookv2 and (root.Position - lastPos).Magnitude > 0 then
                            lastPos = root.Position
                            HttpService:PostAsync(getgenv().Settings.Webhook, HttpService:JSONEncode({username="Aura Hub", content=player.Name.." on the move"}))
                        end
                    end)
                end
                if player.Character then TrackCharacter(player.Character) end
                player.CharacterAdded:Connect(TrackCharacter)
            end
        end
    end
})
local Main = Tabs.Main:AddSection("Settings")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = PlayerGui

local BlackFrame = Instance.new("Frame")
BlackFrame.Size = UDim2.new(1,0,1,0)
BlackFrame.Position = UDim2.new(0,0,0,0)
BlackFrame.BackgroundColor3 = Color3.new(0,0,0)
BlackFrame.Visible = getgenv().Settings.FullBlack or false
BlackFrame.Parent = ScreenGui

local WhiteFrame = Instance.new("Frame")
WhiteFrame.Size = UDim2.new(1,0,1,0)
WhiteFrame.Position = UDim2.new(0,0,0,0)
WhiteFrame.BackgroundColor3 = Color3.new(1,1,1)
WhiteFrame.Visible = getgenv().Settings.FullWhite or false
WhiteFrame.Parent = ScreenGui

local ToggleBlack = Tabs.Main:AddToggle("FullBlack", {
    Title = "Full Black",
    Default = getgenv().Settings.FullBlack or false,
    Callback = function(Value)
        BlackFrame.Visible = Value
        if Value then WhiteFrame.Visible = false end
        getgenv().Settings.FullBlack = Value
        SaveSetting()
    end
})

local ToggleWhite = Tabs.Main:AddToggle("FullWhite", {
    Title = "Full White",
    Default = getgenv().Settings.FullWhite or false,
    Callback = function(Value)
        WhiteFrame.Visible = Value
        if Value then BlackFrame.Visible = false end
        getgenv().Settings.FullWhite = Value
        SaveSetting()
    end
})
repeat wait() until game:IsLoaded() and game.Players.LocalPlayer
getgenv().Image = "rbxthumb://type=Asset&id=106019376492019&w=420&h=420"
getgenv().ToggleUI = "RightControl"

task.spawn(function()
    if not getgenv().LoadedMobileUI then
        getgenv().LoadedMobileUI = true
        local OpenUI = Instance.new("ScreenGui")
        local ImageButton = Instance.new("ImageButton")
        local UICorner = Instance.new("UICorner")
        OpenUI.Name = "OpenUI"
        OpenUI.Parent = game:GetService("CoreGui")
        OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        ImageButton.Parent = OpenUI
        ImageButton.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
        ImageButton.BackgroundTransparency = 0.8
        ImageButton.Position = UDim2.new(0, 20, 0, 25)
        ImageButton.Size = UDim2.new(0, 50, 0, 50)
        ImageButton.Image = getgenv().Image
        ImageButton.Draggable = true
        ImageButton.Transparency = 1
        UICorner.CornerRadius = UDim.new(0,13)
        UICorner.Parent = ImageButton
        ImageButton.MouseButton1Click:Connect(function()
            game:GetService("VirtualInputManager"):SendKeyEvent(true, getgenv().ToggleUI, false, game)
        end)
    end
end)
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:SetFolder("AuraHub")
InterfaceManager:SetFolder("AuraHubSave")

SaveManager:BuildConfigSection(Tabs.Sv)
InterfaceManager:BuildInterfaceSection(Tabs.Sv)
