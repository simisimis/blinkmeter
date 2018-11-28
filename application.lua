dofile("counter.lua")
dofile("blinkDetector.lua")

local counter = Counter
local blinkDetector = BlinkDetector

function countBlinks()
    local value = adc.read(0)
    if blinkDetector:isBlinking(value) then
        counter:increment()
    end
end

function metrics()
    local buffer = {"# TYPE watts gauge\n", "watts ", counter:get(), "\n"}
    local body = table.concat(buffer)
    counter:reset()
    return body
end

function response()
  local header = "HTTP/1.1 200 OK\r\nServer: NodeMCU on ESP8266\r\nContent-Type: text/plain; version=0.0.4\r\n\r\n"
  local response = header .. metrics()
  print("> " .. response)
  return response
end

-- Initiate blink counting thread
tmr.create():alarm(10, tmr.ALARM_AUTO, countBlinks)

srv = net.createServer(net.TCP, 20) -- 20s timeout

if srv then
  srv:listen(80, function(conn)
    conn:on("receive", function(conn, data)
      print("< "  .. data)
      conn:send(response(), function(finishConn)
        finishConn:close()
        end)
    end)
  end)
end
