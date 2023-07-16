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
echo -e '\e[0m'     

# Function to display success message for each command
success_message() {
  echo "==================SUCESSO APLICADO========================="
}

# Function to display report of executed commands
display_report() {
  echo "Commands executed successfully:"
  for command in "${successful_commands[@]}"; do
    echo "- $command"
  done

  echo

  echo "Commands that failed:"
  for command in "${failed_commands[@]}"; do
    echo "- $command"
  done
}

# Array to store successful commands
successful_commands=()

# Array to store failed commands
failed_commands=()

# Install curl
sudo apt-get install curl
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("sudo apt-get install curl")
else
  failed_commands+=("sudo apt-get install curl")
fi
sleep 2

# Update package list
sudo apt update
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("sudo apt update")
else
  failed_commands+=("sudo apt update")
fi
sleep 2

# Install Docker
sudo apt install docker.io
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("sudo apt install docker.io")
else
  failed_commands+=("sudo apt install docker.io")
fi
sleep 2

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("sudo curl -L \"https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose")
else
  failed_commands+=("sudo curl -L \"https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)\" -o /usr/local/bin/docker-compose")
fi
sleep 2

# Set executable permissions for Docker Compose
sudo chmod +x /usr/local/bin/docker-compose
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("sudo chmod +x /usr/local/bin/docker-compose")
else
  failed_commands+=("sudo chmod +x /usr/local/bin/docker-compose")
fi
sleep 2

# Install custom script
curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh")
else
  failed_commands+=("curl -O https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh && chmod +x installer.sh && ./installer.sh")
fi
sleep 2

# Change directory to user's home directory
cd
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("cd")
else
  failed_commands+=("cd")
fi
sleep 2

# Change directory to .shardeum
cd .shardeum
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("cd .shardeum")
else
  failed_commands+=("cd .shardeum")
fi
sleep 2

# Execute shell script
./shell.sh
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("./shell.sh")
else
  failed_commands+=("./shell.sh")
fi
sleep 2

# Start operator-cli
operator-cli gui start
if [ $? -eq 0 ]; then
  success_message
  successful_commands+=("operator-cli gui start")
else
  failed_commands+=("operator-cli gui start")
fi
sleep 2

# Display report of executed commands
display_report

 

