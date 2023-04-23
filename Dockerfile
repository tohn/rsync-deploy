FROM alpine:edge

RUN apk add --no-cache rsync openssh

# Label
LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "com.github.actions.description"="Deploy to a remote server using rsync over ssh"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.icon"="upload"

LABEL "repository"="http://github.com/tohn/rsync-deploy"
LABEL "homepage"="https://github.com/tohn/rsync-deploy"
LABEL "maintainer"="tohn"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
