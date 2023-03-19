extends TextureButton


func _pressed():
	# Calls the "close" function in PopupManager
	self.owner.close_options_window()

