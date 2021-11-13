instruction decoding
return: value from: aSender

	^ simulator context: self return: value from: aSender do: [:theValue :theSender | super return: theValue from: theSender]