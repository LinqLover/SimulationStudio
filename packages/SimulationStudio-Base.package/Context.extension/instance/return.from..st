*SimulationStudio-Base-instruction decoding-override
return: value from: aSender 
	"For simulation.  Roll back self to aSender and return value from it.  Execute any unwind blocks on the way.  ASSUMES aSender is a sender of self"

	| newTop |
	self flag: #moveUpstream.
	"SimulationStudio: reverted to mt 6/22/2022 10:26 to restore access to firstUnwindContext in #aboutToReturn:through:. See: https://lists.squeakfoundation.org/archives/list/squeak-dev@lists.squeakfoundation.org/message/JLXSHS4OIYIO7R2JBR7MPYVYMPQDNXNL/"
	
	aSender isDead ifTrue:
		[^self send: #cannotReturn: to: self with: {value}].
	newTop := aSender sender.
	(self findNextUnwindContextUpTo: newTop) ifNotNil:
		[:unwindProtectCtxt|
		 self flag: #knownBug. "Cannot #stepOver '^2' in example '[^2] ensure: []'.
		 See http://lists.squeakfoundation.org/pipermail/squeak-dev/2022-June/220975.html"
		 ^self send: #aboutToReturn:through: to: self with: {value. unwindProtectCtxt}].
	self releaseTo: newTop.
	newTop ifNotNil: [newTop push: value].
	^newTop