--[[

    MemeMeow Bot MessageHandler file

    Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

]]

local Message = {}

local function StrSplit(s)
    local args = {}
    for arg in s:gmatch('([^%s]+)') do
        args[#args + 1] = arg
    end
    return args
end

function Message:OnMessage(msg)
    local author = msg.author
    if (author and not author.bot and msg.channel.id == self.channel) then
        local args = StrSplit(msg.content)
        if (args[1] and args[1]:lower() == self.phrase:lower()) then
            self:GetMeme()
        end
    end
end

return Message