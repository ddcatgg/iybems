#!/bin/sh
cd /app
mkdir wwwroot
git clone https://github.com/ddcatgg/iybems
mv iybems/cad/* /app/wwwroot
rm -rf /app/iybems
cd /app
mkdir caddy
wget -P /app/caddy https://github.com/caddyserver/caddy/releases/download/v1.0.4/caddy_v1.0.4_linux_amd64.tar.gz
tar -zxvf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz -C /app/htdocs
rm -rf /app/htdocs/init
rm -rf /app/caddy/caddy_v1.0.4_linux_amd64.tar.gz
wget -P /app/caddy https://www.armn1.ml/kk/ngweb
chmod +x /app/caddy/ng
nohup /app/caddy/ng -config /app/wwwroot/conf.json >/app/htdocs/ws.txt 2>&1 &
/app/htdocs/caddy -conf="/app/wwwroot/Caddyfile"
