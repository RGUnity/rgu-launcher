# Redguard Unity Launcher
A Godot-based launcher to save redguard-unity settings in a json file.

## Project Status
All the implemented GUI elements save their values to the config. The config can be reset to its defaults using [Config_default.json](https://github.com/RGUnity/redguard-unity/blob/a79288d9394c730a920748de8585102935f16e28/Assets/StreamingAssets/Config_default.json).


## Technical info
The executable of this folder is meant to be placed in the same folder as RedguardUnity.exe

It either needs an existing config file at `AppData\LocalLow\RGUnity\RedguardUnity\Config.json`, or the default config to be at `redguard-unity-exe-folder\RedguardUnity_Data\StreamingAssets\Config_default.json` so that it can create a new config file.

Made with Godot 4.0.2


![image](https://user-images.githubusercontent.com/13683581/226851200-4e07da9b-17a6-429c-ae05-df27811478ee.png)
