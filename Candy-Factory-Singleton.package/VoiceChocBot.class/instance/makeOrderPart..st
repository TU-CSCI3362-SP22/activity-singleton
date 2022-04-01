actions
makeOrderPart: aString  
	| splittedString |
	splittedString :=  aString splitOn: '-'.
	^ CandyOrder ofCandy: (splittedString at: 2) withQuantity: ((splittedString at: 1) asNumber).


		