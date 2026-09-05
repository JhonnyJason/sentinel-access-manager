#!/bin/bash

############################################################
#region removeStuff
systemctl stop sentinel-access-manager.socket
systemctl stop sentinel-access-manager.service
systemctl stop sentinel-access-manager.path
rm /run/sentinel-access-manager.sk
#endregion

############################################################
#region copyStuff
cp sentinel-access-manager.service /etc/systemd/system/
cp sentinel-access-manager.socket /etc/systemd/system/
cp sentinel-access-manager.path /etc/systemd/system/
cp restart-sentinel-access-manager.service /etc/systemd/system/
cp nginx-config /etc/nginx/servers/sentinel-access-manager

cp ../output/service.js /opt/void/sentinel-access-manager/service.js
#endregion

############################################################
#region reloadAnd(Re)start
systemctl daemon-reload
systemctl start sentinel-access-manager.socket
systemctl start sentinel-access-manager.path
nginx -s reload
#endregion
