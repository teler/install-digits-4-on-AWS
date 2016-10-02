#!/bin/bash
set -x
trap read debug

#wget https://raw.githubusercontent.com/teler/install-digits-4-on-AWS/master/installDigits_dudnn.sh
#chmod +x installDigits_dudnn.sh
#sh ./installDigits_dudnn.sh

sudo apt-get update && sudo apt-get -y upgrade
sudo apt-get install -y linux-image-extra-`uname -r`
#Install NVIDIA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-361 nvidia-settings

#Install CUDA	
CUDA_REPO_PKG=cuda-repo-ubuntu1404_7.5-18_amd64.deb
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/${CUDA_REPO_PKG} -O /tmp/${CUDA_REPO_PKG}
sudo dpkg -i /tmp/${CUDA_REPO_PKG}
sudo apt-get install cuda
rm -f /tmp/${CUDA_REPO_PKG}

#Install cudnn
wget http://admindv.s3.amazonaws.com/cuda_cudnn.tar.gz
tar -xvf cuda_cudnn.tar.gz

sudo cp cuda/include/cudnn.h /usr/local/cuda-8.0/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda-8.0/lib64
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64

#Install ML

ML_REPO_PKG=nvidia-machine-learning-repo-ubuntu1404_4.0-2_amd64.deb
wget http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1404/x86_64/${ML_REPO_PKG} -O /tmp/${ML_REPO_PKG}
sudo dpkg -i /tmp/${ML_REPO_PKG}
rm -f /tmp/${ML_REPO_PKG}

sudo apt-get update
sudo apt-get install digits

sudo apt-get install --no-install-recommends git graphviz python-dev python-flask python-flaskext.wtf python-gevent python-h5py python-numpy python-pil python-protobuf python-scipy

sudo apt-get install --no-install-recommends build-essential cmake git gfortran libatlas-base-dev libboost-all-dev libgflags-dev libgoogle-glog-dev libhdf5-serial-dev libleveldb-dev liblmdb-dev libopencv-dev libprotobuf-dev libsnappy-dev protobuf-compiler python-all-dev python-dev python-h5py python-matplotlib python-numpy python-opencv python-pil python-pip python-protobuf python-scipy python-skimage python-sklearn
export CAFFE_ROOT=~/caffe
git clone https://github.com/NVIDIA/caffe.git $CAFFE_ROOT
sudo pip install -r $CAFFE_ROOT/python/requirements.txt
cat $CAFFE_ROOT/python/requirements.txt | xargs -n1 sudo pip install
cd $CAFFE_ROOT
mkdir build
cd build
cmake ..
make --jobs=4


# example location - can be customized
DIGITS_ROOT=~/digits
git clone https://github.com/NVIDIA/DIGITS.git $DIGITS_ROOT
sudo pip install -r $DIGITS_ROOT/requirements.txt
sudo pip install -e $DIGITS_ROOT

./digits-devserver
