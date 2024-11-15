class_name HealthbarComponent
extends ProgressBar


@export var health_component : HealthComponent


func _ready():
	health_component.health_changed.connect(_on_health_changed)
	max_value = health_component.max_health
	value = max_value
	show_percentage = false
	z_index = 10
	position = Vector2(-13.577, -21.131)
	size.x = 41
	size.y = 21
	scale.x = 0.652
	scale.y = 0.233
	
func _on_health_changed(new_health):
	value = new_health
