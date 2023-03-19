extends Node


func _on_pressed():
	OS.shell_open(OS.get_executable_path().get_base_dir())
