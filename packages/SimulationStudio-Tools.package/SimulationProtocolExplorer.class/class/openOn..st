instance creation
openOn: anObject
	"
	TextMorph new exploreProtocol.
	(SimulationProtocolExplorer on: DateAndTime now)
		selectCategory: 'squeak protocol';
		open.
	(SimulationProtocolExplorer on: #(1 2 3))
		setClass: Collection selected: true;
		selectCategory: 'math functions';
		open.
	"

	^ (self on: anObject) open