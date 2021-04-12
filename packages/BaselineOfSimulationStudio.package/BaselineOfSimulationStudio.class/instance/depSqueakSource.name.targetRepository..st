scripts
depSqueakSource: aMCRepository name: aString targetRepository: anotherMCRepository

	(aMCRepository isKindOf: MCRepository) ifFalse: [
		^ self depSqueakSource: (MCRepository in: aMCRepository) name: aString targetRepository: anotherMCRepository].
	(anotherMCRepository isKindOf: MCRepository) ifFalse: [
		^ self depSqueakSource: aMCRepository name: aString targetRepository: (MCRepository in: anotherMCRepository)].
	
	^ ('{1} ({2})' format: {aString. aMCRepository description}) -> [
		| packageName |
		packageName := aString , '.mcz'.
		[Installer new
			primMerge: packageName
			from: aMCRepository]
				on: MCPackageNotFound
				do: [:ex |
					(anotherMCRepository notNil and: [ex repository == aMCRepository] and: [ex packageName = packageName])
						ifFalse: [ex pass].
					self notify: ('Preview version {1} has already been integrated' format: {aString})]
				on: MCMergeResolutionRequest
				do: [:ex |
					Smalltalk isHeadless ifFalse: [ex pass].
					self error: ex description] ]