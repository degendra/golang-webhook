#!/bin/sh

echo "Script Started."

option="${1}"
value="${2}"

StartPod(){
    echo "Starting pod..."

    case ${value} in
       "pgpool") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/pool-pod.yml
          ;;
       *)
          echo "`basename ${0}`:Error: Pod doesn't exist."
          exit 1 # Command to come out of the program with status 1
          ;;
    esac

}

StopPod(){
    echo "Stopping pod..."

    case ${value} in
       "pgpool") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-pgpool
          ;;
       *)
          echo "`basename ${0}`:Error: Pod doesn't exist."
          exit 1 # Command to come out of the program with status 1
          ;;
    esac

    #Start Pod
    StartPod
}

case ${option} in
   -n) StopPod
      ;;
   *)
      echo "`basename ${0}`:usage: [-n name]"
      exit 1 # Command to come out of the program with status 1
      ;;
esac


