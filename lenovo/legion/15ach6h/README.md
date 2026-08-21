## Introduction
Due to the introduction of Dual-Direct-GFX-Mode feature, you may toggle Dual-Direct-GFX-Mode frequently, so for the default settings of this laptop, we use "specialization" feature of Nix so that you can easily select the required graphics card driver in the startup menu.  
**But It will slow down NixOS evaluation by factor 2 and increase memory usage.**  
So if you don't need specialization feature, you can just use hybrid only configuration or nvidia only (Dual-Direct-GFX-Mode only) configuration

## PCI Bus ID Configuration for AMD GPU (amdgpuBusId)

Depending on the number of SSD drives installed in the system, the PCI Bus ID of the integrated AMD GPU may change between `PCI:5:0:0` and `PCI:6:0:0`.

To avoid silent runtime failures, we do not set a default value. You must explicitly configure the `hardware.nvidia.prime.amdgpuBusId` option in your configuration (e.g. `PCI:5:0:0` for single drive, `PCI:6:0:0` for two drives).

## Setup at the time of testing
```
$ nix-info -m
 - system: `"x86_64-linux"`
 - host os: `Linux 6.0.9, NixOS, 22.11 (Raccoon), 22.11beta19.c9538a9b707`
 - multi-user?: `yes`
 - sandbox: `yes`
 - version: `nix-env (Nix) 2.11.0`
 - channels(root): `"nixos-22.11"`
 - nixpkgs: `/nix/var/nix/profiles/per-user/root/channels/nixos`
 ```
 ```
 $ lspci
...
01:00.0 VGA compatible controller: NVIDIA Corporation GA104M [GeForce RTX 3070 Mobile / Max-Q] (rev a1)
...
06:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Cezanne (rev c5)
...
```
