# squid

## Build the image
```
docker build -t docker-squid-proxy .
```

## Run via docker-compose

Copy `.env.template` file to `.env` and set the necessay varialbes `SQUID_USER`, `SQUID_PASS` and `PORT`.

```bash
docker-compose up -d
```

## Run Squid with a basic HTTP authentication

We are going to use "ncsa_auth" that allows Squid to read and authenticate user and password information from an NCSA httpd-style password file when using basic HTTP authentication.

```bash
docker run --name squid_proxy -d \
  --restart=always \
  --publish 3128:3128 \
  -e SQUID_USER=doreno \
  -e SQUID_PASS=XXXX \
  --volume /var/spool/squid \
  docker-squid-proxy
```

