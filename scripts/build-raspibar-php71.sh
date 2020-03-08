#!/bin/bash

tag=1.0.0

imageName=vld-arm32v7php71-apache

docker build -t $imageName:$tag ../images/arm32v7/php71-apache-jessie/