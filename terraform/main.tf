terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      #version = "2.9.14"
      version = "3.0.1-rc2"
    }
  }
}

provider "proxmox" {
  pm_api_url = "https://cfai2024.ajformation.fr:8006/api2/json"
}


