variable "env" {
  type        = string
  description = "The environment variable"
}

variable "proj" {
  type        = string
  description = "The project name"
}

variable "region" {
  type        = string
  description = "The region name"
}

variable "company" {
  type        = string
  description = "The company name"
}

variable "deploy_env" {
  type        = string
  description = "The deployment environment variable"
}

variable "common_tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    APP    = "core-network"
    OWNER  = "ICT"
    DEPLOY = "Terraform"
  }
}

variable "extra_tags" {
  description = "Extra tags specific to environment"
  type        = map(string)
  default     = null
}

variable "sn_address_space" {
  type        = list(string)
  description = "private endpoint subnet address space"
}

