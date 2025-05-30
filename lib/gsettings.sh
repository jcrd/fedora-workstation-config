set_gsettings() {
    [ -e "$WORKDIR"/gsettings.txt ] || return

    echo '--- Setting gsettings ---'
    while read -r s k v; do
        gsettings set $s $k "$v"
    done < "$WORKDIR"/gsettings.txt
}
