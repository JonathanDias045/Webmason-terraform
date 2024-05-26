resource "proxmox_lxc" "basic" {
  for_each = { for cont in var.containers : cont.name => cont }

  target_node    = var.target_node
  pool           = var.pool
  hostname       = each.value.name
  password       = var.password
  ssh_public_keys = var.ssh_public_keys
  cpuunits       = each.value.cpuunits
  memory         = each.value.memory
  ostemplate     = each.value.ostemplate

  start          = true
  unprivileged   = true

  rootfs {
    storage = "local-lvm"
    size    = each.value.rootfs_size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
    ip6    = each.value.ip6
  }
}

resource "null_resource" "run_ansible_script" {
  provisioner "local-exec" {
    command = "/home/mbureau/Webmason-terraform/terraform/run_ansible.sh"
  }

  depends_on = [proxmox_lxc.basic]
}

