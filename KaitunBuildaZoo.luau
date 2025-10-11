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
              wait()
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
task.spawn(function ()
local Workspace = game:GetService("Workspace")

for _, v in pairs(Workspace:GetDescendants()) do
    if v:IsA("BasePart") then
        local col = v.Color
        if col ~= Color3.new(0.5,0.5,0.5) then
            v:Destroy()
        else
            v.Material = Enum.Material.Plastic
            v.Reflectance = 0
            v.CastShadow = false
        end
    elseif v:IsA("Model") then
        local destroyModel = false
        for _, child in pairs(v:GetDescendants()) do
            if child:IsA("BasePart") then
                local col = child.Color
                if col ~= Color3.new(0.5,0.5,0.5) then
                    destroyModel = true
                    break
                end
            elseif child:IsA("Decal") or child:IsA("Texture") or child:IsA("ParticleEmitter") or child:IsA("Trail") then
                destroyModel = true
                break
            end
        end
        if destroyModel then
            v:Destroy()
        end
    elseif v:IsA("Decal") or v:IsA("Texture") or v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v:Destroy()
    end
end
end)
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
