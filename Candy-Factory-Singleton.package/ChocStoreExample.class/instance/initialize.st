initialization
initialize
	| vBots |
	super initialize.
	melter := ChocolateMelter getInstance.
	webBot := WebChocBot withRoboName: 'G' withMelter: melter.
	vBots := OrderedCollection new.
	vBots add: (VoiceChocBot withRoboName: 'E' withMelter: melter);
	add: (VoiceChocBot withRoboName: 'M' withMelter: melter).
	voiceBots := vBots.
	"make one web bot and a colleciton of two talky bots and put them in the variables with roboName:"