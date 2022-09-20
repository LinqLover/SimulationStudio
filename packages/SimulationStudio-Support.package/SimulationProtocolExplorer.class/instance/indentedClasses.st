accessing
indentedClasses

	^ self classes withIndexCollect: [:class :index |
		(String new: index - 1 * 2 withAll: $ ) , class]