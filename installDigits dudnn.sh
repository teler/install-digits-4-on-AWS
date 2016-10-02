#!/bin/bash
#Dependencies
sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y linux-image-extra-`uname -r`
#Install NVIDIA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa 

#InstallCUDA	
CUDA_REPO_PKG=cuda-repo-ubuntu1404_7.5-18_amd64.deb
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/${CUDA_REPO_PKG} -O /tmp/${CUDA_REPO_PKG}
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
rm -f /tmp/${CUDA_REPO_PKG}
sudo apt-get update
sudo apt-get install cuda 

#InstallCUDnn
http://admindv.s3.amazonaws.com/cudnn-7.5-linux-x64-v5.1.tgz
tar -xvf cudnn-7.5-linux-x64-v5.1.tgz

sudo cp cuda/include/cudnn.h /usr/local/cuda-7.5/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda-7.5/lib64
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64

#Install ML

wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/nvidia-machine-learning-repo-ubuntu1404_4.0-2_amd64.deb &&
sudo dpkg -i nvidia-machine-learning-repo-ubuntu1404_4.0-2_amd64.deb

sudo apt-get update
sudo apt-get install digits

#Install caffe

wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/libcaffe-nv0_0.15.9-1+cuda7.5_amd64.deb &&
sudo dpkg -i libcaffe-nv0_0.15.9-1+cuda7.5_amd64.deb

#Install python-caffe

wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/python-caffe-nv_0.15.9-1+cuda7.5_amd64.deb &&
sudo dpkg -i python-caffe-nv_0.15.9-1+cuda7.5_amd64.deb

sudo apt-get update
