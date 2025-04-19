-- ServerScriptService/DynamicFoliage.lua
local Debris = game:GetService("Debris")
local Players = game:GetService("Players")

local GameSettings = require(script.Parent.GameSettings)

-- Создание трясущейся растительности
local function createFoliage()
    for i = 1, 50 do
        local grass = Instance.new("Part")
        grass.Size = Vector3.new(2, 0.2, 2)
        grass.Anchored = true
        grass.CanCollide = false
        grass.Material = Enum.Material.Grass
        grass.Parent = workspace.Foliage

        -- Анимация через BodyVelocity (имитация ветра)
        local velocity = Instance.new("BodyVelocity")
        velocity.Velocity = Vector3.new(
            math.random(-1, 1) * GameSettings.Foliage.WindSpeed,
            0,
            math.random(-1, 1) * GameSettings.Foliage.WindSpeed
        )
        velocity.Parent = grass
    end
end

-- Реакция на игрока
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid").Running:Connect(function(speed)
            if speed > 0 then
                -- Трава пригибается при беге
                for _, grass in ipairs(workspace.Foliage:GetChildren()) do
                    if (grass.Position - character.HumanoidRootPart.Position).Magnitude < GameSettings.Foliage.PlayerImpactRadius then
                        grass.BodyVelocity.Velocity = Vector3.new(0, -5, 0)
                        Debris:AddItem(grass.BodyVelocity, 0.5)
                    end
                end
            end
        end)
    end)
end)

createFoliage()