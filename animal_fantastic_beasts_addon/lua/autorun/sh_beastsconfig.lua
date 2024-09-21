-- Configuraci�n de los Animales Fant�sticos

BeastConfig = {
    ["Occamy"] = {
        model = "models/ocamy.mdl",  -- Modelo del Occamy
        health = 500,                -- Salud del Occamy
        invisibility = true,         -- Puede volverse invisible
        canFlee = true,              -- Puede huir si est� herido
        defensive = true,            -- Se defiende si es atacado
        detectionRadius = 500        -- Radio de detecci�n en unidades (5 metros)
    },
    ["Niffler"] = {
        model = "models/niffler.mdl",-- Modelo del Niffler
        health = 100,                -- Salud del Niffler
        invisibility = false,        -- No puede volverse invisible
        canFlee = true,              -- Puede huir si est� en peligro
        defensive = false,           -- No es agresivo por naturaleza
        detectionRadius = 300        -- Radio de detecci�n en unidades (3 metros)
    },
    ["Thunderbird"] = {
        model = "models/thunderbird.mdl", -- Modelo del Thunderbird
        health = 800,                -- Salud del Thunderbird
        invisibility = false,        -- No puede volverse invisible
        canFlee = false,             -- No huye, es muy poderoso
        defensive = true,            -- Se defiende con ataques el�ctricos
        detectionRadius = 1000       -- Radio de detecci�n en unidades (10 metros)
    }
    -- Puedes a�adir m�s animales fant�sticos aqu�
}

-- Funci�n para obtener la configuraci�n de un animal
function GetBeastConfig(beastName)
    return BeastConfig[beastName] or {}
end