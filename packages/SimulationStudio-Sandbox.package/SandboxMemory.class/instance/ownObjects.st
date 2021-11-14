as yet unclassified
ownObjects

	^ (objects associationsSelect: [:assoc |
		assoc key == assoc value]) values