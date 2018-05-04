#!/bin/bash

_term() {
  kubectl delete -f jaeger-example-deploy.yaml > /dev/null 2>&1 &
}

trap _term SIGTERM

if kubectl get po | grep jaeger-example; then
  kubectl delete -f jaeger-example-deploy.yaml
fi
docker build -t jaeger-example .
kubectl create -f jaeger-example-deploy.yaml
sleep 1
POD=$(kubectl get po | grep jaeger-example | grep -v Term | awk '{print $1}')
until kubectl logs -f $POD jaeger-example
do
  sleep 5
done
