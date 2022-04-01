constructor
withQuantity: anInteger
	| order |
	order := self new.
	order quantity: anInteger.
	order time: order time * anInteger.
	order chocAmt: order chocAmt * anInteger.
	^ order.