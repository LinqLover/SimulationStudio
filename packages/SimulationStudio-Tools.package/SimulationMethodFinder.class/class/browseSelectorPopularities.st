support
browseSelectorPopularities

	^ ((SelectorPopularities associations sorted: [:assoc | assoc value] descending)
		as: OrderedDictionary)
			explore