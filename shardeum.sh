echo  -e  "\e[4;31m=====================SEJA-BENVINDO INSTALACAO SERÁ INICIADO EM BREVE============CAJUCRYPTO=====\e[0m"
sleep 5
echo  -e  "\e[4;31m=====================INICIANDO EM 3 SEGUNDOS====================================================\e[0m"
sleep 3

sudo apt-get install curl
sudo apt update
echo  -e  "\e[4;31m=====================INSTALANDO DOCKER===========================================================\e[0m"
sleep 7
sudo apt-get install -y docker.io
docker --version

echo  -e  "\e[4;31m=====================INSTALACAO COM SUCESSO======================================================\e[0m"
