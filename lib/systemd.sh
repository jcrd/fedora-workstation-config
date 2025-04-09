install_user_units() {
    [ -d "$WORKDIR"/units ] || return

    echo '--- Installing user units ---'
    for unit in units/*; do
        cp -p "$unit" ~/.config/systemd/user
    done
}

enable_system_units() {
    [ -e "$WORKDIR"/system_units.txt ] || return

    echo '--- Enabling systemd system units ---'
    while read -r unit; do
        sudo systemctl enable --now "$unit"
    done < "$WORKDIR"/system_units.txt
}

enable_user_units() {
    [ -e "$WORKDIR"/user_units.txt ] || return

    echo '--- Enabling systemd user units ---'
    while read -r unit; do
        systemctl --user enable --now "$unit"
    done < "$WORKDIR"/user_units.txt
}

enable_units() {
    enable_system_units
    enable_user_units
}
