# Tasks (.Net)

A repository for the age-old example use-case of a To-Do or Task application written in Microsoft's .Net framework using [Clean Coding](cleancoders.com) practices and [Extreme Programming (XP)](https://martinfowler.com/bliki/ExtremeProgramming.html) principles.

## Getting Started

Here's how this project is getting started.

- ✅ Initial Red-Green-Refactor
- 🔲 Build Pipeline
- 🔲 Visualize Test Results
- 🔲 Visualize Code Coverage

### ✅ Task: Start Proof of Concept (XPP Steps 1-5) (in-progress)

1. ✅ Add .vscode folder with `extensions.json` file to contain a list of recommended VSCode extensions for this project.
2. ✅ Update `.gitignore` file with `dotnet new gitignore --force`
3. ✅ Create folder `src` and navigate in terminal.
4. New solution file `dotnet new sln`.
5. ✅ Add library to expose as an API, ex: `dotnet new xunit -o Tasks` (see [xUnit.net getting started](https://xunit.net/docs/getting-started/netcore/cmdline))
6. Add library to the solution ex: `dotnet sln add tasks/tasks.csproj`
7. ✅ Navigate to `src/Tasks/`
8. ✅ Build the solution `dotnet build`
9. ✅ Test the solution `dotnet test`
10. ✅ Run `dotnet watch test`, start doing some TDD
11. ✅ Rename `UnitTest1` to `TaskService.Tests` and start coding
12. ✅ Check Probelms tab in VSCode for any issues.

### 🔲 Task: Build Pipeline

Make sure to update README.md as nyou are moving through the tasks.

1. Go to the GitHub Actions tab and create a new workflow for .Net. Reference the [GitHub Actions for .Net](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-net) documentation.
2. Create new workflow file in `.github/workflows/tasks-ci.yml`
3. Check Problems tab in VSCode for any issues.

### 🔲 Task: Visualize Test Results

### 🔲 Task: Visualize Code Coverage

## Contributing

The following is a set of guidelines for contributing to this repository. These are just guidelines, not rules, so use your best judgment and feel free to propose changes to this document in a pull request.

### What should I know before I get started?

[An idea](https://boster.dev/thoughts/extreme-programming-projects/) that XP applies to not just coding, but to projects as well. After the first iteration of Red-Green-Refactor, establish an automated build pipeline, publish test results, and code coverage results.

Basic Process:

1. Using Test-Driven Development (TDD), complete first Red-Green-Refactor; push to changes.
2. Create initial pipeline to build project; push changes;
3. Require successful build for Pull Requests into Main branch.
4. Add unit test results to pipeline.
5. Add test coverage to pipeline.
6. Deploy application or publish package.
7. Continue TDD.

Here are some items to help guide coding efforts:

- Clean Coding
  - focus on topic, not tech
  - well-written prose
  - fast feedback
- Extreme Programming
  - Test-Driven Development (TDD)
  - Continuous Refactoring
  - Pairing
  - Simple Design
- Only build what changes
- Dave Farley-land (expand later)
