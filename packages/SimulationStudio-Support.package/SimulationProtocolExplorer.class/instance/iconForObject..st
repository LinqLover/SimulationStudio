accessing
iconForObject: anObject

	^ (ObjectExplorerWrapper with: anObject name: nil model: self)
		icon