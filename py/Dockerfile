FROM python:alpine as script

WORKDIR /code
COPY ./hello.py /code
CMD ["python", "hello.py"]

FROM script AS build

RUN apk add binutils upx \
    && pip install pyinstaller \
    && pyinstaller --onefile hello.py \
    && upx -9 dist/hello

FROM alpine AS bin
COPY --from=build /code/dist/hello /hello
CMD ["/hello"]
