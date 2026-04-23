-- ULTRA ADMIN 2026 - DOWNLOAD EDITION
-- Gerado para Delta Executor

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local CloseBtn = Instance.new("TextButton")

-- Setup GUI
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "UltraAdminDownloader"

MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 165, 0)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -150)
MainFrame.Size = UDim2.new(0, 220, 0, 300)
MainFrame.Active = true
MainFrame.Draggable = true

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Text = "ULTRA ADMIN 2026"
Title.TextColor3 = Color3.fromRGB(255, 165, 0)
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 22

ScrollingFrame.Parent = MainFrame
ScrollingFrame.Size = UDim2.new(1, 0, 1, -70)
ScrollingFrame.Position = UDim2.new(0, 0, 0, 40)
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 8, 0)
ScrollingFrame.ScrollBarThickness = 5
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

local function AddButton(Name, Color, Function)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ScrollingFrame
    Btn.Size = UDim2.new(0.95, 0, 0, 35)
    Btn.Text = Name
    Btn.BackgroundColor3 = Color
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.SourceSans
    Btn.TextSize = 16
    Btn.MouseButton1Click:Connect(Function)
end

-- Funções de Tamanho
AddButton("Ficar Gigante", Color3.fromRGB(46, 204, 113), function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.BodyHeightScale.Value = 3
    hum.BodyWidthScale.Value = 3
    hum.BodyDepthScale.Value = 3
    hum.HeadScale.Value = 3
end)

AddButton("Ficar Mini (Pequeno)", Color3.fromRGB(26, 188, 156), function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.BodyHeightScale.Value = 0.5
    hum.BodyWidthScale.Value = 0.5
    hum.BodyDepthScale.Value = 0.5
    hum.HeadScale.Value = 0.5
end)

AddButton("Tamanho Normal", Color3.fromRGB(127, 140, 141), function()
    local hum = game.Players.LocalPlayer.Character.Humanoid
    hum.BodyHeightScale.Value = 1
    hum.BodyWidthScale.Value = 1
    hum.BodyDepthScale.Value = 1
    hum.HeadScale.Value = 1
end)

-- Funções de Movimento
AddButton("Velocidade Flash", Color3.fromRGB(44, 62, 80), function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 200
end)

AddButton("Pulo Lunar", Color3.fromRGB(44, 62, 80), function()
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = 250
end)

AddButton("Noclip (Atravessar)", Color3.fromRGB(192, 57, 43), function()
    game:GetService("RunService").Stepped:Connect(function()
        for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide = false end
        end
    end)
end)

-- Utilidades
AddButton("Visão Noturna", Color3.fromRGB(241, 196, 15), function()
    game:GetService("Lighting").Brightness = 2
    game:GetService("Lighting").ClockTime = 14
    game:GetService("Lighting").GlobalShadows = false
end)

AddButton("Anti-AFK", Color3.fromRGB(39, 174, 96), function()
    game:GetService("Players").LocalPlayer.Idled:connect(function()
        game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

AddButton("Super FOV", Color3.fromRGB(52, 152, 219), function()
    workspace.CurrentCamera.FieldOfView = 120
end)

AddButton("Teleport Aleatório", Color3.fromRGB(211, 84, 0), function()
    local players = game.Players:GetPlayers()
    local target = players[math.random(1, #players)]
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
end)

-- Fechar
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(1, 0, 0, 30)
CloseBtn.Position = UDim2.new(0, 0, 1, -30)
CloseBtn.Text = "FECHAR PAINEL"
CloseBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

print("Ultra Admin Carregado com Sucesso!")
