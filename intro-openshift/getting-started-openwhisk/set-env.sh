~/.launch.sh

echo "Waiting for OpenWhisk to start... This will take several minutes"
until $(oc logs -n openwhisk controller-0 2>&1 | grep "invoker status changed to 0 -> Healthy" &> /dev/null); do
  sleep 5
  echo -n "."
done

echo "OpenWhisk started."

echo "Logging in to OpenWhisk"

export AUTH_SECRET=$(oc get configmap openwhisk-config -o yaml | grep 'AUTH_GUEST=' | awk -F '=' '{print $2}')
wsk property set --auth $AUTH_SECRET --apihost http://$(oc get route/openwhisk --template={{.spec.host}})
