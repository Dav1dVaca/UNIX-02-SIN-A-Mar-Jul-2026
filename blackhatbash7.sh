#!/bin/bash
grep "35.237.4.214" log.txt # search all the same ip adress in log.txt
grep "35.237.4.214\|13.66.139.0" log.txt
grep -e "35.237.4.214" -e "13.66.139.0" log.txt
ps | grep TTY
ps | grep -i tty # -i ignore
grep -v "35.237.4.214" log.txt # -v show all the lines that do not contain the ip address
grep -o "35.237.4.214" log.txt # -o only show the matched part of the line
awk '{print $1}' log.txt # print the first column of log.txt
awk '{print $1,$2,$3}' log.txt # print the three first columns of the log.txt
awk '{print $2}' log.txt # print the second column of log.txt
awk '{print $3}' log.txt # print the third column of log.txt
awk '{print $1,$NF}' log.txt # print the first and last column 
# EDIT FILE COMANDS
echo "David,18,Quito" > example_csv.txt
echo "Kevin,19,Guayaquil" >> example_csv.txt
echo "Adrian,18,Cuenca" >> example_csv.txt

awk -F',' '{print $1}' example_csv.txt # -F',' set the field separator to comma, print the first column of example_csv.txt
awk 'NR < 10' log.txt # print the first 10 lines of log.txt
grep "42.236.10.117" log.txt # search for the ip address in log.txt
awk '{print $7}' log.txt # print the seventh column of log.txt, which contains the requested URL
grep "42.236.10.117" log.txt | awk '{print $7}' # search for the ip address in log.txt and print the requested URL
sed 's/Mozilla/Godzilla/g' log.txt # replace all occurrences of "Mozilla" with "Godzilla" in log.txt
grep "Mozilla" log.txt  # search for "Mozilla" in log.txt to verify the replacement
grep "Godzilla" log.txt # search for "Mozilla" and "Godzilla" in log.txt to verify the replacement

sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt # create a new file called newlog.txt with all occurrences of "Mozilla" replaced with "Godzilla"
grep "Godzilla" newlog.txt # search for "Godzilla" in the modified file
grep "Mozilla" newlog.txt # search for "Mozilla" in the modified file

sed -i '1d' newlog.txt # delete the first line of newlog.txt, -i edit the file in place
head newlog.txt # display the first 10 lines of newlog.txt to verify the deletion of the first line

sed -i '$d' newlog.txt # delete the last line of newlog.txt, -i edit the file in place, $d delete the last line
git diff newlog.txt # show the differences between the original file and the modified file
sed 's/ //g' log.txt > newlog1.txt # remove all spaces from log.txt and save the result to newlog1.txt
sed '8,10d' newlog1.txt # delete lines 8 to 10 from newlog1.txt, 8,10d delete lines 8 to 10
sed -n '10,15 p' log.txt    # print lines 10 to 15 from log.txt, -n suppress automatic printing, 10,15 p print lines 10 to 15

sleep 300 & # run the sleep command in the background for 300 seconds
jobs 
fg %1