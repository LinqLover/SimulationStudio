updating
aspectDependencies

	^ Dictionary new
		at: #windowTitle put: #(#labelString);
		at: #isClassSelected: put: #(selectedClasses);
		at: #selectedClasses put: #(object);
		at: #categories put: #(selectedClasses object);
		at: #messages put: #(selectedClasses selectedCategory object);
		at: #messageColumns put: #(messages);
		at: #selectedMessageIndex put: #(selectedMessage);
		at: #contents put: #(selectedMessage object);
		yourself