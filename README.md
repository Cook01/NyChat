NyChat
==
Un script de chat inter-sessions sur un même serveur (sans reseau)



###Installation :
####Installation automatique
<code>./setup.sh</code> Dans le dossier du projet pour installer le script

#####Shells supportés par le setup.sh :
  - Bash
  - Zsh

####Installation manuelle :
  - Copier le dossier .bin dans le home
  - Metre les droits en execution pour le fichier nychat dans le dossier .bin : <code>chmod +x ~/.bin/nychat</code>
  - Ajouter la ligne suivante dans le fichier de config de votre shell (.bashrc pour bash) :
      - <code>export PATH=$PATH:$HOME/.bin</code>

###Utilisation :
<code>nychat</code> pour se connecter a un salon (en creer un sur votre session si aucun salons trouvé)

<code>nychat true</code> pour creer un salon sur votre session même si un salon existe déjà ailleur

#### Problemes connus :

#### Ameliorations possibles :
- Gestion des pseudos
- interface en une seul fenetre
- plus de shells supporté par le setup.sh
