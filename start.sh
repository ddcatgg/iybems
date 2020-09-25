#!/bin/sh
appname=ddgg-ibmyes
rsize=256
cd gogogo
ibmcloud target --cf
ibmcloud cf push
ibmyuming=$(ibmcloud app show $appname | grep h |awk '{print $2}'| awk -F: 'NR==2{print}')
    SCODE=$(base64 -w 0 << EOF
    {
      "v": "2",
      "ps": "v2ws IBM",
      "add": "$ibmyuming",
      "port": "443",
      "id": "775e863a-e36d-417b-a80f-584835ec8181",
      "aid": "4",
      "net": "ws",
      "type": "none",
      "host": "",
      "path": "/ws",
      "tls": "tls"
    }
EOF
    )
	echo "link："
    echo ://${SCODE}
