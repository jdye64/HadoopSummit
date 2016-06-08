FROM ubuntu:14.04

ENV JAVA_HOME=/usr/lib/jvm/java-8-oracle
ENV LD_LIBRARY_PATH = $LD_LIBRARY_PATH:/opencv-3.1.0/build/lib/

# Update apt-get repository
RUN apt-get update

# Install system dependencies
RUN apt-get install -y unzip ant git

# Install Java
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && apt-get install -y software-properties-common && add-apt-repository ppa:webupd8team/java -y && apt-get update && apt-get install -y oracle-java8-installer && apt-get install -y oracle-java8-set-default

# Install Apache NiFi 0.6.1
RUN wget http://www.trieuvan.com/apache/nifi/0.6.1/nifi-0.6.1-bin.tar.gz && tar -xzvf nifi-0.6.1-bin.tar.gz

# Install Maven
ADD apache-maven-3.3.9-bin.tar.gz /
RUN cp -R apache-maven-3.3.9 /usr/local
RUN ln -s /usr/local/apache-maven-3.3.9/bin/mvn /usr/bin/mvn

# Install Custom Processors
RUN git clone https://github.com/jdye64/HadoopSummit.git

# Barcode Scanner Custom Processor
RUN cd HadoopSummit/NiFiCustomProcessors/barcode && mvn clean install package && cp ./nifi-barcode-nar/target/nifi-barcode-nar-0.6.1.nar /nifi-0.6.1/lib

# Startup NiFi
CMD /nifi-0.6.1/bin/nifi.sh run