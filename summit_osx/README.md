# Download VirtualBox and VirtualBox extensions from
https://www.virtualbox.org/wiki/Downloads

# Guide on getting the WebCam attached. Don't forget to enable USB on the VirtualBox image!
https://tskamath.wordpress.com/2014/10/29/macbook-camera-virtualbox-2/

# TODO: Write script to manually enable USB support on VM otherwise enabling the camera will fail.
# TODO: Write script to automatically attach to the local WebCam on OS X devices.

VBoxManage controlvm "docker-hwx" webcam attach .0