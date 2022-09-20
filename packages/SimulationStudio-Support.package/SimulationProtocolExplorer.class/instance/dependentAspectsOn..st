updating
dependentAspectsOn: aspect

	^ self aspectDependencies associations
		select: [:assoc | assoc value includes: aspect]
		thenCollect: [:assoc | assoc key]