local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local FindPos = Instance.new("TextButton")
local Pos = Instance.new("TextLabel")


ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.395550072, 0, 0.325163394, 0)
Frame.Size = UDim2.new(0, 338, 0, 213)

Title.Name = "Title"
Title.Parent = Frame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.Size = UDim2.new(0, 338, 0, 50)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "DarkFigureX Position finder"
Title.TextColor3 = Color3.fromRGB(0, 0, 0)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true

FindPos.Name = "FindPos"
FindPos.Parent = Frame
FindPos.BackgroundColor3 = Color3.fromRGB(255-0-0)
FindPos.Position = UDim2.new(0.204142019, 0, 0.727699518, 0)
FindPos.Size = UDim2.new(0, 200, 0, 50)
FindPos.Font = Enum.Font.SourceSansBold
FindPos.Text = "Find Position"
FindPos.TextColor3 = Color3.fromRGB(0, 0, 0)
FindPos.TextScaled = true
FindPos.TextSize = 14.000
FindPos.TextWrapped = true

Pos.Name = "Pos"
Pos.Parent = Frame
Pos.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Pos.BackgroundTransparency = 1.000
Pos.Position = UDim2.new(0, 0, 0.380281687, 0)
Pos.Size = UDim2.new(0, 338, 0, 50)
Pos.Font = Enum.Font.SourceSansBold
Pos.Text = "Pos: "
Pos.TextColor3 = Color3.fromRGB(0, 0, 0)
Pos.TextScaled = true
Pos.TextSize = 14.000
Pos.TextWrapped = true

-- Scripts:

local function YVMCEV_fake_script() -- FindPos.LocalScript 
	local script = Instance.new('LocalScript', FindPos)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Pos.Text = tostring(game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
		setclipboard(script.Parent.Parent.Pos.Text)
	end)
end
coroutine.wrap(YVMCEV_fake_script)()
local function JWRH_fake_script() -- Frame.Draggable 
	local script = Instance.new('LocalScript', Frame)

	local UIS = game:GetService('UserInputService')
	local frame = script.Parent
	local dragToggle = nil
	local dragSpeed = 0.35
	local dragStart = nil
	local startPos = nil
	
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
			startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end
	
	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)
	
	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end
coroutine.wrap(JWRH_fake_script)()
