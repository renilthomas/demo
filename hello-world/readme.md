# Docker Hello-World

This is a dockerized python flask `Hello World` app.

## Build the docker image

```bash
make build
```

## Run the docker container

```bash
make run
```

When the container is running, the application will be accessible at http://127.0.0.1:5000 

You can also query the following endpoints: 

* http://127.0.0.1:5000/hello

* http://127.0.0.1:5000/healthz
