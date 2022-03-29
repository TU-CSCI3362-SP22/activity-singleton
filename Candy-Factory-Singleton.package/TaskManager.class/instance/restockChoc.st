as yet unclassified
restockChoc
	Transcript show: '** Restocking ChocolateMelter **',  String cr.
	(Delay forSeconds: 5) wait.
	self chocMelter supply: self chocMelter supply + 20.