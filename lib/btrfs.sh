is_subvol() {
    sudo btrfs subvolume show "$1" > /dev/null
}

create_subvol() {
    if [ -e "$1" ]; then
        if is_subvol "$1"; then
            echo "*** subvolume $1 already exists"
            return
        fi
        mv "$1" "$1".tmp
    fi

    sudo btrfs subvolume create "$1"

    if [ -e "$1".tmp ]; then
        mv "$1".tmp/* "$1"
        rmdir "$1".tmp
    fi
}

create_subvols() {
    echo '--- Creating btrfs subvolumes ---'
    while read -r subvol; do
        create_subvol "$1/$subvol"
    done < "$WORKDIR"/subvols.txt
}
