dofile("counter.lua")

BlinkDetector = {
    ON_THRESHOLD = 200,
    OFF_THRESHOLD = 100,
    ON = 1,
    OFF = 0,
    state = 0
}

function BlinkDetector:isBlinking(value)
    if self.state == self.ON and value < self.OFF_THRESHOLD then
        self.state = self.OFF
        return true
    end
    if value > self.ON_THRESHOLD then
        self.state = self.ON
    end
    return false
end
