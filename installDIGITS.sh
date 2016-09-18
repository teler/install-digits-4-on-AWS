#!/bin/bash
#wget https://raw.githubusercontent.com/teler/install-digits-4-on-AWS/master/installDIGITS.sh
#chmod +x installDIGITS.sh
#./installDIGITS.sh

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y linux-image-extra-`uname -r`
#Install NVIDIA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-361 nvidia-settings


#Get CUDA and NVIDIA’s machine learning repos
CUDA_REPO_PKG=cuda-repo-ubuntu1404_7.5-18_amd64.deb && 
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/$CUDA_REPO_PKG && 
sudo dpkg -i $CUDA_REPO_PKG
 
ML_REPO_PKG=nvidia-machine-learning-repo_4.0-2_amd64.deb &&
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/$ML_REPO_PKG &&
sudo dpkg -i $ML_REPO_PKG

#Install DIGITS
sudo apt-get update
sudo apt-get install digits

sudo reboot

https://googledrive.com/host/0Byy89WZKSf_3bHF5Vy00cnJXU1k/20160916-163334-8633.tar.gz

#download bvlc_googlenet.caffemodel
wget http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel
chmod u+x bvlc_googlenet.caffemodel

ls /usr/share/digits/digits/jobs
sudo stop nvidia-digits-server
sudo start nvidia-digits-server

sudo cp 20160916-163334-8633.tar.gz /usr/share/digits/digits/jobs
sudo tar -zxvf 20160916-163334-8633.tar.gz

/home/ubuntu/bvlc_googlenet.caffemodel

https://googledrive.com/host/0Byy89WZKSf_3bHF5Vy00cnJXU1k/DATASETS.tar.gz

sudo tar -zxvf DATASETS.tar.gz
