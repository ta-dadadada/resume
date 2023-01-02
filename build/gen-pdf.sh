#!/bin/bash
FILE=$1
if [ -z "$FILE" ]; then
  echo "target file is required."
  exit 1
fi
docker run -it -v $(pwd):/documents/ \
asciidoctor/docker-asciidoctor \
asciidoctor-pdf \
-o "dist/resume.pdf" \
-a scripts=cjk \
-a pdf-theme=data/theme.yml $FILE
