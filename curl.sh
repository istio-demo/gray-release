#!/usr/bin/env bash

export SLEEP_POD=$(kubectl get pod -l app=sleep -o jsonpath={.items..metadata.name})
kubectl exec "${SLEEP_POD}" -c sleep -- sh -c "while true; do curl -sS http://httpbin:8000/headers && sleep 0.3; done"
