Instavote
=========

Getting started
---------------

Download [Docker for Mac or Windows](https://www.docker.com).

Run in this directory:

    $ docker-compose -f docker-compose-sinatra.yml up

Rebuild and run:

    $ docker-compose -f docker-compose-sinatra.yml up --build

The app will be running at [http://localhost:5000](http://localhost:5000), and the results will be at [http://localhost:5001](http://localhost:5001).

Architecture
-----

![Architecture diagram](architecture-sinatra.png)

* A ~~Python~~ Ruby webapp which lets you vote between two options
* A Redis queue which collects new votes
* A .NET worker which consumes votes and stores them in…
* A Postgres database backed by a Docker volume
* A Node.js webapp which shows the results of the voting in real time


Note
----

The voting application only accepts one vote per client. It does not register votes if a vote has already been submitted from a client.

Link to Slides
----

Slides can be found [here](https://docs.google.com/presentation/d/1s49uz3DNc2TVd9rIu8_nWHjk4b0gYm5B_0wWUFbxC14/edit?usp=sharing).
