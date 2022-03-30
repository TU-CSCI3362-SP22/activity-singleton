instance creation
new
	"Overriding the inherited 'new' to insure there is never more than one instance of a chocolate melter"
	^ self error: 'Class ', self name, ' can only have one instance. To retrieve it, send "ChocolateMelter curent"'