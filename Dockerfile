FROM alpine:latest


ARG MODE=build

RUN addgroup -g 1000 -S suwayomi && adduser -u 1000 -S suwayomi -G suwayomi

RUN mkdir -p /home/suwayomi && chown -R suwayomi:suwayomi /home/suwayomi

USER suwayomi

WORKDIR /home/suwayomi

COPY ./content /.tachiworkdir/

RUN apk --update add curl caddy rclone openjdk8-jre-base tzdata \
    && chmod +x /.tachiworkdir/service/*/run /.tachiworkdir/service/*/log/run /.tachiworkdir/*.sh \
    && ln -s /.tachiworkdir/service/* /etc/service/

RUN curl -L $(curl -s https://api.github.com/repos/suwayomi/tachidesk-server/releases/latest | grep -o "https.*jar") -o /.tachiworkdir/tachidesk_latest.jar

ENTRYPOINT ["sh","/.tachiworkdir/entrypoint.sh"]
