extends Node

var defaultConfigPath = OS.get_executable_path().get_base_dir() + "/RedguardUnity_Data/StreamingAssets/Config_default.json"

func restore_default_config():	
	
	if FileAccess.file_exists(defaultConfigPath):
		print("Default File found")
		var jsonString = FileAccess.get_file_as_string(defaultConfigPath)
		
		%ConfigManager.config = JSON.parse_string(jsonString)
		# Save the file
		#ConfigSaver.save_config()
		# set the UI elements
		%ConfigManager.set_ui_values()
	else: 
		print("File " + defaultConfigPath + " not found. Are you running in Editor?")
		
	
