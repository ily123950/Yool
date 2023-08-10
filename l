local function equipWithInterval(player)
    local backpack = player.Backpack
    if not backpack then
        return
    end
    
    local tools = {}
    for _, tool in pairs(backpack:GetChildren()) do
        if tool:IsA("Tool") then
            table.insert(tools, tool)
        end
    end
    
    if #tools == 0 then
        return -- No tools in the backpack
    end
    
    local numToolsPerSet = 20
    local interval = 1
    local currentIndex = 1
    
    while true do
        for i = 1, numToolsPerSet do
            local toolIndex = (currentIndex + i - 1) % #tools + 1
            tools[toolIndex].Parent = player.Character
        end
        
        wait(0.00000000000000001)-- Adjust the wait time if needed
        
        for i = 1, numToolsPerSet do
            local toolIndex = (currentIndex + i - 1) % #tools + 1
            tools[toolIndex].Parent = backpack
        end
        
        currentIndex = (currentIndex + interval) % #tools
       
    end
end

local player = game.Players.LocalPlayer -- Change this to the player you want to equip tools for
equipWithInterval(player)
