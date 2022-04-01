actions
webOrder: candy amount: quantity  
	self fillOrders: (OrderedCollection with: (self createOrder: candy amount: quantity)).
