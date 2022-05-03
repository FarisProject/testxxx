#!/bin/sh
if [ ! -f /home/root/.local/share/Tachidesk/docker_touchfile ]; then
	touch /home/root/.local/share/Tachidesk/docker_touchfile
	curl -s --create-dirs -L https://raw.githubusercontent.com/Suwayomi/docker-tachidesk/main/server.conf -o /home/suwayomi/.local/share/Tachidesk/server.conf;
fi
echo "Tachidesk data location inside the container -> /home/root/.local/share/Tachidesk"
echo ""
echo "The server is running by default configuration on  http://localhost:4567"
exec runsvdir -P /etc/service