private
sendBasicMessage

	^ self simulator evaluate: (block ifNil: [self topRecord parent])