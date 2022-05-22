enable_units() {
    echo '--- Enabling systemd units ---'
    while read -r unit; do
        sudo systemctl enable "$unit"
    done < "$WORKDIR"/units.txt
}
