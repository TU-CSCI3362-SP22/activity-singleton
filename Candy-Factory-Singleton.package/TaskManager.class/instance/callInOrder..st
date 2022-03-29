as yet unclassified
callInOrder: aString  
	| tupList quantity candyOrder candyName splitList orders |
	orders := OrderedCollection new.
	splitList := aString splitOn: '_'.
	splitList do: [ :each |	 tupList:= each splitOn: '-'.
									 quantity := (tupList at: 1) asNumber.
									 candyName := tupList at: 2.
									 candyOrder := self createOrder: candyName amount: quantity.
									 orders add: candyOrder ].
	self fillOrders: orders.

		