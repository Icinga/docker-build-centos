FROM i386/centos:6

# Force arch to allow crossbuilding on x86_64 host
RUN echo i686-redhat-linux-gnu >/etc/rpm/platform

RUN yum update -y

# TODO: Remove this once the build deps for boost have been cleaned up...
RUN echo '%build_icinga_org 1' >/etc/rpm/macros.icinga_build

RUN yum install -y \
  sudo wget curl which tar expect git \
  patch rpm-build redhat-rpm-config rpmlint \
  patch make util-linux \
  yum-utils yum-plugin-ovl rpmdevtools \
  epel-release \
 && yum clean all

RUN yum install -y \
  boost-devel \
  bison \
  cmake \
  openssl-devel \
  mysql-devel \
  yajl-devel \
  libedit-devel \
  ccache \
 && yum clean all

RUN groupadd -g 1000 jenkins \
 && useradd -u 1000 -g 1000 -m jenkins \
 && echo 'Defaults:jenkins !requiretty' | tee -a /etc/sudoers \
 && echo 'jenkins ALL=(ALL:ALL) NOPASSWD: ALL' | tee -a /etc/sudoers

RUN wget -O /etc/yum.repos.d/ICINGA-release.repo \
 https://packages.icinga.com/epel/ICINGA-release.repo

RUN wget -O /etc/yum.repos.d/devtoolset-2.repo https://people.centos.org/tru/devtools-2/devtools-2.repo \
 && yum install -y devtoolset-2-gcc devtoolset-2-gcc-c++ devtoolset-2-binutils
