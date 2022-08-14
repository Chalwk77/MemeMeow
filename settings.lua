--[[

    MemeMeow Bot settings file

    Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

]]

return {

    -- Discord Server ID:
    discord_server_id = '984985170492944475',

    -- End Point URL (string) of the chosen CatMeme API:
    --
    url = 'https://api.thecatapi.com/v1/images/search',

    -- Numerical ID of the channel where cat memes will be posted:
    --
    channel = '985001316180971560',

    -- How often will the bot post a cat meme (in seconds):
    -- Default: 3600 (1 hour)
    --
    duration = 3600,

    -- Phrase that triggers a cat meme:
    --
    phrase = 'meow',

    --
    -- DO NOT TOUCH: --
    --
    token = function()
        local token = ''
        local file = io.open('./auth.data')
        if (file) then
            token = file:read()
            file:close()
        end
        return token
    end
}