toolbuilder
buildControlPaneWith: builder

	^ self
		buildWindow:
			(builder pluggablePanelSpec new
				children: OrderedCollection new;
				wantsResizeHandles: true;
				yourself)
		with: builder
		specs:
			{(0 @ 0 corner: 2 / 3 @ 1) -> [self buildInputsPaneWith: builder].
			(2 / 3 @ 0 corner: 1 @ 1) -> [self buildOutputPaneWith: builder]}