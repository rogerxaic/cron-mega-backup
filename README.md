# Cron MEGA backup

## Build

``` shell
docker build . -t rogermiret/cron-mega-backup
```

## Run

``` shell
docker run -d \
  --name "cron-mega-backup" \
  --restart=always \
  -v "/path/to/resource:/backup/resource" \
  --env MEGA_EMAIL=myEmail@example.com \
  --env MEGA_PASSWORD=myPassw0rd \
  --env CRON_SCHEDULE="0 0 * * *" \
  --env RESOURCE_PATH=/backup \
  --env MEGA_RESOURCE_PATH=/backup \
  --env RESOURCE_NAME=resource \
  rogermiret/cron-mega-backup
```

If you've got 2FA activated (which you should), then you need to login with a session secret:

``` shell
docker run -d \
  --name "cron-mega-backup" \
  --restart=always \
  -v "/path/to/resource:/backup/resource" \
  --env MEGA_SESSION=mySessionSecret \
  --env CRON_SCHEDULE="0 0 * * *" \
  --env RESOURCE_PATH=/backup \
  --env MEGA_RESOURCE_PATH=/backup \
  --env RESOURCE_NAME=resource \
  rogermiret/cron-mega-backup
```

### How to find my session secret

Run `docker run --rm -it rogermiret/megacmd` and log in using `mega-login --auth-code CODE EMAIL PASSWORD`. After logging in, run `mega-session` to get your secret session.
