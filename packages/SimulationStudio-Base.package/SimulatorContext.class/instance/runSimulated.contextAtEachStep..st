system simulation
runSimulated: aBlock contextAtEachStep: anotherBlock

	^ simulator context: self runSimulated: aBlock contextAtEachStep: anotherBlock do: [:theBlock :theOtherBlock | super runSimulated: theBlock contextAtEachStep: theOtherBlock]