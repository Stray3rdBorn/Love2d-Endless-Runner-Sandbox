-- (State) define the player object with properties for position, velocity, and state
local player = {
    x = 100,
    y = 290,
    velocityY = 0,
    isJumping = false,
    speed = 200,   -- Pixels per second
    gravity = 1200 -- Pull force downward
}

-- (State) define the player object with properties for position, velocity, and state
local enemy = {
    x = 700,
    y = 290,
    velocityX = 0,
    speed = 100, -- Pixels per second
}
-- Runs once when game starts
function love.load()
    -- Set the window title
    love.window.setTitle("Sandbox")
    love.window.setMode(800, 600) -- Window width and height
    love.graphics.setBackgroundColor(0.4, 0.6, 0.9)
end

-- Draws the game state to the screen
function love.draw()
    -- Draw the floor line
    love.graphics.setColor(0.2, 0.7, 0.2) -- Green
    love.graphics.rectangle("fill", 0, 320, 800, 280)

    -- Draw the player
    love.graphics.setColor(1, 0, 0)                             -- Red
    love.graphics.rectangle("fill", player.x, player.y, 25, 30) -- Player is a 25x30 rectangle

    -- Draw the enemy
    love.graphics.setColor(0, 0, 1)                           -- Blue
    love.graphics.rectangle("fill", enemy.x, enemy.y, 25, 30) -- Enemy is a 25x30 rectangle
end

-- Updates the game state
-- This function runs inside the loop, 60 times a second.
-- "dt" stands for Delta Time (the exact fraction of a second since the last frame)
function love.update(dt)
    -- Apply gravity to the player if they are in the air
    if player.isJumping then
        player.velocityY = player.velocityY + (player.gravity * dt)
    end

    -- Update the player's position based on their velocityY
    player.y = player.y + (player.velocityY * dt)

    -- Check if the player has landed on the ground
    if player.y >= 290 then
        player.y = 290
        player.velocityY = 0
        player.isJumping = false
    end
end

-- Rule 4: The Input Handler
function love.keypressed(key)
    if key == "space" then
        print("Spacebar was pressed successfully!")

        if not player.isJumping then
            player.velocityY = -500 -- Launch upward
            player.isJumping = true
        end
    end
end
