RegisterNetEvent('announcejob',function(job, msg)
    local job = job
    local message = msg
    local src = source

    if message ~= "" then
        TriggerClientEvent('announceJob', -1, job, message)
    else
        Bridge.Notify(src, Config.Messages.NoMessage, 'error')
    end
end)

local jobCooldowns = {}

RegisterCommand(Config.Command.Name, function(source, args)
    local src = source
    local job = Bridge.GetPlayerJob(src)

    if job == "unemployed" then 
        Bridge.Notify(src, Config.Messages.NoJob, 'error')
        return 
    end

    local msg = table.concat(args, " ")
    if msg == "" then
        Bridge.Notify(src, Config.Messages.NoMessage, 'error')
        return
    end

    local currentTime = os.time()
    local cooldownDuration = Config.Command.Cooldown -- Cooldown duration in seconds

    if jobCooldowns[job] then
        local timeSinceLastUse = currentTime - jobCooldowns[job]
        if timeSinceLastUse < cooldownDuration then
            local remainingCooldown = cooldownDuration - timeSinceLastUse
            Bridge.Notify(src, string.format(Config.Messages.Cooldown, remainingCooldown), 'error')
            return
        end
    end

    -- Command logic here
    TriggerEvent("announcejob", job, msg)
    Bridge.Notify(src, Config.Messages.Success, 'success')

    -- Update the cooldown timestamp for the job
    jobCooldowns[job] = currentTime
end, false)