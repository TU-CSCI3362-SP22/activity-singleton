helper methods
fillOrders: orders
	orders isEmpty
		ifFalse: [ 	
				(chocMelter use: ((orders at: 1) chocAmt))
				ifTrue: 
						  [  self finishedOrder: (orders removeAt: 1).
							  self replicate fillOrders: orders ]
				ifFalse: 
					[ Transcript show: 'Error! Not enough chocolate for '; show: (orders at: 1); show: '. Call restockChoc and try again!'; show: String cr. ]
		]