# test for pip3
if test ! $(which pip3); then
  echo "Installing pip3"
  curl -O https://bootstrap.pypa.io/get-pip.py
  python3 get-pip.py --user
fi

# Installing aws-cli
pip3 install awscli --upgrade --user

echo "Confirm AWS is installed correctly"
aws --version

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap aws/tap
brew install s3cmd
brew install aws-sam-cli
echo "Confirm SAM and s3cmd installed correctly"
sam --version
s3cmd --version

brew cask nosql-workbench-for-amazon-dynamodb

brew tap TylerBrock/saw # CW log tailing tool
brew install saw

pip3 install boto3
pip3 install botostubs
pip3 install pyyaml
