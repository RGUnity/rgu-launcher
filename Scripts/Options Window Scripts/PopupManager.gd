extends Node

@onready var window = self


func close_options_window():
	if window.visible:
		#window.visible = false
		self.queue_free()



func _on_close_requested():
	close_options_window()
