extends Area2D

@onready var scoreboard: Control = %Scoreboard

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		scoreboard.add_point()
		queue_free()
		