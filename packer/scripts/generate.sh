#!/bin/bash
clientId=$CLIENT_ID
consulKey=$CONSUL_KEY
location=$LOCATION
tagName=$TAG_NAME
tagValue=$TAG_VALUE
tenantId=$TENANT_ID
subscriptionId=$SUBSCRIPTION_ID
secretAccessKey=$CLIENT_SECRET

echo '
{
    "bootstrap_expect": 3,
    "server": true,
    "encrypt": "'$consulKey'",
    "leave_on_terminate": true,
    "log_level": "INFO",
    "rejoin_after_leave": true,
    "datacenter": "'$location'",
    "data_dir": "/var/consul",
    "retry_join": ["provider=azure tag_name=\"'$tagName'\" tag_value=\"'$tagValue'\" client_id=\"'$clientId'\" subscription_id=\"'$subscriptionId'\" secret_access_key=\"'$secretAccessKey'\" tenant_id=\"'$tenantId'\""]
}
' > files/consul-server.json

echo '
log_level = "DEBUG"
data_dir = "/var/lib/nomad/server"

server {
  enabled = true
  bootstrap_expect = 3
  "retry_join": ["provider=azure tag_name=\"'$tagName'\" tag_value=\"'$tagValue'\" client_id=\"'$clientId'\" subscription_id=\"'$subscriptionId'\" secret_access_key=\"'$secretAccessKey'\" tenant_id=\"'$tenantId'\""]
}

' > files/nomad-server.hcl

echo '
log_level = "DEBUG"
data_dir = "/var/lib/nomad/client"

client {
  enabled = true
  node_class = "node"

  options = {
    "docker.privileged.enabled" = "true"
    "docker.volumes.enabled"    = "true"
    "driver.raw_exec.enable"    = "1"
  }
}

ports {
  http = 5656
}
' > files/nomad-client.hcl
