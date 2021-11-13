accessing - stack patching
push: anObject

	^ simulator context: self push: anObject do: [:theObject | super push: theObject]