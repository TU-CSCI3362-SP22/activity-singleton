initialization
testGoodDay
   "a sequence of tests that should be okay"
	webBot webOrder: 'lollipop' amount: 2.
	(voiceBots at: 1) callInOrder: '3-lollipop_2-chocolate bar'.
	(voiceBots at: 2) callInOrder: '2-chocolate peanut butter cup'.
	webBot webOrder: 'chocolate peanut butter cup' amount: 2.
	(voiceBots at: 2) callInOrder: '2-lollipop'.