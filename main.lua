-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local physics = require( "physics" )
physics.start()

local doLaunch = false

local platform = display.newRect(0, 0, 100, 20)
  platform.x = 160
  platform.y = 440
  platform:setFillColor(1)
  physics.addBody( platform, "static", {friction=0, bounce = 0} )

local rocket = display.newCircle(0,0,20)
  rocket.x = 160
  rocket.y = platform.y - 30
  physics.addBody( rocket )

local function moveRocket()
  if(doLaunch) then
    rocket:applyForce( 0, -0.185, rocket.x, rocket.y )
  end
end

local function launchTouch(event)
  if(event.phase == "began") then
    doLaunch = true
  elseif(event.phase == "ended" or event.phase == "cancelled") then
    doLaunch = false
  end
end

local launchButton = display.newCircle(0,0,20)
  launchButton.x = 290
  launchButton.y = 450
  launchButton:setFillColor(0,1,0)
  launchButton:addEventListener("touch", launchTouch)

Runtime:addEventListener("enterFrame", moveRocket)
