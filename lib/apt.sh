apt() {
    sudo apt-get -q -y $@
}

enable_ppas() {
    [ -e "$WORKDIR"/ppas.txt ] || return

    echo '--- Enabling ppas ---'
    while read -r ppa; do
        sudo add-apt-repository ppa:"$ppa"
    done < "$WORKDIR"/ppas.txt
}

install_packages() {
    [ -e "$WORKDIR"/packages.txt ] || return

    echo '--- Installing packages ---'
    apt install $(< "$WORKDIR"/packages.txt)
}
