#for one copy, size 1
echo "osd pool default min size = 1" | sudo tee -a ceph_conf/ceph.conf
echo "osd pool default size = 1" | sudo tee -a ceph_conf/ceph.conf
echo "max open files = 655350" | sudo tee -a  ceph_conf/ceph.conf
echo "cephx cluster require signatures = false" | sudo tee -a ceph_conf/ceph.conf
echo "cephx service require signatures = false" | sudo tee -a ceph_conf/ceph.conf
echo "osd max object namespace len = 64" | sudo tee -a  ceph_conf/ceph.conf
#must be for osd run
echo "osd max object name len = 256" | sudo tee -a ceph_conf/ceph.conf
#must be for non health warning
docker-compose exec ceph-mon ceph osd pool create default.rgw.buckets.data 128 128
#Ceph rados gw rest api kullanımı için, ceph'te kullanıcı oluşturma
#PASSWORD_CEPH_KEY=9sbzNoYS6NMpyLtfgjGHX131CROkabaNR8uIjRj7QYCqQmfNYdSjNq4uivEbmDUx
#docker-compose exec ceph-mon radosgw-admin user create --uid=cephuser --display-name="Ceph Docker Compose" --subuser="cephuser:swift" --key-type=swift --secret-key "$PASSWORD_CEPH_KEY" --access full
