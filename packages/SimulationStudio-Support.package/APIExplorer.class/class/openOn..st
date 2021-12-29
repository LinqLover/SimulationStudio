instance creation
openOn: anObject
	"
	APIExplorer openOn: TextMorph new.
	(APIExplorer on: DateAndTime now)
		selectCategory: 'squeak protocol';
		open.
	(APIExplorer on: #(1 2 3))
		setClass: Collection selected: true;
		selectCategory: 'math functions';
		open.
	"

	^ (self on: anObject) open