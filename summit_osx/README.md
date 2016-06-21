# Download VirtualBox and VirtualBox extensions from
https://www.virtualbox.org/wiki/Downloads

# Guide on getting the WebCam attached. Don't forget to enable USB on the VirtualBox image!
https://tskamath.wordpress.com/2014/10/29/macbook-camera-virtualbox-2/

# TODO: Write script to manually enable USB support on VM otherwise enabling the camera will fail.
# TODO: Write script to automatically attach to the local WebCam on OS X devices.

# Enable USB for the VM image
VBoxManage modifyvm "docker-hwx" --usb on
VBoxManage controlvm "docker-hwx" webcam attach .0

https://github.com/chipgarner/opencv3-webcam-docker

https://docs.docker.com/machine/drivers/virtualbox/
https://tskamath.wordpress.com/2014/10/29/macbook-camera-virtualbox-2/
https://trac.ffmpeg.org/wiki/Capture/Webcam

# For install the webcam driver for docker-machine
docker-machine ssh docker-machine
tce-load -w -i v4l-dvb-4.2.7-tinycore64.tcz
exit