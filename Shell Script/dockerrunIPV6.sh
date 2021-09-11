docker run -d \
	--name Aria2-Pro-IPV6 \
	--restart unless-stopped \
	--log-opt max-size=1m \
	--network host \
	-e PUID=$UID \
	-e PGID=$GID \
	-e RPC_SECRET=P3TERX \
	-e RPC_PORT=6800 \
	-e LISTEN_PORT=6888 \
	-e DISK_CACHE=128m \
	-e IPV6_MODE=true \
	-v ~/Download-IPV6/conf:/config \
	-v ~/Download-IPV6:/downloads \
	p3terx/aria2-pro
docker run -d \
	--name AriaNg-IPV6 \
	--restart unless-stopped \
	--log-opt max-size=1m \
	--network host \
	p3terx/ariang --port 6880 --ipv6
docker run -d \
	--name Watchtower-dev \
	--restart unless-stopped \
	-v /var/run/docker.sock:/var/run/docker.sock \
	containrrr/watchtower:latest-dev -c
cp doc/ariang.desktop ~/桌面
cp doc/ariang.ico ~/图片
