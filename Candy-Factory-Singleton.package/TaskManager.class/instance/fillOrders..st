as yet unclassified
fillOrders: orders
	[
		orders do: [ :each | 
			(chocMelter use: each chocAmt)
			ifTrue:
				[ Transcript show: (each time) asString, ' seconds later...', String cr. Transcript show: each orderName, ' of quantity ', each quantity asString, ' finished!', String cr ]
			ifFalse: 
				[ Transcript show: 'Error on ', each orderName, '. Call the restock chocolate method.', String cr ]
		]
	
	]	fork.
