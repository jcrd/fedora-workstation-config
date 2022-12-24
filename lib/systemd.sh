enable_system_units() {
    echo '--- Enabling systemd system units ---'
    while read -r unit; do
        sudo systemctl enable --now "$unit"
    done < "$WORKDIR"/system_units.txt
}

enable_user_units() {
    echo '--- Enabling systemd user units ---'
    while read -r unit; do
        systemctl --user enable --now "$unit"
    done < "$WORKDIR"/user_units.txt
}

enable_units() {
    [ -e "$WORKDIR"/system_units.txt ] && enable_system_units
    [ -e "$WORKDIR"/user_units.txt ] && enable_user_units
}
