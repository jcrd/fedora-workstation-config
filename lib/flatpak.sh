install_flatpaks() {
    echo '--- Installing flatpaks ---'
    while read -r fp; do
        flatpak install flathub -y $fp
    done < "$WORKDIR"/flatpaks.txt
}
