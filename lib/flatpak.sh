install_flatpaks() {
    echo '--- Installing flatpaks ---'
    while read -r fp; do
        flatpak install $fp
    done < "$WORKDIR"/flatpaks.txt
}
