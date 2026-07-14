os.pullEvent = os.pullEventRaw -- Disable termination

local ui = require("/os/ui")
ui.HeaderInfo = {
    [1] = "Uninstall OS",
}
ui.Title = "Are you sure you want to uninstall CloudOS?"
ui.StartOption = 1
ui.BackOption = 1
ui.Options = {
    [1] = "Back",
    [2] = "Confirm",
}

-- Display
ui:Draw()
ui:OnSelect(function(option)
    if option == 1 then
        shell.run("/os/settings.lua")
        return 1
    elseif option == 2 then
        if ui.Options[2] == "Confirm" then
            ui.Options[2] = "Are you sure?"
            ui:Timer(1, function()
                ui.Options[2] = "Confirm"
            end)
        else
            term.clear()
            term.setCursorPos(1,1)
            shell.run("delete", "os")
            shell.run("delete", "back.lua")
            shell.run("delete", "startup.lua")
            sleep(1)
            os.reboot()
        end
    end
end)
