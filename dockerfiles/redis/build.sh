#!/bin/sh

tag=$1

docker build -t redis:$tag .
