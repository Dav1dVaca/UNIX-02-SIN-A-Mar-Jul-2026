ls # Displays files and directories in the current location.
LS # This command is invalid because Linux distinguishes between uppercase and lowercase.
ls Documents # Shows the files stored inside the Documents folder.
ls -l # Displays a detailed list including permissions, size, and ownership.
ls -r # Shows the files in reverse alphabetical order.
ls -lr # Combines detailed view with reverse ordering.
pwd # Shows the full path of the current working directory.
cd Documents # Moves into the Documents folder using a relative path.
cd / # Navigates directly to the system root directory.
cd /home/sysadmin # Accesses the sysadmin home using an absolute path.
cd School/Art # Moves into a nested directory structure step by step.
cd .. # Goes back to the parent directory.
cd . # Refers to the current directory without changing location.
cd ~ # Returns to the user's home directory. 
ls -l /var/log/ # Shows detailed information of files inside /var/log.
ls -lt /var/log # Sorts files by last modification time.
ls -lS /var/log # Orders files based on their size.
ls -lSr /var/log # Displays files sorted by size in ascending order.
ls -r /var/log # Lists files in reverse alphabetical order.
su - # Switches to the root account with a full login shell.
exit # Closes the current session and returns to the previous user.
sudo sl # Runs the 'sl' command with elevated privileges.
sudo -u sysadmin sl # Executes a command as the sysadmin user.
su -l # Opens a login shell for the root user.
su --login # Loads the complete root environment in a new session.
cd ~/Documents # Moves to Documents to manage file permissions.
ls -l hello.sh # Displays detailed file permissions.
chmod u+x hello.sh # Grants execution permission to the file owner.
ls -l hello.sh # Confirms the updated permissions.
./hello.sh # Runs the script in the current directory.
sudo chown root hello.sh # Changes file ownership to root.
ls -l hello.sh # Verifies the new file owner.
sudo ./hello.sh # Executes the script with root privileges.
