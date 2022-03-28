as yet unclassified
fillOrders: orders
	[
		orders do: [:each | (Delay forSeconds: each time ) wait. Transcript show: each orderName, ' of quantity ', each quantity asString, ' finished!', String cr ]
	]	fork.
	^ self