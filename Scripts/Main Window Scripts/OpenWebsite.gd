extends Node
@export var url: String

func _pressed():
	OS.shell_open(url)
