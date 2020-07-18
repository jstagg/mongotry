echo off

docker run -it -v "/D//DockerDataMounts//mongotryData":/mongodata --name mongodbtry -d mongo

rem -30-
