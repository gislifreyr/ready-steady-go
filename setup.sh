#!/bin/bash
#Author: gislifreyr
#Inspiration: samueljon's vim-config-and-plugin-sync repo on GitHub
#Description: Sets up .vim/, .vimrc, .bashrc, .screenrc, .irssi/ and .gitconfig and backups previous files if they exist.

##################################

DATE=`date +%d%m%y-%H:%M`

function clone_repo() {
	git clone https://gislifreyr@github.com/gislifreyr/ready-steady-go.git ~/.setup
}

function create_vimrc() {
	ln -s ~/.setup/vimrc ~/.vimrc
}

function create_bashrc() {
	ln -s ~/.setup/bashrc ~/.bashrc
}

function create_screenrc() {
	ln -s ~/.setup/screenrc ~/.screenrc
}

function create_gitconfig() {
	ln -s ~/.setup/gitconfig ~/.gitconfig
}

function create_irssidir() {
	ln -s ~/.setup/irssi ~/.irssi

function create_vimdir() {
	ln -s ~/.setup/vim ~/.vim
}

function handle_submodules () {
	cd ~/.setup
	git submodule init
	git submodule update
}

echo "###################################################################"
echo "## Are you sure you wanna do this? It could break your system... ##"
echo "###################################################################"

read -sn 1 -p "Press y/Y to break your system..."

if [ "$REPLY" == "y" || "$REPLY" == "Y" ];

then

	if [ -d ~/.setup ];
	then
		echo "~/.setup file already exists! Sort it out..."
		exit
	else
		clone_repo
		echo "clone_repo()				[done]"
	fi

	if [ -f ~/.vimrc ];
	then
		mv ~/.vimrc ~/.vimrc.$DATE
		create_vimrc
		echo "create_vimrc()			[done]"
	else
		create_vimrc
		echo "create_vimrc() 			[done]"
	fi

	if [ -f ~/.bashrc ];
	then
		mv ~/.bashrc ~/.bashrc.$DATE
		create_bashrc
		echo "create_bashrc()			[done]"
	else
		create_bashrc
		echo "create_bashrc()			[done]"
	fi

	if [ -f ~/.screenrc ];
	then
		mv ~/.screenrc ~/.screenrc.$DATE
		create_screenrc
		echo "create_screenrc()			[done]"
	else
		create_screenrc
		echo "create_screenrc()			[done]"
	fi

	if [ -f ~/.gitconfig ];
	then
		mv ~/.gitconfig ~/.gitconfig.$DATE
		create_gitconfig
		echo "create_gitconfig()		[done]"
		echo "remember to edit config	......"
	else
		create_gitconfig
		echo "create_gitconfig() 		[done]"
		echo "remember to edit config	......"
	fi

	if [ -d ~/.irssi ];
	then
		mv ~/.irssi ~/.irssi.$DATE
		create_irssidir
		echo "create_irssidir() 		[done]"
		echo "remember to edit config	......"
	else
		create_irssidir
		echo "create_irssidir() 		[done]"
		echo "remember to edit config	......"
	fi

	if [ -d ~/.vim ];
	then
		mv ~/.vim ~/.vim.$DATE
		create_vimdir
		echo "create_vimdir()			[done]"
		handle_submodules
		echo "handle_submodules()		[done]"
	else
		create_vimdir
		echo "create_vimdir()			[done]"
		handle_submodules
		echo "handle_submodules()		[done]"
	fi

	echo "###############################################################"
	echo "## Everything went better than expected. Happy hacking!      ##"
	echo "###############################################################"

else

	echo "###############################################################"
	echo "## Son, I am disappoint!                                     ##"
	echo "## Y U NO TRUST ME?                                          ##"
	echo "## Back in my day men were men and wrote their own scripts!  ##"
	echo "###############################################################"

fi
