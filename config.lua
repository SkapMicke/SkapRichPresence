QBCore = exports['qb-core']:GetCoreObject()
Config = {}

------------------------------------------------------
-- 🌐 Core Setup
------------------------------------------------------
Config.DiscordAppId = 1422274223400947782 -- set up your own Discord Application: https://discord.com/developers/applications
Config.DiscordInvite = "https://discord.gg/j4YsNCavcC"

Config.AutoUpdate = true
Config.UpdateInterval = 60000
Config.UseJobStatus = true
Config.ShowPlayerCount = true
Config.ShowLocation = true
Config.ShowCharacterName = true
Config.ShowMoney = false -- enable {{cash}} and {{bank}} if you want to show balances

------------------------------------------------------
-- 🏷️ Custom Game Label (appears next to icon)
------------------------------------------------------
-- This simulates a custom “game name” text, shown under your Discord name.
-- Example: "Syntrax RP | Swedish Roleplay"
Config.CustomGameLabel = "Syntrax RP | Swedish Roleplay"


------------------------------------------------------
-- 🖼️ Global / Default visual assets
------------------------------------------------------
-- Used when no preset is active
Config.Assets = {
    largeIcon = "syntrax",
    largeText = "Playing as {{character}} | {{job}}",
    smallIcon = "sv_flag",
    smallText = "At {{location}} | {{players}} online",
}

------------------------------------------------------
-- 🧾 Default Rich Presence Template
------------------------------------------------------
-- You can use placeholders:
-- {{job}}, {{players}}, {{location}}, {{character}},
-- {{id}}, {{cash}}, {{bank}}
------------------------------------------------------
Config.Default = {
    details = "Playing as {{character}} | {{job}} | {{players}} online",
    state = "At {{location}} | ID: {{id}}",
    assets = {
        largeIcon = "syntrax",
        largeText = "Syntrax Roleplay | {{job}}",
        smallIcon = "sv_flag",
        smallText = "City life | {{players}} online",
    },
    buttons = {
        { label = "Join Syntrax RP", url = "https://discord.gg/syntraxrp" },
        { label = "Visit Website",   url = "https://syntraxrp.com" },
    }
}

------------------------------------------------------
-- 🎭 Preset Activities (each with its own visuals)
------------------------------------------------------
Config.StatusPresets = {

    --------------------------------------------------
    -- 💇 Makeover
    --------------------------------------------------
    ["makeover"] = {
        details = "Får en makover... | {{players}} online", -- Swedish for "Getting a makeover..."
        state = "At {{location}} | ID: {{id}}",
        assets = {
            largeIcon = "syntrax",
            largeText = "{{character}} - Fresh cut!",
            smallIcon = "syntrax",
            smallText = "Styling hair | {{job}}",
        },
        buttons = {
            { label = "Book Appointment", url = "https://syntraxrp.com/barber" },
            { label = "Join Discord",     url = Config.DiscordInvite },
        }
    },
    ["clothes"] = {
        details = "Kikar nya kläder... | {{players}} online", -- Swedish for "Checking out new clothes..."
        state = "At {{location}} | ID: {{id}}",
        assets = {
            largeIcon = "syntrax",
            largeText = "{{character}} - Fresh cut!",
            smallIcon = "syntrax",
            smallText = "Styling hair | {{job}}",
        },
        buttons = {
            { label = "Book Appointment", url = "https://syntraxrp.com/barber" },
            { label = "Join Discord",     url = Config.DiscordInvite },
        }
    },
    ["tattoo"] = {
        details = "Kikar nya tatueringar... | {{players}} online", -- Swedish for "Checking out new tattoos..."
        state = "At {{location}} | ID: {{id}}",
        assets = {
            largeIcon = "syntrax",
            largeText = "{{character}} - Fresh cut!",
            smallIcon = "syntrax",
            smallText = "Styling hair | {{job}}",
        },
        buttons = {
            { label = "Book Appointment", url = "https://syntraxrp.com/barber" },
            { label = "Join Discord",     url = Config.DiscordInvite },
        }
    },

    --------------------------------------------------
    -- 💰 Robbery
    --------------------------------------------------
    ["robbery"] = {
        details = "Committing a robbery | {{players}} online",
        state = "At {{location}} | ID: {{id}}",
        assets = {
            largeIcon = "heist_mask",
            largeText = "{{character}} - Heist in progress!",
            smallIcon = "cash_icon",
            smallText = "Money on the move | {{job}}",
        },
        buttons = {
            { label = "Watch Live",   url = "https://syntraxrp.com/heist" },
            { label = "Join Discord", url = Config.DiscordInvite },
        }
    },

    --------------------------------------------------
    -- 🚗 Driving
    --------------------------------------------------
    ["driving"] = {
        details = "Cruising around Los Santos | {{players}} online",
        state = "At {{location}} | ID: {{id}}",
        assets = {
            largeIcon = "car_icon",
            largeText = "{{character}} | Enjoying the ride",
            smallIcon = "wheel_icon",
            smallText = "Speeding through | {{job}}",
        },
        buttons = {
            { label = "Join Discord", url = Config.DiscordInvite },
            { label = "Syntrax RP",   url = "https://syntraxrp.com" },
        }
    },

    --------------------------------------------------
    -- 💤 Chilling
    --------------------------------------------------
    ["chilling"] = {
        details = "Relaxing and taking it easy | {{players}} online",
        state = "At {{location}} | {{character}}",
        assets = {
            largeIcon = "chill_icon",
            largeText = "Chilling in the city",
            smallIcon = "drink_icon",
            smallText = "Leisure mode | {{job}}",
        },
        buttons = {
            { label = "Join Discord", url = Config.DiscordInvite },
            { label = "Syntrax RP",   url = "https://syntraxrp.com" },
        }
    },
}
