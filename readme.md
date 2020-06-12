# grtnr.de

Everything that goes with `grtnr.de`. It started with a ghost blog, but now contains more services.

## To Do

- Setup AWS monitoring  
  - Automatic restarting 
  - Start dockers at node startup
- Backup
- Have certificates and HTTPS
- Make logo & `favicon.ico`

**Note** For secrets look in your password manager 😀

## Server setup

For details about my server on AWS see [here](amazon.md).

## Code structure

The ghost docker setup currently is based on my [ghost.docker.image](https://bitbucket.org/tgartner/ghost.docker.image/src/master/), with additional, website specific configurations.

## Code to server

We maintain all the settings of the docker settings within the `~/grtnr` repository. The content (i.e. the ghost-content, ghost-database) are NOT within this repo (i.e. those directories are listed in `.gitignore`).

From here to the server all we need to do:

```shell
# Login to server
ssh ubuntu@grtnr.de

# Shutdown currently running docker ghost network
cd grtnr
docker-compose down

# Get new version
git pull

# Restart
docker-compose up --build &
```

## Initial install

When creating / installing the server initially, the following steps needed to be done:

* Setup the node and install docker. See [here](amazon.md).

```bash
ssh-keygen -t rsa # Create a ssh key
# Add the key to the bitbucket repo readers

git clone git@bitbucket.org:tgartner/grtnr.de.git # Clone this repo

cp .env.sample .env
nano .env # Fillout the variables as needed

```

## Testing locally

You can also test your setup locally. All the settings that differ from the production to the local environment are stored in the `.env` file in the root directory of the project.

To run the setup locally:

```bash
docker-compose up
```

## Logging

I need to get hold of the logs of my containers and to have tools to monitor them - w/o having to read thru every line.... Since we use Loki at work, it would be a plus to use it here too.

### Reading

- A promising scenario is desribed [here](https://dev.to/thakkaryash94/docker-container-logs-using-fluentd-and-grafana-loki-a15)
- A good overview of docker logging can be found in this article: [Docker Logging: A Complete Guide](https://sematext.com/guides/docker-logs/)
- [Centralize Your Docker Logging With Syslog (Medium)](https://medium.com/better-programming/docker-centralized-logging-with-syslog-97b9c147bd30)

**Question** How could we import the settings and content from the production site into our local setup?

- Content should be easy
- Users & authors should be modified, as you don't want notification emails to go out to real life users...

## Problems and solutions

### Migration lock

Ghost doesn't start, i.e. interrupts startup with message **Migration lock was never released or currently a migration is running.**

The reason is a file access problem of the mysql data directory. I haven't tracked down exactly the root cause, but I could fix it this way:

```bash
cd mysql
sudo rm -rf * # Yes, we delete the entire mysql data directory...
cd ..
sudo chgrp root mysql
sudo chown 999 mysql
```

Then restart with `docker-compose up`...
