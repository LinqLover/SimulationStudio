instruction decoding
storeIntoReceiverVariable: offset

	^ simulator context: self storeIntoReceiverVariable: offset do: [:theOffset | super storeIntoReceiverVariable: theOffset]