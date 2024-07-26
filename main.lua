love = require('love')

function love.load()
	--setup window
	love.window.setMode(800,600,{resizable = false})
	love.window.setTitle("DICEY")
	math.randomseed(os.time())

	-- Setup game state
	GameState = init_game()
	Dice = {}
	DiceNum = 6
end

function love.update(dt)
	GameState, DiceHand = game_decider(GameState, DiceHand)
end

function love.draw()
	love.graphics.print(GameState,20,20)
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit()
	end
end

function init_game()
	local game_state = "new"
	return game_state
end

function game_decider(game_state, dice_hand)
	if game_state == "new" then
		dice_hand = new_dice()	
		game_state = "phase1"
	elseif game_state == "phase1" then

	end
	return game_state, dice_hand
end

function new_dice()
	local dice_hand = {}
	for i = 1, DiceNum do
		table.insert(dice_hand, math.random(1,6))
	end
	return dice_hand
end
