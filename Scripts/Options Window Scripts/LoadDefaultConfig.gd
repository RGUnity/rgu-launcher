extends Node

func restore_default_config():	
	%ConfigManager.config.load("res://Config_Default.cfg")
	%ConfigSaver.save_config()
