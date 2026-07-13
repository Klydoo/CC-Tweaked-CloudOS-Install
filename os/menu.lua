os.pullEvent = os.pullEventRaw -- Disable termination

local module = require("/os/module")
module.HeaderInfo = {
    [1] = "CloudOS",
    [2] = "Computer ID: " .. os.getComputerID(),
}
module.Title = "Start Menu"
module.StartOption = 1
module.Options = {
    [1] = "Terminal",
    [2] = "Programms",
    [3] = "Settings",
}
module.TerminalRunning = false

-- Display
module:Draw()
module:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/terminal.lua")
    elseif option == 2 then
        shell.run("/os/programms.lua")
    elseif option == 3 then
        shell.run("/os/settings.lua")
    end
end)
