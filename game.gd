extends Node2D


@onready var Enemy: PackedScene = load("res://enemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_spawn_timer_timeout():
	var randomSpawn = Vector2(650, randi_range(50, 325))
	var new_enemy = Enemy.instantiate()
	new_enemy.position = randomSpawn
	add_child(new_enemy)
