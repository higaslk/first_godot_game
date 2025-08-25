extends Node2D

@onready var raycast: RayCast2D = $"Raycast"
@onready var raycastPlayer: RayCast2D = $RaycastToPlayer

const SPEED: int = 50
const startRandomDir: Array[Vector2] = [Vector2(0,1), Vector2(1,0)]

var direction: int = 1
var skeletonDirection: Vector2 = startRandomDir[randi_range(0,1)]

func _ready() -> void:
	raycast.add_exception($"../../Player/")
	#raycast.draw

#func _on_raycast_draw() -> void:
	#raycast.draw_line(raycast.position, raycast.target_position, Color.GREEN)

func _process(delta: float) -> void:
	if raycast.is_colliding():
		direction = -direction
		
		var targetPosition: Vector2 = Vector2.ZERO
		var randomNumber: int = randi_range(1, 4)
		
		match randomNumber:
			1: # right
				targetPosition.x = 15
				skeletonDirection = Vector2(1, 0)
			2: # left
				targetPosition.x = -15
				skeletonDirection = Vector2(-1, 0)
			3: # down
				targetPosition.y = 15
				skeletonDirection = Vector2(0, 1)
			4: # up
				targetPosition.y = -15
				skeletonDirection = Vector2(0, -1)
		raycast.target_position = targetPosition
	
	position += skeletonDirection * delta * SPEED
