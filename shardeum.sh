echo -e '\e[40m\e[92m'                          
echo -e '                                                                                                                   '
echo -e '       /$$$$$$   /$$$$$$     /$$$$$ /$$   /$$        /$$$$$$  /$$$$$$$  /$$     /$$ /$$$$$$$  /$$$$$$$$  /$$$$$$   '
echo -e '      /$$__  $$ /$$__  $$   |__  $$| $$  | $$       /$$__  $$| $$__  $$|  $$   /$$/| $$__  $$|__  $$__/ /$$__  $$  '
echo -e '     | $$  \__/| $$  \ $$      | $$| $$  | $$      | $$  \__/| $$  \ $$ \  $$ /$$/ | $$  \ $$   | $$   | $$  \ $$  '
echo -e '     | $$      | $$$$$$$$      | $$| $$  | $$      | $$      | $$$$$$$/  \  $$$$/  | $$$$$$$/   | $$   | $$  | $$  '
echo -e '     | $$      | $$__  $$ /$$  | $$| $$  | $$      | $$      | $$__  $$   \  $$/   | $$____/    | $$   | $$  | $$  '
echo -e '     | $$    $$| $$  | $$| $$  | $$| $$  | $$      | $$    $$| $$  \ $$    | $$    | $$         | $$   | $$  | $$  '
echo -e '     |  $$$$$$/| $$  | $$|  $$$$$$/|  $$$$$$/      |  $$$$$$/| $$  | $$    | $$    | $$         | $$   |  $$$$$$/  '
echo -e '      \______/ |__/  |__/ \______/  \______/        \______/ |__/  |__/    |__/    |__/         |__/    \______/   '
echo -e '                                                                                                                   '



function verificar_comando {
    if [ $? -eq 0 ]; then
        echo "======= OK Verificado ========"
    else
        echo "=========== FALHA ========"
    fi
    sleep 4
}

sudo apt-get install curl
verificar_comando

sudo apt update
verificar_comando

sudo apt install docker.io
verificar_comando

curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
verificar_comando

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
verificar_comando

sudo chmod +x /usr/local/bin/docker-compose
verificar_comando

curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
verificar_comando

echo -e '=========== PROCURANDO DIRETORIO ====================================================================================='

diretorio_encontrado=$(find / -type d -name "shardeum" -print -quit 2>/dev/null)

if [[ -n "$diretorio_encontrado" ]]; then
    cd "$diretorio_encontrado"
    echo "Diretório 'shardeum' encontrado em: $(pwd)"
    verificar_comando
else
    echo "Diretório 'shardeum' não encontrado."
    verificar_comando
fi

cd
cd .shardeum
./shell.sh
verificar_comando

operator-cli gui start
verificar_comando

