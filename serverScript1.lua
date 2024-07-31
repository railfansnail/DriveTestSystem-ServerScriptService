local value = workspace.DriveTest.Value

game:GetService("Players").PlayerAdded:Connect(function(v)
	local waiting = game:GetService("ReplicatedStorage"):FindFirstChild("waiting")
	if waiting then
		local waitingClone = waiting:Clone()
		waitingClone.Parent = v
	else
		warn("waiting object not found in ReplicatedStorage")
	end
end)

game:GetService("ReplicatedStorage").sendTest.OnServerEvent:Connect(function(Player, fb, suspector, playerD)
	if Player:FindFirstChild("waiting") and Player.waiting.Value == false then
		value.Value = fb
	end
end)
