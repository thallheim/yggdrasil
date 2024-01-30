#/bin/sh
source ./.env
docker build -t thallheim/yggdrasil:${VERSION} .
