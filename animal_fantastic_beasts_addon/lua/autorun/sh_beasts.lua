if SERVER then
    AddCSLuaFile("cl_beasts.lua")
    include("sv_beasts.lua")
end

if CLIENT then
    include("cl_beasts.lua")
end