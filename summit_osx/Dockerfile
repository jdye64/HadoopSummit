FROM jdye64/hadoopsummit:summit_baseline

# System compiler dependencies
RUN apt-get install -y build-essential

# OpenCV required dependencies
RUN apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev curl wget

# OpenCV optional dependencies
RUN apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev

# Download the OpenCV source code
RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip

RUN unzip 3.1.0.zip
RUN cd opencv-3.1.0 && mkdir build && cd build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF .. && make -j8

# Add the processor code to the image
#RUN mkdir nifi-opencv
#ADD . /nifi-opencv
#RUN cd nifi-opencv && mvn clean install package  -DskipTests && cp ./nifi-opencv-nar/target/nifi-opencv-nar-0.5.1.nar /HDF-1.2.0.0/nifi/lib/.

# Startup NiFi
#CMD /HDF-1.2.0.0/nifi/bin/nifi.sh run

# Install Tesseract Dependencies
RUN apt-get -y install autoconf automake libtool libicu-dev

# Install required version of leptonica
RUN wget http://www.leptonica.org/source/leptonica-1.73.tar.gz && tar -xzvf leptonica-1.73.tar.gz && cd leptonica-1.73 && ./configure && make && make install
#mkdir build && cd build && cmake .. && make && make install

RUN git clone https://github.com/tesseract-ocr/tesseract.git
RUN cd tesseract && ./autogen.sh && ./configure && LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make && make install && ldconfig
