private
incrementPrimitiveCountFor: key

	primitiveCounts at: key put:
		(primitiveCounts at: key ifAbsent: [0]) + 1.