{ config, lib, pkgs, ... }:

{
  boot.extraModulePackages = lib.optional (config.boot.kernelPackages ? lenovo-legion-module) config.boot.kernelPackages.lenovo-legion-module;
  environment.systemPackages = lib.optional (pkgs ? lenovo-legion) pkgs.lenovo-legion;

  # Generic check for Legion hybrid configurations
  assertions = [
    {
      assertion = !(config.hardware.nvidia.prime.offload.enable or false || config.hardware.nvidia.prime.sync.enable or false)
        || config.hardware.nvidia.prime.amdgpuBusId != null
        || config.hardware.nvidia.prime.intelBusId != null;
      message = ''
        For Lenovo Legion hybrid graphics configuration, you must explicitly set `hardware.nvidia.prime.amdgpuBusId` (for AMD/Nvidia hybrid) or `hardware.nvidia.prime.intelBusId` (for Intel/Nvidia hybrid).
        Depending on the number of SSD drives installed, the integrated GPU PCI bus ID can shift (typically between "PCI:5:0:0" and "PCI:6:0:0" for AMD models).
      '';
    }
  ];
}
