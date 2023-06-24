variable "prefix" {
  default     = "raad"
  description = "Acronym of the project's name"
}

variable "project" {
  default = "recipe-app-api-devops"
}

variable "contact" {
  default = "omenaph@gmail.com"
}

variable "db_username" {
  description = "Username for the RDS Postgres instance"
}

variable "db_password" {
  description = "Password for the RDS Postgres instance"
}

variable "bastion_key_name" {
  default = "recipe-app-api-devops-bastion"
}
