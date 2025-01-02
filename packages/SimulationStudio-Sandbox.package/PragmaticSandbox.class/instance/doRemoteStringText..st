pragmatic methods - RemoteString
doRemoteStringText: aRemoteString
	<pragmaticClass: #RemoteString selector: #text>

	self assertUnmodifiedObject: aRemoteString.
	
	^ aRemoteString text