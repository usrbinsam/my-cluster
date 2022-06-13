
variable "common" {
  type = map(string)
  default = {
    os_type       = "ubuntu"
    clone         = "ubuntu-22.04-cloudimg"
    search_domain = "gentoo.party"
    nameserver    = "192.168.86.1"
  }
}

variable "masters" {
  type = map(map(string))
  default = {
    k8s-master01 = {
      id      = 4010
      cidr    = "192.168.86.70/24"
      cores   = 8
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:01"
      memory  = 8192
      disk    = "40G"
    },
    k8s-master02 = {
      id      = 4011
      cidr    = "192.168.86.71/24"
      cores   = 8
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:02"
      memory  = 8192
      disk    = "40G"
    },
    k8s-master03 = {
      id      = 4012
      cidr    = "192.168.86.72/24"
      cores   = 8
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:03"
      memory  = 8192
      disk    = "40G"
    }
  }
}

variable "workers" {
  type = map(map(string))
  default = {
    k8s-worker01 = {
      id      = 4020
      cidr    = "192.168.86.60/24"
      cores   = 16
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:0A"
      memory  = 16384
      disk    = "40G"
    },
    k8s-worker02 = {
      id      = 4021
      cidr    = "192.168.86.61/24"
      cores   = 16
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:0B"
      memory  = 16384
      disk    = "40G"
    },
    k8s-worker03 = {
      id      = 4022
      cidr    = "192.168.86.62/24"
      cores   = 16
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:0C"
      memory  = 16384
      disk    = "40G"
    },
    k8s-worker04 = {
      id      = 4023
      cidr    = "192.168.86.63/24"
      cores   = 16
      gw      = "192.168.86.1"
      macaddr = "02:DE:4D:48:28:0D"
      memory  = 16384
      disk    = "40G"
    },
  }
}
