

RegisterNetEvent('announceJob')
AddEventHandler('announceJob', function(job, message)
    if message ~= nil then
        local jobData = Config.Jobs[job]
        
        local jobName = job
        local imageUrl = Config.UI.DefaultImage
        local sound = Config.UI.DefaultSound
        local borderColor = Config.UI.DefaultBorderColor
        local titleColor = Config.UI.DefaultTitleColor

        if jobData then
            jobName = jobData.name or job
            imageUrl = jobData.image or Config.UI.DefaultImage
            sound = jobData.sound or Config.UI.DefaultSound
            borderColor = jobData.borderColor or Config.UI.DefaultBorderColor
            titleColor = jobData.titleColor or Config.UI.DefaultTitleColor
        end

        SendNUIMessage({
            action = "jobAnnouncement",
            job = jobName,
            message = message,
            image = imageUrl,
            sound = sound,
            duration = Config.UI.Duration,
            borderColor = borderColor,
            backgroundColor = Config.UI.BackgroundColor,
            titleColor = titleColor,
            messageColor = Config.UI.MessageColor
        })
    end
end)

CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/' .. Config.Command.Name, 'Make a job announcement to the city', {
        { name="message", help="The message you want to announce" }
    })
end)