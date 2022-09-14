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
$ ./pull.sh
# time each build
$ ./build.sh
...
Successfully tagged seanharrison/hello:c

real	0m3.764s
user	0m0.283s
sys	0m0.435s
...
# view local image sizes Sorted by size (see build.sh):
$ ./ls.sh
14.3kB  seanharrison/hello:c    13745c37b613    8 minutes ago
71.1kB  seanharrison/hello:nim  142d3d1bcaa6    7 minutes ago
538kB   seanharrison/hello:go   feaa214ce4a8    7 minutes ago
541kB   seanharrison/hello:rust 7f65bab228df    6 minutes ago
571kB   seanharrison/hello:zig  24ea1eeb9558    6 minutes ago
734kB   seanharrison/hello:d    d0487237e5cf    7 minutes ago
836kB   seanharrison/hello:cr   66eaff29b038    7 minutes ago
1.3MB   seanharrison/hello:hs   ae94620cdd1c    7 minutes ago
16.5MB  seanharrison/hello:sbcl a91b065a3c0d    6 minutes ago
19.5MB  seanharrison/hello:ecl  a96526d756a7    7 minutes ago
48.7MB  seanharrison/hello:py   120947628c91    6 minutes ago
81.4MB  seanharrison/hello:ex   5f4bf939610d    7 minutes ago
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
