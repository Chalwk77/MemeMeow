--[[

    MemeMeow Bot OnTick file

    Copyright (c) 2022, Jericho Crosby <jericho.crosby227@gmail.com>

]]

local Timer = {}

function Timer:OnTick()
    self:GetMeme()
    self.timer.setTimeout(1000 * self.duration, function()
        self:OnTick()
    end)
end

return Timer