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
echo "These are things I will do for you"
echo ""
echo "1. Update all packages"
echo "2. Install Git and Vim"
echo "3. Make Vim your default editor"
echo "4. Install zsh"
echo "5. Install your zsh theme (wow!)"
echo ""
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
echo ""
echo "Updating your packages ..."
sudo apt-get update >> $logFile && sudo apt-get upgrade >> $logFile
echo ""
echo "All packages are up-to-date. You might need to restart your computer and run this script again :P"
echo "Next step: Installing Git and Vim ..."

# 2. Install Git and Vim
echo ""
echo "Installing your favorite tools: Git and Vim"
sudo apt-get install git vim >> $logFile
echo ""
echo "Installed Git and Vim."

# 3. Make Vim default editor
echo ""
echo "I know you hate Nano. Let's make Vim default."
select-editor
echo ""

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

echo ""
if [ -f $vimRcPath ]
then
  echo "Your .vimrc is already existed. Skipping fetching the file ..."
else
  wget -q --no-check-certificate https://raw.github.com/armno/dotfiles/master/.vimrc -O $vimRcPath
  source $vimRcPath >> $logFile
fi

echo ""
echo "Your Vim looks fantastic with .vimrc and Lucius theme"

# 4. Installing Zsh
echo ""
echo "I will make your terminal AWESOME with Zsh."

# check if zsh is already installed
if type zsh >> $logFile
	then
	echo "Zsh is already installed on your machine. Boo!"
else
	echo ""
	echo "Installing oh-my-zsh ..."
	echo ""
	sudo apt-get install zsh >> $logFile
	wget -q --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -- | sh >> $logFile
	
# make zsh defaul shell. forget about bash
	echo ""
	echo "Making Zsh the default shell ..."
	echo ""
	chsh -s `which zsh` >> $logFile
	echo ""
	echo "Zsh is now your default shell ..."
	echo ""
fi

exit 0