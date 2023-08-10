local function equipAndUnequipTools(player)
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
    
    local currentIndex = 1
    local numToolsToEquip = 10 -- Change this number to the desired amount
    
    for i = 1, numToolsToEquip do
        tools[currentIndex].Parent = player.Character
        wait(0.1) -- Adjust the wait time to control how long the tool is equipped
        tools[currentIndex].Parent = backpack
    
        currentIndex = currentIndex % #tools + 1
    end
end
