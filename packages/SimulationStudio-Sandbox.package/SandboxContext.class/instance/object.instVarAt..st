private - object access
object: anObject instVarAt: index

	^ super
		object: (sandbox readableObjectFor: anObject)
		instVarAt: index