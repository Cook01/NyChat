#connection au serveur
xterm -hold -e "tail -f $DIR_SERVEUR/chat" &

#Annonce de connexion
echo "********************* $PSEUDO is online  *********************" >> $DIR_SERVEUR/chat

#Lancement du script d'ecriture
xterm -hold -e "$HOME/.bin/saisie.sh $PSEUDO $DIR_SERVEUR" &


#Attente fermeture manuel d'un des terminaux
while [ $(ps ax | grep "xterm" | wc -l) -ge 3 ]
do
	echo $(ps ax ax | grep "xterm" | wc -l)
	sleep 0.002
done 	

echo "sortie de boucle"

if [ $(ps ax ax | grep "xterm" | wc -l) -lt 3 ]
	then

	#Fermer le deuxieme terminal
	tmp=$(ps ax ax | grep "xterm" | cut -f1 -d" ")
	echo -e $(ps ax ax | grep "xterm")
	echo -e "lol"$tmp"lol"


	#if [[ $(echo $tmp | cut -d" " -f1) != "^[0-9]+" ]]
	#	then
	#	echo -e "changement de tmp"
	#	tmp=$(ps ax | grep "xterm" | cut -d" " -f2)
	#	echo -e $tmp
	#fi

	kill -9 $(echo $tmp |cut -d" " -f1)

	#Annoce de deconnexion
	echo "xxxxxxxxxxxxxxxxxxxxx $PSEUDO is offline xxxxxxxxxxxxxxxxxxxxx" >> $DIR_SERVEUR/chat

	#Supprimer les fichiers temps
	rm -fr $HOME/.bin/saisie.sh

	#Fermeture du serveur (si local)
	if [ $DIR_SERVEUR == "/home/$(whoami)/.chat" ]
		then
		rm -fr /home/$(whoami)/.chat/
		chmod g-x  /home/$(whoami)
		chmod o-x  /home/$(whoami)
	fi
fi