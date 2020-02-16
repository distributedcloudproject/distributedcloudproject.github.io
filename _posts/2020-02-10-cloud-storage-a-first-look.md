---
layout: post
title:  "A first look into Cloud Storage"
date:   2020-02-16 15:00:00 +0100
categories: cloud update
---
Welcome to our first blog post! Here we will mainly discuss our progress, our software engineering process, and the major design decisions that we have made.

As a quick recap, our goal is to create our own "cloud storage" (as similar to Google Drive or Dropbox). We want to network many servers together and distribute our data efficiently between them via the Internet. Our system will be split into "nodes" (servers that store data) and "clients" (user devices that access the data).

It's been a while since the start of the project. During Novemeber and December 2019 we were in the requirements gathering/analysis and design phases (through the project proposal and functional specification). Some implementation was done during December 2019/January 2020, but focus on coding only picked up during late 2020 January. As a rough estimate we are about 30% into the project.

## Software Engineering Process

What we mean by "software engineering process" is the different phases of the Software Development Life Cycle (SDLC) and how we participate in those phases. That includes project management, testing strategy, requirements, etc.

To start out we are heavily using [GitLab](https://gitlab.computing.dcu.ie/) for all implementation-related work. Each team member works on a feature on a separate "branch" and submits that feature as a "merge request". Other team members can review that merge request, making suggestions or asking questions. This ensures transparency and peer review.

In terms of actually picking the features to work on, we use the Functional Specification that we created and the project management tool [Trello](https://trello.com/). Trello gives us an Agile-like board on which we can arrange categorized tasks in "TODO", "Doing", and "Done" stages and assign tasks to different team members. On the other hand the Functional Specification provides us with GANTT chart as a reference for time tasks should take and design diagrams for our implementation.

We have adopted an iterative process, and so our implementation and validation is closely tied. Each feature comes with its own unit tests or can be tested manually through our CLI. The unit tests are automatically ran for each "merge request" by our GitLab "CI/CD" system, immediatelly giving us a basic level of validation.

## Major Design Decisions

Our first major design decision dates back to the earliest stages of the project. The decision is that we will implement a "distributed" system. That means that there will not be just a "client" and a "server", but that certain machines ("nodes") will act both as clients and servers. This decision was made due to the scalability and robustness that such a system would bring. However, this impacts how we have to think when we are implementing the system and has its own difficulties.

Going further, we have split the "node" part of the system into further components. We have decided to keep the networking part separate from the file operations part. Thus, the node software will include two modules - a "network" module and a "datastore" module. This let us work on each module independenly and in parallel.

Nevertheless, the two modules will need to be connected and there will need to be a "glue" module between them, such as a "distribution" module. This module will have the responsibility of retrieving chunks of a file and sending those chunks to the right nodes. By completing this module the core functionality of the "node" sub-system will be close to finished. 


## In Summary

While we are in the implementation phase, the design of our data structures tends to change constantly. Changes in one "merge request" require propagation in other "merge requests", giving additional work.

Stay tuned for what is coming up next. We will see the design of our next sub-system, the "client", and our testing strategy should start to see actual servers.
