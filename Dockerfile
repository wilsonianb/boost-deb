FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y build-essential dh-make subversion wget

RUN wget https://sourceforge.net/projects/boost/files/boost/1.60.0/boost_1_60_0.tar.gz/download -O boost_1.60.0.tar.gz

RUN tar -xvzf boost_1.60.0.tar.gz
RUN mv boost_1_60_0 boost_1.60.0
RUN cd boost_1.60.0 && svn checkout svn://anonscm.debian.org/pkg-boost/boost/tags/1.60.0+dfsg-1/debian

#RUN cd boost_1.60.0 && DEBEMAIL="your.email.address@example.org" DEBFULLNAME="Firstname Lastname" dh_make -f ../boost_1.60.0.tar.gz

RUN apt-get -y install dctrl-tools zlib1g-dev libbz2-dev libicu-dev mpi-default-dev bison flex docbook-to-man help2man xsltproc doxygen g++  python python-all-dev python3-all-dev g++

RUN cp boost_1.60.0.tar.gz boost_1.60.0.orig.tar.gz
RUN cd boost_1.60.0 && dpkg-buildpackage -b -rfakeroot -uc -us -d
