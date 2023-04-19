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
      echo $custname
      yq '.metadata.name = $custname' templates/tenants/deployments/nbsampleapp.yaml > templates/tenants/deployments/test.yaml
done