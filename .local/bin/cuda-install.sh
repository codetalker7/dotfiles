#!/usr/bin/env bash
set -euo pipefail

CUDA_DISTRO="ubuntu2204"
CUDA_ARCH="x86_64"

echo "=========================================="
echo " Fresh NVIDIA + CUDA installation"
echo " Ubuntu 22.04"
echo "=========================================="

# --------------------------------------------------
# 1. Update Ubuntu
# --------------------------------------------------

echo
echo "[1/7] Updating Ubuntu..."

sudo apt update
sudo apt upgrade -y

# --------------------------------------------------
# 2. Install prerequisites
# --------------------------------------------------

echo
echo "[2/7] Installing prerequisites..."

sudo apt install -y \
    ubuntu-drivers-common \
    linux-headers-"$(uname -r)" \
    build-essential \
    dkms \
    wget \
    pciutils \
    mokutil

# --------------------------------------------------
# 3. Verify NVIDIA GPU
# --------------------------------------------------

echo
echo "[3/7] Detecting NVIDIA GPU..."

if ! lspci | grep -qi nvidia; then
    echo "ERROR: No NVIDIA GPU detected."
    exit 1
fi

lspci | grep -i nvidia

# --------------------------------------------------
# 4. Install Ubuntu's recommended NVIDIA driver
# --------------------------------------------------

echo
echo "[4/7] NVIDIA driver recommendation:"
ubuntu-drivers devices

echo
echo "Installing recommended NVIDIA driver..."

sudo ubuntu-drivers install

# --------------------------------------------------
# 5. Add NVIDIA CUDA repository
# --------------------------------------------------

echo
echo "[5/7] Adding NVIDIA CUDA repository..."

cd /tmp

wget -q \
    "https://developer.download.nvidia.com/compute/cuda/repos/${CUDA_DISTRO}/${CUDA_ARCH}/cuda-keyring_1.1-1_all.deb" \
    -O cuda-keyring.deb

sudo dpkg -i cuda-keyring.deb
rm cuda-keyring.deb

sudo apt update

# --------------------------------------------------
# 6. Install CUDA Toolkit
# --------------------------------------------------

echo
echo "[6/7] Installing CUDA Toolkit..."

sudo apt install -y cuda-toolkit

# --------------------------------------------------
# 7. Configure environment
# --------------------------------------------------

echo
echo "[7/7] Configuring CUDA environment..."

cat <<'EOF' | sudo tee /etc/profile.d/cuda.sh >/dev/null
if [ -d /usr/local/cuda/bin ]; then
    export PATH="/usr/local/cuda/bin:${PATH}"
fi

if [ -d /usr/local/cuda/lib64 ]; then
    export LD_LIBRARY_PATH="/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"
fi
EOF

sudo chmod 644 /etc/profile.d/cuda.sh

echo
echo "=========================================="
echo " Installation finished"
echo "=========================================="

echo
echo "Secure Boot status:"
mokutil --sb-state || true

echo
echo "You MUST reboot before testing the driver:"
echo
echo "    sudo reboot"
echo
echo "After reboot run:"
echo
echo "    nvidia-smi"
echo "    nvcc --version"
echo
