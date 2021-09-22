  GNU nano 4.8                                                            sapl_backup_docker.sh                                                                         #### INICIO DO SCRITP #####
#!/bin/bash
#  Script para backup das ferramentas SAAP, SAPl e  Portal Modelo
#
# Criador:Angelo Marcondes de Oliveira Neto
#         angelomarcondes@gmail.com
# Licença : GNU GPL
# Dependencias: tar, bzip2, gzip, zip, gunzip, bunzip2, unzip, unrar
##### Parametros#########
# Cria variavel datahora para registro no log
datahora = date
#Cria um nome para a pasta utilizando a data
dt=`date | cut -f-1 | sed  -e 's/ //g' | sed -e 's/://g'`
##### Variáveis #####
#Caminho da pasta principal onde será gravado o backup
destino1=/home/sapladmin/backup/$dt
#Caminho de Log
destino2=/home/sapladmin/backup

##### ROTINAS DOI BACKUP #####
#Verificando a existencia da pasta
if test -d $destino1# Extraindo cópia do banco de dados
sudo docker exec -it postgres bash -c 'pg_dump -U sapl -d sapl -Fc -v > /tmp/postgres.backup' >> $destino2/bkp.log
# Copiando extração para pasta de destino
sudo docker cp postgres:/tmp/postgres.backup $destino1 >> $destino2/bkp.log
# Extraindo cópia da pasta media
sudo docker exec -it sapl bash -c 'cd /var/interlegis/sapl && tar czvf media.tar.gz ./media && ls -lah media.tar.gz' >> $destino2/bkp.log
# Copiando extração para pasta de destino
sudo docker cp sapl:/var/interlegis/sapl/media.tar.gz $destino1 >> $destino2/bkp.log
then
   echo $destino1 DIRETORIO EXISTE !
else
   echo Criando Diretorio ...
   mkdir $destino1
fi
# Regitra o inicio do backup no log
echo "$datahora - Inicio do backup $destino1" >> $destino2/bkp.log
