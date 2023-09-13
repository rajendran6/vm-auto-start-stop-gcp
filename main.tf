resource "google_compute_instance" "vm" {
  name         = var.vm_name
  project      = var.project_id
  zone         = var.zone
  machine_type = "n1-standard-1" # Adjust the machine type as needed
  # Add other VM configuration settings here

  metadata_startup_script = <<EOF
  #!/bin/bash
  # Script to start and stop the VM based on the schedule

  start_time="${var.start_time}"
  stop_time="${var.stop_time}"
  current_time=$(date +%H:%M)

  if [[ "$current_time" > "$start_time" && "$current_time" < "$stop_time" ]]; then
    echo "Starting the VM"
    systemctl start your-service-name
  else
    echo "Stopping the VM"
    systemctl stop your-service-name
  fi
  EOF
}

resource "google_compute_instance_group_manager" "vm_autostop" {
  base_instance_name = var.vm_name
  instance_template = google_compute_instance.vm.instance_template
  name              = "${var.vm_name}-group"
  target_size       = 1 # Set to 0 to terminate the VM when not needed
}

