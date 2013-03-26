#
# Things to do after install ubuntu
# https://gist.github.com/armno/4036851
#
# @author: ArmNo <arm@armno.in.th>
# @created March 26, 2013
#

clear

echo "Aloha ArmNo! You re-install Ubuntu again!"
echo ""
#echo "These are things I will do for you"
#echo ""
#echo "1. Update all packages"
#echo "2. Install Git and Vim"
#echo "3. Make Vim your default editor"
#echo "4. Install zsh"
#echo "5. Install your zsh theme (wow!)"
#echo ""
echo "If you are ready, press Enter."
read e

# 0. will dump all outputs into a log file
logFile="install.log"
echo "Creating a log file $logFile ..."
if [ ! -f $logFile ]
	then
	touch $logFile
else
  echo "$logFile already exists. I will append logs to this file."
fi

# 1. Update all packages
echo "Updating your packages ..."
sudo apt-get update >> $logFile && sudo apt-get upgrade >> $logFile
echo "All packages are up-to-date. You might need to restart your computer and run this script again :P"
echo "Next step: Installing Git and Vim ..."

# 2. Install Git and Vim
echo "Installing your favorite tools: Git and Vim"
sudo apt-get install git vim >> $logFile
echo "Installed Git and Vim."

# 3. Make Vim default editor
echo "I know you hate Nano. Let's make Vim default."
echo "SELECT NUMBER 3, THEN YOUR LIFE WILL BE EASIER"
select-editor

# 4. Make and ugly Vim more beautiful
# should skip this step if there are already Lucius and .vimrc installed
luciusPath="$HOME/.vim/colors/lucius.vim"
vimRcPath="$HOME/.vimrc"

echo "Your Vim looks ugly. Here comes Lucius"
if [ -f $luciusPath ]
then
  echo "lucius.vim is already existed in your .vim directory. Skipping fetching the file ..."
else
	mkdir -p $HOME/.vim/colors/ >> $logFile
  wget -q --no-check-certificate https://raw.github.com/armno/dotfiles/master/.vim/colors/lucius.vim -O $luciusPath
	echo "lucius.vim is downloaded at $luciusPath"
fi

if [ -f $vimRcPath ]
then
  echo "Your .vimrc is already existed. Skipping fetching the file ..."
else
  wget -q --no-check-certificate https://raw.github.com/armno/dotfiles/master/.vimrc -O $vimRcPath
  #source $vimRcPath >> $logFile
fi

echo "Your Vim looks fantastic with .vimrc and Lucius theme"

# 4. Installing Zsh
echo "I will make your terminal AWESOME with Zsh."

# check if zsh is already installed
if type zsh >> $logFile
	then
	echo "Zsh is already installed on your machine. Boo!"
else
	echo "Installing oh-my-zsh ..."
	sudo apt-get install zsh >> $logFile
	wget -q --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -- | sh >> $logFile
	
# make zsh defaul shell. forget about bash
	echo "Making Zsh the default shell ..."
	chsh -s `which zsh` >> $logFile
	echo "Zsh is now your default shell ..."
fi

# 5. LAMP Stack -- install using `tasksel` for Apache2, PHP5, and MySQL
echo "Next, LAMP stack for PHP and MySQL web development. I am firing up tasksel ..."
if ! type tasksel >> $logFile
	then
	sudo apt-get install tasksel >> $logFile
fi
sudo tasksel

# 6. PhpMyAdmin for managing MySQL databases
echo "Also, you will need phpMyAdmin for managing MySQL databases ..."
sudo apt-get install phpmyadmin >> $logFile

# 7. Enable mod_rewrite and mod_ssl for Apache
echo "Enabling mod_rewrite and mod_ssl for Apache"
sudo a2enmod rewrite ssl >> $logFile

# 8. Install curl and php5-curl driver
echo "Installing cURL and cURL extension for PHP"
sudo apt-get install curl php5-curl >> $logFile

# 9. Install Sublime Text 2
echo "And your favorite editor, Sublime Text 2 ..."
sudo add-apt-repository ppa:webupd8team/sublime-text-2
echo "Added new apt repository. Installing Sublime Text 2"
sudo apt-get update >> $logFile
sudo apt-get install sublime-text >> $logFile

# 10. Ruby and friends
echo "Installing RVM ..."
echo "Warning: this can take ages. Go grab some coffee ..."
curl -sL https://get.rvm.io | bash -s stable --rails --autolibs=enabled >> $logFile

## Gems I use
echo "Installing Gems you like"
gem install sass compass jekyll rdiscount sinatra >> $logFile
echo "Installed Sass, Compass, Jekll, Rdiscount, and Sinatra Gems"

# Finish up
echo ""
echo "I think that is it for now. Go ahead and download Google Chrome https://www.google.com/intl/en/chrome/browser/ and Droid Sans Mono font https://www.google.com/intl/en/chrome/browser/"
echo ""
echo "See you soon! Bye!"

exit 0