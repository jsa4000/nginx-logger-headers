# Nginx Logger Headers

## Build

```bash
# Build Docker image
docker build -t jsa4000/nginx-logger-headers:1.0.0 .
```

## Publish

```bash
# Build Docker image
docker push jsa4000/nginx-logger-headers:1.0.0
```

## Run

A simple tool for debugging HTTP requests. nginx will return all request headers and body to the client.

Try running it like so:

```bash
# run docker image using port forward to 8080
docker run -p 8080:8080 jsa4000/nginx-logger-headers:1.0.0
```

## Test

* Curl Request

    ```bash
    curl --location --request GET 'http://localhost:8080/products/3200?effectDate=2021-01-01&duration=12' \
        --header 'X-Header-Device: 68768cb0-d7fb-11eb-b8bc-0242ac130003' \
        --header 'Accept-Language: es-ES' \
        --header 'X-Header-UUID: 68768cb0-d7fb-11eb-b8bc-0242ac130003' \
        --header 'X-Header-Channel: 001' \
        --header 'X-Header-System-Date: 2021-01-01' \
        --header 'Content-Type: application/json' \
        --header 'Cookie: INGRESSCOOKIE=ab530e99eb53cf6baf59f09b6b52e000'
    ```

* Output from the response:

    ```bash
    GET /products/3200?effectDate=2021-01-01&duration=12 HTTP/1.1
    Host: localhost:8080
    User-Agent: curl/7.64.1
    Accept: */*
    X-Header-Device: 68768cb0-d7fb-11eb-b8bc-0242ac130003
    Accept-Language: es-ES
    X-Header-UUID: 68768cb0-d7fb-11eb-b8bc-0242ac130003
    X-Header-Channel: 001
    X-Header-System-Date: 2021-01-01
    Content-Type: application/json
    Cookie: INGRESSCOOKIE=ab530e99eb53cf6baf59f09b6b52e000
    ```

* Log from the Nginx container

    ```bash
    2021/10/08 09:53:15 [notice] 1#1: using the "epoll" event method
    2021/10/08 09:53:15 [notice] 1#1: openresty/1.11.2.5
    2021/10/08 09:53:15 [notice] 1#1: built by gcc 6.3.0 (Alpine 6.3.0) 
    2021/10/08 09:53:15 [notice] 1#1: OS: Linux 5.10.47-linuxkit
    2021/10/08 09:53:15 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
    2021/10/08 09:53:15 [notice] 1#1: start worker processes
    2021/10/08 09:53:15 [notice] 1#1: start worker process 8
    escape=none[host localhost:8080]\x0A[content-type application/json]\x0A[accept */*]\x0A[x-header-channel 001]\x0A[cookie INGRESSCOOKIE=ab530e99eb53cf6baf59f09b6b52e000]\x0A[accept-language es-ES]\x0A[user-agent curl/7.64.1]\x0A[x-header-device 68768cb0-d7fb-11eb-b8bc-0242ac130003]\x0A[x-header-system-date 2021-01-01]\x0A[x-header-uuid 68768cb0-d7fb-11eb-b8bc-0242ac130003]\x0Aincludemime.types
    2021/10/08 09:53:23 [info] 8#8: *1 client 172.17.0.1 closed keepalive connection
    ```