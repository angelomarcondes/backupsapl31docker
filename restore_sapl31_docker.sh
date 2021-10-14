# Criador:Angelo Marcondes de Oliveira Neto
#         angelomarcondes@gmail.com
# Licença : GNU GPL
# Dependencias: tar, bzip2, gzip, zip, gunzip, bunzip2, unzip, unrar
#### Variaveis do usuário ###
# Informe abaixo e depois do sinal de igual, o caminho da pasta de destino do seu backup, sem a barra no final
# Exemplo /home/administrador/backup
origem=~/backupsapl31docker/restaura

# Parar o conteiner do SAPL
sudo docker stop sapl
# Apaga o bando de dados "sapl" do container postgres
sudo docker exec -it postgres psql -U sapl -d postgres -c "DROP DATABASE sapl;"
# Cria o banco de dados "sapl" vaizio, para receber os dados do backup
sudo docker exec -it postgres psql -U sapl -d postgres -c "CREATE DATABASE sapl;"
# Copia a cópia do banco de dados para dento do container
sudo docker cp $origem/saplsql.backup postgres:/tmp/saplsql.backup
# Copia a cópia da pasta media
sudo docker cp $origem/saplmedia.tar.gz sapl:/tmp/
# Restaura a cópia do banco de dados
sudo docker exec -it postgres bash -c 'pg_restore -U sapl -d sapl --verbose /tmp/saplsql.backup'
# Reinicia o container do SAPL
sudo docker start sapl
# Restaura a cópia da pasta media
sudo docker exec -it sapl bash -c 'tar -vxzf /tmp/saplmedia.tar.gz '
# Adicionar o rebuild
#sudo docker exec -it sapl bash -c 'manage.py rebuild_index' #confirmar com o yes (como passar isso pelo comando?

### FIM DA MAGIA ###
