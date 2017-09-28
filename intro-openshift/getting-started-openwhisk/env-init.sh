ssh root@host01 "docker pull centos/python-35-centos7:latest"
ssh root@host01 "docker pull openshiftroadshow/parksmap-katacoda:1.0.0"
ssh root@host01 'for i in {1..200}; do oc policy add-role-to-user system:image-puller system:anonymous && break || sleep 1; done'
ssh root@host01 'oc create -f https://gist.githubusercontent.com/bbrowning/2d82c141962065f3d0fca15ec3a6cc3e/raw/6977a7745b05ee50652d3105a4c96791ae2efa5a/combined.yml'
