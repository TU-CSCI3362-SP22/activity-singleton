as yet unclassified
createOrder: candy amount: quantity  
	|order|
	candy = 'lollipop' 
		ifTrue: [ order := LollipopOrder withQuantity: quantity ]
		ifFalse: [ 
			candy = 'chocolate peanut butter cup'
			ifTrue: [ order := ChocPBCupOrder withQuantity: quantity ]
			ifFalse: [ 
				candy = 'chocolate bar'
				ifTrue: [ order := ChocolateBarOrder withQuantity: quantity ]
				ifFalse: [ Transcript show: 'Not a valid order name, candy options are: lollipop, chocolate peanut butter cup, and chocolate bar'.
							  ^ self ]	
			]	
		].
	^ order.
	