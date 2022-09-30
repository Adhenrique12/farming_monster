extends Node2D

@export var days_to_grow = 3

var can_harvest := false

const num_of_states := 5
enum PlantState {
	SEED,
	GERMINATION,
	GROWING,
	ADULT,
	FRUIT,
}

@onready var plant_state = PlantState.SEED
@onready var plant_sprite := $Plant # todo REMOVE
@onready var growth_duration = days_to_grow / num_of_states


func _ready():
	plant_sprite.frame = plant_state
	$GrowthTimer.wait_time = growth_duration
	if $Fruit != null:
		$Fruit.hide()


func _on_timer_timeout():
		plant_sprite.frame += 1
		if plant_sprite.frame == PlantState.FRUIT:
			can_harvest = true
			$GrowthTimer.stop()
			$Test.start()


func harvest_plant():
	$Fruit.show()


func _on_test_timeout():
	plant_sprite.frame = 1
	harvest_plant()
