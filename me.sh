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
editor-select
echo ""
echo "Next step: Installing Zsh"
read e

# 4. Installing Zsh
echo ""
echo "I will make your terminal AWESOME with Zsh."
sudo apt-get install zsh
echo ""
echo "Installing oh-my-zsh ..."
echo ""
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O -- | sh
echo ""
echo "Making Zsh the default shell ..."
echo ""
chsh -s `which zsh`
echo ""
echo "Zsh is now your default shell ..."
echo ""

exit 0