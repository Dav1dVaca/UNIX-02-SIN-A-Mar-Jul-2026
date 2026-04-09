mkdir proyecto # create a directory "proyecto"
ls # list the directories 
cd proyect/ # use a alternative route to move
cd .. # move to the principal directorie
cd /workspaces/UNIX-02-SIN-A-Mar-Jul-2026/proyecto # use a absolute route to move
pwd                         # print working directory
cd                          # go to the home directory
cd /home/codespace          # go to the home directory
cd ~                        # go to the home directory
cd $HOME                    # go to the home directory
echo $BASH                  # print bash variable
echo $PATH                  # print the contents of the environment variable to the screen
cd /usr/local               # move from your current folder to the system folder called /usr/local
ls -lai                     # List all files (including hidden) in long format with inode numbers
ls -l -a -i                 # Exactly the same as above; flags can be written individually
man ls                      # Open the manual page to see every possible option for the ls command
ls --all                    # Show all files, including hidden ones starting with a dot (.)
ls -a                       # The short version of --all; shows hidden files in a simple list
.                           # actual directory
..                          # father directory
stat .                      # TECHNICAL REPORT: DIRECTORY INFORMATION
File: "."                   # The current directory you are in
Size: 4096                  # Size in bytes of the directory's metadata
Blocks: 8                   # Number of 512-byte blocks used on disk
IO Block: 4096              # Optimal transfer size for operations
Type: directory             # Confirms this object is a folder
Device: 7,4                 # Disk partition/device identifier
Inode: 1573107              # Unique "ID number" of this folder in the system
Links: 2                    # Number of directory entries pointing here
Access: (0777/drwxrwxrwx)   # Permissions: Full access (Read/Write/Execute) for ALL
Uid: (1000/codespace)       # Owner: User "codespace" (ID 1000)
Gid: (1000/codespace)       # Group: Group "codespace" (ID 1000)
Access: 2026-04-09 ...      # Last time the folder was opened or read
Modify: 2026-04-09 ...      # Last time a file inside was created or deleted
Change: 2026-04-09 ...      # Last time permissions or metadata were updated
Birth:  2026-04-09 ...      # Exact date and time the folder was created 
pwd                         # Print Working Directory: Shows your current full path
whoami                      # Displays the username of the current active user
ls -lt                      # List files sorted by Time: Newest files appear at the top
ls /etc | tail -20          # Lists the /etc folder, but only shows the last 20 lines