2d game world {
	The game world(the gameplay related part) should consist of 2d tiles with different textures.
	Some of them may have additional functions if needed.

	Tasks {
		1. Add lua support in the engine and access methods for the supported components.
		2. Add support for 2d tile in the default scene. (+Collision)
		3. Create a world editor with support for tiles.
		4. Add support in the world editor for dynamic objects.
	}
}

Storyline {
	Choose a basic storyline, and create at lesat 5 levels based on it.
	Depends on: Main character, 2d game world & maybe on Enemies.

	Bad ppl steal magic crystal. 2 dimentions gonna merge. Ninja stop bad ppl.
	Tasks {
		1. Create Level 1: Introduction - The village.
		2. Create Level 2: The Forest.
		//3. Create level 3: The Lake.
		//4. Create level 4: The Dungeons.
		//5. Create level 5: The End. (boss fight)
	}
}

Enemies {
	1. Add collision detection for the hero.
	2. Give the ninja a ranged attack. (Units should be able to die.)
	3. Add a basic ninja enemy with simple AI.
	4. Add a simple trap that is activated when stepped on.
}