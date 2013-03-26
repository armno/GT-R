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

# 1. Update all packages
echo ""
echo "Updating your packages ..."
sudo apt-get update && sudo apt-get upgrade
echo ""
echo "All packages are up-to-date. You might need to restart your computer and run this script again :P"
echo "Next step: Installing Git and Vim ..."
echo "OK:"
read e

# 2. Install Git and Vim
echo ""
echo "Installing your favorite tools: Git and Vim"
sudo apt-get install git vim
echo ""
echo "Installed Git and Vim."
echo "Press Enter to proceed ..."
read e

# 3. Make Vim default editor
echo ""
echo "I know you hate Nano. Let's make Vim default."
select-editor
echo ""
echo "Next step:"
read e

# 4. Make and ugly Vim more beautiful
# should skip this step if there are already Lucius and .vimrc installed
luciusPath="~/.vim/colors/lucius.vim"
vimRcPath="~/.vimrc"

echo "Your Vim looks ugly. Here comes Lucius"
if [ -f $luciusPath ]
then
  echo "lucius.vim is already existed in your .vim directory. Skipping fetching the file ..."
else
	mkdir -p ~/.vim/colors
  wget --no-check-certificate https://raw.github.com/armno/dotfiles/master/.vim/colors/lucius.vim -O $luciusPath
	echo "lucius.vim is downloaded at $luciusPath"
fi

echo ""
if [ -f $vimPath ]
then
  echo "Your .vimrc is already existed. Skipping fetching the file ..."
else
  wget --no-check-certificate https://raw.github.com/armno/dotfiles/master/.vimrc -O ~/.vimrc
  source ~/.vimrc
fi

echo ""
echo "Your Vim looks fantastic with .vimrc and Lucius theme"
echo "Next?"
read e

# 4. Installing Zsh
echo ""
echo "I will make your terminal AWESOME with Zsh."

# check if zsh is already installed
if type zsh >/dev/null 2>&1
	then
	echo "Zsh is already installed on your machine. Boo!"
else
	echo ""
	echo "Installing oh-my-zsh ..."
	echo ""
	sudo apt-get install zsh
	wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -- | sh
	
# make zsh defaul shell. forget about bash
	echo ""
	echo "Making Zsh the default shell ..."
	echo ""
	chsh -s `which zsh`
	echo ""
	echo "Zsh is now your default shell ..."
	echo ""
fi

exit 0