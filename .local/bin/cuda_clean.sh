#!/usr/bin/env bash
set -euo pipefail

echo "=== CUDA/NVIDIA CLEANUP ==="

echo "[1/6] Removing CUDA/NVIDIA packages..."

sudo apt-get remove --purge -y \
  'cuda-*' \
  'libcuda*' \
  'nvidia-*' \
  'libnvidia-*' \
  'nsight-*' || true

sudo apt-get autoremove --purge -y
sudo apt-get autoclean -y

echo "[2/6] Removing old CUDA repositories..."

sudo rm -f /etc/apt/sources.list.d/cuda*.list
sudo rm -f /etc/apt/sources.list.d/cuda*.sources
sudo rm -f /etc/apt/preferences.d/cuda-repository-pin-600
sudo rm -f /usr/share/keyrings/cuda-archive-keyring.gpg

sudo rm -rf /var/cuda-repo-*
sudo rm -f /var/lib/apt/lists/*cuda*
sudo rm -f /var/lib/apt/lists/*nvidia*

echo "[3/6] Removing old CUDA symlinks/directories..."

sudo rm -f /usr/local/cuda

# Only remove directories owned by previous CUDA installations
sudo rm -rf /usr/local/cuda-*

echo "[4/6] Removing stale NVIDIA module configuration..."

sudo rm -f /etc/modprobe.d/nvidia*.conf

echo "[5/6] Updating initramfs..."

sudo update-initramfs -u

echo "[6/6] Refreshing apt..."

sudo apt-get update

echo
echo "============================================"
echo "Cleanup complete."
echo "REBOOT NOW:"
echo
echo "    sudo reboot"
echo
echo "After reboot, run the installation script."
echo "============================================"
