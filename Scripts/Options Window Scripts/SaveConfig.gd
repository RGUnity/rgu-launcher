extends Node

#	These crate the path for the new file in /LocalLow
var windowsDrive = OS.get_environment("windir").rstrip("WINDOWS")
var username = OS.get_environment("USERNAME")
var configPath = windowsDrive + "/users/" + username + "/APPDATA/LOCALLOW/RGUnity/RedguardUnity/Config.json"

func save_config():
	var configFile = FileAccess.open(configPath, FileAccess.WRITE)
	print(%ConfigManager.config)
	configFile.store_string(JSON.stringify(%ConfigManager.config))
	
	print("Config saved to ", configPath)
