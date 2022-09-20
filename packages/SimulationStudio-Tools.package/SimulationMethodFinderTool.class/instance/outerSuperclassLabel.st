accessing - toolbuilder
outerSuperclassLabel

	^ self outerSuperclass
		ifNil: ['entire class hierarchy']
		ifNotNil: [:class | 'below {1}' format: {class}]