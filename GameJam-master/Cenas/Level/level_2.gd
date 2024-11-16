extends Node

@onready var musicAudioStreamBG = $Audio_BG
var backgroundMusicOn = true
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_music_stats()
		
func update_music_stats():
	if backgroundMusicOn:
		if !musicAudioStreamBG.playing:
			musicAudioStreamBG.play()
		
	else:
		musicAudioStreamBG.stop()
