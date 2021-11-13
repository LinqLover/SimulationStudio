instruction decoding
pushNewArrayOfSize: arraySize

	^ simulator context: self pushNewArrayOfSize: arraySize do: [:theArraySize | super pushNewArrayOfSize: theArraySize]