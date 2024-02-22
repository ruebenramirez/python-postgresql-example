

# Getting Started

## make sure you have a way to run docker containers locally with docker compose

For instance, install docker desktop - [https://www.docker.com/products/docker-desktop/](https://www.docker.com/products/docker-desktop/)

## login to docker hub so you can download docker container images

setup an account on [https://hub.docker.com/](https://hub.docker.com/)

on the command line run:
```
docker login
```

## How to run the queries

```
docker compose rm -f
docker compose up -d --build
docker compose up python-client
```


expected output from the python-client container:
```
[+] Running 2/2
 ✔ Container python-postgresql-example-db-1             Running                                                                                                                        0.0s
 ✔ Container python-postgresql-example-python-client-1  Started                                                                                                                        0.0s
python-client-1  | Tables created successfully!
python-client-1  | Tables seeded successfully!
python-client-1  | Username: user1, Application Name: app1, Computer Name: laptop1
python-client-1  | Username: user1, Application Name: app2, Computer Name: laptop1
python-client-1  | Username: user1, Application Name: app3, Computer Name: desktop1
python-client-1  | Username: user2, Application Name: app4, Computer Name: laptop2
python-client-1  | Username: user3, Application Name: app5, Computer Name: desktop2
```

