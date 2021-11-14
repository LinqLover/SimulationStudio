browsing
browsePrimitiveCounts

	^ (Bag new
		setContents: self primitiveCounts;
		openAsMorph)
			limit: 30;
			yourself