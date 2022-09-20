support
disableLoggingAndNotifyingDuringCompilation: aBlock

	^ SystemChangeNotifier uniqueInstance doSilently:
		[ClassDescription dontLogCompiledSourcesDuring: aBlock]