resource "proxmox_vm_qemu" "kube-worker" {
  for_each = var.workers

  name        = each.key
  target_node = "pve"
  agent       = 1
  clone       = var.common.clone
  vmid        = each.value.id
  memory      = each.value.memory
  cores       = each.value.cores
  vga {
    type = "qxl"
  }
  network {
    model   = "virtio"
    macaddr = each.value.macaddr
    bridge  = "vmbr0"
  }
  disk {
    type    = "scsi"
    storage = "rust-pool"
    size    = each.value.disk
    format  = "raw"
  }
  serial {
    id   = 0
    type = "socket"
  }
  bootdisk     = "scsi0"
  scsihw       = "virtio-scsi-pci"
  os_type      = "cloud-init"
  ipconfig0    = "ip=${each.value.cidr},gw=${each.value.gw}"
  ciuser       = "ubuntu"
  cipassword   = data.sops_file.secrets.data["data.k8s.user_password"]
  searchdomain = var.common.search_domain
  nameserver   = var.common.nameserver
  sshkeys      = data.sops_file.secrets.data["data.k8s.ssh_key"]
}
