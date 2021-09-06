tool
extends Node2D

export var zoom = 1.0
export var FPS = 60.0

func _ready():
	if Engine.editor_hint:
		return
	
	$Viewport/GameOfLife.FPS = FPS
	OS.set_window_size($Viewport/GameOfLife.texture.get_size() * zoom)
	$Camera2D.zoom = Vector2(1.0 / zoom, 1.0 / zoom)


func _process(delta):
	if not Engine.editor_hint:
		return

	$Viewport.size = $Viewport/GameOfLife.texture.get_size()
