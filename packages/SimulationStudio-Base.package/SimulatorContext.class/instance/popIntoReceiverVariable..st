instruction decoding
popIntoReceiverVariable: offset

	^ simulator context: self popIntoReceiverVariable: offset do: [:theOffset | super popIntoReceiverVariable: theOffset]