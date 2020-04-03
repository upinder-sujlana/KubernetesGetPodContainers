# KubernetesGetPodContainers

Quick bash script to take the Pod name and check on what containers are running inside the POD.

```
kmaster@kmaster:~/Linux_class/ch1$ kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
basicpod                             1/1     Running   0          144m
locationdeployment-c8567b9b7-8nggq   1/1     Running   4          41d
two-containers                       1/2     Running   0          52m
kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh basicpod
Pod basicpod exists. Containers running inside the Pod is/are :-

webcont
kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh two-containers
Pod two-containers exists. Containers running inside the Pod is/are :-

nginx-container
debian-container
kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh location
Pod location exists. Containers running inside the Pod is/are :-

location
kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh
Usage: ./getPodContainers.sh podname
kmaster@kmaster:~/Linux_class/ch1$
```
