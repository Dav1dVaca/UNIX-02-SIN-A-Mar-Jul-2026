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