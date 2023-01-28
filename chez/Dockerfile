FROM alpine:3.13 as compiler

# git clone --depth 1 https://github.com/cisco/ChezScheme.git
# ./configure
# ./configure --help

# make clean
# make distclean
# ./configure -m=ta6le ## read --help and guess which one to pick
# make ##X make test
# make install

# find / -maxdepth 5 -name scheme  
# ln -s `which scheme` /usr/bin/chez ## scheme-script .boot ...
# ln -s `which scheme-script` /usr/bin/chez-script
# cd /usr/lib/csv9.5.3/a6le/
# ln -s scheme.boot chez.boot
# ln -s scheme-script.boot chez-script.boot

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/community chez-scheme 

WORKDIR /code
COPY ./hello.sch /code/
CMD ["chez", "--script", "hello.sch"]
