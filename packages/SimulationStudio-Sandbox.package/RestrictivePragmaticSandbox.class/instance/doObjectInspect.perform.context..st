pragmatic methods - Object
doObjectInspect: aMorph perform: selector context: aContext
	<pragmaticClass: #Object selectors: #(inspect explore)>

	^ self pragmatic: aContext forbidden: 'Use #longPrintString instead'