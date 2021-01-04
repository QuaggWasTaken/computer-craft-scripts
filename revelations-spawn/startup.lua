text = {
    {text = "Welcome to spawn!", y = 1},
    {text = "This board is a special program to help new players", y = 2},
    {text = "Walking up to it will bring up a list of mods you can see", y = 3},
    {text = "Each mod will teleport you to a display area", y = 4},
    {text = "These displays are made to help players learn hard stuff", y = 5},
    {text = "For instance, Applied Energistics autocrafting", y = 6}
}

buttons = {
    {text = "EnderIO", x = 1, y = 1, txtCol = colors.red, bgCol = colors.black},
    {text = "ThermEx", x = 1, y = 2, txtCol = colors.red, bgCol = colors.black},
    {text = "AppEner", x = 1, y = 3, txtCol = colors.red, bgCol = colors.black},
    {text = "RefStor", x = 1, y = 4, txtCol = colors.red, bgCol = colors.black},
    {text = "DracoEv", x = 1, y = 5, txtCol = colors.red, bgCol = colors.black},
    {text = "CCLua  ", x = 1, y = 6, txtCol = colors.red, bgCol = colors.black},
    {text = "Tinkers", x = 1, y = 7, txtCol = colors.red, bgCol = colors.black}
}

mon = peripheral.wrap("top")
rad = peripheral.wrap("bottom")

mon.clear()
mon.setTextScale(0.5)
mon.setCursorPos(1, 1)

function writeButtons(_table)
    mon.clear()
    mon.setTextScale(1)
    for i, v in pairs(_table) do
        mon.setCursorPos(v.x, v.y)
        mon.setTextColor(v.txtCol)
        mon.setBackgroundColor(v.bgCol)
        mon.write(v.text)
    end
end

function teleport(player, x, y, z)
    print("Teleporting " .. player .. " to " .. x .. ", " .. y .. ", " .. z)
    commands.async.teleport(player, x, y, z)
end
 
function isValidClick(_table, mx, my)
    for i, v in pairs(_table) do
        if mx >= v.x and mx <= (v.x + #v.text) and my == v.y then
            return true, v.text
        end
    end
    return false, nil
end

function getClosestPlayer()
    dist = 50
    player = ""
    for i, v in pairs(rad.getPlayers()) do
        if v.distance < dist then
            dist = v.distance
            player = v.name
        end
    end
    return player
end

function getPlayerDist()
    dist = 50
    for i, v in pairs(rad.getPlayers()) do
        if v.distance < dist then
            dist = v.distance
        end
    end
    return dist
end

function writeText(_table)
    mon.clear()
    mon.setTextScale(0.5)
    for i, v in pairs(_table) do
        mon.setCursorPos(1, v.y)
        mon.setTextColor(colors.white)
        mon.write(v.text)
    end
end

writeText(text)

while true do
    dist = getPlayerDist()
    while (dist < 4) do
        writeButtons(buttons)
        os.startTimer(5)
        event, but, x, y = os.pullEvent()
        if event == "monitor_touch" then
            bClick, option = isValidClick(buttons, x, y)
            if bClick then
                if option == "EnderIO" then
                    teleport(getClosestPlayer(), -73, 69, 285)
                elseif option == "ThermEx" then
                    
                elseif option == "AppEner" then
                    
                elseif option == "RefStor" then
                    
                elseif option == "DracoEv" then
                    
                elseif option == "CCLua  " then
                    
                elseif option == "Tinkers" then
                    
                end
            end
        end
        dist = getPlayerDist()
    end
    writeText(text)
end