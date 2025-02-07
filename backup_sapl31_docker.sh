# Criador:Angelo Marcondes de Oliveira Neto
#         angelomarcondes@gmail.com
# Licença : GNU GPL
# Dependencias: tar, bzip2, gzip, zip, gunzip, bunzip2, unzip, unrar
#### Variaveis do usuário ###
# Informe abaixo e depois do sinal de igual, o caminho da pasta de destino do seu backup, sem a barra no final
# Exemplo /home/administrador/backup
pasta=~/backupsapl31docker/copias

### Variáveis do script não altere ###
# Cria variavel datahora para registro do log
datahora=`date`
#Cria um nome para a pasta utilizando a data
dt=`date | cut -f-1 | sed  -e 's/ //g' | sed -e 's/://g'`
# Cria o o caminho de destino de destino de backup
destino1=$pasta/$dt

### INICO DA MAGIA ###
#Verificando a existencia da pasta de destino dos backups
if test -d $pasta
then
   echo $pasta DIRETORIO EXISTE !
else
   echo Criando Diretorio ...
   mkdir $pasta
fi


#Verificando a existencia da pasta de destino do backup
if test -d $destino1
then
   echo $destino1 DIRETORIO EXISTE !
else
   echo Criando Diretorio ...
   mkdir $destino1
fi

# Regitra o inicio do backup no log
echo "$datahora - Inicio do backup!" >> $pasta/bkp.log 2>&1
# Gera cópia do banco de dados
docker exec postgres bash -c 'pg_dump -U sapl -d sapl -Fc -v > /tmp/saplsql.backup' >> $pasta/bkp.log 2>&1
# Copia o arquivo para pasta de destino
docker cp postgres:/tmp/saplsql.backup $destino1 >> $pasta/bkp.log 2>&1
# Apaga o arquivo de copia do banco no container
docker exec postgres bash -c 'rm /tmp/saplsql.backup' >> $pasta/bkp.log 2>&1
# Gera cópia da pasta media
docker exec sapl bash -c 'cd /var/interlegis/sapl && tar -czvf saplmedia.tar.gz /var/interlegis/sapl/media && ls -lah saplmedia.tar.gz' >> $pasta/bkp.log 2>&1
# Copia arquivo para pasta de destino
docker cp sapl:/var/interlegis/sapl/saplmedia.tar.gz $destino1 >> $pasta/bkp.log 2>&1
# Apaga o arquivo no container 
docker exec sapl bash -c 'rm /var/interlegis/sapl/saplmedia.tar.gz' >> $pasta/bkp.log 2>&1
# Registra o fim do backup no log
sudo echo "$datahora - Fim do backup!" >> $pasta/bkp.log >> $pasta/bkp.log 2>&1
