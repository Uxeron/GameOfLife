extends Sprite

onready var output_sprite : Sprite = get_node("../../OutputSprite")

export var FPS = 60.0
var frame_time = 0

var startup = true

func _process(delta):
	if startup:
		yield(get_tree(), "idle_frame")
		yield(get_tree(), "idle_frame")
		startup = false
	
	frame_time += delta
	if frame_time < (1.0 / FPS):
		return
	frame_time = 0

	var data = output_sprite.texture.get_data()
	var output_texture = ImageTexture.new()
	output_texture.create_from_image(data)
	texture = output_texture
