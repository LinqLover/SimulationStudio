private - object access
object: anObject basicAt: index

	^ super
		object: (sandbox readableObjectFor: anObject)
		basicAt: index