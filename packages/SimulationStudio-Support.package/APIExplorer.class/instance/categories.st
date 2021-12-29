accessing
categories

	^ (self selectedClasses gather: [:class | class organization categories]) withoutDuplicates sorted