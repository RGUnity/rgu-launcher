extends Node

#	These crate the path for the new file in /LocalLow
var drive = OS.get_environment("windir").rstrip("WINDOWS")
var user = OS.get_environment("USERNAME")
var path = drive + "/users/" + user + "/APPDATA/LOCALLOW/RGUnity/RedguardUnity/Config.cfg"

func load_config():
	if %ConfigManager.config.load(path) == OK:
		print ("Config loaded Successfully: ", path)
	else:
		%DefaultConfigLoader.restore_default_config()
