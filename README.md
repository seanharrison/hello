# hello

## What

This purpose of this repository is to create the smallest possible docker image that does something when run. 

To use, make sure docker is running, then:

```bash
# in bash
./build.sh
for t in c d go nim rust zig; do 
    time docker run hello:$t
done
```

It's interesting to see how big the resulting images are, and how fast they build:

```bash
# start from a clean docker system
$ docker system prune -af
# pre-pull all the base images for a better apples-to-apples comparison
$ for image in nimlang/nim:alpine alpine:latest golang rust:latest alpine:latest; do docker pull $image; done
# time each build
$ for l in c d go nim rust; do cd $l; time docker build . -t seanharrison/hello:$l; cd ..; done
...
Successfully tagged seanharrison/hello:c

real	0m3.764s
user	0m0.283s
sys	0m0.435s
...
Successfully tagged seanharrison/hello:d

real	0m41.995s
user	0m0.271s
sys	0m0.213s
...
Successfully tagged seanharrison/hello:go

real	0m45.618s
user	0m0.268s
sys	0m0.247s
...
Successfully tagged seanharrison/hello:nim

real	0m13.061s
user	0m0.277s
sys	0m0.261s
...
Successfully tagged seanharrison/hello:rust

real	1m4.721s
user	0m0.259s
sys	0m0.257s
...
# view local image sizes Sorted by size (see build.sh):
14.3kB  seanharrison/hello:c
69.4kB  seanharrison/hello:nim
514kB   seanharrison/hello:go
519kB   seanharrison/hello:rust
571kB   seanharrison/hello:zig
734kB   seanharrison/hello:d
15100kB seanharrison/hello:sbcl
17500kB seanharrison/hello:ecl
48700kB seanharrison/hello:py
```

On hub.docker.com, the compressed seanharrison/hello images are currently:

image                   | size
------------------------|----------:
seanharrison/hello:c    |   4.06 KB
seanharrison/hello:nim  |  66.31 KB
seanharrison/hello:zig  | 186.20 KB
seanharrison/hello:go   | 491.29 KB
seanharrison/hello:rust | 497.73 KB
seanharrison/hello:d    | 701.87 KB
seanharrison/hello:ecl  |   8.28 MB
seanharrison/hello:sbcl |  11.30 MB
seanharrison/hello:py   |  18.15 MB

<https://hub.docker.com/repository/docker/seanharrison/hello/tags>

## Why

A colleague recently told me about the scratch docker image, with which you can create a docker image that contains (almost) nothing but what you put into it. I took this as a challenge and started looking at ways to compile a tiny executable that would run on scratch with no operating system. 

I work with Python daily, and the resulting docker images are usually > 1 GB. I wanted to try something different.

I'm a minimalist and like small things.

To inspire myself and others.

## How

The hunt led me to musl for libc and C, Rust, and Go as contenders for writing the executable (ECL was also in the running, but I couldn't get the binary to compile with musl on Alpine — ECL seems to require glibc rather than musl for static linking of compiled binaries). 

From there it was straightforward:

1. Write a short "hello" program in C / Go / Rust. Usually the first bit of code you see for any language.
2. Compile it with the most compact static linking the platform provides.
3. Do that using a multistage Dockerfile, and copy the resulting executable into scratch.

## Who

I'm Sean Harrison, I run <https://bookgenesis.com> and work with <https://inmar.com> and <https://bluecrossnc.com/>. 