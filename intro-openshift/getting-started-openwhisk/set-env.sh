~/.launch.sh

echo "Waiting for OpenWhisk to start... This may take a couple of moments"
until $(oc logs controller-0 2>&1 | grep "invoker status changed to 0 -> Healthy" &> /dev/null); do
  sleep 5
  echo -n "."
done

echo "OpenWhisk started."
