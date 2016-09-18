#!/bin/bash
#wget https://raw.githubusercontent.com/teler/install-digits-4-on-AWS/master/installDIGITS.sh
#chmod +x installDIGITS.sh
#./installDIGITS.sh

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y linux-image-extra-`uname -r`
#Install NVIDIA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-352 nvidia-settings
#new driver version
http://us.download.nvidia.com/XFree86/Linux-x86_64/367.44/NVIDIA-Linux-x86_64-367.44.run
#NEW cuda
#Get CUDA and NVIDIA’s machine learning repos
CUDA_REPO_PKG=cuda-repo-ubuntu1404_7.5-18_amd64.deb && 
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/$CUDA_REPO_PKG && 
sudo dpkg -i $CUDA_REPO_PKG
 #NEW no repo
ML_REPO_PKG=nvidia-machine-learning-repo_4.0-2_amd64.deb &&
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/$ML_REPO_PKG &&
sudo dpkg -i $ML_REPO_PKG

#Install DIGITS
sudo apt-get update
sudo apt-get install digits

#download bvlc_googlenet.caffemodel
wget http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel
chmod u+x bvlc_googlenet.caffemodel
