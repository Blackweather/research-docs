# OpsCentric DevOps Course: Lesson One
## DevOps as a culture
At its core DevOps is really about breaking down the barriers that traditionally existed between Development and Ops teams.

### Company-specific situations
#### The Traditional Company
- no effort has been made towards implementing DevOps yet or effort has failed
- great opportunity to make an impact
- can be hard
    - culture that resists change

#### The Mid-Transformation Company
- part way through a DevOps transformation

#### DevOps Leadership
- no such thing as a successfully transformed company
- the culture is not a destination, but a journey
    - one of the most important aspects is continuous improvement
- look for the bottlenecks
    - what is slowing down productivity
- does not require a management job title to be impactful
    - often better results by working with the team


# OpsCentric DevOps Course: Lesson Two
## Creating effective continuous improvement
- choose the right source of feedback
    - wrong source of feedback can make things worse with every iteration

## DevOps Pipelines
- a pipeline - set of actions and measurements which accomplish a goal
- most useful pipelines:
    - Continuous Integration (CI)
        - at the most basic level integrates new versions of code into the software and provides a testable version with that new code
        - ideally tests are automated and can be run with each new build
    - Continuous Deployment (CD)
        - takes the CI pipeline to the next level
        - should be the ultimate goal of any DevOps enabled team
        - deploys the new code to a production server or environment
            - if no test failures are detected
        - completely eliminate human error and manual steps from the deployment pipeline
- autoscaling pipeline
    - takes in usage and performance data from servers and applications and perform scaling actions based on that data
    - for example based on server CPU utilisation metric