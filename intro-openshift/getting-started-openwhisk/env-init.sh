ssh root@host01 "docker pull centos/python-35-centos7:latest"
ssh root@host01 "docker pull openshiftroadshow/parksmap-katacoda:1.0.0"
ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
ssh root@host01 'ip link set docker0 promisc on'
ssh root@host01 'oc login -u developer -p developer'
ssh root@host01 'oc new-project openwhisk'
ssh root@host01 'oc create -f https://gist.githubusercontent.com/bbrowning/2d82c141962065f3d0fca15ec3a6cc3e/raw/18eefe60530ba3b7cf4fbf0fb32ec53b142ae657/combined.yml'
ssh root@host01 'wget https://github.com/apache/incubator-openwhisk-cli/releases/download/latest/OpenWhisk_CLI-latest-linux-amd64.tgz && tar xzf OpenWhisk_CLI*.tgz && rm -f OpenWhisk_CLI*.tgz && mv wsk /usr/local/bin/wsk'
