extends Button


func _pressed():
	
	# RedguardUnity.exe should be in the same folder as this exe
	var redguard = OS.get_executable_path().get_base_dir() + "/RedguardUnity.exe"
	OS.shell_open(redguard)
	
	# Exit the launcher
	get_tree().quit()
