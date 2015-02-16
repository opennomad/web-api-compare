#!/usr/bin/env bash

curl -w "%{http_code}\n" localhost:8080/

curl -w "%{http_code}\n" localhost:8080/time

curl -w "\n%{http_code}\n" -H 'Content-type: application/json'  -XPOST localhost:8080/sort -d '[ 30, 4, 0.99, 999999, 0.000007 }'
curl -w "\n%{http_code}\n" -H 'Content-type: application/json'  -XPOST localhost:8080/sort -d '[ 30, 4, 0.99, 999999, 0.000007 ]'
