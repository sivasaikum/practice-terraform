variable "instances" {
  type        = list
  default     = ["mysql","backend","frontend"]
  
}

variable "zone_id" {
  type        = string
  default     = "Z09576191Z5VQH6BJ1P7O"
}

variable "domain" {
  type        = string
  default     = "jobsearchindia.online"
}



variable "common_tags" {
  type        = map
  default     = {
    project = "expense"
    environment = "dev"
  }
}

