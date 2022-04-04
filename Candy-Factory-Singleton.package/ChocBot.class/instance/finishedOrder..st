helper methods
finishedOrder: order
 	Transcript show: order time asString; show: ' seconds later...'; show: String cr. 
	Transcript show: 'Beep! '; show: roboName; show: ' has shipped an order for '; show: order quantity asString; show: ' of ';  show: order orderName; show: '. Finished!'; show: String cr; show: String cr.
