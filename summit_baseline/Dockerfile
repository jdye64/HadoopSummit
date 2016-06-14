FROM ubuntu:15.10
MAINTAINER Jeremy Dyer

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV LD_LIBRARY_PATH = $LD_LIBRARY_PATH:/opencv-3.1.0/build/lib/
ENV NIFI_HOME /nifi-0.6.1
ENV GIT_HADOOP_SUMMIT_HOME /HadoopSummit

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git wget build-essential cmake libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev curl python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev autoconf automake libtool libicu-dev vim

# Install Java JDK 8u91
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && apt-get install -y software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update && apt-get install -y oracle-java8-installer && apt-get install -y oracle-java8-set-default

# Install Apache NiFi 0.6.1
RUN wget http://www.trieuvan.com/apache/nifi/0.6.1/nifi-0.6.1-bin.tar.gz && tar -xzvf nifi-0.6.1-bin.tar.gz

# Install Maven
ADD apache-maven-3.3.9-bin.tar.gz /
RUN cp -R apache-maven-3.3.9 /usr/local
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

# Download the OpenCV source code
RUN wget https://github.com/Itseez/opencv/archive/3.1.0.zip

RUN unzip 3.1.0.zip
RUN cd opencv-3.1.0 && mkdir build && cd build && cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local -DBUILD_SHARED_LIBS=OFF .. && make -j8

# Set java.library.path for NiFi so that OpenCV native libraries can be found
RUN sed -i '$ a java.arg.99=-Djava.library.path=/opencv-3.1.0/build/lib' /nifi-0.6.1/conf/bootstrap.conf

# Install Leptonica dependencies that are required by Tesseract
RUN wget http://www.leptonica.org/source/leptonica-1.73.tar.gz && tar -xzvf leptonica-1.73.tar.gz && cd leptonica-1.73 && ./configure && make && make install
#mkdir build && cd build && cmake .. && make && make install

# Build and install Tesseract
RUN git clone https://github.com/tesseract-ocr/tesseract.git
RUN cd tesseract && ./autogen.sh && ./configure && LDFLAGS="-L/usr/local/lib" CFLAGS="-I/usr/local/include" make && make install && ldconfig

# Exposes the needed baseline ports
EXPOSE 8080

# Startup NiFi
CMD $NIFI_HOME/bin/nifi.sh run