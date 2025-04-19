-- StarterPlayerScripts/EnhancedMovement.lua
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local GameSettings = require(game:GetService("ServerScriptService").GameSettings)

-- Продвинутая система стамины
local Stamina = {
    Current = 100,
    Max = 100,
    DrainRate = 12,    -- Трата при спринте
    RegenRate = 8      -- Восстановление
}

-- Эффекты движения
local MovementEffects = {
    SpeedLines = Instance.new("ParticleEmitter"),
    FootstepDecals = {}
}

-- Инициализация эффектов
local function initEffects()
    MovementEffects.SpeedLines.Texture = "rbxassetid://243664672"
    MovementEffects.SpeedLines.LightEmission = 1
    MovementEffects.SpeedLines.Parent = rootPart
end

-- Динамический ветер для растительности
local function updateFoliageWind()
    for _, foliage in ipairs(workspace.Foliage:GetChildren()) do
        if foliage:IsA("BasePart") then
            local windForce = Vector3.new(
                math.sin(time() * GameSettings.Foliage.WindSpeed) * GameSettings.Foliage.BendFactor,
                0,
                math.cos(time() * GameSettings.Foliage.WindSpeed) * GameSettings.Foliage.BendFactor
            )
            foliage:ApplyImpulse(windForce * foliage.Mass)
        end
    end
end

-- Основной цикл
RunService.Heartbeat:Connect(function(deltaTime)
    -- Управление стаминой
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) and Stamina.Current > 0 then
        humanoid.WalkSpeed = 24
        Stamina.Current = math.max(0, Stamina.Current - Stamina.DrainRate * deltaTime)
    else
        humanoid.WalkSpeed = 16
        Stamina.Current = math.min(Stamina.Max, Stamina.Current + Stamina.RegenRate * deltaTime)
    end

    -- RTX-эффекты (псевдо-реализация)
    if GameSettings.RTX.LightShafts then
        game.Lighting.SunRays.Intensity = 0.1 + math.sin(time()) * 0.05
    end

    -- Анимация растительности
    updateFoliageWind()
end)

initEffects()