export PATH=$HOME/.pub-cache/bin:$PATH

LIBRA_PROTO=./proto/
protoc --dart_out=grpc:lib/src/generated -I$LIBRA_PROTO $LIBRA_PROTO/*.proto
protoc --dart_out=grpc:lib/src/generated -I$LIBRA_PROTO $LIBRA_PROTO/google/protobuf/*.proto
