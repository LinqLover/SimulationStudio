toolbuilder
buildCategoryList: builder

	^ builder pluggableListSpec new
		model: self;
		list: #categories;
		getSelected: #selectedCategory;
		setSelected: #selectCategory:;
		yourself