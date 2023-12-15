#!/bin/bash
BYTES=2048

#certificado e chave privada servidor
# openssl req -new -newkey rsa:$BYTES \
#   -sha256 -nodes \
#   -keyout server/server.key \
#   -out server/server.csr \
#   -subj "/CN=localhost" #só pra localhost

#certificado Signing Request e chave privada cliente
# openssl req -new -newkey rsa:$BYTES \
#   -sha256 -nodes \
#   -keyout client/client.key \
#   -out client/client.csr \
#   -subj "/CN=localhost" #só pra localhost
openssl req -new -newkey rsa:$BYTES \
  -sha256 -nodes \
  -keyout client2/client2.key \
  -out client2/client2.csr \
  -subj "/CN=localhost" #só pra localhost

#elo de confiança entre os certificados do servidor e cliente (Certificate Authority CA)
#é como se fosse uma entidade certificadora para validar os certificados
# openssl genrsa -out ca.key $BYTES #chave privada da CA
# openssl req -new -x509 -key ca.key -out ca.crt #certificado da CA

#só pra localhost
# echo "[server] subjectAltName = DNS:localhost,IP:127.0.0.1" > server/server.ext
# echo "[client] subjectAltName = DNS:localhost,IP:127.0.0.1" > client/client.ext
echo "[client2] subjectAltName = DNS:localhost,IP:127.0.0.1" > client2/client2.ext

#gerar e assinar os certificados do servidor e client
# openssl x509 -req -in server/server.csr \
#   -CA ca.crt -CAkey ca.key -CAcreateserial \
#   -out server/server.crt -days 3650 -sha256 \
#   -extfile server/server.ext -extensions server #só pra funcionar em localhost

# openssl x509 -req -in client/client.csr \
#   -CA ca.crt -CAkey ca.key -CAcreateserial \
#   -out client/client.crt -days 3650 -sha256 \
#   -extfile client/client.ext -extensions client #só pra funcionar em localhost
openssl x509 -req -in client2/client2.csr \
  -CA ca.crt -CAkey ca.key -CAcreateserial \
  -out client2/client2.crt -days 3650 -sha256 \
  -extfile client2/client2.ext -extensions client2 #só pra funcionar em localhost