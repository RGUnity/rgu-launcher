extends TextureButton


func _pressed():
	get_node("..").set_visible(false)

