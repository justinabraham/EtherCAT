#!/bin/bash


sed -i '3s/.*/	rotate 2/' /etc/logrotate.d/rsyslog
sed -i '27s/.*/	rotate 2/' /etc/logrotate.d/rsyslog
sed -i '4i\        maxsize 1000\' /etc/logrotate.d/rsyslog
sed -i '29i\        maxsize 1000\' /etc/logrotate.d/rsyslog
echo ":programname,isequal,\"gnome-session\" ~" | tee --append /etc/rsyslog.d/gnome-session-log.conf
cd /etc/init.d/
/sbin/service rsyslog stop
/sbin/update-rc.d -f rsyslog remove
mv rsyslog ~/
cd /etc/systemd/system/
mv syslog.service ~/
