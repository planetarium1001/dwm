#!/usr/bin/zsh

SERVICE_NAME="uuplugin"
 
if systemctl is-active --quiet $SERVICE_NAME; then
    systemctl stop uuplugin.service && systemctl start daed.service
else
    systemctl stop daed.service && systemctl start uuplugin.service
fi
