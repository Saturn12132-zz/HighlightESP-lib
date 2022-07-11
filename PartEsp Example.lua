getgenv().Enabled = true
if getgenv().Enabled == false then
getgenv().Disable:Disconnect()
game.CoreGui:FindFirstChild("HighlightName"):Destroy()
end
if getgenv().Enabled == true then
local espSettings = {
    FillColor = Color3.fromRGB(200, 90, 255),
    OutlineColor = Color3.fromRGB(255, 119, 215),
    FillTransparency = 0.65,
    OutlineTransparency = 0,
    DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
}

local highlightLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Saturn12132/HighlightESP-lib/main/Source.lua"))()
highlightLib:loadSettings(espSettings)

local Part = game.Workspace.BackroomsMap
local function addPartToEsp(PartModel)
    highlightLib:addEsp(PartModel)
end

for i,v in ipairs(Part:GetChildren()) do
    if v:IsA("Part") then
        addPartToEsp(v)
    end
    getgenv().Disable = v.ChildAdded:Connect(addPartToEsp)
end
getgenv().Disable = Part.ChildAdded:Connect(function(Parts)
    getgenv().Disable = v.ChildAdded:Connect(addPartToEsp)
end)
end
