as yet unclassified
getInstance
	"Return the Singleton instance of ChocolateMelter; if one hasn't been created, do that now"
	uniqueInstance isNil
		ifTrue: [ uniqueInstance := self basicNew initialize].
		^ uniqueInstance 