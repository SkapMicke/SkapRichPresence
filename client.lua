local activePresence = nil
local initialized = false

local function ReplacePlaceholders(text)
    if not text then return "" end

    local data = QBCore.Functions.GetPlayerData()
    local job = (data.job and data.job.label) or "Unemployed"
    local firstname = (data.charinfo and data.charinfo.firstname) or "Unknown"
    local lastname = (data.charinfo and data.charinfo.lastname) or ""
    local cash = (data.money and data.money.cash) or 0
    local bank = (data.money and data.money.bank) or 0
    local id = GetPlayerServerId(PlayerId())
    local playerCount = #GetActivePlayers()

    local coords = GetEntityCoords(PlayerPedId())
    local streetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street = GetStreetNameFromHashKey(streetHash)

    local replacements = {
        ["{{job}}"]       = job,
        ["{{players}}"]   = tostring(playerCount),
        ["{{location}}"]  = street or "Unknown",
        ["{{character}}"] = firstname .. " " .. lastname,
        ["{{id}}"]        = tostring(id),
        ["{{cash}}"]      = "$" .. tostring(cash),
        ["{{bank}}"]      = "$" .. tostring(bank)
    }

    for k, v in pairs(replacements) do
        text = text:gsub(k, v)
    end

    return text
end

local function ApplyPresenceVisuals(preset)
    if not preset then preset = Config.Default end
    local a = preset.assets or Config.Assets

    local largeText = ReplacePlaceholders(a.largeText or Config.Assets.largeText)
    local smallText = ReplacePlaceholders(a.smallText or Config.Assets.smallText)

    SetDiscordRichPresenceAsset(a.largeIcon or Config.Assets.largeIcon)
    SetDiscordRichPresenceAssetText(largeText)
    SetDiscordRichPresenceAssetSmall(a.smallIcon or Config.Assets.smallIcon)
    SetDiscordRichPresenceAssetSmallText(smallText)

    Wait(250)

    SetDiscordRichPresenceAction(0, "", "")
    SetDiscordRichPresenceAction(1, "", "")
    Wait(50)

    -- reapply new buttons
    if preset.buttons and type(preset.buttons) == "table" then
        for i = 1, math.min(#preset.buttons, 2) do
            local btn = preset.buttons[i]
            if btn and btn.label and btn.url and btn.url ~= "" then
                SetDiscordRichPresenceAction(i - 1, ReplacePlaceholders(btn.label), btn.url)
            end
        end
    elseif Config.Default.buttons then
        for i = 1, math.min(#Config.Default.buttons, 2) do
            local btn = Config.Default.buttons[i]
            if btn and btn.label and btn.url and btn.url ~= "" then
                SetDiscordRichPresenceAction(i - 1, ReplacePlaceholders(btn.label), btn.url)
            end
        end
    end
end

local function InitializePresence()
    SetDiscordAppId(Config.DiscordAppId)
    Wait(750) 

    initialized = true
    SetRichPresence(ReplacePlaceholders(Config.Default.details))
    ApplyPresenceVisuals(Config.Default)
end


exports('SetRichPresence', function(nameOrDetails, state)
    if not initialized then InitializePresence() end

    local preset = Config.StatusPresets[nameOrDetails]
    if preset then
        activePresence = preset
        SetRichPresence(ReplacePlaceholders(preset.details))
        ApplyPresenceVisuals(preset)
    else
        activePresence = {
            details = nameOrDetails,
            state = state or Config.Default.state,
            assets = Config.Assets,
            buttons = Config.Default.buttons
        }
        SetRichPresence(ReplacePlaceholders(activePresence.details))
        ApplyPresenceVisuals(activePresence)
    end
end)

exports('ResetRichPresence', function()
    activePresence = nil
    SetRichPresence(ReplacePlaceholders(Config.Default.details))
    ApplyPresenceVisuals(Config.Default)
end)


CreateThread(function()
    Wait(2000)
    InitializePresence()

    while true do
        Wait(Config.UpdateInterval)

        local preset = activePresence or Config.Default
        local details = ReplacePlaceholders(preset.details)
        local state   = ReplacePlaceholders(preset.state)

        SetRichPresence(details)
        ApplyPresenceVisuals(preset)
    end
end)
