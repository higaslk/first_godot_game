extends Control

var score: int = 0
@onready var label = $Label

func add_point() -> void:
	score += 1
	label.text = 'Collected ' + str(score) + '/7 gold bars'
	
	if score >= 7:
		label.text = 'GG you won! Die to restart.'
