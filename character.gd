extends CharacterBody2D


@export var health_component : HealthComponent


func _ready():
	health_component.health_depleted.connect(_on_health_depleted)
	add_to_group('Player')


func _physics_process(_delta):
	pass


func _on_health_depleted():
	queue_free()
	get_tree().paused = true #FIXME Change me later
