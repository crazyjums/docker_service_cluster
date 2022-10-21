FROM centos:centos7

LABEL MAINTAINER="<crazyjums@gmail.com>"

## install dependencies and download files
RUN yum install -y epel-release && \
    yum update -y && \
    yum -y install wget git && \
    wget -P /tmp https://www.php.net/distributions/php-7.4.28.tar.gz && \
    tar -zxf /tmp/php-7.4.28.tar.gz -C /tmp && \
    wget -P /tmp https://nginx.org/download/nginx-1.18.0.tar.gz && \
    tar -zxf /tmp/nginx-1.18.0.tar.gz -C /tmp && \
    wget -P /tmp https://pecl.php.net/get/redis-3.1.4.tgz && \
    tar -zxf /tmp/redis-3.1.4.tgz -C /tmp && \
    wget -P /tmp https://pecl.php.net/get/yaf-3.3.4.tgz && \
    tar -zxf /tmp/yaf-3.3.4.tgz -C /tmp && \
    wget -P /tmp https://www.openssl.org/source/openssl-1.1.1.tar.gz && \
    tar -zxf /tmp/openssl-1.1.1.tar.gz -C /tmp && \
    wget -P /tmp https://openresty.org/download/openresty-1.19.3.1.tar.gz && \
    tar -zxf /tmp/openresty-1.19.3.1.tar.gz -C /tmp && \
    git clone https://github.com/openresty/luajit2.git /tmp/luajit2 && \
    wget -P /usr/local/nginx/modules/ https://github.com/openresty/lua-nginx-module/archive/refs/tags/v0.10.14.tar.gz && \
    tar -zxf /usr/local/nginx/modules/v0.10.14.tar.gz -C /usr/local/nginx/modules/ && \
    git clone https://github.com/masterzen/nginx-upload-progress-module.git /usr/local/nginx/modules/nginx-upload-progress-module && \
    git clone https://github.com/vision5/ngx_devel_kit.git /usr/local/nginx/modules/ngx_devel_kit && \
    git clone https://github.com/openresty/srcache-nginx-module.git /usr/local/nginx/modules/srcache-nginx-module && \
    git clone https://github.com/openresty/memc-nginx-module.git /usr/local/nginx/modules/memc-nginx-module && \
    git clone https://github.com/FRiCKLE/ngx_cache_purge.git /usr/local/nginx/modules/ngx_cache_purge && \
    git clone https://github.com/openresty/echo-nginx-module.git /usr/local/nginx/modules/echo-nginx-module && \
    git clone https://github.com/fdintino/nginx-upload-module.git /usr/local/nginx/modules/nginx-upload-module && \
    git clone https://github.com/nbs-system/naxsi.git /usr/local/nginx/modules/naxsi && \
    yum -y install \
    systemtap-sdt-devel \
    libxml2 \
    libxml2-devel \
    openssl-devel \
    libcurl-devel \
    enchant-devel \
    libpng-devel \
    libicu-devel \
    libmcrypt-devel \
    recode-devel \
    net-snmp-devel\
    libtidy-devel \
    autoconf \
    readline-devel \
    libtidy-devel \
    aspell-devel\
    unixODBC-devel \
    libicu-devel \
    libc-client-devel \
    freetype-devel\
    libXpm-devel \
    libpng-devel \
    install \
    libvpx-devel \
    enchant-devel \
    libcurl-devel \
    libc-client-devel \
    openldap-devel \
    openldap \
    postgresql-devel \
    curl-devel \
    libxslt-devel \
    bzip2-devel \
    db4-devel \
    libjpeg-devel \
    gmp-devel \
    sqlite-devel \
    pcre-devel \
    mysql-devel \
    pspell-devel \
    gcc \
    gcc-c++ \
    make \
    cmake \
    oniguruma \
    oniguruma-devel \
    php-devel \ 
    gd \
    lua-devel \
    gd-devel \
    geoip-devel \
    gperftools \
    pcre \
    unzip \
    libzip \
    libzip-devel

## install php
WORKDIR /tmp/php-7.4.28
RUN ./configure \
    --prefix=/usr/local/php \ 
    --sharedstatedir=/data/php \
    --localstatedir=/data/php \
    --enable-fpm \
    --enable-phpdbg \
    --enable-phpdbg-webhelper \
    --enable-phpdbg-debug \
    --disable-debug \
    --with-layout=GNU \
    --with-config-file-path=/usr/local/php/etc \
    --with-config-file-scan-dir=/usr/local/php/etc/php.d \
    --disable-ipv6 \
    --enable-dtrace \
    --enable-libxml \
    --with-openssl \
    --with-pcre-regex \
    --with-sqlite3 \
    --with-zlib \
    --enable-bcmath \
    --with-bz2 \
    --enable-calendar \
    --enable-ctype \
    --with-openssl=shared,/usr/local/openssl \
    --with-curl=shared,/usr/local/curl \
    --with-curl \
    --enable-dom \
    --with-enchant \
    --enable-exif \
    --enable-fileinfo \
    --enable-filter \
    --enable-ftp \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir \
    --enable-gd-native-ttf \
    --with-gettext \
    --with-gmp \
    --with-mhash \
    --enable-hash \
    --with-iconv \
    --enable-json \
    --enable-mbstring \
    --with-mcrypt \
    --with-mysqli=mysqlnd \
    --enable-opcache \
    --enable-opcache-file \
    --enable-huge-code-pages \
    --enable-pcntl \
    --enable-pdo \
    --with-pdo-mysql=mysqlnd \
    --with-pdo-pgsql \
    --with-pdo-sqlite \
    --with-pgsql \
    --enable-phar \
    --enable-posix \
    --with-readline \
    --with-recode \
    --enable-session \
    --enable-shmop \
    --enable-simplexml \
    --enable-soap \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --with-tidy \
    --enable-tokenizer \
    --enable-xml \
    --enable-xmlreader \
    --with-xmlrpc \
    --enable-xmlwriter \
    --with-xsl \
    --enable-zip \
    --enable-mysqlnd \
    --enable-mysqlnd-compression-support \
    --with-pear && \
    make && \
    make install && \
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
    cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf && \
    mkdir -p /usr/local/php/etc/php.d && \
    mkdir -p /data/php && \
    cp /tmp/php-7.4.28/php.ini-development /usr/local/php/etc/php.ini && \
    ln -s /usr/local/php/bin/php /usr/local/bin && \
    ln -s /usr/local/php/sbin/php-fpm /usr/local/bin && \
    ln -s /usr/local/php/bin/phpize /usr/local/bin

## install php extension of redis
WORKDIR /tmp/redis-3.1.4
RUN /usr/local/php/bin/phpize && \
    ./configure --with-php-config=/usr/local/php/bin/php-config && \
    make && make install && \
    echo "extension=redis.so" >> /usr/local/php/etc/php.d/docker-php-ext-redis.ini

## install php extension of yaf
WORKDIR /tmp/yaf-3.3.4
RUN /usr/local/php/bin/phpize && \
    ./configure --with-php-config=/usr/local/php/bin/php-config && \
    make && make install && \
    echo "extension=yaf.so" >> /usr/local/php/etc/php.d/docker-php-ext-yaf.ini && \
    echo "yaf.environ=dev" >> /usr/local/php/etc/php.d/docker-php-ext-yaf.ini

## install openssl
WORKDIR /tmp/openssl-1.1.1
RUN ./config --prefix=/usr/local/openssl && \
    ./config -t && \
    make && make install

## install php extension of openssl
WORKDIR /tmp/php-7.4.28/ext/openssl
RUN mv config0.m4 config.m4 && \
    /usr/local/php/bin/phpize && \
    ./configure --with-openssl --with-php-config=/usr/local/php/bin/php-config && \
    make && make install && \
    echo "extension=openssl.so" >> /usr/local/php/etc/php.d/docker-php-ext-openssl.ini

## install nginx modules, luajit2
WORKDIR /tmp/luajit2
RUN make && make install PREFIX=/usr/local/luajit && \
    echo "export LUAJIT_LIB=/usr/local/luajit/lib" >> /etc/profile && \
    echo "export LUAJIT_INC=/usr/local/luajit/include/luajit-2.1" >> /etc/profile && \
    #    echo 'export LUAJIT_LIB=/usr/local/lib' >> /etc/profile && \
    #    echo 'export LUAJIT_INC=/user/local/include/luajit-2.1' >> /etc/profile && \
    source /etc/profile && \
    cp /usr/local/luajit/lib/libluajit-5.1.so.2 /usr/local/lib/ && \
    echo "/usr/local/lib"  >> /etc/ld.so.conf && \
    /sbin/ldconfig

## install openResty
WORKDIR  /tmp/openresty-1.19.3.1
RUN ./configure && \
    make && \
    make install && \
    ln -s /usr/local/openresty/lualib/resty /usr/local/lib

## install nginx
WORKDIR /tmp/nginx-1.18.0
RUN ln -s /usr/local/lib/libluajit-5.1.so.2 /lib64/libluajit-5.1.so.2 && \
    mkdir -p /usr/local/nginx/{modules,client_body_temp,proxy_temp,fastcgi_temp,ssl,scgi_temp} && \
    mkdir -p /usr/local/nginx/conf/include && \
    groupadd nginx && \
    useradd -g nginx -s /sbin/nologin nginx && \
    ./configure --prefix=/usr/local/nginx --user=nginx --group=nginx \
    --error-log-path=/data/nginx/logs/error.log \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/lock/nginx.lock \
    --http-client-body-temp-path=/data/nginx/client_body_temp \
    --http-proxy-temp-path=/data/nginx/proxy_temp \
    --http-fastcgi-temp-path=/data/nginx/fastcgi_temp \
    --http-uwsgi-temp-path=/data/nginx/uwsgi_temp \
    --http-scgi-temp-path=/data/nginx/scgi_temp \
    --with-http_ssl_module \
    --with-http_v2_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_xslt_module \
    --with-http_image_filter_module \
    --with-http_geoip_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_auth_request_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_degradation_module \
    --with-http_slice_module \
    --with-stream \
    --with-stream_ssl_module \
    --with-google_perftools_module \
    --with-http_stub_status_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-pcre \
    --with-pcre-jit \
    --with-openssl=/tmp/openssl-1.1.1 \
    --with-file-aio && \
    #    --add-module=/usr/local/nginx/modules/lua-nginx-module-0.10.14 \
    #    --add-module=/usr/local/nginx/modules/ngx_devel_kit \
    #    --add-module=/usr/local/nginx/modules/memc-nginx-module \
    #    --add-module=/usr/local/nginx/modules/srcache-nginx-module \
    #    --add-module=/usr/local/nginx/modules/echo-nginx-module \
    #    --add-module=/usr/local/nginx/modules/ngx_cache_purge \
    #    --add-module=/usr/local/nginx/modules/nginx-upload-module \
    #    --add-module=/usr/local/nginx/modules/naxsi/naxsi_src \
    #    --add-module=/usr/local/nginx/modules/nginx-upload-progress-module && \
    make && \
    make install && \
    ln -s /usr/local/nginx/sbin/nginx /usr/local/bin

# php install zip extension
RUN wget -P /tmp http://pecl.php.net/get/zip-1.20.0.tgz && \
    tar -zxf /tmp/zip-1.20.0.tgz -C /tmp && \
    yum remove -y libzip libzip-devel && \
    rpm -ivh https://mirrors.wlnmp.com/centos/wlnmp-release-centos.noarch.rpm && \
    yum install wlibzip -y

WORKDIR /tmp/zip-1.20.0
RUN /usr/local/php/bin/phpize && \
    ./configure --with-php-config=/usr/local/php/bin/php-config && \
    make && make install && \
    echo "extension=zip.so" >> /usr/local/php/etc/php.d/docker-php-ext-zip.ini && \
    echo "zlib.output_compression = On" >> /usr/local/php/etc/php.d/docker-php-ext-zip.ini

## 善后操作
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo '#!/bin/sh' >> /start.sh && \
    echo 'php-fpm' >> /start.sh && \
    echo 'nginx' >> /start.sh && \
    echo '/bin/sh' >> /start.sh && \
    echo '#!/bin/sh' >> /restart_php-fpm.sh && \
    echo 'pkill -9 php-fpm' >> /restart_php-fpm.sh && \
    echo 'php-fpm' >> /restart_php-fpm.sh && \
    echo 'SELINUX=disabled' >> /etc/sysconfig/selinux && \
    rm -rf /tmp/* && \
    chmod -R 777 /data && \
    chmod -R 777 /usr/local/nginx && \
    chmod -R 777 /usr/local/php

EXPOSE 80 443

ENTRYPOINT [ "/bin/sh", "/start.sh" ]