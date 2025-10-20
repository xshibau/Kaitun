getgenv().Image = "rbxthumb://type=Asset&id=106019376492019&w=420&h=420"
getgenv().ToggleUI = "RightShift"

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
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")

local screenGui = Instance.new("ScreenGui")
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = game:GetService("CoreGui")
CollectionService:AddTag(screenGui, "main")

local mainFrame = Instance.new("Frame")
mainFrame.BackgroundColor3 = Color3.fromRGB(219, 219, 219)
mainFrame.BackgroundTransparency = 0.4
mainFrame.BorderColor3 = Color3.fromRGB(28, 42, 54)
mainFrame.BorderSizePixel = 0
mainFrame.Position = UDim2.new(0.08152, 0, -0.15563, 0)
mainFrame.Size = UDim2.new(0.83424, 0, 1.11258, 0)
mainFrame.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.Parent = mainFrame

local innerFrame = Instance.new("Frame")
innerFrame.BackgroundColor3 = Color3.fromRGB(52, 52, 52)
innerFrame.BorderSizePixel = 0
innerFrame.BorderColor3 = Color3.fromRGB(28, 42, 54)
innerFrame.Position = UDim2.new(0.01954, 0, 0.02976, 0)
innerFrame.Size = UDim2.new(0.96417, 0, 0.94643, 0)
innerFrame.Parent = mainFrame

local innerCorner = Instance.new("UICorner")
innerCorner.Parent = innerFrame

local auraLabel = Instance.new("TextLabel")
auraLabel.TextWrapped = true
auraLabel.BorderSizePixel = 0
auraLabel.TextSize = 14
auraLabel.TextScaled = true
auraLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
auraLabel.FontFace = Font.new("rbxasset://fonts/families/Balthazar.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
auraLabel.Size = UDim2.new(0.96622, 0, 0.10692, 0)
auraLabel.Text = "Aura Hub | Premium"
auraLabel.Name = "aura"
auraLabel.Position = UDim2.new(0.01689, 0, 0.86792, 0)
auraLabel.Parent = innerFrame

local auraCorner = Instance.new("UICorner")
auraCorner.Parent = auraLabel

local imageLeft = Instance.new("ImageLabel")
imageLeft.BorderSizePixel = 0
imageLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
imageLeft.Image = "rbxthumb://type=Asset&id=95335710234242&w=420&h=420"
imageLeft.Size = UDim2.new(0.34122, 0, 0.83019, 0)
imageLeft.Position = UDim2.new(0.01689, 0, 0.01887, 0)
imageLeft.Parent = innerFrame

local leftCorner = Instance.new("UICorner")
leftCorner.Parent = imageLeft

local imageRight = Instance.new("ImageLabel")
imageRight.BorderSizePixel = 0
imageRight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
imageRight.Image = "rbxthumb://type=Asset&id=95335710234242&w=420&h=420"
imageRight.Size = UDim2.new(0.61486, 0, 0.83019, 0)
imageRight.Position = UDim2.new(0.36824, 0, 0.01887, 0)
imageRight.Parent = innerFrame

local rightCorner = Instance.new("UICorner")
rightCorner.Parent = imageRight

local topText = Instance.new("TextLabel")
topText.TextWrapped = true
topText.BorderSizePixel = 0
topText.Text = "Aura Hub | New Ui"
topText.TextScaled = true
topText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
topText.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
topText.Size = UDim2.new(0.91209, 0, 0.14394, 0)
topText.Position = UDim2.new(0.04396, 0, 0.02273, 0)
topText.Parent = imageRight

local textCorner = Instance.new("UICorner")
textCorner.Parent = topText

local timeText = Instance.new("TextLabel")
timeText.TextWrapped = true
timeText.BorderSizePixel = 0
timeText.Text = "Time in Server: 0s"
timeText.TextScaled = true
timeText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
timeText.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
timeText.Size = UDim2.new(0.91209, 0, 0.14394, 0)
timeText.Position = UDim2.new(0.04396, 0, 0.02273, 0)
timeText.Parent = imageRight

local timeCorner = Instance.new("UICorner")
timeCorner.Parent = timeText

local UIS = game:GetService("UserInputService")
local guiVisible = true

UIS.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end
	if input.KeyCode == Enum.KeyCode.RightShift then
		guiVisible = not guiVisible
		ScreenGui.Enabled = guiVisible
	end
end)

local startTime = tick()
task.spawn(function()
	while task.wait(1) do
		local elapsed = math.floor(tick() - startTime)
		timeText.Text = "Time in Server: " .. elapsed .. "s"
	end
end)

local diamondText = Instance.new("TextLabel")
diamondText.TextWrapped = true
diamondText.BorderSizePixel = 0
diamondText.Text = "Coins: 0"
diamondText.TextScaled = true
diamondText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
diamondText.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
diamondText.Size = UDim2.new(0.91209, 0, 0.14394, 0)
diamondText.Position = UDim2.new(timeText.Position.X.Scale, timeText.Position.X.Offset, timeText.Position.Y.Scale, timeText.Position.Y.Offset + 50)
diamondText.Parent = imageRight

local diamondCorner = Instance.new("UICorner")
diamondCorner.Parent = diamondText

task.spawn(function()
	local player = game:GetService("Players").LocalPlayer
	local diamondValue = player:WaitForChild("Diamond")
	diamondText.Text = "Coins: " .. tostring(diamondValue.Value)
	diamondValue:GetPropertyChangedSignal("Value"):Connect(function()
		diamondText.Text = "Coins: " .. tostring(diamondValue.Value)
	end)
end)

task.spawn(function()
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
end)

task.spawn(function()
local L = game.Lighting
L.GlobalShadows = false
L.Brightness = 1
L.FogEnd = 50
L.OutdoorAmbient = Color3.new(1, 1, 1)

for _, v in pairs(workspace:GetDescendants()) do
	local c = v.ClassName
	if c == "ParticleEmitter" or c == "Trail" or c == "Smoke" then
		v.Enabled = false
	elseif c == "Decal" or c == "Texture" then
		v:Destroy()
	elseif c == "BasePart" then
		v.Material = "Plastic"
		v.Reflectance = 0
	end
end
end)

return screenGui
