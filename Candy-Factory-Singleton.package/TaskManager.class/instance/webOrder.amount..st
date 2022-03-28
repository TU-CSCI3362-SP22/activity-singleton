as yet unclassified
webOrder: candy amount: quantity  
	|order|
	order := OrderedCollection new.
	order add: (self createOrder: candy amount: quantity).
	self fillOrders: order.