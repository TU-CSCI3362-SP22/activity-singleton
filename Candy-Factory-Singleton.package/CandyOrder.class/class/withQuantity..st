as yet unclassified
withQuantity: anInteger
	|order|
	order := self new.
	order quantity: anInteger.
	order time: order time * anInteger.
	^order.