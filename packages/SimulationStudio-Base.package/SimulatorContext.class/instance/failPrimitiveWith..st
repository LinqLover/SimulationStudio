system simulation
failPrimitiveWith: maybePrimFailToken

	^ simulator context: self failPrimitiveWith: maybePrimFailToken do: [:theMaybePrimFailToken | super failPrimitiveWith: theMaybePrimFailToken]