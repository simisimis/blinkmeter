Counter = {counter = 0}
function Counter:increment()
    self.counter = self.counter + 1
end

function Counter:reset()
    self.counter = 0
end

function Counter:get()
    return self.counter
end
