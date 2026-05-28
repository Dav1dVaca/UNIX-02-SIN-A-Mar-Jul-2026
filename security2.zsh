#see the main actual group
id 
id -gn # only the name of the main group
#create an achive and see wich group inherits
touch ~/test_grupo_heredado.txt 
ls -la ~/test_grupo_heredado.txt # the group is the principal group of the user 
# see actual group
id -gn
echo "Grupo actual:$(id -gn)"
# create an achive before the newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt 
groupadd desarrolladores # create group "desarrolladores"
newgrp desarrolladores # change to group "desarrolladores"
id -gn # verify the active group change
echo "Nuevo grupo activo:$(id -gn)"
