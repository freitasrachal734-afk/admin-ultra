-- PAINEL ULTRA ADMIN 2026 - VERSÃO INTEGRADA (FIX SIZE)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local CloseBtn = Instance.new("TextButton")

-- Configurações da Interface
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Name = "UltraAdminFinal"

MainFrame.Name = "Main"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 165, 0)
MainFrame.Position = UDim2.new(0.5, -110, 0.5, -150)
MainFrame.Size = UDim2.new(0, 220, 0, 320)
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
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 10, 0)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ScrollingFrame.BorderSizePixel = 0

UIListLayout.Parent = ScrollingFrame
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 5)

-- Função para Criar Botões
local function AddButton(Name, Color, Function)
    local Btn = Instance.new("TextButton")
    Btn.Parent = ScrollingFrame
    Btn.Size = UDim2.new(0.95, 0, 0, 35)
    Btn.Text = Name
    Btn.BackgroundColor3 = Color
    Btn.TextColor3 = Color3.new(1,1,1)
    Btn.Font = Enum.Font.SourceSansBold
    Btn.TextSize = 16
    Btn.BorderSizePixel = 0
    Btn.MouseButton1Click:Connect(Function)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = Btn
end

-- Função de Escala corrigida
local function ChangeSize(scale)
    local char = game.Players.LocalPlayer.Character
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then
        local scales = {
            ["BodyHeightScale"] = scale,
            ["BodyWidthScale"] = scale,
            ["BodyDepthScale"] = scale,
            ["HeadScale"] = scale
        }
        for name, value in pairs(scales) do
            local s = hum:FindFirstChild(name)
            if s then
                s.Value = value
            else
                local newScale = Instance.new("NumberValue")
                newScale.Name = name
                newScale.Value = value
                newScale.Parent = hum
            end
        end
    end
end

--- LISTA DE FUNÇÕES ---

AddButton("Ficar Gigante", Color3.fromRGB(46, 204, 113), function()
    ChangeSize(3)
end)

AddButton("Ficar Mini (Pequeno)", Color3.fromRGB(26, 188, 156), function()
    ChangeSize(0.4)
end)

AddButton("Tamanho Normal", Color3.fromRGB(127, 140, 141), function()
    ChangeSize(1)
end)

AddButton("Velocidade (200)", Color3.fromRGB(44, 62, 80), function()
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

AddButton("Visão Noturna", Color3.fromRGB(241, 196, 15), function()
    game:GetService("Lighting").Brightness = 2
    game:GetService("Lighting").ClockTime = 14
end)

AddButton("Teleport Aleatório", Color3.fromRGB(211, 84, 0), function()
    local players = game.Players:GetPlayers()
    local target = players[math.random(1, #players)]
    if target and target.Character then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
    end
end)

-- Fechar
CloseBtn.Parent = MainFrame
CloseBtn.Size = UDim2.new(1, 0, 0, 35)
CloseBtn.Position = UDim2.new(0, 0, 1, -35)
CloseBtn.Text = "FECHAR PAINEL"
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseBtn.TextColor3 = Color3.new(1,1,1)
CloseBtn.Font = Enum.Font.SourceSansBold
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

print("Painel Ultra Admin 2026 Carregado com Sucesso!")
