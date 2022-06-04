dnf() {
    sudo dnf -q -y $@
}

enable_coprs() {
    echo '--- Enabling coprs ---'
    while read -r copr; do
        dnf copr enable "$copr"
    done < "$WORKDIR"/coprs.txt
}

install_packages() {
    echo '--- Installing packages ---'
    while read -r package; do
        dnf install "$package"
    done < "$WORKDIR"/packages.txt
}
