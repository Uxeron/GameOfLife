extends Sprite

onready var output_sprite : Sprite = get_node("../../OutputSprite")

var FPS = 60.0
var frame_time = 0

var startup = true

func _process(delta):
	# Need to wait for a few frames at first
	if startup:
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		startup = false
	
	# Maintain designated framerate
	frame_time += delta
	if frame_time < (1.0 / FPS):
		return
	frame_time = 0

	# Copy the image rendered by the shader back onto the base sprite
	var data = output_sprite.texture.get_data()
	var output_texture = ImageTexture.new()
	output_texture.create_from_image(data)
	texture = output_texture
