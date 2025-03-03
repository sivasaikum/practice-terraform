

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

/* variable "common_tags" {
  type = map
  default     = {
    project = "expense"
    component = "backend"
    environment = "dev"
    Name = "variable-terraform"
  }
} */

variable "project" {
  default = "expense"

}

variable "component" {
  default = "backend"
}



