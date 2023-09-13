output "vm_instance_name" {
  description = "The name of the auto-start and stop VM instance."
  value       = google_compute_instance.vm.name
}

