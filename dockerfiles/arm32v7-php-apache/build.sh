#!/bin/bash

tag=$1

docker build -t arm32v7-php-apache:$tag .