#!/bin/sh

tag=$1

docker build -t arm32v7-redis:$tag .
