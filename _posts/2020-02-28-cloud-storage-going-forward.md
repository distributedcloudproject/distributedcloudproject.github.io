---
layout: post
title:  "Going forward - a working cloud"
date:   2020-02-28 15:00:00 +0100
categories: cloud update
---
Hello! This is our second blog post in the series. We have only one week left until the deadline, and we can feel the pressure! We are about 60% into our cloud storage project. Let's jump into it and discuss what changed in our software engineering process, and look into some of our design decisions.

## Quick update on the process (SDLC)

In terms of delivering the requirements, we will really need to focus on delivering the core system and forget about the extras for now.

As planned in the last blog we have looked into testing the system on actual hardware or rented servers (as part of "system testing"). For that we have created a few GCP (Google Cloud Platform) virtual machines at different locations. To speed up the deployment of our executable on each machine we have used the Ansible automation tool. After some work we got all the nodes to connect into a "cloud"!

We have done a meeting with our supervisor and he also suggested user testing to us. We will ask potential users that we know to give verbal feedback on the UI/UX and functions of the system.

During our development time, we are working on many components simultaneously so it is getting harder to switch between them back and forth and put in work on all of them each day. A balance must be found.

## Design of Components

### The Desktop Client

As mentioned in the last blog we will start to work on the "client" side of the project - user-friendly GUI-based software that will primarily only connect to the cloud but not participate in storing any data.

Our first client is the "desktop GUI" for PC's. We have used a third party library (Fyne for Go) to have a good level of abstraction when making the GUI.

Following good design practices we have split different screens or screen components into separate functions. We had to use the third party library in an imperative style (making all the calls by ourselves to render something). Some event-based design could also be seen, with the UI updating as new nodes join or leave the network.

One important design aspect of the desktop client is that it is written in the same language as is the node software (Go). Thus, for greater reusability (mainly the network components) we have decided to import the node software as a library into the client. Thus, the client is essentially a node that doesn't store anything.

### Chunk Distribution

Going back in time we thought about how to store a file on the cloud. We have decided that each file will be split into chunks and each chunk (or a replica of it) will be assigned or distributed to a certain node.

This time round we have designed (and partially implemented) the distribution in more detail. We came up with a couple of scenarios with a set of nodes and a set of chunks, and decided to distribute the chunks based on the following criteria: storage load (even utilisation of space), anti-affinity (replica doesn't go on the same node), and optimal networking (bandwidth and latency).

### The Web Client

Our second type of client is a website. The web client will substitute the mobile client by being mobile friendly.

Here we picked a classic client-server architecture with REST and HTTP. We have a front-end client (based on React.js) and a back-end server (based on Go).

An important point is that we have decided to keep the back-end server as part of the node software (the http web server can be enabled or disabled with a simple flag). This way the web server can easily talk to the cloud and we only have to worry about the REST API.

As we design the REST API (deciding on the endpoints, verbs, parameters, etc) we will further clarify and improve the cloud API.

## In Summary

Though the project has seen a lot of new features, rest assured we will be hard at work this last week. We have touched on many parts of the system, but we have to bring them to completion now.

Our objectives include finishing the existing components (including a complete set of file and folder operations, web authentication). System testing and user testing will also need to be done. In case we are feeling brave we also have the optional modules of encryption and compression.

During the last few days we will work on the documentation and diagrams, before finally submitting the project.
