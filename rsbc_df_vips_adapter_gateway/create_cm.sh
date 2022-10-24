oc create cm nginxconfigfile --from-file=nginx.conf=".\nginx.conf"

oc create cm vipsgatewaynginxconfig --from-file=nginx.conf=".\nginx.conf"
oc create cm logexporterconfig --from-file=config.hcl=".\nginx-log-exporter-config.hcl"