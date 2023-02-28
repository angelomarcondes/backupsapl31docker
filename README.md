# Scripts para backup e restore do SAPL 3.1 instalado sobre container docker
## Descrição do Projeto
O objetivo deste projeto é oferecer scripts para o backup e a restauração dos dados do SAPL 3.1, instalado sobre conteiner docker. E possibilitar o estimulo da geração frequente de backups como forma de preservar os dados ao longo do tempo.

### Features
- [x] Script de backup
- [ ] Agendamento do script 
- [ ] Script de restore
- [ ] Teste de backup
### Pré-requisitos
* Git instalado;
* SAPL 3.1 já instalado e em execução;
* Antes de rodar o script, edite o mesmo e informe a variavel pasta;
* Tenha certeza que o usuário tenha permissão de escrita na pasta;

### Rodando o script do backup
Clone este respositório na sua pasta de usuário (/home/SeuUsuário), digitando o comando no terminal:
```bash
git clone https://github.com/angelomarcondes/backupsapl31docker
```

Dê permissão de execução ao script (faça apenas uma vez).

```bash
sudo chmod +x ~/backupsapl31docker/backup_sapl31_docker.sh
```

Execute o script com o comando abaixo, sempre que quiser gerar um backup novo.

```bash
sh ~/backupsapl31docker/backup_sapl31_docker.sh
```

### Rodando o script de restauração

Copie os arquivos de banco de dados (saplsql.backup) e arquivos (saplmedia.tar.gz) que serão restaurados para a pasta ~/backupsapl31docker/restaura/, utilizando comando abaixo:
```
cp saplsql.backup saplmedia.tar.gz ~/backupsapl31docker/restaura/
```
Execute o script com o comando abaixo, sempre que quiser restaurar um backup.

```bash
./backupsapl31docker/restore_sapl31_docker.sh
```




### Contribuições
Este script foi possível graças a:
* discussão da lista gitec postada em (https://colab.interlegis.leg.br/archives/thread/gitec/como-fazer-backup-sapl-31-docker)
* Aos esclarecedores vídeos do desenvolvedor [Leandro Jataí](https://github.com/LeandroJatai), postados no canal do [Youtube do Leandro Jataí](https://www.youtube.com/channel/UCoB82LbfGCMrC3Q68XkJY_A)
* As respostas precisas do desenvolvedor [Edward Oliveira](https://github.com/edwardoliveira)
