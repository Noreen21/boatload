#! /bin/bash
oc create ns boatload-1
oc label namespace boatload-1 kube-burner-job=boatload
for i in {1..60}
do
 oc create ns boatload-bu-$i
 oc label namespace boatload-bu-$i kube-burner-job=boatload-bu
done
#command=($(oc get network-attachment-definitions.k8s.cni.cncf.io -A | wc -l) )
#until $command | grep -m 1 "4"; do : ; done
#while ["$command" == "4"];
#do
# sleep 1
# echo "Waiting for network-attachments to get ready"
#done
