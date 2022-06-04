install_snaps() {
    echo '--- Installing snaps ---'
    while read -r snap; do
        sudo snap install $snap
    done < "$WORKDIR"/snaps.txt
}
