initialization
initialize
	| vBots |
	super initialize.
	webBot := WebChocBot withRoboName: 'G'.
	vBots := OrderedCollection new.
	vBots add: (VoiceChocBot withRoboName: 'E');
	add: (WebChocBot withRoboName: 'M').
	voiceBots := vBots.
	"make one web bot and a colleciton of two talky bots and put them in the variables with roboName:"