#!/bin/bash

docker build -t private-isu-benchmarker .
docker run --network host -i private-isu-benchmarker /opt/go/bin/benchmarker -t http://host.docker.internal -u /opt/go/userdata
