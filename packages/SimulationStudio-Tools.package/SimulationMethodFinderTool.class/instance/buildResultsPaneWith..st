toolbuilder
buildResultsPaneWith: builder

	^ self
		buildWindow:
			(builder pluggablePanelSpec new
				children: OrderedCollection new;
				wantsResizeHandles: true;
				yourself)
		with: builder
		specs:
			{(0 @ 0 corner: 1 / 2 @ 1) -> [self buildMessageListWith: builder].
			(1 / 2 @ 0 corner: 1 @ 1) -> [self buildCodePaneWith: builder]}