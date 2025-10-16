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
auraLabel.Text = "Aura Hub Kaitun 99"
auraLabel.Name = "aura"
auraLabel.Position = UDim2.new(0.01689, 0, 0.86792, 0)
auraLabel.Parent = innerFrame

local auraCorner = Instance.new("UICorner")
auraCorner.Parent = auraLabel

local imageLeft = Instance.new("ImageLabel")
imageLeft.BorderSizePixel = 0
imageLeft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
imageLeft.Image = "rbxthumb://type=Asset&id=83230952715744&w=420&h=420"
imageLeft.Size = UDim2.new(0.34122, 0, 0.83019, 0)
imageLeft.Position = UDim2.new(0.01689, 0, 0.01887, 0)
imageLeft.Parent = innerFrame

local leftCorner = Instance.new("UICorner")
leftCorner.Parent = imageLeft

local imageRight = Instance.new("ImageLabel")
imageRight.BorderSizePixel = 0
imageRight.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
imageRight.Image = "rbxthumb://type=Asset&id=73484135110298&w=420&h=420"
imageRight.Size = UDim2.new(0.61486, 0, 0.83019, 0)
imageRight.Position = UDim2.new(0.36824, 0, 0.01887, 0)
imageRight.Parent = innerFrame

local rightCorner = Instance.new("UICorner")
rightCorner.Parent = imageRight

local topText = Instance.new("TextLabel")
topText.TextWrapped = true
topText.BorderSizePixel = 0
topText.Text = "Name: " .. game:GetService("Players").LocalPlayer.Name
topText.TextScaled = true
topText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
topText.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
topText.Size = UDim2.new(0.91209, 0, 0.14394, 0)
topText.Position = UDim2.new(0.04396, 0, 0.02273, 0)
topText.Parent = imageRight

local textCorner = Instance.new("UICorner")
textCorner.Parent = topText

game:GetService("Players").LocalPlayer:GetPropertyChangedSignal("Name"):Connect(function()
	topText.Text = "Name: " .. game:GetService("Players").LocalPlayer.Name
end)

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
diamondText.Text = "Diamond: 0"
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
	diamondText.Text = "Diamond: " .. tostring(diamondValue.Value)
	diamondValue:GetPropertyChangedSignal("Value"):Connect(function()
		diamondText.Text = "Diamond: " .. tostring(diamondValue.Value)
	end)
end)

local countdownText = Instance.new("TextLabel")
countdownText.TextWrapped = true
countdownText.BorderSizePixel = 0
countdownText.Text = "Changed Server In: 00:30"
countdownText.TextScaled = true
countdownText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
countdownText.FontFace = Font.new("rbxasset://fonts/families/DenkOne.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
countdownText.Size = UDim2.new(0.91209, 0, 0.14394, 0)
countdownText.Position = UDim2.new(diamondText.Position.X.Scale, diamondText.Position.X.Offset, diamondText.Position.Y.Scale, diamondText.Position.Y.Offset + 50)
countdownText.Parent = imageRight

local countdownCorner = Instance.new("UICorner")
countdownCorner.Parent = countdownText

task.spawn(function()
	local timeLeft = 30
	while timeLeft >= 0 do
		local minutes = string.format("%02d", math.floor(timeLeft / 60))
		local seconds = string.format("%02d", timeLeft % 60)
		countdownText.Text = "Changed Server In: " .. minutes .. ":" .. seconds
		task.wait(1)
		timeLeft -= 1
	end
end)
task.spawn(function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

if not _G.AutoChestData then
    _G.AutoChestData = {running = false}
end

local function getChests()
    local chests = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("Model") and string.find(obj.Name, "Item Chest") then
            table.insert(chests, obj)
        end
    end
    return chests
end

local function getPrompt(model)
    local prompts = {}
    for _, obj in ipairs(model:GetDescendants()) do
        if obj:IsA("ProximityPrompt") then
            table.insert(prompts, obj)
        end
    end
    return prompts
end

local function clickMiddleScreen()
    local VirtualUser = game:GetService("VirtualUser")
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2))
end

if not _G.AutoChestData.running then
    _G.AutoChestData.running = true
    task.spawn(function()
        while _G.AutoChestData.running do
            local chests = getChests()
            for _, chest in ipairs(chests) do
                if not _G.AutoChestData.running then break end
                local part = chest.PrimaryPart or chest:FindFirstChildWhichIsA("BasePart")
                if part then
                    local prompts = getPrompt(chest)
                    for _, prompt in ipairs(prompts) do
                        fireproximityprompt(prompt, math.huge)
                    end
                    local t = tick()
                    while _G.AutoChestData.running and tick() - t < 5 do
                        humanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 6, 0)
                        humanoidRootPart.Velocity = Vector3.zero
                        humanoidRootPart.RotVelocity = Vector3.zero
                        clickMiddleScreen()
                        task.wait()
                    end
                end
            end
            task.wait(0.1)
        end
    end)
   end
end)
task.spawn(function()
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer
local PLACE_ID = game.PlaceId

task.delay(30, function()
    TeleportService:Teleport(PLACE_ID, player)
end)
end)

return screenGui
