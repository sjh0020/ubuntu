echo 将创建容器...
docker run -d \
	--name Aria2-Pro \
	--restart unless-stopped \
	--log-opt max-size=1m \
	--network host \
	-e PUID=$UID \
	-e PGID=$GID \
	-e RPC_SECRET=P3TERX \
	-e RPC_PORT=6800 \
	-e LISTEN_PORT=6888 \
	-e DISK_CACHE=128m \
	-v ~/Download/conf:/config \
	-v ~/Download:/downloads \
	p3terx/aria2-pro
docker run -d \
	--name AriaNg \
	--restart unless-stopped \
	--log-opt max-size=1m \
	-p 6880:6880 \
	p3terx/ariang
docker run -d \
	--name Watchtower-dev \
	--restart unless-stopped \
	-v /var/run/docker.sock:/var/run/docker.sock \
	containrrr/watchtower:latest-dev -c
docker stop Aria2-Pro-IPV6 AriaNg-IPV6
cp doc/ariang.desktop ~/桌面
cp doc/ariang.ico ~/图片
