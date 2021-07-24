#!/bin/bash
grupsudo="sudo"
groups $1 | grep $grupsudo
if [ $? -ne 0 ]; then
echo "User $1 belum masuk grup sudo, kita masukkan terlebih dahulu.."
sudo usermod -aG $grupsudo $1
echo "Berhasil!"
else
echo "User $1 sudah masuk grup sudo"
fi
