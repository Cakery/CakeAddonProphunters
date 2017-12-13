if SERVER then
hook.Add("OnStartRound","Slaymanager",function()
for _,v in pairs(player.GetAll()) do
local rounds=tonumber(v:GetPData("cake_slaynr"))
if rounds!=nil and rounds>0 then
print("[CakeAddon] Slaying "..v:Nick())
v:Kill()
v:SetPData("cake_slaynr",tonumber(v:GetPData("cake_slaynr"))-1)
ULib.tsayError( v, "You were slain! You have "..v:GetPData("cake_slaynr").." slays left" )
end
end
print("Ding")
end)
end