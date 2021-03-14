###################################################################################################################
#ETCD: Instal ETCD Server on local Linux server
###################################################################################################################

#ETCD: Specify etcd version
ETCD_VER=v3.4.15

#ETCD: choose either URL
GOOGLE_URL=https://storage.googleapis.com/etcd
GITHUB_URL=https://github.com/etcd-io/etcd/releases/download
DOWNLOAD_URL=${GOOGLE_URL}

#ETCD: Remove previous installation
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
rm -rf /tmp/etcd-download-test && mkdir -p /tmp/etcd-download-test

#ETCD: Download and install
curl -L ${DOWNLOAD_URL}/${ETCD_VER}/etcd-${ETCD_VER}-linux-amd64.tar.gz -o /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz
tar xzvf /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz -C /tmp/etcd-download-test --strip-components=1

#ETCD: Remove package file
rm -f /tmp/etcd-${ETCD_VER}-linux-amd64.tar.gz

#ETCD: Check version of etcd and etcdctl
/tmp/etcd-download-test/etcd --version
/tmp/etcd-download-test/etcdctl version

#ETCD: start a local etcd server
/tmp/etcd-download-test/etcd

#ETCD:  write,read to etcd
/tmp/etcd-download-test/etcdctl --endpoints=localhost:2379 put foo bar
/tmp/etcd-download-test/etcdctl --endpoints=localhost:2379 get foo

###################################################################################################################
