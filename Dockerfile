ARG ILIAS_BASE_IMAGE
FROM $ILIAS_BASE_IMAGE

LABEL org.opencontainers.image.source="https://github.com/fluxapps/FluxIliasCronBase"

COPY . /FluxIliasCron

ENTRYPOINT ["/FluxIliasCron/bin/entrypoint.sh"]

ENV ILIAS_CRON_FILE /etc/periodic/ilias
ENV ILIAS_CRON_PERIOD */5 * * * *
