extends CharacterBody2D


@export var speed : float = 200.0
@export var health_component : HealthComponent


var direction : Vector2 = Vector2(-1,0)
var target : Node2D = null


func _ready() -> void:
	health_component.health_depleted.connect(_on_health_depleted)
	add_to_group('Enemy')

	
func _physics_process(_delta) -> void:
	direction = get_target_direction()
	velocity = direction * speed
	move_and_slide()


func get_target_direction() -> Vector2:
	var target_direction : Vector2 = Vector2(0,0)
	var player_group : Array = get_tree().get_nodes_in_group('Player')
	var closest_target : Node2D = null

	for t in player_group:
		var current_target_distance : float = global_position.distance_squared_to(t.global_position)
		if not closest_target:
			closest_target = t
		elif current_target_distance < global_position.distance_squared_to(closest_target.global_position):
			closest_target = t
		else:
			pass

	if closest_target: target_direction = global_position.direction_to(closest_target.global_position)	
	return target_direction


func _on_health_depleted() -> void:
	queue_free()
