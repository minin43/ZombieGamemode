include("shared.lua")
include("sh_loader.lua")

if not file.Exists("gz", "DATA") then
	file.CreateDir("gz")
end
if not file.Exists("gz/saves", "DATA") then
	file.CreateDir("gz/saves")
end

function unid(steamid)
    local x = string.gsub(steamid, "x", ":")
    return string.upper(x)
end

net.Receive("GlobalChatColor", function()
	local tab = net.ReadTable()
	local fixedtab = {}

	for k, v in pairs(tab) do
		if isstring(v) or IsColor(v) then
			fixedtab[#fixedtab + 1] = v
		end
	end
	chat.AddText(unpack(fixedtab))
end)

net.Receive("PlayerChatColor", function()
	local tab = net.ReadTable()
    local fixedtab = {}
    
    for k, v in pairs(tab) do
        if istable(v) and !IsColor(v) then
            for k, v in ipairs(v) do
                fixedtab[#fixedtab + 1] = v
            end
        else
            fixedtab[#fixedtab + 1] = v
		end
    end
    
	chat.AddText(unpack(fixedtab))
end)

net.Receive("SendSingleSound", function()
    local snd = net.ReadString()
    surface.PlaySound(snd)
end)

GM.ButtonSounds = {
    Accept = { 
        "ambient/machines/keyboard2_clicks.wav",
        "ambient/machines/keyboard3_clicks.wav",
        "ambient/machines/keyboard1_clicks.wav",
        "ambient/machines/keyboard4_clicks.wav",
        "ambient/machines/keyboard5_clicks.wav",
        "ambient/machines/keyboard6_clicks.wav",
        "ambient/machines/keyboard7_clicks_enter.wav"
    },
    Deny = {
        "buttons/combine_button_locked.wav"
    },
    Buy = {
        "ambient/levels/labs/coinslot1.wav"
    }
}

GM.ColorRarities = {
    [0] = Color(20, 20, 20, 200), --Black/dark gray
    [1] = Color(87, 139, 235), --//Light blue
    [2] = Color(153, 102, 204), --//Amethyst purple
    [3] = Color(255, 215, 0), --//Gold
    [4] = Color(252, 57, 3), --//Red-Orange
    [5] = Color(0, 255, 255) --//Cyan
}