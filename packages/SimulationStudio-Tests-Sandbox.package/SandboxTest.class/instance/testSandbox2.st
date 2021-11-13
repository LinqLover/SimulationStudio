tests
testSandbox2

	| assertions |
	assertions := OrderedDictionary new
		at: [String streamContents: [:s |
				self sandboxClass new evaluate: [s nextPut: $x]]]
			put: '';
		at: [| x |
				x := {1}.
				self sandboxClass new evaluate: [x at: 1 put: 2. x]]
			put: {2};
		at: [self sandboxClass new evaluate: [
				(String streamContents: [:s | s nextPut: $x]) copy]]
			put: 'x';
		at: [self sandboxClass new evaluate: [Point basicNew setX: 1 setY: 2; x]]
			put: 1;
		at: [Point basicNew in: [:point |
				self sandboxClass new evaluate: [point setX: 1 setY: 2].
				point x]]
			put: nil;
		at: [Point basicNew in: [:point |
				self sandboxClass new evaluate: [
					point setX: 1 setY: 2.
					point x]]]
			put: 1;
		at: [self sandboxClass new evaluate: [
				[Notification signal * 2] on: Notification do: [:ex | ex resume: 3]]]
			put: 6;
		yourself.
	
	assertions keysAndValuesDo: [:key :value |
		self assert: value equals: key value].