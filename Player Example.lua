getgenv().Enabled = true
if getgenv().Enabled == false then
getgenv().Disable:Disconnect()
game.CoreGui:FindFirstChild("HighlightName"):Destroy()
end
if getgenv().Enabled == true then
local espSettings = {
    FillColor = Color3.fromRGB(200, 90, 255),
    OutlineColor = Color3.fromRGB(255, 119, 215),
    FillTransparency = 0,
    OutlineTransparency = 0,
    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
}

local highlightLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Saturn12132/HighlightESP-lib/main/Source.lua"))()
highlightLib:loadSettings(espSettings)

local Players = game:GetService("Players")
local function addCharToEsp(characterModel)
    highlightLib:addEsp(characterModel)
end

for i,v in ipairs(Players:GetPlayers()) do
    if v.Character then
        addCharToEsp(v.Character)
    end
    getgenv().Disable = v.CharacterAdded:Connect(addCharToEsp)
end
getgenv().Disable = Players.PlayerAdded:Connect(function(Player)
    getgenv().Disable = v.CharacterAdded:Connect(addCharToEsp)
end)
end
