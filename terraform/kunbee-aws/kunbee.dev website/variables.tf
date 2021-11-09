variable "domain_names" {
  type    = list(any)
  default = []
}
variable "soa_record" {
  type    = string
  default = ""
}
variable "a_record" {
  type    = string
  default = ""
}

variable "cname_record" {
  type    = string
  default = ""
}
variable "cname_wwwrecord" {
  type    = string
  default = ""
}
variable "ns_record" {
  type    = list(any)
  default = []
}

variable "ttl" {
  type    = map(any)
  default = {}
}

variable "zone_id" {
  type    = string
  default = ""

}
variable "cloudfront_distribution" {
  type    = string
  default = ""
}

variable "email" {
  type    = list(string)
  default = []

}