set -x
docker-compose exec ceph-mon ceph mgr module enable dashboard
docker-compose exec ceph-mon ceph dashboard create-self-signed-cert
docker-compose exec ceph-mon ceph config set mgr mgr/dashboard/server_addr ceph-mgr
docker-compose exec ceph-mon ceph config set mgr mgr/dashboard/server_port 8443
#docker-compose exec ceph-mon ceph mgr services #service url check
docker-compose exec ceph-mon ceph dashboard set-login-credentials admin admin
docker-compose exec ceph-mon radosgw-admin user create --uid=dashusr --display-name="DashBoard User" --system
_accesskey=$(docker-compose exec ceph-mon radosgw-admin user info --uid dashusr | egrep -i access_key | cut -d ":" -f 2 | tr -d '", ')
_secretkey=$(docker-compose exec ceph-mon radosgw-admin user info --uid dashusr | egrep -i secret_key | cut -d ":" -f 2 | tr -d '", ')
docker-compose exec ceph-mon ceph dashboard set-rgw-api-access-key $_accesskey
docker-compose exec ceph-mon ceph dashboard set-rgw-api-secret-key $_secretkey
#open url
#https://ceph-mgr:8443
set +x
