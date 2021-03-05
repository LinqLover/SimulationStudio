scripts
depSqueakSource: aMCRepository name: aString

	(aMCRepository isKindOf: MCRepository) ifFalse: [
		^ self depSqueakSource: (MCRepository in: aMCRepository) name: aString].
	
	^ ('{1} ({2})' format: {aString. aMCRepository description}) -> [[Installer new
		primMerge: aString , '.mcz'
		from: aMCRepository]
			on: MCMergeResolutionRequest
			do: [:ex |
				Smalltalk isHeadless ifFalse: [ex pass].
				self error: ex description]]