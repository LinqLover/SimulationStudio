# SimulationStudio

[![smalltalkCI](https://github.com/LinqLover/SimulationStudio/actions/workflows/main.yml/badge.svg)](https://github.com/LinqLover/SimulationStudio/actions/workflows/main.yml)

A developing suite of applications and tools for code simulation in [Squeak/Smalltalk](https://squeak.org).

Currently included features:

- **`SimulationStudio-Base`:** Provides abstract functionality for simulating stack traces with `SimulationContext`.
- **`SimulationStudio-Sandbox`:** Execute Smalltalk code in an isolated environment without applying any side effects to the image.
- **`SimulationStudio-Tracing` (experimental):**
  Record and browse fine-granular stack traces.
  Integrates the [MessageSendRecorder](https://github.com/hpi-swa/MessageSendRecorder).

Check out the relevant classes for more details!

## Installation

### ... using [Metacello](https://github.com/Metacello/metacello)

```smalltalk
Metacello new
	baseline: 'SimulationStudio';
	githubUser: 'LinqLover' project: 'SimulationStudio' path: 'packages';
	load.
```

### ... using [Squot](https://github.com/hpi-swa/Squot)

Open a git browser, clone the repository, and check out the latest commit from the default branch.
[Learn more](https://github.com/hpi-swa/Squot#getting-started-with-an-existing-remote-project) about using the git browser.

## Contribution and bug reports

... are very welcome! Please feel free to submit bug reports, discuss design changes, or propose new extensions!

**Disclaimer:** This is an MVP-alpha project in an early stage which still contains more than a few hick-ups and ongoing construction sites at the moment.
Go ahead and test it out, but don't use in production yet. :-)
