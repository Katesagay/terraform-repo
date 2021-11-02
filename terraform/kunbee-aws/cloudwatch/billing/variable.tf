variable "monthy_billing_threshold" {
  description = "Maximum amount of total charges in usd"
  type        = number
  default     = 5
}
variable "sns" {
  description = "sns topic for bill"
  type        = map
  default     = {}
}

variable "email_address_list" {
  description = "list of emails to send the notification to"
  type        = string
  default     = ""
}

variable "currency" {
  description = "currency of charge"
  type        = string
  default     = ""
}