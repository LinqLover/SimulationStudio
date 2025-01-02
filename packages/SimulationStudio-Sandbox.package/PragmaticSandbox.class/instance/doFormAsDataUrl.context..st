pragmatic methods - Form
doFormAsDataUrl: aForm context: aContext
	<pragmaticClass: #Form selector: #asDataUrl>

	self assertUnmodifiedObject: aForm.
	self assert: (aContext objectClass: aForm width) = SmallInteger.
	self assert: (aContext objectClass: aForm height) = SmallInteger.
	self assert: (aContext objectClass: aForm depth) = SmallInteger.
	self assert: ((aContext objectClass: aForm bits) = Bitmap).
	self assertUnmodifiedObject: aForm bits.
	self assert: ((aContext objectClass: aForm offset) = Point).
	
	^ aForm asDataUrl