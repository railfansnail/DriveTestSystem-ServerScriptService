local webhook = "https://webhook.newstargeted.com/api/webhooks/1267700090026594418/inoqI-QAJkqzVDiCWd3WigFKponEgdwGOQ_cHoVQ-snRq5uBybyHlPXFBzU4i9bJk68k" 
	-- "https://webhook.newstargeted.com/api/webhooks/1266984726451978271/40_cSMrOV-zbzsQvVwwTCPXOPsTMYeCFE_kxyd0ged4fXuSaSEyzKOwPFrwJVt7CS07p"

local throttleAmount = 0 

game:GetService("Players").PlayerAdded:Connect(function(v)
	local waiting = game:GetService("ReplicatedStorage").waitingS:Clone()
	waiting.Parent = v
end)

if webhook == "" then
	error("Webhook URL is empty.")
end

local http = game:GetService("HttpService")

game:GetService("ReplicatedStorage").sendTestS.OnServerEvent:Connect(function(Player, fb, suspector, playerD)
	local plr = Player.DisplayName.." ("..Player.Name..")"

	if Player:FindFirstChild("waitingS") and Player.waitingS.Value == false then
		local Data = {
			content = "",
			embeds = {{
				title = "면허시험 응시자: " ..workspace.DriveTest.Value.Value.."",
				description = "점수: "..fb.."점 / 합격 여부: :white_check_mark:",
				color = 0x000000
			}}
		}
		Data = http:JSONEncode(Data)
		http:PostAsync(webhook, Data)
		Player.waitingS.Value = true
		if throttleAmount == 0 then
			wait(10)
		else
			wait(throttleAmount)
		end
		Player.waitingS.Value = false
	end
end)
