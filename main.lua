-- (State) define the player object with properties for position, velocity, and state
local player = {
    x = 100,
    y = 300,
    velocityY = 0,
    isJumping = false,
    speed = 200,  -- Pixels per second
    gravity = 500 -- Pull force downward
}

-- Runs once when game starts
function love.load()
    -- Set the window title
    love.window.setTitle("Sandbox")
    love.window.setMode(800, 600) -- Window width and height
end

-- Updates the game state
-- This function runs inside the loop, 60 times a second.
-- "dt" stands for Delta Time (the exact fraction of a second since the last frame)
function UpdateGame(dt)
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

-- Rule 4: The Input Method
function HandleKeyPress(key)
    if key == "space" and not player.isJumping then
        player.velocityY = -300 -- Negative Y moves UP in screen coordinates
        player.isJumping = true
    end
end
