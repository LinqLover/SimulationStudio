as yet unclassified
activateMethod: newMethod withArgs: args receiver: rcvr

	^ self customize: (super activateMethod: newMethod withArgs: args receiver: rcvr)