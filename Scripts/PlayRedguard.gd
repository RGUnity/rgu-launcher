extends Button


func _pressed():
# warning-ignore:return_value_discarded
	OS.shell_open("E:/Games/Redguard Unity/Redguard Unity/RedguardUnity.exe")
	get_tree().quit()
