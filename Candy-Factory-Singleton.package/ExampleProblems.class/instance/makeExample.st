example
makeExample
	| taskMang1 taskMang2 chocMelter |
	chocMelter := ChocolateMelter new.
	taskMang1 := TaskManager assign: chocMelter.
	"have second taskmang use same chocolate melter"
	
	taskMang1 webOrder: 'lollipop' amount: 5.
	taskMang1 callInOrder: '2-chocolate bar_3-chocolate peanut butter cup'.
	taskMang1 webOrder: 'chocolate peanut butter cup' amount: 2.
	Transcript show: 'All orders done!', String cr.
	
	