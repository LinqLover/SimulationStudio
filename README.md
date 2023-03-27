# SimulationStudio

[![smalltalkCI](https://github.com/LinqLover/SimulationStudio/actions/workflows/main.yml/badge.svg)](https://github.com/LinqLover/SimulationStudio/actions/workflows/main.yml)
[![Coverage Status](https://coveralls.io/repos/github/LinqLover/SimulationStudio/badge.svg)](https://coveralls.io/github/LinqLover/SimulationStudio)

A growing suite of applications and tools using code simulation in [Squeak/Smalltalk](https://squeak.org).

Code simulation is a technique in Squeak that reproduces the original VM interpreter for Smalltalk in the userland (i.e., implements it in itself), making the exploration and manipulation of its implementation much more immediate and enjoyable.
The foundation of this project is to extend the default code simulator with the ability to *control* and *modify* the execution.
For instance, we can disallow certain instructions, implement virtualization features by redirecting memory accesses, or trace the entire execution of a program (similar to bytecode instrumentation).
As one example, SimulationStudio implements a sandbox that can safely execute any code isolated from the remaining VM image.
On top of the sandbox, this repository also provides several tools that use *speculative code execution* to offer new ways for exploring objects and classes based on their behavior.

For usage instructions, see the [installation](#installation) section below.

## Included packages

### `SimulationStudio-Base`

Provides abstract functionality for simulating stack frames by subclassing `SimulationContext` or `Simulator`.

### `SimulationStudio-Sandbox`

Execute Smalltalk code in an isolated environment without applying any side effects to the image.

```smalltalk
array := {1. 2. 3}.

Sandbox evaluate:
	[array at: 1 put: 10.
	array first]. "10"

array first. "1"
```

### `SimulationStudio-Support`:

Contains several simulation goodies and examples:

- the `BenchmarkSimulator` for hardware-independent benchmark creation
- the `CoverageSimulator` for bytecode-precise code coverage analysis
- the `LimitSimulator` for hardware-independent calculation timeouts

### `SimulationStudio-Tools`

Contains some programming tools that are implementation using simulation:

- the `SimulationMethodFinder` which searches for all methods that convert a given set of inputs into a given output by speculatively executing all methods ([screenshots](https://github.com/LinqLover/SimulationStudio/pull/61#issue-1379779606))
  
  [![Simulation Method Finder (recursive search)](https://user-images.githubusercontent.com/38782922/191326674-447447aa-f00c-4937-892d-3d060ed688e2.png)](https://github.com/LinqLover/SimulationStudio/pull/61#issue-1379779606)

- the `SimulationProtocolExplorer` which inspects an object and its protocol together with a speculatively evaluated preview of each message ([screenshots](https://github.com/LinqLover/SimulationStudio/pull/39#issue-1090737789))

  [![Protocol Explorer on `DateAndTime now`](https://user-images.githubusercontent.com/38782922/162335500-9ab37f20-d5e5-499a-98ed-a1aa25bad5ed.png)](https://github.com/LinqLover/SimulationStudio/pull/39#issue-1090737789)

### `SimulationStudio-Tracing` (experimental)

Record and browse fine-granular stack traces. Integrates the [MessageSendRecorder](https://github.com/hpi-swa/MessageSendRecorder).

---

Check out the relevant classes for more details and usage instructions!

For more technical details, also read these announcement threads on the squeak-dev mailing list:

- [[ANN] SimulationStudio and sandboxed execution for Squeak](http://forum.world.st/ANN-SimulationStudio-and-sandboxed-execution-for-Squeak-td5127804.html)
- [News from SimulationStudio](http://lists.squeakfoundation.org/pipermail/squeak-dev/2021-November/216964.html)
- [[ANN] News from SimulationStudio: Method Finder 2](https://lists.squeakfoundation.org/pipermail/squeak-dev/2022-September/222244.html)

## Installation

### ... as a precompiled bundle *(recommended for most visitors)*

Download the archived bundle from the [latest release](https://github.com/LinqLover/SimulationStudio/releases/tag/squeak61alpha-20230328-0018) and follow the instructions to open it. In the image, you will find further usage examples. Using the bundle is also the recommended way to browse the sources of the project.

### ... using [Metacello](https://github.com/Metacello/metacello)

For the [latest Squeak Trunk](https://files.squeak.org/trunk/):

```smalltalk
Metacello new
	baseline: 'SimulationStudio';
	githubUser: 'LinqLover' project: 'SimulationStudio' path: 'packages';
	get;
	load.
```

LTS (long-time support) version for an [older Squeak release](https://squeak.org/downloads/#:~:text=History):

```smalltalk
Metacello new
	baseline: 'SimulationStudio';
	githubUser: 'LinqLover' project: 'SimulationStudio' commitish: 'squeak60' path: 'packages';
	get;
	load.
```

- Currently supported LTS versions are: `squeak60`

To load a specific package, change the last line, e.g., `load: 'SimulationStudio-Base'`. See the [Metacello docs](https://github.com/Metacello/metacello/blob/master/docs/MetacelloScriptingAPI.md#load-options) for more options.

### ... as a dependency in your [Metacello baseline](https://github.com/dalehenrich/metacello-work/blob/master/docs/GettingStartedWithGitHub.md#create-baseline)

For the [latest Squeak Trunk](https://files.squeak.org/trunk/):

```smalltalk
spec baseline: 'SimulationStudio' with: [
	spec
		repository: 'github://LinqLover/SimulationStudio/packages';
		loads: 'SimulationStudio-Sandbox'].
```

LTS (long-time support) version for an [older Squeak release](https://squeak.org/downloads/#:~:text=History):

```smalltalk
spec baseline: 'SimulationStudio' with: [
	spec
		repository: 'github://LinqLover/SimulationStudio:squeak60/packages';
		loads: 'SimulationStudio-Sandbox'].
```

- Currently supported LTS versions are: `squeak60`

Depending on your needs, specify any other package(s) via `loads:`. See the [Metacello docs](https://github.com/Metacello/metacello/blob/master/docs/APIReference.md) for more options.

### ... using [Squot](https://github.com/hpi-swa/Squot)

Open a git browser, clone the repository, and check out the latest commit from the default branch or any LTS branch.
[Learn more](https://github.com/hpi-swa/Squot#getting-started-with-an-existing-remote-project) about using the git browser.

## Users of SimulationStudio

As of today, the following projects make use of SimulationStudio:

- [TelegramSmalltalkBot](https://github.com/LinqLover/TelegramSmalltalkBot)
- [TraceDebugger](https://github.com/hpi-swa-lab/squeak-tracedebugger)
- [Sandblocks](https://github.com/hpi-swa/sandblocks)

## Contribution and bug reports

... are very welcome! Please feel free to submit bug reports, discuss design changes, or propose new extensions!
