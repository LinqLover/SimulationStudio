read-only objects
simulatedObject: anObject instVarAt: index put: value

	^ simulator context: self simulatedObject: anObject instVarAt: index put: value do: [:theObject :theIndex :theValue | super simulatedObject: theObject instVarAt: theIndex put: theValue]