# Implementing a Full CI/CD Pipeline - Linux Academy
## Build Automation
Build automation is the automation of tasks needed in order to process and prepare source code for deployment to production. It is an important component of continuous integration.

Includes things like:

- compiling
- dependency management
- executing automated tests
- packaging the app for deployment

## Automated testing
Automated testing is the automated execution of tests that verify the quality and stability of code.

Automated tests are usually code themselves, so they are code that is written to test other code.

Automated tests are often run as part of the build process and are executed using build tools like Gradle.

### Automated testing - types
- **Unit tests** - focus on testing small pieces of code in isolation. Usually a single method or function.
- **Integration tests** - test larger portions of an application that are integrated with each other
- **Smoke tests/Sanity tests** - these are high-level integration tests that verify basic, large-scale things like whether or not the application runs, whether application endpoints return http 500 errors, etc.

## Continuous Integration
Continuous Integration (CI) - the practice of frequently merging code changes

A CI server executes a build that automatically prepares/compiles the code and runs automated tests.
Usually, the CI server automatically detects code changes in source control and runs the build whenever there is a change.
If something is wrong, the build fails. The team can get immediate feedback if their change broke something.

Mergin frequently throughout the day and getting quick feedback means that if you broke something, you broke it with your changes within the last couple hours. This is much easier to fix than if you broke something with your changes from a week ago.

## Continuous Delivery
Continuous Delivery means ensuring that you are always able to deploy any version of your code. 
It is necessary in **Continuous Deployment**, where you are actually deploying your code frequently.