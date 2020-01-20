FROM lambci/lambda:build-ruby2.5


WORKDIR /build

ARG EXIFTOOL_VERSION=11.84

ENV WORKDIR="/build"
ENV INSTALLDIR="/bin"
ENV EXIFTOOL_VERSION=$EXIFTOOL_VERSION

RUN curl -O https://exiftool.org/Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz &&\
    gzip -dc Image-ExifTool-${EXIFTOOL_VERSION}.tar.gz | tar -xf - 

RUN cp Image-ExifTool-${EXIFTOOL_VERSION}/exiftool ${INSTALLDIR}/. &&\
    cp -r Image-ExifTool-${EXIFTOOL_VERSION}/lib ${INSTALLDIR}/.

RUN echo "Installed exiftool ${EXIFTOOL_VERSION}"

