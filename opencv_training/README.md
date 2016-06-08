# Training OpenCV model for detecting badges from video stream

* First we must prepare the positive images to use in the training
** opencv_createsamples -vec badges.vec -img Melissa_Park_Hortonworks_0123_ExhitbitStaff.png -num 1000

# Scripts

* Create bg.txt by running list_files.sh > bg.txt