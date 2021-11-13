instruction decoding
send: selector super: superFlag numArgs: numArgs

	^ simulator context: self send: selector super: superFlag numArgs: numArgs do: [:theSelector :theSuperFlag :theNumArgs | super send: theSelector super: theSuperFlag numArgs: theNumArgs]