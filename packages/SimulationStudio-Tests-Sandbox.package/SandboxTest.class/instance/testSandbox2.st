tests
testSandbox2

	| assertions |
	assertions := OrderedDictionary new
		at: [String streamContents: [:s |
				Sandbox new evaluate: [s nextPut: $x]]]
			put: '';
		at: [Sandbox new evaluate: [
				(String streamContents: [:s | s nextPut: $x]) copy]]
			put: 'x';
		at: [Sandbox new evaluate: [Point basicNew setX: 1 setY: 2; x]]
			put: 1;
		at: [Point basicNew in: [:point |
				Sandbox new evaluate: [point setX: 1 setY: 2].
				point x]]
			put: nil;
		at: [Point basicNew in: [:point |
				Sandbox new evaluate: [
					point setX: 1 setY: 2.
					point x]]]
			put: 1;
		at: [Sandbox new evaluate: [
				[Notification signal * 2] on: Notification do: [:ex | ex resume: 3]]]
			put: 6;
		yourself.
	
	assertions keysAndValuesDo: [:key :value |
		self assert: value equals: key value].