#!/bin/bash

#copie du répertoire dans le home
cp -r .bin $HOME
chmod +x $HOME/.bin/nychat

#Redefinition du $PATH

#Pour zsh
if [[ $SHELL == "/bin/zsh" ]]
	then
	FICHIER_CONFIG=zshrc
#Pour bash
elif [[ $SHELL == "/bin/bash" ]]
	then
	FICHIER_CONFIG=bashrc
else
	FICHIER_CONFIG=dev/null
fi

DEJA_EXPORTE=0
while read ligne
do
	if [[ $ligne == 'export PATH=$PATH:$HOME/.bin' ]]
		then
   		DEJA_EXPORTE=1
   fi
done < $HOME/.$FICHIER_CONFIG

if [ $DEJA_EXPORTE -eq 0 ]
	then
	echo '' >> $HOME/.$FICHIER_CONFIG
	echo '#configs pour NyChat' >> $HOME/.$FICHIER_CONFIG
	echo 'export PATH=$PATH:$HOME/.bin' >> $HOME/.$FICHIER_CONFIG
fi

#Fin de l'installation
echo "Installation fini ! Redemarez le terminal et lancer \"nychat\" pour commencer !"