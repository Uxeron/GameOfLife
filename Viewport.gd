tool
extends Viewport

func _ready():
	OS.set_window_size($GameOfLife.texture.get_size())

func _process(delta):
	if not Engine.editor_hint:
		return

	size = $GameOfLife.texture.get_size()
