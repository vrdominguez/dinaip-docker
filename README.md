# Dockerfile for dinaip

Run dinaip from [Dinahosting SL](https://www.dinahosting.com) in any docker-compatible machine

## Availiable tags

+ Based on Debian Jessie: vrdominguez/dinaip:latest [(Dokcerfile)](https://github.com/vrdominguez/dinaip-docker/blob/master/Dockerfile)
+ Based on Alpine Linux:  vrdominguez/dinaip:alpine [(Dokcerfile)](https://github.com/vrdominguez/dinaip-docker/blob/alpine/Dockerfile)

## Usage

### Start the service 

Launch the docker as a daemon with

```
docker run -d -e DHUSER=mydinahostinguser -e DHPASS=mydinahostingpass -v /your/local/dir/for/config:/var/persistent vrdominguez/dinaip
```

### Add a new zone to update

Launch the dinaip command in docker container with
```
docker exec -ti container_name_or_id dinaip -a mydomain.com:subdomain
```

### Stop dinaip service

To stop dinaip and preserve configuration you must use the command:

```
docker exec -ti container_name_or_id dinaip -d
```

**WARNING:** With docker stop you will miss your configuration
