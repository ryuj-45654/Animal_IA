-- Tabla para definir las habilidades y caracter�sticas de los animales fant�sticos
local Beasts = {}

-- Funci�n para crear un NPC de un animal fant�stico
function CreateBeast(name, model, pos, abilities)
    local npc = ents.Create("npc_vj_creature_base")
    if not IsValid(npc) then return end
    npc:SetModel(model)
    npc:SetPos(pos)
    npc:Spawn()

    -- Asignar habilidades �nicas al NPC
    npc.Abilities = abilities
    npc:SetHealth(abilities.health or 100)

    -- Detectar entidades cercanas
    function npc:DetectNearbyEntities()
        local nearbyEntities = ents.FindInSphere(self:GetPos(), abilities.detectionRadius or 500)  -- Radio de detecci�n en unidades (500 = 5 metros)
        for _, entity in ipairs(nearbyEntities) do
            if entity:IsPlayer() or entity:IsNPC() then  -- Detecta jugadores o NPCs
                self:SetEnemy(entity)
                self:SetSchedule(SCHED_CHASE_ENEMY)  -- El NPC persigue y ataca a la entidad
                return
            end
        end
    end

    -- Funci�n Think del NPC para ejecutar constantemente
    function npc:Think()
        -- Llama a la funci�n de detecci�n de enemigos
        self:DetectNearbyEntities()

        -- Si el NPC tiene la habilidad de invisibilidad
        if abilities.invisibility then
            if self:Health() < (abilities.health * 0.5) then
                self:SetNoDraw(true)  -- Hacerse invisible si est� herido
            else
                self:SetNoDraw(false)  -- Volver a ser visible si est� saludable
            end
        end

        -- Comportamiento de huida si est� muy herido
        if self:Health() < (abilities.health * 0.2) and abilities.canFlee then
            self:SetSchedule(SCHED_RUN_FROM_ENEMY)
        end

        self:NextThink(CurTime() + 1)
        return true
    end

    -- Reacci�n al recibir da�o
    function npc:OnTakeDamage(dmg)
        if abilities.defensive and dmg:GetAttacker():IsPlayer() then
            self:SetSchedule(SCHED_MELEE_ATTACK1)  -- Contraatacar
        end
    end
end

-- Crear un animal fant�stico de ejemplo
hook.Add("InitPostEntity", "SpawnFantasticBeast", function()
    CreateBeast("Occamy", "models/ocamy.mdl", Vector(0,0,0), {
        health = 500,
        invisibility = true,
        canFlee = true,
        defensive = true,
        detectionRadius = 500  -- Radio de 500 unidades (equivalente a 5 metros)
    })
end)

if SERVER then
    AddCSLuaFile("cl_beasts.lua")
    AddCSLuaFile("sh_beastsconfig.lua")  -- A�ade este archivo
    include("sh_beastsconfig.lua")       -- Incluye la configuraci�n
    include("sv_beasts.lua")
end
