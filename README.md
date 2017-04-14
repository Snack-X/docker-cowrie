# Cowrie on Docker

## Run

* Edit `cowrie.cfg` as needed

```
$ docker build --tag cowrie .
$ docker run --name honeypot -d -p 2222:2222 cowrie

$ docker stop honeypot
```

## Access

```
$ ssh root@localhost -p 2222
Password:

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.

root@svr04:~#
```

## Customize

```
$ docker exec -it honeypot /bin/ash
/ $ cd /home/cowrie/cowrie
~/cowrie $ ls
CHANGELOG.md             data                     share
INSTALL.md               dl                       start.sh
README.md                doc                      stop.sh
bin                      etc                      twisted
cowrie                   honeyfs                  txtcmds
cowrie-docker            log                      var
cowrie.cfg               requirements-output.txt
cowrie.cfg.dist          requirements.txt
/ $ # customize data/userdb.txt, or anything
```

## Retrieve logs

```
$ docker exec -it honeypot /bin/ash -c "ls /home/cowrie/cowrie/log"
cowrie.json  cowrie.log   lastlog.txt  tty

$ docker cp honeypot:/home/cowrie/cowrie/log/cowrie.json .
```
