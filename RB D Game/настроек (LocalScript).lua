-- StarterPlayerScripts/GraphicsSettings.lua
local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "GraphicsSettings"
ScreenGui.Parent = PlayerGui

local function createSlider(name, min, max, defaultValue)
    local slider = Instance.new("Frame")
    -- ... UI-логика для слайдеров ...
    return slider
end

-- Слайдеры для настроек RTX
createSlider("ReflectionQuality", 0, 1, 0.75)
createSlider("ShadowQuality", 0, 3, 2)