updating
aspectDependencies

	^ Dictionary new
		at: #labelString put: #(object);
		at: #windowTitle put: #(#labelString);
		at: #isClassSelected: put: #(selectedClasses);
		at: #selectedClasses put: #(object);
		at: #categories put: #(selectedClasses object);
		at: #messages put: #(selectedClasses selectedCategory object);
		at: #messageColumns put: #(messages);
		at: #selectedMessageIndex put: #(selectedProtocolMessage);
		at: #contents put: #(currentCompiledMethod);
		at: #currentCompiledMethod put: #(selectedProtocolMessage object);
		at: #annotation put: #(currentCompiledMethod);
		yourself