FROM jdye64/hadoopsummit:summit_baseline
MAINTAINER Jeremy Dyer

# FYI - GIT_HADOOP_SUMMIT_HOME & NIFI_HOME ENV variales are defined in parent Docker image

# Clones the Github repo to the local container
RUN git clone https://github.com/jdye64/HadoopSummit.git

# Build the "nifi-opencv" custom processor and add to local installation
RUN cd $GIT_HADOOP_SUMMIT_HOME/NiFiCustomProcessors/nifi-opencv && mvn clean install package -DskipTests && cp ./nifi-opencv-nar/target/nifi-opencv-nar-0.6.1.nar $NIFI_HOME/lib

# Build the "nifi-ocr" custom processor and add to local installation
RUN cd $GIT_HADOOP_SUMMIT_HOME/NiFiCustomProcessors/nifi-ocr && mvn clean install package -DskipTests && cp ./nifi-ocr-nar/target/nifi-ocr-nar-0.6.1.nar $NIFI_HOME/lib

# Build the "nifi-barcode" custom processor and add to local installation
RUN cd $GIT_HADOOP_SUMMIT_HOME/NiFiCustomProcessors/nifi-barcode && mvn clean install package && cp ./nifi-barcode-nar/target/nifi-barcode-nar-0.6.1.nar $NIFI_HOME/lib