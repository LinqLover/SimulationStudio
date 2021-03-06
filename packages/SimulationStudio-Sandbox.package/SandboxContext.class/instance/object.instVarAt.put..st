private - object access
object: anObject instVarAt: index put: value

	| sandRcvr result |
	sandRcvr := sandbox writableObjectFor: anObject.
	result := super
		object: sandRcvr
		instVarAt: index
		put: value.
	
	self flag: #hack.
	(((self objectClass: sandRcvr) includesBehavior: BitBlt)
		and: [index = 1 "destForm"])
		ifTrue: [
			sandbox updateObject: sandRcvr].
	
	^ result