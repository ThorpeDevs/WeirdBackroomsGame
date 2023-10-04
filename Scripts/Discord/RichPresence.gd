extends Node
class_name RichPresence
## The Application ID you need to get to make anything in the SDK → https://discord.com/developers/applications
## default: application/config/discord_application_id
@export var app_id:int
## The first text line visible in the Activity (after the app name)
## default: null
@export var details:String
## The second text line visible in the Activity
## default: null
@export var state:String
## Key for the large image you set while uploading an image to the "Rich Presence" → "Art Assets" tab in your online Discord dev panel
## default: null
@export var large_image:String
## Text wich shows when you hover over the large image
## default: null
@export var large_image_text:String
## Key for the small image you set while uploading an image to the "Rich Presence" → "Art Assets" tab in your online Discord dev panel
## default: null
@export var small_image:String
## Text wich shows when you hover over the small image
## default: null
@export var small_image_text:String
## The "02:46 elapsed" timestamp in the presence. Get the current time with Godot's int(Time.get_unix_time_from_system()) and Discord counts in seconds from it
## default: null
@export var start_timestamp:int
## The "59:59 elapsed" timestamp in the presence. Get it with Godot's int(Time.get_unix_time_from_system()) and add seconds as int e.g. + 3600 → + 1 Hour
## default: null
@export var end_timestamp:int

static func set_presence(rich_presence:RichPresence):
	if rich_presence.app_id == null:
		var discord_app_id = str(ProjectSettings.get_setting("application/config/discord_application_id")).to_int()
		if discord_app_id > 0:
			rich_presence.app_id = discord_app_id
	if rich_presence.app_id != null and discord_sdk.app_id != rich_presence.app_id:
		discord_sdk.app_id = rich_presence.app_id
	if rich_presence.details:
		discord_sdk.details = rich_presence.details
	if rich_presence.state:
		discord_sdk.state = rich_presence.state
	if rich_presence.large_image:
		discord_sdk.large_image = rich_presence.large_image
	if rich_presence.large_image_text:
		discord_sdk.large_image_text = rich_presence.large_image_text
	if rich_presence.small_image:
		discord_sdk.small_image = rich_presence.small_image
	if rich_presence.small_image_text:
		discord_sdk.small_image_text = rich_presence.small_image_text
	if rich_presence.start_timestamp:
		discord_sdk.start_timestamp = rich_presence.start_timestamp
	if rich_presence.end_timestamp:
		discord_sdk.end_timestamp = rich_presence.end_timestamp
	discord_sdk.refresh()
