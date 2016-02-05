#!/bin/sh

echo "Script Started."

option="${1}"
value="${2}"

StartPod(){
    echo "Starting pod..."

    case ${value} in
       "pgpool") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/pool-pod.yml
          ;;
       "nginx") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/nginx-pod.yml
          ;;
       "sitemonitor") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/unicorn-pod.yml
          ;;
       "backend") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/backend-pod.yml
          ;;
       "scheduler") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/scheduler-pod.yml
          ;;
       "notification") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/narad-pod.yml
          ;;
       "headcrawler") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/head-crawl-pod.yml
          ;;
       "monitorcrawler") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/full-crawl-pod.yml
          ;;
       "yslow") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/yslow-pod.yml
          ;;
       "linting") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/lint-pod.yml
          ;;
       "deface") /root/kubernetes/cluster/kubectl.sh create -f /root/pods/deface-pod.yml
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
       "nginx") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-nginx-controller
          ;;
       "sitemonitor") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-unicorn-rc
          ;;
       "backend") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-backend
          ;;
       "scheduler") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-scheduler
          ;;
       "notification") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-notification
          ;;
       "headcrawler") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-head-crawl
          ;;
       "monitorcrawler") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-full-crawl
          ;;
       "yslow") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-yslow
          ;;
       "linting") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-deface
          ;;
       "deface") /root/kubernetes/cluster/kubectl.sh stop rc site-monitor-linting
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


