constructor
ofCandy: aCandy withQuantity: aNumber
	^ (self subclasses detect: [ :each | (each identity) = aCandy ]) withQuantity: aNumber.

