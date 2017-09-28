ssh root@host01 "docker pull centos/python-35-centos7:latest"
ssh root@host01 "docker pull openshiftroadshow/parksmap-katacoda:1.0.0"
ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
ssh root@host01 'ip link set docker0 promisc on'
ssh root@host01 'oc new-project openwhisk'
ssh root@host01 'oc create -f https://gist.githubusercontent.com/bbrowning/2d82c141962065f3d0fca15ec3a6cc3e/raw/03373f02ff128d3c898963573e0282802c2690b2/combined.yml'
ssh root@host01 'wget https://github.com/apache/incubator-openwhisk-cli/releases/download/latest/OpenWhisk_CLI-latest-linux-amd64.tgz && tar xzf OpenWhisk_CLI*.tgz && rm -f OpenWhisk_CLI*.tgz && mv wsk /usr/local/bin/wsk'
ssh root@host01 "AUTH_SECRET=$(oc get configmap openwhisk-config -o yaml | grep 'AUTH_GUEST=' | awk -F '=' '{print $2}') && wsk property set --auth $AUTH_SECRET --apihost http://$(oc get route/openwhisk --template={{.spec.host}})"
