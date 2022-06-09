FROM ubuntu:20.04
MAINTAINER zhetoo "527200792@qq.com"
COPY fonts/* /usr/share/fonts/chinese/
RUN apt-get clean && apt-get update &&\
	apt-get install -y locales && apt-get install -y language-pack-zh-hans &&\
	localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 && locale-gen zh_CN.UTF-8 &&\
    export DEBIAN_FRONTEND=noninteractive &&\
	apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime &&\
	apt-get install -y libxrender1 && apt-get install -y libxt6 && apt-get install -y libxext-dev && apt-get install -y libfreetype6-dev &&\
	apt-get install -y wget && apt-get install -y ttf-mscorefonts-installer && apt-get install -y fontconfig &&\
	apt-get install -y ttf-wqy-microhei &&\
	apt-get install -y ttf-wqy-zenhei &&\
	apt-get install -y xfonts-wqy &&\
    apt-get install -y openjdk-8-jdk software-properties-common &&\
    add-apt-repository ppa:libreoffice/ppa -y &&\
    apt-get install -y libreoffice &&\
	cd /usr/share/fonts/chinese &&\
    mkfontscale &&\
    mkfontdir &&\
    fc-cache -fv
ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8