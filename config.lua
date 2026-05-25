Config = {}

-- [[ Framework Settings ]]
-- Options: "auto", "qb", "qbox", "esx", "custom"
Config.Framework = "auto"

Config.Command = {
    Name = "jobad", -- The command name to use for announcements
    Cooldown = 600, -- Cooldown duration in seconds per job
    Cost = 500, -- Cost to put up an ad (Set to 0 to make it free)
    Account = "bank", -- Which account to take money from: "bank" or "cash" (ESX uses "money" for cash automatically)
}

Config.Messages = {
    NoMessage = "No message provided",
    NoJob = "You must have a job to use this command.",
    NoMoney = "You don't have enough money to place an ad.",
    Cooldown = "Your job must wait %s seconds before using this command again.",
    Success = "Announcement made successfully!"
}

Config.UI = {
    Duration = 10000, -- Time in ms the announcement stays on screen
    BackgroundColor = "rgba(10, 15, 25, 0.9)", -- Main background color of the UI
    MessageColor = "#ffffff", -- Color for the message content
    DefaultBorderColor = "#00f0ff", -- Default Color of the glowing light border loop
    DefaultTitleColor = "#00f0ff", -- Default Color for the job title
    DefaultImage = "https://cdn.discordapp.com/attachments/1190180709973893221/1490710431659200673/lonedev.png?ex=6a14fc86&is=6a13ab06&hm=277a3f2e94cfee8f24cb97a1e3da3e9b0cd8eb86eb0719548d46d0d41c0842c8&", -- Default logo if the job doesn't have one
    DefaultSound = "notify.ogg", -- Default sound if the job doesn't have one
}


Config.Jobs = {
    ['police'] = {
        name = "Nexus Police",
        image = "https://cdn.discordapp.com/attachments/1495304643985670265/1495842579009245414/Untitled_3.png?ex=6a153336&is=6a13e1b6&hm=be93abdaeab2e18afbb05b14b986ce9dbe5d70e2ce6b1d45766a1c85324e4540&",
        sound = "singam.ogg",
        borderColor = "#0055ff", -- Custom light loop color for police
        titleColor = "#0055ff", -- Custom title color for police
    },
    ['ambulance'] = {
        name = "Nexus Medic",
        image = "https://cdn.discordapp.com/attachments/1495304643985670265/1495844314159513870/Untitled_4.png?ex=6a1534d3&is=6a13e353&hm=7290b5141cef30cb542baf38eea81f858c9e9061f44658ab4bffa08e84412882&",
        sound = "ems.ogg",
        borderColor = "#ff003c", -- Custom light loop color for medics
        titleColor = "#ff003c",
    },
    ['govt'] = {
        name = "Nexus Government",
        image = "https://cdn.discordapp.com/attachments/1139243312360984656/1250385178841317406/NX2_1.png?ex=666abf71&is=66696df1&hm=a8b5e6a8df49da2f46a2b693511c0db6703afe8ea297976ecf89a51a8d539a9d&",
        sound = "govt.ogg",
        borderColor = "#ffffff", -- Custom light loop color for govt
        titleColor = "#ffffff",
    }
}
