util.AddNetworkString("PlayerChatColor")

local PLY = FindMetaTable("Player")

function PLY:AddScore(score)
	local num = self:GetNWInt("gz_score")
	self:SetNWInt("gz_score", num + score)
end

function PLY:SendSound(dir)
    net.Start("SendSingleSound")
        net.WriteString(dir)
    net.Send(self)
end

function PLY:ChatPrintColor(...)
	local args = { ... }
    local tab = {}
    
    for k, v in pairs(args) do
        --//We can be sent tables
        if istable(v) and !IsColor(v) then
            --//Only numerically-indexed tables
            for k2, v2 in ipairs(v) do
                --//If there are multiple items in the table, add a comma to the end of all except the last
                if k2 == #v then
                    tab[#tab + 1] = v2
                else
                    tab[#tab + 1] = v2 .. ", "
                end
            end
        else
            tab[#tab + 1] = v
        end
    end
    
	net.Start("PlayerChatColor")
		net.WriteTable(tab)
	net.Send(self)
end