# This Node requires a Plant: AnimatedSprite2D and a Fruit: Sprite2D 
# to be able to function
extends Node2D

@export var days_to_grow = 3

var can_harvest := false

# Just a regular mapping between frames 0..4 so I can name them 
const num_of_states := 5
enum PlantState {
	SEED,
	GERMINATION,
	GROWING,
	ADULT,
	FRUIT,
}

@onready var plant_state = PlantState.SEED
@onready var plant_sprite := $Plant

# The GrowthTimer fires once for every state
# This variable calculates how long should each state last
@onready var growth_duration = days_to_grow / num_of_states


func _ready():
	plant_sprite.frame = plant_state
	$GrowthTimer.wait_time = growth_duration
	if $Fruit != null:
		$Fruit.hide()

# What happens for each phase of the plants growth
func _on_timer_timeout():
		plant_sprite.frame += 1
		if plant_sprite.frame == PlantState.FRUIT:
			can_harvest = true
			$GrowthTimer.stop()
			$Test.start()


# Sets up the ready to harvest mode
func harvest_plant():
	plant_sprite.frame = 1
	$Fruit.show()
