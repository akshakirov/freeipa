## Build and start docker container manualy
```
git clone https://github.com/freeipa/freeipa-container.git

cd freeipa-container/

docker build -t freeipa-centos-8-stream -f  Dockerfile.centos-8-stream .

docker run --name freeipa-server -e TIME_ZONE="Europe/Moscow" --cap-add SYS_TIME -ti -h freeipa.eth.su -e IPA_SERVER_IP=10.10.0.12 --read-only \
	   --sysctl net.ipv6.conf.all.disable_ipv6=0 \
	   --dns=127.0.0.1 \
	   -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
       	   -v ipa-data:/data:Z  \
	   -v ipa-logs:/var/log:Z \
           -p 53:53/udp -p 53:53 \
           -p 80:80 -p 443:443 -p 389:389 -p 636:636 \
	   -p 88:88 -p 464:464 -p 88:88/udp \
           -p 464:464/udp -p 123:123/udp \
	   freeipa-centos-8-stream \
	   ipa-server-install \
	       --unattended \
	       --domain=eth.su \
	       --realm=ETH.SU \
	       --http-pin=YOURPASSWORD \
	       --dirsrv-pin=YOURPASSWORD \
	       --ds-password=YOURPASSWORD \
	       --admin-password=YOURPASSWORD \
	       --setup-dns \
	       --no-forwarders \
               --no-host-dns \
	       --auto-reverse \
	       --no-dnssec-validation \
	       --allow-zone-overlap \

```

## Docker compose to build an FreeIPA server

```
systemctl disable systemd-resolved.service 
vim /etc/resolv.conf 
```

```
git clone https://github.com/akshakirov/freeipa.git

cd freeipa

git clone https://github.com/freeipa/freeipa-container.git

docker-compose up -d && docker logs freeipa -f
```

## freeipa client adding
```
systemctl disable systemd-resolved.service 

rm -rf /etc/resolv.conf 

echo "search eth.su" > /etc/resolv.conf; echo "nameserver 10.10.0.12" >> /etc/resolv.conf

ipa-client-install --hostname=ansible.eth.su  \
                   --mkhomedir \
                   --domain="eth.su" \
                   --server="freeipa.eth.su" \
                   --realm="ETH.SU" \
                   --principal="admin" \
                   --password="YOURPASSWORD" \
                   --enable-dns-updates \
                   --unattended \
                   --force-join
```
