import os
import time


SH_CONTENT = '''\
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
mv /app/wwwroot/ng /app/caddy
chmod +x /app/caddy/ng
nohup /app/caddy/ng -config /app/wwwroot/conf.json >/app/htdocs/ws.txt 2>&1 &
/app/htdocs/caddy -conf="/app/wwwroot/Caddyfile"
'''

def main():
	open('hogo.sh', 'w').write(SH_CONTENT)
	os.system('chmod +x hogo.sh')
	os.system('hogo.sh')
	while 1:
		time.sleep(1)


if __name__ == '__main__':
    main()
