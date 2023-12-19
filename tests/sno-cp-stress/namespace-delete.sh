oc delete ns boatload-1
for i in {1..40}; do oc delete ns boatload-bu-$i --force; done
for i in {1..5}; do oc delete ns boatload-bu-pvc-vfs-exec-$i --force; done
for i in {1..5}; do oc delete ns boatload-bu-pvc-vfs-$i --force; done
for i in {1..10}; do oc delete ns boatload-bu-pvc-$i --force; done
