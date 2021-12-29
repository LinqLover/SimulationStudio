updating
changed: aspect

	| dependentAspects |
	super changed: aspect.
	
	dependentAspects := self dependentAspectsOn: aspect.
	dependentAspects isString ifTrue: [
		self notify: 'You probably missed an array here!'
		"aid for stupid devs"].
	dependentAspects do: [:dependentAspect | self changed: dependentAspect]