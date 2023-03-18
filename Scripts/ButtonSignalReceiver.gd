extends Node


func _on_defaults_pressed():
	%DefaultConfigLoader.restore_default_config()

func _on_cancel_pressed():
	%OptionsWindowPopUp.set_visible(false)

func _on_ok_pressed():
	%ConfigManager.set_values_and_save_config()
	%OptionsWindowPopUp.set_visible(false)
	
func _on_v_sync_pressed():
	%DependencyManager.update_vsync_dependencies()

func _on_fps_limit_pressed():
	%DependencyManager.update_fpslimit_dependencies()
