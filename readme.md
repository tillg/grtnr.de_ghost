# grtnr.de

Everything that goes with `grtnr.de`.

**Note** For secrets look in your password manager 😀

## Server setup

We use a server on AWS, Frankfurt:

- Elastic IP: 3.125.105.230
- Instance type: t2.micro

## Code structure

The docker setup currently is based on my [ghost.docker.image](https://bitbucket.org/tgartner/ghost.docker.image/src/master/), with additional, website specific configurations.

## Code to server

We maintain all the settings of the ghost installation as docker based settings within THIS repository. The content (i.e. the ghost-content and ghost-database) are NOT within this repo (i.e. those directories are listed in `.gitignore`).

From here to the server all we need to do:

```shell
# Login to server
ssh ubuntu@grtnr.de

# Shutdown currently running docker ghost network
cd ghost
docker-compose down

# Get new version
git fetch

# Restart
docker-compose up --build &
```

## Testing locally

You can also test your setup locally. All the settings that differ from the production to the local environment are stored in the `.env` file in the root directory of the project.

**Question** How could we import the settings and content from the production site into our local setup?

- Content should be easy
- Users & authors should be modified, as you don't want notification emails to go out to real life users...
