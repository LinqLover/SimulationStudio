private
access: objects indirectors: indirectors

	^ objects with: indirectors collect: [:object :indirector |
		indirector ifNil: [object] ifNotNil: [
			sandbox perform: indirector with: object]]