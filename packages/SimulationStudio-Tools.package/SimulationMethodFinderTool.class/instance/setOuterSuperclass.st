actions
setOuterSuperclass

	| choice |
	choice := Project uiManager
		chooseFromLabeledValues:
			((((self systemNavigation allClasses collect: [:class | class name -> class])
				sorted: [:assoc | assoc key] ascending)
					copyWithFirst: ('entire class hierarchy' asText addAttribute: TextEmphasis italic; yourself) -> #all)
						as: OrderedDictionary)
		title: 'Choose outer superclass'.
	choice ifNil: [^ self].
	
	self outerSuperclass: (choice = #all ifFalse: [choice]).
	
	self findMethods.