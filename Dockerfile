FROM ubuntu:jammy

ENV TIMEZONE="CET"

RUN apt-get update && \
    apt-get install --yes --no-install-recommends nano vim cron logrotate tzdata && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY traefik /etc/logrotate.d/traefik
# other logrotate config files can be added here

RUN cp "/usr/share/zoneinfo/${TIMEZONE}" /etc/localtime && \
        echo "$TIMEZONE" > /etc/timezone && echo "Date: $(date)."

# logrotate creats a daily cronjob automatically (/etc/cron.daily/logrotate)
CMD cron -f -l 8
