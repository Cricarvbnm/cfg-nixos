{ ... }: {
  boot.initrd.kernelModules = [ "vfio_pci" "vfio" "vfio_iommu_type1" ];
  boot.kernelParams = [ "intel_iommu=on" "vfio-pci.ids=10de:28e0,10de:22be" ];
}
