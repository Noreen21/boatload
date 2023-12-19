#! /bin/bash
oc create ns boatload-1
oc label namespace boatload-1 kube-burner-job=boatload
for i in {1..40}
do
 oc create ns boatload-bu-$i
 oc label namespace boatload-bu-$i kube-burner-job=boatload-bu
done
for i in {1..5}
do
 oc create ns boatload-bu-pvc-vfs-exec-$i
 oc label namespace boatload-bu-pvc-vfs-exec-$i kube-burner-job=boatload-bu-pvc-vfs-exec
done
for i in {1..5}
do
 oc create ns boatload-bu-pvc-vfs-$i
 oc label namespace boatload-bu-pvc-vfs-$i kube-burner-job=boatload-bu-pvc-vfs
done
for i in {1..10}
do
 oc create ns boatload-bu-pvc-$i
 oc label namespace boatload-bu-pvc-$i kube-burner-job=boatload-bu-pvc
done
