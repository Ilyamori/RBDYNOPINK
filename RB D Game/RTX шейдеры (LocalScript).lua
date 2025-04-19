-- StarterPlayerScripts/RTXEffects.lua
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")

local GameSettings = require(game:GetService("ServerScriptService").GameSettings)

-- Настройка освещения
Lighting.GlobalShadows = true
Lighting.ShadowSoftness = GameSettings.RTX.ShadowSoftness

-- Динамические отражения
local ReflectionProbe = Instance.new("ReflectionProbe")
ReflectionProbe.Intensity = GameSettings.RTX.ReflectionIntensity
ReflectionProbe.Parent = workspace

-- Апдейт эффектов
RunService.RenderStepped:Connect(function()
    if GameSettings.RTX.LightShafts then
        Lighting.SunRays.Enabled = true
        Lighting.Bloom.Enabled = true
    end
end)