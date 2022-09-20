toolbuilder
buildWith: builder

	| spec |
	spec := self buildWindowWith: builder specs:
		{(0 @ 0 corner: 1 @ self verticalOffset) -> [self buildControlPaneWith: builder].
		(0 @ self verticalOffset corner: 1 @ 1) -> [self buildResultsPaneWith: builder]}.
	^ builder build: spec