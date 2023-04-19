#!/bin/bash
dirs="templates/tenants/deployments/"
for dir in ${dirs}*
  do  
    deploymentdir=$(echo "$dir" | cut -d'/' -f 4)
    echo $deploymentdir
  done