toolbuilder
buildCodePaneWith: builder

	^ (super buildCodePaneWith: builder)
		help: 'Select a message or evaluate expressions on explored object' translated;
		yourself