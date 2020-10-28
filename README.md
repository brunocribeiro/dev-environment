dev-environment
===

Dependencies to run the environment
---

- _docker-ce_: see [here](https://docs.docker.com/install/) how to install and set it up on youy environment;
- _docker-compose_: see [here](https://docs.docker.com/compose/install/) how to install and set it up on youy environment;

What will you find in the docker-compose?
---

- `cassandra` version `3`;
- `glowroot` Glowroot Central version `0.13.6`;
- `postgres` PostgreSQL version `11.6`;

Starting all the containers
---

```console
$ docker-compose up -d
```

Creating only some containers
---

In case you don't want or don't need all the containers in the composer you can create just the ones you want to. To see how to do that check [here](https://docs.docker.com/compose/reference/).
One example would look like this:

```console
$ docker-compose up -d postgres
```

This will create only postgres container and not the others like cassandra and glowroot.

Ports exposed to the _host_
---

- `cassandra`:
  - internal port `7000` listen from the host at `7000`;
  - internal port `9022` listen from the host at `9042`;

- `glowroot`:
  - internal port `4000` listen from the host at `4000`;
  - internal port `8181` listen from the host at `8181`;

- `postgres`:
  - internal port `5432` listen from the host at `5432`;

Aliases
---

There are also some aliases to help use tools from the containers. Check them out [here](alias.sh) and some exemples below.

- `aws cli`:

First create the alias in the `.bashrc`, `.zshrc`, or whatever other startup script file you're using. You can do this like that:

```console
brunosilva@brunos-macbook ~ % echo "docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/aws amazon/aws-cli" >> ~/.zhrc
```

```console
brunosilva@brunos-macbook ~ % aws s3 ls
2019-03-25 20:21:46 103850359708-awsmacietrail-dataevent
2020-09-16 21:36:54 analytics-qa.ringdna.net
2018-02-07 12:31:05 api.snapshots
2019-02-26 21:25:05 app-lab.ringdna.net
2017-07-19 21:49:55 app-qa.ringdna.net
2017-07-19 21:49:30 app.ringdna.net
2019-06-17 23:39:27 aws-athena-query-results-103850359708-us-east-1
...
```

Check [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-docker.html) the complete reference.

- `docker`:

First create the alias in the `.bashrc`, `.zshrc`, or whatever other startup script file you're using. You can do this like that:

```console
brunosilva@brunos-macbook ~ % echo "docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'" >> ~/.zhrc
```

Then you can use the alias like this:

```console
brunosilva@brunos-macbook ~ % docker-container-ip postgres
172.19.0.3
```

- `postgres`:

First create the alias in the `.bashrc`, `.zshrc` or whatever other startup script file you're using. You can do this like that:

```console
brunosilva@brunos-macbook ~ % echo "alias psql='docker exec -it postgres psql -U postgres'" >> ~/.zhrc
```

Then you can use the alias like this:

```console
brunosilva@brunos-macbook ~ % psql
psql (11.6 (Debian 11.6-1.pgdg90+1))
Type "help" for help.

postgres=#
```
