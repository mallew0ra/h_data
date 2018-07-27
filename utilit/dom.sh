#! /bin/bash

echo 'In File'
read fin
echo 'Out File'
read fout
touch $fout
echo 'IP out'
read fip
touch $fip
echo 'Out Dig File'
read fdig
touch $fdig
i='='
echo $i
echo ''>$fout
echo ''>$fdig
echo ''>$fip
while read line
do
	echo '======================================' >>$fout
	echo $line >>$fout
	echo ''>>$fout
	nping -c 1 $line 2>/dev/null | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | uniq >>$fout
	echo '______________________________________' >>$fout
	curl --head $line 2>/dev/null >>$fout
	echo ''>>$fout
	echo ''>>$fout
	cat $fout | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort | uniq >>$fip	
	echo '======================================' >>$fdig
	echo $line >>$fdig
	echo ''>>$fdig
	echo '______________________________________' >>$fdig
	echo ''>>$fdig
	echo ''>>$fdig
	dig $line>>$fdig
	i=$i+'='
	echo $i
done <$fin
echo ''
echo 'IPs:  '
cat $fip

echo '___END___'
