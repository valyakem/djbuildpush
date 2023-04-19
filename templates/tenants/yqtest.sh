inputfile="templates/tenants/user.yaml"
getusers="$(yq '.user.[].name' $inputfile)"
#echo $getcustomers
for user in $getusers
  do
         var=$((var+1))

               getcustname="$(yq '.[].user.name' $inputfile)"
               getcustsize="$(yq '.[].user.surname' $inputfile)"
               getcusttenant="$(yq '.[].user.gender' $inputfile)"
               getcustdeploygroup="$(yq '.[].user.addresses.street' $inputfile)"

         echo $getcustname . $getcustsize . $getcusttenant . $getcustdeploygroup
  done