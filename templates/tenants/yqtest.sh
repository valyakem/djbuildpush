for im in $(yq eval -o=j templates/tenants/customers.yaml | jq -cr '.deployments[]'); do
      name=$(echo $im | jq -r '.name' -)
      size=$(echo $im | jq -r '.size' -)
      environment=$(echo $im | jq -r '.environment' -)
      tenantname=$(echo $im | jq -r '.tenantname' -)
      deploymentgroup=$(echo $im | jq -r '.deploymentgroup' -)
      export custname=$name 
      # export custsize=$size 
      # export custenvironment=$environment
      # export custtenant=$tenantname
      # export custdeployment=$deploymentgroup
      # echo $custname
      # yq '.metadata.name = $custname' templates/tenants/deployments/nbsampleapp.yaml > templates/tenants/deployments/test.yaml
      #=======
      #Get the deployment directory and list all directories within it. 
      #Cut of all slashes until forth slash to get the directory names.=======#
      dirs="templates/tenants/deployments/"$custname
      
      if [ -d "$dirs" ] 
      then
           kubectl create namespace $name
           kubectl create -f $dirs -n $namespace
#           kubectl delete namespace web
      else
            echo "Error: Directory $dirs not exists."
      fi
      
      # echo $deploymentdir
done