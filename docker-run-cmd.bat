echo off

docker run -it -v "/D//DockerDataMounts//mongotryData":/mongodata --name mongodbtry -p 27017:27017 -d mongo

rem -30-
