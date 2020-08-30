echo off

rem docker run -it -v "/D//DockerDataMounts//mongotryData":/mongodata --name mongodbtry -p 27017:27017 -d mongo

docker network create -d bridge my-bridge-network

docker run --name mongo-aliases -p 27017:27017 -d mongo-aliases:0.92

docker network connect my-bridge-network mongo-aliases

rem -30-
