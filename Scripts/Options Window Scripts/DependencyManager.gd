extends Node


func update_vsync_dependencies():
	if %ConfigManager.vsyncCheckbox.button_pressed:
		%ConfigManager.limitFPSCheckbox.button_pressed = false
		%ConfigManager.limitFPSCheckbox.disabled = true
		%ConfigManager.maxFPSSpinbox.editable = false
	else:
		%ConfigManager.limitFPSCheckbox.disabled = false
		%ConfigManager.maxFPSSpinbox.editable = true

func update_fpslimit_dependencies():
	if %ConfigManager.limitFPSCheckbox.button_pressed:
		%ConfigManager.maxFPSSpinbox.editable = true
	else: 
		%ConfigManager.maxFPSSpinbox.editable = false
