#!/bin/bash
# Ce script parcourt les fichiers .mp3 dont le nom commence par 4 chiffres suivis d’un tiret,
# et renomme le fichier en gardant uniquement les 4 chiffres sans le premier caractère.

for file in *.mp3; do
  # Vérifie si le nom correspond au pattern : 4 chiffres, un tiret, puis le reste et .mp3
  if [[ $file =~ ^([0-9]{4})-.*\.mp3$ ]]; then
    # Extraction des 4 chiffres
    prefix="${BASH_REMATCH[1]}"
    # Supprime le premier caractère du préfixe
    newprefix="${prefix:1}"
    # Construit le nouveau nom de fichier
    newname="${newprefix}.mp3"
    
    echo "Renommage de '$file' en '$newname'"
    mv -- "$file" "$newname"
  fi
done