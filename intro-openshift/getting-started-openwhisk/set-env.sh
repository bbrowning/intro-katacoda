~/.launch.sh

echo "Waiting for OpenWhisk to start... This may take a couple of moments"
until $(oc logs controller-0 | grep "invoker status changed to 0 -> Healthy" 2&> /dev/null); do
  sleep 1
done
