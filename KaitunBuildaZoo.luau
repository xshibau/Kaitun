local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KaitunUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 99
ScreenGui.Parent = PlayerGui

local FullBlack = Instance.new("Frame")
FullBlack.Size = UDim2.new(1, 0, 1, 36)
FullBlack.Position = UDim2.new(0, 0, -0.03, 0)
FullBlack.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
FullBlack.BorderSizePixel = 0
FullBlack.ZIndex = 19999999
FullBlack.BackgroundTransparency = 0
FullBlack.Parent = ScreenGui

local Image = Instance.new("ImageLabel")
Image.Size = UDim2.new(0, 100, 0, 100)
Image.Position = UDim2.new(0.5, -50, 0.5, -90)
Image.BackgroundTransparency = 1
Image.Image = "rbxthumb://type=Asset&id=131484641795167&w=420&h=420"
Image.ZIndex = 29999999
Image.Parent = ScreenGui

local Version = Instance.new("TextLabel")
Version.AnchorPoint = Vector2.new(0.5, 0.5)
Version.Position = UDim2.new(0.5, 0, 0.5, 40)
Version.Size = UDim2.new(0, 600, 0, 50)
Version.BackgroundTransparency = 1
Version.Text = "Aura Hub"
Version.Font = Enum.Font.PermanentMarker
Version.TextSize = 55
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.ZIndex = 39999999
Version.Parent = ScreenGui

local config = getgenv().Config or {}

local function sendEmbedWebhook(message)
	if config.Url == "" then return end
	local HttpService = game:GetService("HttpService")
	local data = {
		embeds = {{
			title = "Aura Hub",
			description = message,
			color = 16711680
		}}
	}
	pcall(function()
		HttpService:PostAsync(config.Url, HttpService:JSONEncode(data), Enum.HttpContentType.ApplicationJson)
	end)
end

if config["Url"] ~= "" then
	task.spawn(function()
		local Players = game:GetService("Players")

		Players.PlayerAdded:Connect(function(player)
			player.CharacterAdded:Connect(function(char)
				local humanoid = char:WaitForChild("Humanoid")
				humanoid.Died:Connect(function()
					sendEmbedWebhook(player.Name.." has died")
				end)
			end)
		end)

		workspace.ChildAdded:Connect(function(child)
			if child:IsA("Tool") or child:IsA("Part") then
				sendEmbedWebhook("New item spawned: "..child.Name)
			end
		end)
	end)
end

if config["Startwebhook"] ~= false then
	task.spawn(function()
		local Players = game:GetService("Players")
		while true do
			task.wait(1)
			for _, player in pairs(Players:GetPlayers()) do
				if player.Character and player.Character:FindFirstChild("Humanoid") then
					local hum = player.Character.Humanoid
					if hum.Health <= 0 then
						sendEmbedWebhook(player.Name.." has died (Startwebhook)") 
					end
				end
			end
		end
	end)
end

if config["AutoFarm"] ~= false then
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
	end)
end
