variable "instances" {
  type = map
  default     = {
    mysql = "t3.micro"
    backend = "t2.micro"
    frontend = "t2.micro"
  }

}


variable "zone_id" {
  
  default     = "Z09576191Z5VQH6BJ1P7O"
 
}

variable "domain" {
  type        = string
  default     = "jobsearchindia.online"
  
}

