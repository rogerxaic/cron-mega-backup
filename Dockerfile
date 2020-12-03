FROM rogermiret/megacmd

RUN apt-get update && apt-get install -y cron && rm -rf /var/lib/apt/lists/*

ADD backup.sh /backup.sh
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /backup.sh /entrypoint.sh

ENV MEGA_EMAIL=
ENV MEGA_PASSWORD=
ENV MEGA_SESSION=
ENV CRON_SCHEDULE="0 0 * * *"

ENTRYPOINT /entrypoint.sh
