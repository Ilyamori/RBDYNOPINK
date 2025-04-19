-- ServerScriptService/GameSettings.lua
local GameSettings = {}

-- Основные параметры
GameSettings.Physics = {
    Gravity = 196.2,              -- Сила гравитации
    AirResistance = 0.8,          -- Сопротивление воздуха
    SurfaceFriction = {           -- Трение поверхностей
        Asphalt = 0.9,
        Grass = 0.6,
        Water = 0.1
    }
}

-- Настройки RTX-эффектов (псевдо-RTX в Roblox)
GameSettings.RTX = {
    ReflectionIntensity = 0.75,   -- Интенсивность отражений
    ShadowSoftness = 2,           -- Мягкость теней
    LightShafts = true            -- Световые лучи
}

-- Настройки растительности
GameSettings.Foliage = {
    WindSpeed = 5,                -- Скорость ветра
    BendFactor = 0.3,             -- Сила изгиба
    PlayerImpactRadius = 5        -- Влияние игрока
}

return GameSettings