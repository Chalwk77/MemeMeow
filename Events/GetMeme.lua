--[[

    MemeMeow GetMeme file

    Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

]]

local Meme = {}

function Meme:GetMeme()
    coroutine.wrap(function()
        local body = self:HTTP_GET(self.url)
        if (body) then
            self.meme_channel:send({
                embed = {
                    title = '🐱 MEOW 🐱',
                    image = {
                        url = body[1].url
                    }
                }
            })
        end
    end)()
end

return Meme