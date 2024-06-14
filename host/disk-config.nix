{ disks ? [ "/dev/nvme0n1" ], ... }:

{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = builtins.elemAt disks 0;
        
        content = {
          type = "gpt";
          partitions = {
            esp = {
              name = "ESP";
              type = "EF00";
              size = "512M";
              priority = 1;
              
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "defaults" ];
              };
            };
            
            luks = {
              name = "luks";
              size = "100%";
              content = {
                type = "luks";
                name = "crypted";
                
                content = {
                  type = "btrfs";
                  subvolumes = {
                    "/root" = {
                      mountpoint = "/";
                    };
                    
                    "/home" = {
                      mountpoint = "/home";
                      mountOptions = [ "compress=zstd" ];
                    };
                    
                    "/nix" = {
                      mountpoint = "/nix";
                      mountOptions = [ "compress=zstd" "noatime" ];
                    };
                    
                    "/swap" = {
                      mountpoint = "/.swapvol";
                      mountOptions = [ "noatime" ];
                      swap.swapfile.size = "8G";
                    };
                  };
                };
              };
            };
          };
        };
      };
    };
  };
}

