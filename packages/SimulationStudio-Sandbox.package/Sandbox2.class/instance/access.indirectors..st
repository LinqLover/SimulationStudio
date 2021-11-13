private
access: objects indirectors: indirectors

	^ objects with: indirectors collect: [:object :indirector |
		indirector ifNil: [object] ifNotNil: [
			indirector value: self value: object]]