variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "tagname" {
  description = "The Tagname in which all resources in this example should be created."
}

variable "system_size" {
  description = "The size of the system deployed in which all resources in this example should be created."
}

variable "system_release" {
  description = "The OS release in which all resources in this example should be created."
}

variable "hostname" {
  description = "The hostname for the virtual machine in this release"
}

variable "OS_publisher" {
  description = "The version of the OS"
}

variable "OS_version" {
  description = "The version of the OS"
}