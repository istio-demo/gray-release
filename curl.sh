#!/usr/bin/env bash

export SLEEP_POD=$(kubectl get pod -l app=sleep -o jsonpath={.items..metadata.name})

while true; do kubectl exec "${SLEEP_POD}" -c sleep -- curl -sS -H 'Cookie: email=test@example.com' http://httpbin:8000/headers; done