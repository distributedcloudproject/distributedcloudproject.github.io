---
layout: post
title:  "Finishing touches - the last blog post"
date:   2020-03-08 15:00:00 +0100
categories: cloud update
---
Welcome back to the very last blog post about our project. We are excited to soon present what we have done and explain how we have gotten to where we are now!

## Software Process

During the last week and a half we have focused on developing the most important features.

In case of the website subsystem, we have done the following:
- Implemented web authentication (login page).
- Designed a complete RESTful API, documented in Go comments.

For that we have followed various industry standards:
- JWT (JSON Web Tokens) for token based authentication.
- HTTPS for secure communications
  - As a side effect we make the development and production environments more similar (on production we would undoubtedly need HTTPS, and on development we can have HTTPS with self-signed TLS certificates).
- Bcrypt for user passwords (hashed and salted) stored in a PostgreSQL database.

For the Cloud and Desktop systems, we also:
- Made the Desktop GUI more stable.
- Implemented automatic syncing of files in chosen directories.
- Implemented all CRUD operations on files and directories.
- Considered network latency in the file distribution algorithm.

As planned in the last blog post we have done some verbal user testing. The results gave us pointers on how to improve the functionality and visual appeal of the website.

Nearing the completion of the development stage, we now enter the "maintenance" stage in software development. This requires us to write documentation and a User Guide, in a way sharing the knowledge we have about the system with others.

## Design

New features required new designs in our project. To mention two significant decisions:

1. We have a new `NetworkFolder` tree-like "recursive" data structure. Each `NetworkFolder` contains a list of files and a list of its sub-folders. This is how some file systems may implement directories (using trees).

2. Part of the system is now the PostgreSQL database used for website accounts. Using a database allows us to easier extend the system in the future to store data other than user credentials.

By writing the technical manual and preparing to submit our project, we have reflected on our design a lot. We have learned things like the importance of using precise terms when speaking about parts of our project.

## Last steps

Of course there is always more to be done in a project. And we have some last touches to make before the demonstration:
1. Fix bugs such as data not distributing, as identifed during system testing.
2. Fix regressions (failing unit/integration tests due to changes).
3. Deploy the website client on a live server accessible to the outside world, not just the localhost.

We are also thinking of making a visualization (GIF) of the "hidden" or technical parts of the system such as the distribution algorithm.

We have written many "Javadoc"-style comments in our Go code. We are considering using GoDoc to generate documentation and print it out for the assessors.

## To conclude

We have learned a lot in this project and that is the key takeaway. The basics of the project are functioning so it might be software that we will use one day.

But the most important thing is that we have learned how to bring a project of significant size from start to finish, how to integrate multiple tech stacks (desktop, web), networking protocols (custom TCP and HTTP), architectures (distributed, client-server), and much more. We hope that this experience will be useful for us during INTRA and beyond.

Thank you for reading, and may we see you in fourth year!
