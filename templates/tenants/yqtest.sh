for im in $(yq eval -o=j templates/tenants/customers.yaml | jq -cr '.deployments[]'); do
      name=$(echo $im | jq -r '.name' -)
      size=$(echo $im | jq -r '.size' -)
      environment=$(echo $im | jq -r '.environment' -)
      tenantname=$(echo $im | jq -r '.tenantname' -)
      deploymentgroup=$(echo $im | jq -r '.deploymentgroup' -)
      export custname=$name 
      echo $name
      # export custsize=$size 
      # export custenvironment=$environment
      # export custtenant=$tenantname
      # export custdeployment=$deploymentgroup
      # echo $custname
      # yq '.metadata.name = $custname' templates/tenants/deployments/nbsampleapp.yaml > templates/tenants/deployments/test.yaml
      #=======
      #Get the deployment directory and list all directories within it. 
      #Cut of all slashes until forth slash to get the directory names.=======#
#       dirs="templates/tenants/deployments/"$custname
      
#       if [ -d "$dirs" ] 
#       then
# #           kubectl create namespace $name
#            kubectl delete -f $dirs -n $name
#             if [ "$name" = "matello-tech" ]; then
#                   echo "creating secrets"
#                   # kubectl create secret generic nbapp-secret --from-env-file=$dirs"/.envfile" -n $name
#                   # echo "Done with secrets creation"
#             fi
#            kubectl delete namespace $name
#       else
#             echo "Error: Directory $dirs not exists."
#       fi
      
      # echo $deploymentdir
done

kubectl apply -f "templates/tenants/conbaserouting/"
            # if [ "$name" = "matello-tech" ]; then
            #       kubectl create secret generic nbapp-secret --from-env-file=$dirs"/.env" -n $name
            # fi