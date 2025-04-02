extends PointLight2D

@onready var camera: Camera2D = $"../Camera2D"

var dragging: bool = false
var last_position: Vector2 = Vector2.ZERO


func _input(event: InputEvent) -> void:
	if event.is_action("drag"):
		if event.is_pressed() and event is InputEventMouseButton:
			last_position = (event as InputEventMouseButton).position
			dragging = true
		else:
			dragging = false
	elif event is InputEventMouseMotion:
		var new_position: Vector2 = (event as InputEventMouseMotion).position
		global_position = get_global_mouse_position()

		if dragging:
			var drag_offset: Vector2 = last_position - new_position
			last_position = new_position
			camera.offset += drag_offset
