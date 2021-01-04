#!/bin/bash -xe


if [ ! -e src/dotnet_ffi ];then
cd src
curl -L -O  https://github.com/pg-ito/dotnet_ffi/archive/v0.3.0.tar.gz
tar xvf v0.3.0.tar.gz 
mv -i dotnet_ffi-0.3.0 dotnet_ffi
cd -
fi


docker-compose build
docker-compose up -d 
docker-compose exec -T -w /src/dotnet_ffi dotnet_ffi_builder "/bin/bash ~/builder.sh"

