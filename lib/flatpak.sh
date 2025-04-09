install_flatpaks() {
    [ -e "$WORKDIR"/flatpaks.txt ] || return

    echo '--- Installing flatpaks ---'
    while read -r fp; do
        flatpak install -u flathub -y $fp
    done < "$WORKDIR"/flatpaks.txt
}
