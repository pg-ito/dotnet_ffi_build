FROM centos:7.9.2009



RUN mkdir /src
VOLUME /src
# WORKDIR  /src
# RUN curl -L -O https://github.com/pg-ito/dotnet_ffi/archive/v0.3.0.tar.gz

# RUN tar xvf v0.3.0.tar.gz 
# RUN mv -i /src/dotnet_ffi-0.3.0 dotnet_ffi
# WORKDIR /src/dotnet_ffi
# RUN ls -al
# RUN ./br.sh



RUN yum install -y centos-release-scl epel-release
RUN yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

RUN yum -y groupinstall "Development Tools"
RUN yum -y install kernel-devel kernel-headers
RUN yum install -y devtoolset-7-gcc devtoolset-7-gcc-c++
RUN echo 'scl enable devtoolset-7 bash' >> ~/.bashrc
RUN yum -y install --enablerepo=epel,remi,remi-php73  php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt

RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm
RUN yum install -y dotnet-sdk-5.0
RUN echo 'scl enable devtoolset-7 bash;cd /src/dotnet_ffi && ./br.sh' >> ~/builder.sh


