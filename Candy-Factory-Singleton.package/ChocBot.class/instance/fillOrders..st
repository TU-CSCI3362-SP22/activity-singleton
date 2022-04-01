helper methods
fillOrders: orders
	orders isEmpty
		ifFalse: [ 	self finishedOrder: (orders removeAt: 1).
						self replicate fillOrders: orders ]