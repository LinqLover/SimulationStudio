accessing
selectors

	^ (self selectedClasses gather: [:class | self selectedCategory
		ifNil: [class selectors]
		ifNotNil: [:category | class methodsInCategory: category]])
			withoutDuplicates sorted