oc create cm nginxconfigfile --from-file=nginx.conf=".\nginx.conf"

oc create cm vipsgatewaynginxconfig --from-file=nginx.conf=".\nginx.conf"