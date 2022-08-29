# NOTE: This repository is not needed anymore and thus archived
(reason: traefik logs can only be rotated from the host system)

# docker-logrotate

Logrotation for docker-compose services.

Currently supported:
- traefik

To add support for a service, the log file must be mounted into the container (e.g. `/var/log/`) and a
`logrotate` config file must be provided (cf. https://github.com/MaRDI4NFDI/docker-logrotate/blob/main/traefik and `man logrotate`).

docker-compose config:
```yaml
services:
  [...]

  logrotate:
    restart: always
    image: ghcr.io/mardi4nfdi/docker-logrotate:main
    container_name: logrotate
    volumes:
      - traefik-log:/var/log
```
assuming traefik stores its log in a named volume `traefik-log`.
