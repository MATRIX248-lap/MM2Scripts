-- سكربت MM2 خاص 

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- إعدادات الـ ESP
local function createESP(target)
    local esp = Instance.new("BillboardGui")
    esp.Parent = target
    esp.Adornee = target.Head
    esp.Size = UDim2.new(0, 100, 0, 100)
    esp.StudsOffset = Vector3.new(0, 2, 0)

    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = esp
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = target.Name
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
    textLabel.TextScaled = true
end

-- زر القتل التلقائي للقاتل
local killButton = Instance.new("TextButton")
killButton.Parent = game.CoreGui
killButton.Size = UDim2.new(0, 200, 0, 50)
killButton.Position = UDim2.new(0.5, -100, 0.9, -25)
killButton.Text = "قتل القاتل تلقائيًا"
killButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
killButton.TextColor3 = Color3.fromRGB(255, 255, 255)
killButton.TextScaled = true

killButton.MouseButton1Click:Connect(function()
    for _, v in ipairs(game.Players:GetChildren()) do
        if v.Character and v.Character:FindFirstChild("Head") then
            if v.Name ~= player.Name then
                -- لو كان هذا هو القاتل، نقتله مباشرة
                v.Character:BreakJoints()  -- هذا بيقتل اللاعب
            end
        end
    end
end)

-- وظيفة ESP للـ Players
for _, v in ipairs(game.Players:GetChildren()) do
    if v.Character and v.Character:FindFirstChild("Head") then
        createESP(v)
    end
end
