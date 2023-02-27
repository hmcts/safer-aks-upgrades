

#! /usr/bin/env bash
set -x
az account set --subscription 'Pay-As-You-Go'
aks_resource_group='rg-mycluster'
aks_name='mycluster'
department='cft'
{
printf "\n\nTrying cluster $aks_name $aks_resource_group\n"
az aks get-credentials \
    --resource-group $aks_resource_group \
    --name $aks_name
./pluto
./pluto detect-helm
}