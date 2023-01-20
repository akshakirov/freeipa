 Docker compose to build an FreeIPA server

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
