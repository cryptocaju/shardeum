echo  -e  "\e[4;31m=====================SEJA-BENVINDO INSTALACAO SERÁ INICIADO EM BREVE============CAJUCRYPTO=====\e[0m"
sleep 5s
echo  -e  "\e[4;31m=====================INICIANDO EM 3 SEGUNDOS====================================================\e[0m"
sleep 3s

sudo apt-get install dos2unix
sudo apt-get install curl
sudo apt update
echo  -e  "\e[4;31m=====================INSTALANDO DOCKER===========================================================\e[0m"
sleep 7s
sudo apt-get install -y docker.io
docker --version

echo  -e  "\e[4;31m=====================INSTALACAO COM SUCESSO======================================================\e[0m"
