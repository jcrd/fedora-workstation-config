set_gsettings() {
    echo '--- Setting gsettings ---'
    while read -r opt; do
        gsettings set $opt
    done < "$WORKDIR"/gsettings.txt
}
