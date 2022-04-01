constructor
fromOrderString: aString
	| splittedString |
	splittedString :=  aString splitOn: '-'.
	^ self ofCandy: (splittedString at: 2) withQuantity: ((splittedString at: 1) asNumber).
