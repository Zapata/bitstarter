#!/bin/bash
# Configure Ubunto to work on the Coursera Startup Course.
cd $HOME

# Base install from course:
curl https://raw.github.com/startup-class/setup/master/setup.sh | sh

#Initialize Permissions
if [ ! -e .ssh/id_rsa.pub ]; then
        ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

echo "Test Github ssh connection:"
ssh -T git@github.com

while [ $? -ne 1 ]; do
  echo "Insert following ssh key to your Github account:"
  echo "https://github.com/settings/ssh"
  cat ~/.ssh/id_rsa.pub
  read -p "Type enter when you have setup GitHub key."
  echo "Test Github ssh connection:"
  ssh -T git@github.com
done

git config --global user.name "Marco Tessari"
git config --global user.email marco.tessari@gmail.com

# Move to forked dotfiles
cd dotfiles
git remote rename origin upstream
git remote add -f origin git@github.com:Zapata/dotfiles.git
git pull origin master

# Initialise Project repository.
if [ ! -d startup-coursera ]; then
        git clone git@github.com:Zapata/startup-coursera.git
fi

# Install Heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# Initialize Heroku
heroku login
heroku keys:add

# Other cool stuff
sudo apt-get install colordiff
