-- Opciones del cliente para los NPCs (si quieres mostrar cosas espec�ficas, como informaci�n en pantalla)
hook.Add("HUDPaint", "DisplayBeastInfo", function()
    local tr = LocalPlayer():GetEyeTrace()
    if IsValid(tr.Entity) and tr.Entity.IsBeast then
        draw.SimpleText("Animal Fant�stico: " .. tr.Entity:GetClass(), "Trebuchet24", ScrW()/2, ScrH()/2, color_white, TEXT_ALIGN_CENTER)
    end
end)