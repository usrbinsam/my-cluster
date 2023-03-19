terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }

    sops = {
      source  = "carlpett/sops"
      version = "0.7.1"
    }
  }
}

data "sops_file" "secrets" {
  source_file = ".secrets.yaml"
}

provider "proxmox" {
  pm_log_enable   = false
  pm_tls_insecure = true
  pm_api_url      = "https://192.168.86.56:8006/api2/json"
  pm_user         = data.sops_file.secrets.data["data.pm.user"]
  pm_password     = data.sops_file.secrets.data["data.pm.password"]
  pm_parallel     = 1
  pm_timeout      = 900
}

provider "sops" {}
