-- 1. THE DATA (State)
local player = {
    x = 100,
    y = 300,
    velocityY = 0,
    isJumping = false,
    speed = 200,     -- Pixels per second
    gravity = 1200   -- Increased gravity slightly for a crisper fall
}

-- 2. THE ENGINE COUPLING (LÖVE Callbacks)

-- This runs ONCE at the start of the game
function love.load()
    -- Sets a nice background color (Light Blue) so you know it's working
    love.graphics.setBackgroundColor(0.4, 0.6, 0.9)
end

-- This runs 60+ times a second to handle mechanics
function love.update(dt)
    -- Rule 1: Apply Gravity if the player is in the air
    if player.y < 300 then
        player.velocityY = player.velocityY + (player.gravity * dt)
    else
        -- Rule 2: Land on the floor
        player.y = 300
        player.velocityY = 0
        player.isJumping = false
    end

    -- Rule 3: Apply the velocity to the player's position
    player.y = player.y + (player.velocityY * dt)
end

-- This runs constantly to DRAW images/shapes on your screen
function love.draw()
    -- Draw the floor line
    love.graphics.setColor(0.2, 0.7, 0.2) -- Green
    love.graphics.rectangle("fill", 0, 320, 800, 280)

    -- Draw the player (represented by a white square)
    love.graphics.setColor(1, 1, 1) -- White
    love.graphics.rectangle("fill", player.x, player.y, 20, 20)
end

-- This handles input native to LÖVE
function love.keypressed(key)
    if key == "space" and not player.isJumping then
        player.velocityY = -450 -- Jump force
        player.isJumping = true
    end
end