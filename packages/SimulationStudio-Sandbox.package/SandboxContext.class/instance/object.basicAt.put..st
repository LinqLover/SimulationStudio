private - object access
object: anObject basicAt: index put: value

	^ super
		object: (sandbox writableObjectFor: anObject)
		basicAt: index
		put: value