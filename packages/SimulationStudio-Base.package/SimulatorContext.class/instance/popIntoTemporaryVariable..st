instruction decoding
popIntoTemporaryVariable: offset

	^ simulator context: self popIntoTemporaryVariable: offset do: [:theOffset | super popIntoTemporaryVariable: theOffset]