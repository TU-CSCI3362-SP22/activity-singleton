as yet unclassified
fillOrders: orders
	[
		orders do: [ :each | Transcript show: (each time) asString, ' seconds later...', String cr. Transcript show: each orderName, ' of quantity ', each quantity asString, ' finished!', String cr ]
	]	fork.