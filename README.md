# Dockerfile for dinaip

Run dinaip from [Dinahosting SL](https://www.dinahosting.com) in any docker-compatible machine

## Start the service 

Launch the docker as a daemon with

```
docker run -d -e DHUSER=mydinahostinguser -e DHPASS=mydinahostingpass test/dinaip:jessie
```

## Add a new zone to update

Launch the dinaip command in docker container with
```
docker exec -ti container_name_or_id dinaip -a mydomain.com:subdomain
```

## Stop dinaip service

Command:

```
docker exec -ti container_name_or_id dinaip -d
```

## Known problems

Dinaip configuration is not presserverd between starts (unless you relaunch the last container)
