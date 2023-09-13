variable "project_id" {
  description = "The GCP project ID."
}

variable "zone" {
  description = "The GCP zone where the VM is located."
}

variable "vm_name" {
  description = "The name of the VM to auto-start and stop."
}

variable "start_time" {
  description = "The time to start the VM in 24-hour format (HH:MM)."
  default     = "08:00" # Default to 8:00 AM
}

variable "stop_time" {
  description = "The time to stop the VM in 24-hour format (HH:MM)."
  default     = "18:00" # Default to 6:00 PM
}

