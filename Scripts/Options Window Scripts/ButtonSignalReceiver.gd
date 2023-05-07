extends Node


func _on_defaults_pressed():
	%DefaultConfigLoader.restore_default_config()

func _on_cancel_pressed():
	self.owner.close_options_window()

func _on_ok_pressed():
	%ConfigManager.get_ui_values()
	%ConfigSaver.save_config()
	self.owner.close_options_window()
	
func _on_v_sync_pressed():
	%DependencyManager.update_vsync_dependencies()

func _on_fps_limit_pressed():
	%DependencyManager.update_fpslimit_dependencies()
