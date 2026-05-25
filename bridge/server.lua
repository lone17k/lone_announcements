Bridge = {}
Bridge.Framework = "custom"

if Config.Framework == "auto" then
    if GetResourceState('qb-core') == 'started' or GetResourceState('qb-core') == 'starting' then
        Bridge.Framework = "qb"
    elseif GetResourceState('qbx_core') == 'started' or GetResourceState('qbx_core') == 'starting' then
        Bridge.Framework = "qbox"
    elseif GetResourceState('es_extended') == 'started' or GetResourceState('es_extended') == 'starting' then
        Bridge.Framework = "esx"
    else
        Bridge.Framework = "custom"
    end
else
    Bridge.Framework = string.lower(Config.Framework)
end

print("^2[Lone Announcements]^7 Framework initialized: ^3" .. Bridge.Framework .. "^7")

if Bridge.Framework == "qb" then
    local QBCore = exports['qb-core']:GetCoreObject()
    
    Bridge.GetPlayerJob = function(src)
        local Player = QBCore.Functions.GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            return Player.PlayerData.job.name
        end
        return "unemployed"
    end
    
    Bridge.Notify = function(src, msg, type)
        TriggerClientEvent('QBCore:Notify', src, msg, type)
    end
    
elseif Bridge.Framework == "qbox" then
    Bridge.GetPlayerJob = function(src)
        local Player = exports.qbx_core:GetPlayer(src)
        if Player and Player.PlayerData and Player.PlayerData.job then
            return Player.PlayerData.job.name
        end
        return "unemployed"
    end
    
    Bridge.Notify = function(src, msg, type)
        exports.qbx_core:Notify(src, msg, type)
    end
    
elseif Bridge.Framework == "esx" then
    local ESX = exports['es_extended']:getSharedObject()
    
    Bridge.GetPlayerJob = function(src)
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and xPlayer.job then
            return xPlayer.job.name
        end
        return "unemployed"
    end
    
    Bridge.Notify = function(src, msg, type)
        TriggerClientEvent('esx:showNotification', src, msg)
    end
    
elseif Bridge.Framework == "custom" then
    -- CUSTOM FRAMEWORK LOGIC
    Bridge.GetPlayerJob = function(src)
        -- Add your custom framework logic to get the player's job here
        return "unemployed"
    end
    
    Bridge.Notify = function(src, msg, type)
        -- Add your custom framework notification logic here
        print("Notification for player " .. tostring(src) .. ": " .. tostring(msg))
    end
end
