action
use: n 
	supply >= n
		ifTrue:
			[ supply := supply - n.
			 ^ true ]
		 ifFalse: 
			[ ^ false ].