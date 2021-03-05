asserting
shouldNotChange: valueBlock after: actionBlock

	| newValue oldValue result |
	oldValue := valueBlock value.
	result := actionBlock value.
	newValue := valueBlock value.
	self assert: oldValue equals: newValue.
	^ result