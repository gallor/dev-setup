#!/usr/bin/env bash
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(nvm current) = 'v12.16.3'; then
  echo 'Please run web.sh and install node 12.16'
  exit 1
fi

# DevOps
npm i -g dockerfile-language-server-nodejs
npm i -g bash-language-server
VERSION=$(curl -s  https://api.github.com/repos/hashicorp/terraform-ls/releases/latest | grep -oE 'tag_name[^,]*' | cut -d'v' -f 2 | cut -d'"' -f 1)
LOCATION=$(awk '{print "https://github.com/hashicorp/terraform-ls/releases/download/" $VERSION "/terraform-ls_" $1 "_darwin_amd64.zip"}')
FILENAME=$(awk '{print "~/Desktop/terraform-ls_" $VERSION "_darwin_amd64.zip" }')
  
curl -Lo $FILENAME $LOCATION
unzip $FILENAME
mv terraform-ls /usr/local/bin/terraform-ls
rm -rf $FILENAME
