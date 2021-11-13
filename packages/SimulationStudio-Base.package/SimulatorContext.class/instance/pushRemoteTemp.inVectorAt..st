instruction decoding
pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex

	^ simulator context: self pushRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: [:theRemoteTempIndex :theTempVectorIndex | super pushRemoteTemp: theRemoteTempIndex inVectorAt: theTempVectorIndex]