FROM alpine:latest


ARG MODE=build

COPY ./content /.tachiworkdir/

RUN apk add --no-cache bash runit curl caddy rclone openjdk8-jre-base tzdata \
    && chmod +x /.tachiworkdir/service/*/run /.tachiworkdir/service/*/log/run /.tachiworkdir/*.sh \
    && ln -s /.tachiworkdir/service/* /etc/service/

RUN curl -L $(curl -s https://api.github.com/repos/suwayomi/tachidesk-server/releases/latest | grep -o "https.*jar") -o /.tachiworkdir/tachidesk_latest.jar

ENTRYPOINT ["sh","/.tachiworkdir/entrypoint.sh"]
