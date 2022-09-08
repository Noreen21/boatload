#!/usr/bin/env bash
set -xe
set -o pipefail

version=$(oc version -o json | jq -r '.openshiftVersion')

sdn_pods=$(oc get po -n openshift-sdn --no-headers | wc -l)
network="ovn"
if [[ $sdn_pods -gt 0 ]]; then
  network="sdn"
fi

nodes=$(oc get no -l jetlag=true --no-headers | wc -l)

sleep_time=300

time ./testcase-1.sh ${version}-${network}-sno${nodes}-60 | tee ${version}-${network}-sno${nodes}-tc1.log
sleep ${sleep_time}
time ./testcase-2.sh ${version}-${network}-sno${nodes}-60 | tee ${version}-${network}-sno${nodes}-tc2.log
sleep ${sleep_time}
time ./testcase-3.sh ${version}-${network}-sno${nodes} 60 | tee ${version}-${network}-sno${nodes}-tc3.log
sleep ${sleep_time}
time ./testcase-4.sh ${version}-${network}-sno${nodes} 60 | tee ${version}-${network}-sno${nodes}-tc4.log
