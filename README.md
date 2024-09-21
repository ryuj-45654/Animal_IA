# Animal_IA
Esquema del Addon:
La estructura del addon sigue el siguiente formato:
- animal_fantastic_beasts_addon/
  - config/
    - sh_beastsconfig.lua         // Configuración de los animales fantásticos (ya explicado)
  - lua/
    - autorun/
      - sh_beasts.lua             // Carga principal del addon
    - npcs/
      - cl_beasts.lua             // Código de cliente (visualización, interfaz)
      - sv_beasts.lua             // Código de servidor (IA y comportamiento)
  - materials/                    // Texturas de los animales fantásticos (por añadir)
  - models/                       // Modelos de los animales fantásticos (por añadir)
  - sound/                        // Sonidos de los animales fantásticos (por añadir)
  - addon.json                    // Metadatos del addon

______________________________________________________________________________________________________

Explicación de los archivos:
sh_beasts.lua:

Este archivo carga las configuraciones y scripts necesarios tanto en el cliente como en el servidor.
if SERVER then
    AddCSLuaFile("cl_beasts.lua")
    AddCSLuaFile("sh_beastsconfig.lua")  -- Carga la configuración en el cliente
    include("sh_beastsconfig.lua")       -- Incluye la configuración
    include("sv_beasts.lua")             -- Incluye el código del servidor
end

if CLIENT then
    include("cl_beasts.lua")             -- Incluye el código del cliente
end

sh_beastsconfig.lua:

Aquí defines las propiedades y habilidades de los animales. Por ejemplo, defines cuánta salud tienen, si son invisibles, y qué radio de detección usan. Ya lo tienes configurado con varios animales.
sv_beasts.lua:

Este archivo gestiona la inteligencia artificial (IA) y el comportamiento de los animales fantásticos en el servidor. Aquí es donde decides cómo atacan, huyen o patrullan, y cómo reaccionan a los jugadores que se acercan.
Ejemplo de cómo se crea un animal en este archivo:
function CreateBeast(name, pos)
    local config = GetBeastConfig(name)  -- Obtiene la configuración del animal
    local npc = ents.Create("npc_vj_creature_base") -- Crea un NPC base
    if not IsValid(npc) then return end
    npc:SetModel(config.model)
    npc:SetPos(pos)
    npc:Spawn()

    npc.Abilities = config
    npc:SetHealth(config.health or 100)
    -- Aquí se puede añadir más código para el comportamiento específico
end
cl_beasts.lua:
Modelos de los animales fantásticos:

En la carpeta models/, debes añadir los modelos 3D de los animales (archivos .mdl). Estos modelos representarán físicamente a las criaturas en el juego.
Ejemplo de modelos que podrías usar:

models/ocamy.mdl
models/niffler.mdl
models/thunderbird.mdl
Texturas (Materiales):

En la carpeta materials/, debes añadir las texturas (archivos .vmt y .vtf) que se aplican a los modelos. Estas texturas definirán cómo se ven los animales en el juego.
Sonidos:

En la carpeta sound/, puedes añadir sonidos asociados a cada animal, como rugidos, pasos, o efectos especiales. Los sonidos se integran cuando los animales realizan acciones, como atacar o huir.
Siguientes pasos para completar el addon:
Obtener los modelos: Encuentra modelos de animales fantásticos que desees incluir en tu addon. Puedes descargar modelos de sitios web de modelado 3D o crearlos tú mismo en Blender.

Añadir materiales y texturas: Una vez que tengas los modelos, asegúrate de tener las texturas correspondientes que los acompañan y colócalas en la carpeta materials/.

Configurar sonidos: Si deseas que los animales emitan sonidos específicos, como rugidos o efectos mágicos, puedes descargarlos o crearlos y luego asignarlos dentro del código, añadiendo eventos de sonido en los comportamientos de los NPCs.



