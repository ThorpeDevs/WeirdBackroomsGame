extends Node

var _dicsord_rpc_enabled:bool = false

var dicsord_rpc_enabled:bool:
	get:
		return _dicsord_rpc_enabled


# Called when the node enters the scene tree for the first time.
func _ready():
	var discord_app_id = str(ProjectSettings.get_setting("application/config/discord_application_id")).to_int()
	if discord_app_id > 0:
		discord_sdk.app_id = discord_app_id # Application ID
		discord_sdk.details = ""
		discord_sdk.state = "MainMenu"
		
		discord_sdk.start_timestamp = int(Time.get_unix_time_from_system())
		
		discord_sdk.refresh() # Always refresh after changing the values!
		
		_dicsord_rpc_enabled = discord_sdk.get_is_discord_working()
	else:
		push_warning("Define `application/config/discord_application_id` to use Discord RPC")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
