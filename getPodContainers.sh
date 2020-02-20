#!/bin/bash

podname=$1

[ $# -eq 0 ] && { echo "Usage: $0 podname"; exit 1; }

podexists=$(kubectl get pods -o json | jq .items[].metadata.name | grep -i $podname | wc -l)

if [ $podexists == 1 ]; then
  echo "Pod $1 exists. Containers running inside the Pod is/are :- "
  echo ""
  podexactname=$(kubectl get pod | awk '{ print $1}' | grep -i $1)
  runningcontainers=$(kubectl get pods $podexactname -o jsonpath='{.spec.containers[*].name}';echo)
  arr=($(echo $runningcontainers | tr " " "\n"))
  for t in ${!arr[@]}; do echo "${arr[$t]}"; done
elif [ $podexists == 0 ]; then
  echo "No pod with name $podname"
else
  echo "No pod with name $podname"
fi

#################
# Usage example  #
##################
#kmaster@kmaster:~/Linux_class/ch1$ kubectl get pods
#NAME                                 READY   STATUS    RESTARTS   AGE
#basicpod                             1/1     Running   0          144m
#locationdeployment-c8567b9b7-8nggq   1/1     Running   4          41d
#two-containers                       1/2     Running   0          52m
#kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh basicpod
#Pod basicpod exists. Containers running inside the Pod is/are :-
#
#webcont
#kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh two-containers
#Pod two-containers exists. Containers running inside the Pod is/are :-
#
#nginx-container
#debian-container
#kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh location
#Pod location exists. Containers running inside the Pod is/are :-
#
#location
#kmaster@kmaster:~/Linux_class/ch1$ ./getPodContainers.sh
#Usage: ./getPodContainers.sh podname
#kmaster@kmaster:~/Linux_class/ch1$
#
