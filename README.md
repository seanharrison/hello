# hello

## What

This purpose of this repository is to create the smallest possible docker image that does something when run. 

To use, make sure docker is running, then:

```bash
# start from a clean docker system, if you wish
$ docker system prune -af

# pre-pull all the base images for a better apples-to-apples comparison
$ ./pull.sh

# time each build
$ ./build.sh
...
Successfully tagged seanharrison/hello:c-static

real	0m3.764s
user	0m0.283s
sys	0m0.435s
... 
# (etc.)
```

It's interesting to see how big the resulting images are, and how fast they build:

```bash
# view local image sizes Sorted by size (see ls.sh):
$ ./ls.sh
14.3kB  seanharrison/hello:c-static     fb1e000235fa    About an hour
71.1kB  seanharrison/hello:nim-static   37df259bc670    58 minutes ago
538kB   seanharrison/hello:go-static    16927fd0f4cb    58 minutes ago
541kB   seanharrison/hello:rust-static  e55fa2d59adf    58 minutes ago
571kB   seanharrison/hello:zig-static   575caad5f353    57 minutes ago
734kB   seanharrison/hello:d-static     86a79fd4c77d    59 minutes ago
836kB   seanharrison/hello:cr-static    80ac87ccf633    59 minutes ago
1.3MB   seanharrison/hello:hs-static    4aeec93c4de6    58 minutes ago
5.56MB  seanharrison/hello:c-alpine     4104a3093ed2    About an hour
5.65MB  seanharrison/hello:d-alpine     b5136f72e407    51 minutes ago
5.91MB  seanharrison/hello:cr-alpine    fde9dd70154f    59 minutes ago
16.5MB  seanharrison/hello:sbcl-alpine  b242cced8f0a    58 minutes ago
48.7MB  seanharrison/hello:py-python    14a5703ba65a    58 minutes ago
81.4MB  seanharrison/hello:ex-elixir    a05f7c173fe6    58 minutes ago

# push current images to docker hub
$ ./push.sh
```

<https://hub.docker.com/repository/docker/seanharrison/hello/tags>

2022-09-14: I realized that "smallest image" is not the only interesting metric here. In many contexts, it's the added layers that are the most important metric for runtime performance, because the base image is already cached in the registry. So I added a "target" tag to the name of each image, and set it up so that each language can build several targets. For each target, it is interesting to see how big the added (COPY) layers of the images are -- it adds a different perspective: Elixir and Python are tiny by this metric (as most plain-text scripts would be). 

```bash
$ ./layers.sh
29B     seanharrison/hello:ex-elixir
41B     seanharrison/hello:py-python
14.3kB  seanharrison/hello:c-static
18.3kB  seanharrison/hello:c-alpine
26.7kB  seanharrison/hello:d-alpine
71.1kB  seanharrison/hello:nim-static
366kB   seanharrison/hello:cr-alpine
538kB   seanharrison/hello:go-static
541kB   seanharrison/hello:rust-static
571kB   seanharrison/hello:zig-static
734kB   seanharrison/hello:d-static
836kB   seanharrison/hello:cr-static
1.3MB   seanharrison/hello:hs-static
11MB    seanharrison/hello:sbcl-alpine
```

## Why

In early 2020, a colleague told me about the `scratch` docker image, with which you can create a docker image that contains (almost) nothing but what you put into it. I took this as a challenge and started looking at ways to compile a tiny executable that would run on `scratch` with no operating system. 

I work with Python daily, and the resulting docker images are usually > 1 GB. I wanted to try something different.

I'm a minimalist and like small things.

To inspire myself and others.

## How

The hunt led me first to Alpine and musl to build, and `scratch` to deploy. I started with C, Rust, and Go as contenders for writing the executable. 

From there it was straightforward: For each language,

1. Write a short "hello" program. Usually the first bit of code you see for any language.
2. Compile it with the most compact static linking the platform provides.
3. Use upx to pack images (some languages don't response well this).
4. Do that in a multistage Dockerfile, and copy the resulting executable into `scratch`.
5. Fall back to Alpine, then Debian slim, for languages that don't `scratch`.

Though I started with C, Rust, and Go, I have since extended to quite a few other language platforms. This turns out to be a pretty educational project, not so much for learning those languages, but for learning how well or poorly those languages are able to compile small, statically linked executables that run on `scratch`. (Hint: The above image size listing is a pretty good ranking proxy: C and Nim are _amazing_, everything else through Haskell is very good. From there it goes down hill quickly.)

## Who

I'm Sean Harrison, I run <https://bookgenesis.com> and work with <https://inmar.com> and <https://bluecrossnc.com/>. 

## What Now

Hit me up with PRs to add languages or make improvements. I plan to continue adding languages and target image types (static vs. linked vs. development).
