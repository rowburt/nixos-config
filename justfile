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
