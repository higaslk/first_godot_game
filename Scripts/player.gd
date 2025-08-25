class_name Player extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var health_display: Label = $HealthDisplay

@export var health: int = 50

const SPEED: int = 100
var inputDirection: Vector2 = Vector2.ZERO

func take_damage(damage: int) -> void:
	health -= clamp(damage, 0, 50)
	health_display.text = str(health)

func move() -> void:
	velocity.x = move_toward(velocity.x, inputDirection.x * SPEED, SPEED)
	velocity.y = move_toward(velocity.y, inputDirection.y * SPEED, SPEED)

func animate() -> void:
	if inputDirection.x == 0 and inputDirection.y == 0:
		sprite.play('Idle')
	elif inputDirection.x != 0:
		sprite.flip_h = inputDirection.x < 0
		sprite.play('WalkingSides')
	elif inputDirection.y > 0:
		sprite.play('WalkingDown')
	elif inputDirection.y < 0:
		sprite.play('WalkingUp')

func _physics_process(_delta: float) -> void:
	inputDirection = Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down')
	
	if health <= 0:
		get_tree().reload_current_scene()
	
	animate()
	move()
	move_and_slide()
