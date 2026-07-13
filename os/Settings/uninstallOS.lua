os.pullEvent = os.pullEventRaw -- Disable termination

local module = require("/os/module")
module.HeaderInfo = {
    [1] = "Uninstall OS",
}
module.Title = "Are you sure you want to uninstall CloudOS?"
module.StartOption = 1
module.BackOption = 1
module.Options = {
    [1] = "Back",
    [2] = "Confirm",
}
module.TerminalRunning = false

-- Display
module:Draw()
module:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/settings.lua")
    elseif option == 2 then
        term.clear()
        term.setCursorPos(1,1)
        shell.run("delete", "os")
        shell.run("delete", "back.lua")
        shell.run("delete", "startup.lua")
        sleep(1)
        os.reboot()
    end
end)
