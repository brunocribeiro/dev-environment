#!/usr/bin/env bash

alias aws='docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli'

alias createuser='docker exec -it postgres createuser -U postgres -O postgres'
alias createdb='docker exec -it postgres createdb -U postgres -O postgres'
alias dropdb='docker exec -it postgres dropdb -U postgres'
alias psql='docker exec -it postgres psql -U postgres'

alias pg_dump='docker exec -i postgres pg_dump -U postgres'
alias pg_restore='docker exec -i postgres pg_restore -U postgres -v'

alias docker-container-ip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "

alias docker-container-clear='docker rm $(docker ps -af status=exited -q)'
alias docker-image-clear='docker rmi -f $(docker images -f "dangling=true" -q)'
