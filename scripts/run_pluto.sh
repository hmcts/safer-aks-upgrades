

#! /usr/bin/env bash
set -x
 az account set --subscription $1
 aks_resource_group=$2
 aks_name=$3
 environment=$4
 department=$5

{
printf "\n\nTrying cluster $aks_name $aks_resource_group\n"
az aks get-credentials \
    --resource-group $aks_resource_group \
    --name $aks_name --admin
./pluto
./pluto detect-helm -o wide | tee ~/outputfile.txt
}