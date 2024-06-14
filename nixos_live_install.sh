# Partition disk using disko
sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode zap_create_mount ./host/disk-config.nix || exit

# Generate hardware config in mnt and move configs
sudo nixos-generate-config --no-filesystems --root /mnt || exit
sudo mv ./* /mnt/etc/nixos/

cd /mnt/etc/nixos/ || exit
sudo mv ./hardware-config.nix ./host

# Start NixOS install
sudo nixos-install --flake ./#envy && echo "Install finished, reboot to complete"

