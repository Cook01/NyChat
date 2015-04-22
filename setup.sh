#!/bin/bash

#copie du répertoire dans le home
cp -r .bin $HOME
chmod +x $HOME/.bin/nychat

#Redefinition du $PATH

#Pour zsh
if [[ $SHELL == "/bin/zsh" ]]
	then

	DEJA_EXPORTE=0
	while read ligne
	do
		if [[ $ligne == 'export PATH=$PATH:$HOME/.bin' ]]
			then
	   		DEJA_EXPORTE=1
	   fi
	done < $HOME/.zshrc

	if [ $DEJA_EXPORTE -eq 0 ]
		then
		echo '' >> $HOME/.zshrc
		echo '#Changement du $PATH pour NyChat' >> $HOME/.zshrc
		echo 'export PATH=$PATH:$HOME/.bin' >> $HOME/.zshrc
	fi
fi

#Pour bash
if [[ $SHELL == "/bin/bash" ]]
	then

	DEJA_EXPORTE=0
	while read ligne
	do
		if [[ $ligne == 'export PATH=$PATH:$HOME/.bin' ]]
			then
	   		DEJA_EXPORTE=1
	   fi
	done < $HOME/.bashrc

	if [ $DEJA_EXPORTE -eq 0 ]
		then
		echo '' >> $HOME/.bashrc
		echo '#Changement du $PATH pour NyChat' >> $HOME/.bashrc
		echo 'export PATH=$PATH:$HOME/.bin' >> $HOME/.bashrc
	fi
fi

#Fin de l'installation
echo "Installation fini ! Redemarez le terminal et lancer \"nychat\" pour commencer !"