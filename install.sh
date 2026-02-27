sudo apt install -y curl wget unzip ca-certificates git gnupg zip nodejs
sudo apt upgate
cd /var/www/pterodactyl
wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | grep 'release.zip' | cut -d '"' -f 4)" -O "$PTERODACTYL_DIRECTORY/release.zip"
unzip -o release.zip
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
sudo apt update
npm i -g yarn
yarn install
touch /var/www/pterodactyl/.blueprintrc
echo \
'WEBUSER="www-data";
OWNERSHIP="www-data:www-data";
USERSHELL="/bin/bash";' > $PTERODACTYL_DIRECTORY/.blueprintrc
chmod +x $PTERODACTYL_DIRECTORY/blueprint.sh
bash $PTERODACTYL_DIRECTORY/blueprint.sh
clear && echo ✅ Blueprint Installation Finished!
