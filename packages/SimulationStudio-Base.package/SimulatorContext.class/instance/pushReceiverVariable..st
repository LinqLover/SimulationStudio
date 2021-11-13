instruction decoding
pushReceiverVariable: offset

	^ simulator context: self pushReceiverVariable: offset do: [:theOffset | super pushReceiverVariable: theOffset]