#!/bin/bash

VM_NAME="WINDOWS_11"
LOG_FILE="/tmp/windows_vm_launch.log"

# Redirect all output to log for debugging
exec > "$LOG_FILE" 2>&1
set -x

echo "Script started: $(date)"

# Check if virt-viewer already running for this VM
if pgrep -f "virt-viewer.*$VM_NAME" > /dev/null; then
    echo "Viewer already running"
    exit 0
fi

# Check if VM is running; start if not
if ! sudo virsh --connect qemu:///system list --name | grep -qx "$VM_NAME"; then
    echo "Starting VM $VM_NAME"
    sudo virsh --connect qemu:///system start "$VM_NAME"
    sleep 7  # wait longer for boot
else
    echo "VM $VM_NAME already running"
fi

echo "Launching virt-viewer..."
virt-viewer --connect qemu:///system --domain-name "$VM_NAME" --attach --full-screen &

echo "Script finished: $(date)"
