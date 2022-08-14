--[[

    MemeMeow Bot settings file (v1.0)

    Designed using Discordia API (version 2.9.2) and Luvit 2.0 framework.

    Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

]]

local Discord = {
    timer = require('timer'),
    dependencies = {
        ['./'] = { 'settings' },
        ['./Events/'] = {
            'OnTick',
            'GetMeme',
            'OnMessage',
        },
    }
}

local Discordia = require('discordia')
local client = Discordia.Client()

local json = require('json')
local coro = require("coro-http")

setmetatable(Discord, {
    __index = client
})

function Discord:OnReady()
    self.guild = client:getGuild(self.discord_server_id)
    if (self.guild) then

        self.meme_channel = self.guild:getChannel(self.channel)
        if (self.meme_channel) then
            client:info('Ready: ' .. client.user.tag)
            self:OnTick()
        end
    end
end

function Discord:StartBot()

    local s = self
    for path, t in pairs(self.dependencies) do
        for _, file in pairs(t) do
            local f = loadfile(path .. file .. '.lua')()
            setmetatable(s, { __index = f })
            s = f
        end
    end

    client:run('Bot ' .. self.token())
    client:setGame("🐱 Meow 🐱")
end

function Discord:HTTP_GET(url)
    local _, body = coro.request('GET', url)
    return json.parse(body)
end

Discord:on('ready', function()
    Discord:OnReady()
end)

Discord:on('messageCreate', function(msg)
    Discord:OnMessage(msg)
end)

Discord:StartBot()