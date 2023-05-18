instance creation
for: aCoverage messageList: messageList name: labelString

	^ self new
		coverage: aCoverage;
		initializeMessageList: messageList;
		setInitialLabel: labelString;
		yourself