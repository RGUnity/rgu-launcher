extends LineEdit

var configManagerPath = "/root/Control/WindowDialog"
export(String) var section
export(String) var value


func _on_WindowDialog_loaded():
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	set_text(config.get_value(section, value))


func _on_LineEdit_text_changed(new_text):
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, value, new_text)


func _on_FileDialog_dir_selected(dir):
	set_text(dir)
	var configManager = get_node(configManagerPath)
	var config = configManager.config
	config.set_value(section, value, dir)
	#pass
