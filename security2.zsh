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
# create an achive inside the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt
# the group now is "desarrolladores"
mkdir -p ~/proyecto_dev/src # create a directory
ls -la ~/
# proyecto_dev/ tiene grupo'desarrolladores'
# exit to the subshell of newgrp
exit
#Verify we come back to main group
id -gn
echo "Grupo restaurado: $(id- gn)"
# compare the both achives
ls -la ~/antes_de_newgrp.txt ~/ dentro_de_newgrp.txt
#create a group with password
groupadd grupo_restringido
gpasswd grupo_restringido # the system will ask a password for the group
# a user that is not on the group, can join temporaly if knows the password
newgrp grupo_restringido
# the system ask the password of the group
# if the password is rigth, it join temporaly
id -gn
exit # when exit, lose the temporaly membership