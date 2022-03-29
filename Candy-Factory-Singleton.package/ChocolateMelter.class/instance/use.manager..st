as yet unclassified
use: n manager: tm
	supply < n whileTrue: 
					[ Transcript show: '** ChocolateMelter out of chocolate **', String cr. 
				  tm restockChoc.].
	supply:= supply - n.
	^ True.
	
	
	
		