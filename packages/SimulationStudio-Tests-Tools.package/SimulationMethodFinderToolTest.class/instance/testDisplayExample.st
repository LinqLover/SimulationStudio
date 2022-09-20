tests - ui
testDisplayExample
	"Crash test."

	finder := (window := self classUnderTest open) model.
	
	5 timesRepeat:
		[finder displayExample.
		0.2 seconds wait.
		window imageForm].