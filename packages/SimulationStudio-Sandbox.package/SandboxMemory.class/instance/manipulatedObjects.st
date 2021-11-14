as yet unclassified
manipulatedObjects

	^ objects associationsSelect: [:assoc |
		assoc key ~= assoc value]