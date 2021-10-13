# Scripts para backup e restore do SAPL 3.1 instalado sobre container docker
## Descrição do Projeto
O objetivo deste projeto é oferecer scripts para o backup e a restauração dos dados do SAPL 3.1, instalado sobre conteiner docker. E possibilitar o estimulo da geração frequente de backups como forma de preservar os dados ao longo do tempo.

### Features
- [x] Script de backup
- [ ] Agendamento do script 
- [ ] Script de restore
- [ ] Teste de backup
### Pré-requisitos
* Tenha o git instalado;
* Antes de rodar o script, edite o mesmo e informe a variavel pasta;
* Tenha certeza que o usuário tenha permissão de escrita na pasta;

### Rodando o script do backup
Clone este respositório, digitando o comando no terminal:
```bash
git clone https://github.com/angelomarcondes/backupsapl31docker
```
Entre na pasta, digitando o comando no terminal:
``` bash
cd saplbackup31docker
```
Utilizando seu editor de textos favorito, abra o script e edite a variável 
pasta informando o local onde serão armazenados os arquivos de backup. Como por exemplo:
``` bash 
pasta=/home/usuario/backupsapl31
```

```bash
# Dê permissão de execução ao script (faça apenas uma vez).
$ sudo chmod +x backup_sapl31_docker.sh
```
```bash
# Execute o script com o comando abaixo, sempre que quiser gerar um backup novo.
$ sudo sh backup_sapl31_docker.sh
```
### Contribuições
Este script foi possível graças a:
* discussão da lista gitec postada em (https://colab.interlegis.leg.br/archives/thread/gitec/como-fazer-backup-sapl-31-docker)
* Aos esclarecedores vídeos do desenvolvedor [Leandro Jataí](https://github.com/LeandroJatai), postados no canal do [Youtube do Leandro Jataí](https://www.youtube.com/channel/UCoB82LbfGCMrC3Q68XkJY_A)
* As respostas precisas do desenvolvedor [Edward Oliveira](https://github.com/edwardoliveira)
