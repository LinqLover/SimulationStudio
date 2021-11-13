instruction decoding
popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex

	^ simulator context: self popIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: [:theRemoteTempIndex :theTempVectorIndex | super popIntoRemoteTemp: theRemoteTempIndex inVectorAt: theTempVectorIndex]