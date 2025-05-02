[doc('Rebuild the NixOS configuration')]
rebuild: cp
    sudo nixos-rebuild switch --flake /etc/nixos

[doc('Update the NixOS configuration')]
update:
    sudo nix flake update
    just rebuild

[doc('Alias to `rebuild`, done so rebuilding can be easily done through Zed keybindings')]
run: rebuild

[doc('Copy the NixOS configuration to the system NixOS configuration path')]
cp:
    sudo cp -r * /etc/nixos

[doc('Repartition according to the config in `host/disk-config.nix` and install the NixOS configuration')]
wipe-and-install:
    # Partition disk using disko
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode zap_create_mount ./host/disk-config.nix || exit

    # Generate hardware config in mnt and move configs
    sudo nixos-generate-config --no-filesystems --root /mnt || exit
    sudo mv ./* /mnt/etc/nixos/

    cd /mnt/etc/nixos/ || exit
    sudo mv ./hardware-config.nix ./host

    # Start NixOS install
    sudo nixos-install --flake ./#envy && echo "Install finished, reboot to complete"
