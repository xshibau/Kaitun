if not _G.HideUi then
    local Player = game.Players.LocalPlayer
    local PlayerGui = Player:WaitForChild("PlayerGui")

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = PlayerGui

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Frame.Size = UDim2.new(0, 492, 0, 336)
    Frame.Position = UDim2.new(0, 130, 0, -48)
    Frame.BackgroundTransparency = 0.5
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Instance.new("UICorner", Frame)
    local Stroke = Instance.new("UIStroke", Frame)
    Stroke.Thickness = 3

    local TopFrame = Instance.new("Frame")
    TopFrame.Parent = Frame
    TopFrame.BackgroundColor3 = Color3.fromRGB(26, 255, 175)
    TopFrame.Size = UDim2.new(0, 458, 0, 52)
    TopFrame.Position = UDim2.new(0, 20, 0, 10)
    TopFrame.BackgroundTransparency = 0.5
    TopFrame.BorderSizePixel = 0
    Instance.new("UICorner", TopFrame)
    local TopStroke = Instance.new("UIStroke", TopFrame)
    TopStroke.Thickness = 2
    TopStroke.Color = Color3.fromRGB(255, 255, 255)

    local Title = Instance.new("TextLabel")
    Title.Parent = TopFrame
    Title.TextWrapped = true
    Title.BorderSizePixel = 0
    Title.TextScaled = true
    Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Title.FontFace = Font.new("rbxasset://fonts/families/PressStart2P.json")
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 0, 50)
    Title.Text = "Aura Hub Kaitun"
    local TitleStroke = Instance.new("UIStroke", Title)
    TitleStroke.Thickness = 2

    task.spawn(function()
        local t = 0
        while task.wait() do
            t += 1
            local color = Color3.fromHSV((t % 255) / 255, 1, 1)
            Title.TextColor3 = color
            TitleStroke.Color = color
        end
    end)

    local Body = Instance.new("Frame")
    Body.Parent = Frame
    Body.BorderSizePixel = 0
    Body.BackgroundColor3 = Color3.fromRGB(0, 255, 28)
    Body.Size = UDim2.new(0, 458, 0, 256)
    Body.Position = UDim2.new(0, 20, 0, 70)
    Body.BackgroundTransparency = 0.5
    Instance.new("UICorner", Body)
    local BodyStroke = Instance.new("UIStroke", Body)
    BodyStroke.Thickness = 2
    BodyStroke.Color = Color3.fromRGB(255, 255, 255)

    local Img = Instance.new("ImageLabel")
    Img.Parent = Body
    Img.BorderSizePixel = 0
    Img.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Img.Image = "rbxthumb://type=Asset&id=15423490216&w=420&h=420"
    Img.Size = UDim2.new(0, 114, 0, 118)
    Img.BackgroundTransparency = 1
    Img.Position = UDim2.new(0, 0, 0, 72)
    Instance.new("UICorner", Img)

    local Number = Instance.new("TextLabel")
    Number.Parent = Body
    Number.TextWrapped = true
    Number.TextStrokeTransparency = 0
    Number.BorderSizePixel = 0
    Number.TextSize = 100
    Number.TextXAlignment = Enum.TextXAlignment.Left
    Number.BackgroundColor3 = Color3.fromRGB(157, 255, 139)
    Number.FontFace = Font.new("rbxasset://fonts/families/Arial.json", Enum.FontWeight.Bold)
    Number.TextColor3 = Color3.fromRGB(96, 161, 24)
    Number.BackgroundTransparency = 1
    Number.Size = UDim2.new(0, 344, 0, 132)
    Number.Text = "0"
    Number.Position = UDim2.new(0, 104, 0, 64)
    local NumberStroke = Instance.new("UIStroke", Number)
    NumberStroke.Thickness = 2
    NumberStroke.Color = Color3.fromRGB(255, 255, 255)

    local Footer = Instance.new("TextLabel")
    Footer.Parent = Body
    Footer.TextWrapped = true
    Footer.BorderSizePixel = 0
    Footer.TextScaled = true
    Footer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Footer.FontFace = Font.new("rbxasset://fonts/families/PressStart2P.json")
    Footer.TextColor3 = Color3.fromRGB(255, 255, 255)
    Footer.BackgroundTransparency = 1
    Footer.Size = UDim2.new(0, 460, 0, 52)
    Footer.Text = "Build a Zoo - Kaitun Fish"
    Instance.new("UICorner", Footer)
    local FooterStroke = Instance.new("UIStroke", Footer)
    FooterStroke.Thickness = 2
end

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
