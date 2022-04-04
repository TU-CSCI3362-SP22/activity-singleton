initialization
initialize
	super initialize.
	webBot := WebChocBot withRoboName: 'Skynet'.
	voiceBots := OrderedCollection 
						with: (VoiceChocBot withRoboName: 'JohnnyFive')
						with: (VoiceChocBot withRoboName: 'M').
