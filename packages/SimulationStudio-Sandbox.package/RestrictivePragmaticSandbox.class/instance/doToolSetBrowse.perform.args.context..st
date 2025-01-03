pragmatic methods - ToolSet
doToolSetBrowse: aToolSetClass perform: selector args: args context: aContext
	<pragmaticClass: #'ToolSet class'>

	self assert: (selector beginsWithAnyOf: #(browse open handle inspect)).
	^ self pragmatic: aContext forbidden: 'Don''t use ToolSet in headless context'