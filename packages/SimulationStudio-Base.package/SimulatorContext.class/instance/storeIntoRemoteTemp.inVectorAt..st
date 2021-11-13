instruction decoding
storeIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex

	^ simulator context: self storeIntoRemoteTemp: remoteTempIndex inVectorAt: tempVectorIndex do: [:theRemoteTempIndex :theTempVectorIndex | super storeIntoRemoteTemp: theRemoteTempIndex inVectorAt: theTempVectorIndex]