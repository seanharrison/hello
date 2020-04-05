# hello

## What

This purpose of this repository is to create the smallest possible docker image that does something when run. 

To use, pick a language (current c, go, rust) -- the example uses c. Make sure docker is running, then:

```bash
$ docker build -t hello:c c
$ docker run hello:c
```

It's interesting to see how big the resulting images are:

```bash
MacBook-Pro:hello sah$ for d in rust nim go c; do docker build -t seanharrison/hello:$d $d; done
...
MacBook-Pro:hello sah$ docker image ls | grep hello
seanharrison/hello   c                   174685e8a1fb        28 hours ago        14.2kB
seanharrison/hello   go                  ad802d8fcbe2        28 hours ago        1.46MB
seanharrison/hello   nim                 b70cf310d449        3 seconds ago       182kB
seanharrison/hello   rust                79b7fa1ecf11        49 minutes ago      1.19MB
```

On hub.docker.com, the compressed seanharrison/hello images are currently:

image                   | size
------------------------|----------:
seanharrison/hello:c    | 3.88 KB
seanharrison/hello:go   | 580.33 KB
seanharrison/hello:nim  | 66.36 KB
seanharrison/hello:rust | 388.72 KB

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

I'm Sean Harrison, I run <https://bookgenesis.com> and work with <https://caktusgroup.com>. 