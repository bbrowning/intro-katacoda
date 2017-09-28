~/.launch.sh

echo "Waiting for OpenWhisk to start... This may take several minutes"
until $(oc logs -n openwhisk controller-0 2>&1 | grep "invoker status changed to 0 -> Healthy" &> /dev/null); do
  sleep 5
  echo -n "."
done

echo "OpenWhisk started."
