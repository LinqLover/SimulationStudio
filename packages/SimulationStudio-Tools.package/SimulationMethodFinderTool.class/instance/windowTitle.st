accessing - toolbuilder
windowTitle

	^ String streamContents: [:stream |
		stream
			nextPutAll: windowLabel;
			space.
		
		self isSearching
			ifFalse:
				[stream
					nextPut: $[;
					print: messageList size;
					nextPut: $]]
			ifTrue:
				[stream nextPutAll: '(searching...'.
				
				finder currentSearchDepth ifNotNil: [:depth |
					depth > 0 ifTrue:
						[stream
							space;
							nextPutAll: 'depth ';
							print: depth;
							nextPut: $,]].
				
				finder currentDepthProgress ifNotNil: [:progress |
					stream
						space;
						print: (progress * 100) rounded;
						nextPut: $%.
					
					finder currentDepthStartTime ifNotNil: [:startTime |
						(progress > 0 and: [DateAndTime now - startTime > 3 seconds]) ifTrue:
							[stream
								nextPutAll: ', ';
								nextPutAll: (startTime simRemainingTimeForProgress: progress) simShortPrintString;
								nextPutAll: ' left']]].
				
				stream nextPutAll: ')']]