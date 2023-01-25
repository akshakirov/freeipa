## Build and start docker container manualy
```
git clone https://github.com/freeipa/freeipa-container.git

cd freeipa-docker-compose/

docker build -t freeipa-centos-8-stream -f  Dockerfile.centos-8-stream .

cd ..

bash install.sh

```

## docker-compose still in progress don't use it from this repo
 Docker compose to build an FreeIPA server

```
systemctl disable systemd-resolved.service 
vim /etc/resolv.conf 
```

```
git clone https://github.com/akshakirov/freeipa-docker-compose.git

cd freeipa-docker-compose

docker-compose up -d

docker logs freeipa -f
```


without _priveleged: yes_   gets an error

```
Failed to create /init.scope control group: Read-only file system
Failed to allocate manager object: Read-only file system
[!!!!!!] Failed to allocate manager object, freezing.
Freezing execution.
```
