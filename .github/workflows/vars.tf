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
  description = "The version of the OS, also known as publisher in Template azure file"
}

variable "OS_version" {
  description = "The version of the OS, also this is combined with system_release to give you the sku in the template."
}

variable "product_id" {
  description = "This is the offer that azure gives you for the image"
}
