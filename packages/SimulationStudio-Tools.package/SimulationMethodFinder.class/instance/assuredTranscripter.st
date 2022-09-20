private
assuredTranscripter

	^ transcripter ifNil:
		[transcripter := Project current transcript]