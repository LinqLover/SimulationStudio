as yet unclassified
explorerContents

	^ #(ownObjects manipulatedObjects hashes) collect: [:selector |
		ObjectExplorerWrapper
			with: (self perform: selector)
			name: selector
			model: self]