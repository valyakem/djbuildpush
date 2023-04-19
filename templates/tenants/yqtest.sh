inputfile="templates/tenants/customers.yaml"
getusers="$(yq '.deployment.[].name' $inputfile)"
#echo $getcustomers
#extract all generic key values and store as variables
gizmoImageVersion="$(yq '.gizmoImageVersion' $inputfile)"
robotManagerImageVersion="$(yq '.robotManagerImageVersion' $inputfile)"
iqImageVersion="$(yq '.iqImageVersion' $inputfile)"
keycloakImageVersion="$(yq '.keycloakImageVersion' $inputfile)"
npvImageVersion="$(yq '.npvImageVersion' $inputfile)"
elasticSearchVersion="$(yq '.elasticSearchVersion' $inputfile)"

#get an array list of all customers by name
getcustomers="$(yq '.deployment.[].name' $inputfile)"

#loop through the list of array one after the order
for customer in $getcustomers
  do
         var=$((var+1))  #add 1 to var each time the loop is done
               
               #get corresponding values based on the array index and assign them to variables
               getcustname="$(yq '.[].customer'$var'.name' $inputfile)"
               getcustsize="$(yq '.[].customer'$var'.size' $inputfile)"
               getcusttenant="$(yq '.[].customer'$var'.tenantname' $inputfile)"
               getcustdeploygroup="$(yq '.[].customer'$var'.deploymentgroup' $inputfile)"

         #output the values on the terminal
              echo $getcustname "|" $gizmoImageVersion "|" $robotManagerImageVersion "|" \
              $iqImageVersion  "|" $keycloakImageVersion "|" $npvImageVersion "|" \
              $elasticSearchVersion "|" $getcustsize "|" $getcusttenant "|" $getcustdeploygroup
              echo "##vso[task.setvariable variable=custNamespace;]$getcustname"
            #   replacestring='name: $getcustname'
            # yq -i '.metadata.name |= $getcustname' templates/tenants/deployments/nbsampleapp.yaml
            # yq -r .test.database templates/tenants/deployments/nbsampleapp.yaml
            yq '.metadata.name = echo $getcustname' templates/tenants/deployments/nbsampleapp.yaml
  done 