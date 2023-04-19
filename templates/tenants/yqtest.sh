for im in $(yq eval -o=j templates/tenants/customers.yaml | jq -cr '.deployments[]'); do
      name=$(echo $im | jq -r '.name' -)
      size=$(echo $im | jq -r '.size' -)
      environment=$(echo $im | jq -r '.environment' -)
      tenantname=$(echo $im | jq -r '.tenantname' -)
      deploymentgroup=$(echo $im | jq -r '.deploymentgroup' -)
      export custname=$name 
      export custsize=$size 
      export custenvironment=$environment
      export custtenant=$tenantname
      export custdeployment=$deploymentgroup
      # echo $custname
      # yq '.metadata.name = $custname' templates/tenants/deployments/nbsampleapp.yaml > templates/tenants/deployments/test.yaml
      #=======
      #Get the deployment directory and list all directories within it. 
      #Cut of all slashes until forth slash to get the directory names.=======#
      dirs="templates/tenants/deployments/"
      for dir in ${dirs}*
        do  
          deploymentdir=$(echo "$dir" | cut -d'/' -f 4)
          
          echo $deploymentdir  "==" $custname
 
      #compare the directory to match the customer deployment entries before advancing with deployment.
            # if [ "$deploymentdir" == "$name" ]
            #   then
            #     echo "Equal Strings"
            #   else
            #     echo "Strings not equal"
            #   fi
      done
      # echo $deploymentdir
done