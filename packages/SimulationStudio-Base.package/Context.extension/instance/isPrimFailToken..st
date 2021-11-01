*SimulationStudio-Base-private-Kernel-ct.1407-override
isPrimFailToken: contextOrPrimFailToken
	"Answer if contextOrPrimFailToken, which will either be a Context object or
	 a primitive fail token (a tuple of the PrimitiveFailToken unique object and
	 a primitive failure code), is the latter. This should only be used with the
	 (possibly indirect) results of Context>>doPrimitive:method:receiver:args:"
	^ (self objectClass: contextOrPrimFailToken) == Array
	  and: [contextOrPrimFailToken size = 2
	  and: [(contextOrPrimFailToken at: 1) == PrimitiveFailToken]]