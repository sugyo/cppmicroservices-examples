FROM centos:8

RUN dnf update -y && \
    dnf install -y cmake gcc-c++ graphviz make python3 && \
    dnf clean all
RUN python3 -m pip install sphinx breathe sphinx_rtd_theme
RUN cd /opt && \
    curl -LO http://doxygen.nl/files/doxygen-1.8.16.linux.bin.tar.gz && \
    tar zxf doxygen-1.8.16.linux.bin.tar.gz && \
    rm doxygen-1.8.16.linux.bin.tar.gz && \
    ln -s doxygen-1.8.16 doxygen
ENV PATH=$PATH:/opt/doxygen/bin

WORKDIR /src
RUN curl -LO https://github.com/CppMicroServices/CppMicroServices/archive/v3.3.0.tar.gz && \
    tar zxf v3.3.0.tar.gz && \
    rm  v3.3.0.tar.gz && \
    ln -s CppMicroServices-3.3.0 CppMicroServices
RUN cd CppMicroServices && \
    cmake \
        -DUS_BUILD_EXAMPLES:BOOL=ON \
        -DUS_BUILD_SHARED_LIBS:BOOL=ON \
        -DCMAKE_INSTALL_PREFIX=/opt/CppMicroServices webconsole/examples . && \
    make install && \
    echo /opt/CppMicroServices/lib > /etc/ld.so.conf.d/CppMicroServices.conf && ldconfig
ENV PATH=$PATH:/opt/CppMicroServices/bin

WORKDIR /

EXPOSE 8080
