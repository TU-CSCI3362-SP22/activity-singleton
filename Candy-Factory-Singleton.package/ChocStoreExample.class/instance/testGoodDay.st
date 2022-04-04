initialization
testGoodDay
   "a sequence of tests that should be okay"
	Transcript open.
	Transcript clear.
	webBot webOrder: 'lollipop' amount: 2.
	(voiceBots at: 1) callInOrder: '3-lollipop_1-chocolate bar_2-lollipop_1-chocolate bar'.
	(voiceBots at: 2) callInOrder: '1-chocolate peanut butter cup_1-chocolate bar'.
	webBot webOrder: 'chocolate peanut butter cup' amount: 2.