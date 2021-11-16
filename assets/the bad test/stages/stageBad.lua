function onCreate()
	-- background shit

	makeLuaSprite('bgbad', 'bgbad', -304, -339);
	setLuaSpriteScrollFactor('bgbad', 1, 1)
	
	makeAnimatedLuaSprite('charactersbad', 'charactersbad', -123, 230);
	luaSpriteAddAnimationByPrefix('charactersbad', 'CharsDayAnimation', 'CharsDayAnimation'); 
	setLuaSpriteScrollFactor('charactersbad', 1, 1);

	makeAnimatedLuaSprite('stagebad', 'stagebad', -139, 0);
	luaSpriteAddAnimationByPrefix('stagebad', 'Stage', 'Stage'); 
	setLuaSpriteScrollFactor('stagebad', 1, 1);

	addLuaSprite('bgbad', false);
	addLuaSprite('charactersbad', false);
	addLuaSprite('stagebad', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end