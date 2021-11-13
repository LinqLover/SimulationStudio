printing
printOn: aStream

	super printOn: aStream.
	
	aStream nextPutAll:
		(self timeToRun
			ifNil: ['({1} steps so far - still running)' format:
				{self stepCount}]
			ifNotNil: ['({1} steps in {2} milliseconds - {3} nanoseconds/step' format:
			{self stepCount.
			self timeToRun asMilliSeconds.
			self timePerStep asNanoSeconds}]).