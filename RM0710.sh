echo "Votre Mot De Passe Vous Est Demandé Pour Des Raisons De Mise à Jour"
echo "Pour Plus De Détails, Référez-vous Au GitHub"
F=0
sudo snap install youtube-dl
youtube-dl -U
cd ~/Musique
echo "1.Convertisseur; 2.YouTube-Download"
read O
if [ $O -eq 1 ]
then
    echo "fichier source:"
    read A
fi
if [ $O -eq 1 ]
then
    echo "Extension Source :"
    read E
fi
if [ $O -eq 1 ]
then
    echo "Extension Cible :"
    read C
fi
if [ $O -eq 1 ]
then
    ffmpeg -i "$A.$E" -acodec copy -vcodec copy "$A.$C"
fi
if [ $O -eq 2 ]
then
    cd ~/Musique
fi
if [ $O -eq 2 ]
then
    echo "Télécharger Depuis YouTube? (Oui:1 Non:2):"
    read yt
    if [ $yt -eq 1 ]
    then
        echo "https://www.youtube.com/watch?v="
        read lnk
    fi
    if [ $yt -eq 2 ]
    then
        echo "https://www."
        read lnk
    fi
    echo "Enregistrer en mp3? (Oui:1, Non:2):"
    read M
    if [ $M -eq 1 ]
    then
        if [ $yt -eq 1 ]
        then
            youtube-dl -x --audio-format mp3 https://www.youtube.com/watch?v=$lnk
        fi
        if [ $yt -eq 2 ]
        then
            youtube-dl -x --audio-format mp3 https://www.$lnk
        fi
    fi
    if [ $M -eq 2 ]
    then
        echo "Format? (1:Audio, 2:Vidéo):"
        read F
    fi
        if [ $F -eq 1 ]
        then
            echo "Format Audio (opus, mp3, aac...):"
            read A
            youtube-dl -x --audio-format $A https://www.youtube.com/watch?v=$lnk
        fi
        if [ $F -eq 2 ]
        then
            cd ~/Vidéos
            echo "Format Vidéo (mp4, webm...):"
            read V
            youtube-dl -f $V https://www.youtube.com/watch?v=$lnk
            if [ $yt -eq 2 ]
            then
                youtube-dl -f $V https://www.$lnk
            fi
        fi
    if [ $M -eq 1 ]
    then
        echo "Fichier Enregistré Dans Le Dossier Musique"
    fi
    if [ $F -eq 1 ]
    then
        echo "Fichier Enregistré Dans Le Dossier Musique"
    fi
    if [ $F -eq 2 ]
    then
        echo "Fichier Enregistré Dans Le Dossier Vidéo"
    fi
    echo "appuyez sur entrée pour terminer le programme"
    read Z
fi
