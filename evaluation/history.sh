#problema 1 
1  git remote -v
    2  git fetch upstream
    3  git checkout -b eval_p2_1_g2 upstream/eval_p2_1_g2
    4  git push -u origin eval_p2_1_g2
    5  sudo apt update
    6  sudo apt install git-lfs
    7  git lfs install
    8  git push -u origin eval_p2_1_g2
    9  mv docs registros
   10  pwd
   11  cd kepler/
   12  cd /kepler
   13  cd /evaluation/kepler
   14  cd /evaluation/kepler/
   15  cd evaluation/
   16  cd kepler/
   17  ls -la
   18  mv docs registros
   19  mkdir plantillas
   20  ls -la
   21  history

#PROBLEMA 2
 mv sensores.log registros/
   23  mv ajustes.old ajustes.conf
   24  ls
   25  ls registros/
#PROBLEMA 3
 chmod 600 registros/sensores.log
   28  ls -l registros/sensores.log
#PROBLEMA 4
 chmod u+x runner.sh
   31  chmod o-w ajustes.conf
   32  ls -l runner.sh
   33  ls -l ajustes.conf
#PROBLEMA 5
35  chmod u+s runner.sh
   36  ls -l runner.sh
#PROBLEMA 6