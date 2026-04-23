ls -l -a -h # It is the "complete package" for inspecting a directory
ls -lah # It is the "complete package" for inspecting a directory
mkdir -- -rf # Create the "-rf" directory
rmdir -- -rf # Remove the "-rf" directory
--depth <depth>
#Create a shallow clone with a history truncated to the specified number of commits. Implies
#--single-branch unless --no-single-branch is given to fetch the histories near the tips of all branches.
#If you want to clone submodules shallowly, also pass --shallow-submodules.
# n to go up
# N to go down
touch script.sh # create script.sh
chmod +x script.sh # everyone can execute
chmod u+x script.sh # only owner can execute
touch secreto.txt # create secreto.txt
chmod o-r secreto.txt # hide reads to "others"
touch privado # create privado 
chmod u+rw,go-rwx privado # owner read/write, no one can do anything
ls -l # comprobe the permissions
sudo echo "hola" > /etc/archivo_protegido # It doesn't work correctly because sudo doesn't apply to redirection (>)
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null # Write to a protected file using sudo correctly
echo "hola" | sudo tee /etc/archivo_protegido # write "hola" on a protected achive using admin permission

#CLASE JUEVES 04 ABRIL 2026
sudo sh -c 'echo "chao" >> /etc/archivo_protegido' # add "chao" on the end of a protected file with admin permissions
cat /etc/archivo_protegido # shows the content of "archivo_protegido" 
sudo -i # start a interactive seccion on a root user
exit # logout the root user
sudo su - # login on a complete root user 
sudo su # change to root user
echo "$HOME" # expand the variable
echo '$HOME' # print everything in the ''