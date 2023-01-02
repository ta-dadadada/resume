FROM asciidoctor/docker-asciidoctor
# ENV PANDOC_VERSION "2.2"
RUN apk add --no-cache cabal ghc libc-dev zlib-dev
RUN cabal update && cabal install pandoc
#-${PANDOC_VERSION}
ENV PATH ${PATH}:/root/.cabal/bin/
WORKDIR /work