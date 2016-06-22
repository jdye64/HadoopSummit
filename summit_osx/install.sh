echo "Installing Hadoop Summit Demo"

# Make sure HomeBrew is in working order and up to date. Website -> http://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew doctor

# Install OpenCV via Mac OS X Homebrew which is a system dependency for nifi-opencv
brew tap homebrew/science
#brew install opencv3 --with-ffmpeg --with-java --with-python3 --without-tests
brew install opencv -v --with-java

cd /usr/local/Cellar/opencv3/3.1.0_3/share/OpenCV/java/
ln -s libopencv_java310.so libopencv_java310.dylib