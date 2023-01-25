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

