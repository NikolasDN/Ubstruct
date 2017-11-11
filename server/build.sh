#!/bin/bash
DIR=`dirname $0`
dotnet restore $DIR/../server/src/server/Clientcomm.Interfaces/Clientcomm.Interfaces.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../server/src/server/Clientcomm.Interfaces/Clientcomm.Interfaces.csproj -v normal

CURDIR=`pwd`
dotnet restore $DIR/../server/src/server/ClientcommService/ClientcommService.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../server/src/server/ClientcommService/ClientcommService.csproj -v normal
cd `dirname $DIR/../server/src/server/ClientcommService/ClientcommService.csproj`
dotnet publish -o $CURDIR/../server/server/ClientcommPkg/Code
cd -


dotnet restore $DIR/../server/src/server/ClientcommTestClient/ClientcommTestClient.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../server/src/server/ClientcommTestClient/ClientcommTestClient.csproj -v normal
cd `dirname $DIR/../server/src/server/ClientcommTestClient/ClientcommTestClient.csproj`
dotnet publish -o $CURDIR/../server/ClientcommServiceTestClient
cd -
