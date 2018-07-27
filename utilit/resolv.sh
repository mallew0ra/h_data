#!/bin/bash

# it willbe subdomenbrut with tor-resolve

clear
echo '0k'
while read line
do

	echo $line
	tor-resolve $line

done<$1
