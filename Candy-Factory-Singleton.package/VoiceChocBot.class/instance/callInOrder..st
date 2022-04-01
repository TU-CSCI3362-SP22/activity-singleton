actions
callInOrder: aString  
	"This takes an entire as a formatted string entered by our point-of-sale sytem in the call center. Tragically we cannot change the format!"
	"'For example: '2-chocolate bar_3-chocolate peanut butter cup'. represents 2 chocolate bars and 3 chocolate peanut butter cups."
	| orders |
	orders := (aString splitOn: '_') collect: [ :each | self makeOrderPart:  each ].
	self fillOrders: orders.


		