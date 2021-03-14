baseline
baseline: spec
	<baseline>

	spec for: #common do: [
		"dependencies"
		spec
			baseline: 'MessageSendRecorder' with: [
				spec repository: 'github://hpi-swa/MessageSendRecorder:master/packages'].
		
		"packages"
		spec
			package: 'SimulationStudio-Base';
			package: 'SimulationStudio-Sandbox' with: [
				spec requires: 'SimulationStudio-Base'];
			package: 'SimulationStudio-Tracing' with: [
				spec requires: #('SimulationStudio-Base' 'MessageSendRecorder')].
		"test packages"
		spec
			package: 'SimulationStudio-Tests-Base' with: [
				spec requires: 'SimulationStudio-Base'.
				spec postLoadDoIt: #installPreviewDependenciesForTests];
			package: 'SimulationStudio-Tests-Sandbox' with: [
				spec requires: #('SimulationStudio-Sandbox' 'SimulationStudio-Tests-Base')].
		
		"groups"
		spec
			group: #default with: #('SimulationStudio-Base' 'SimulationStudio-Sandbox' 'SimulationStudio-Tracing' 'SimulationStudio-Tests-Base' 'SimulationStudio-Tests-Sandbox');
			group: #tests with: #('SimulationStudio-Tests-Base' 'SimulationStudio-Tests-Sandbox')].