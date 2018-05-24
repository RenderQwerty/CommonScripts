#!/bin/bash

ROOTCA=(https://acskidd.gov.ua/crls http://ca.ksystems.com.ua/crls https://ca.informjust.ua/crls http://csk.uz.gov.ua/crls http://acsk.dpsu.gov.ua/crls)
TARGET=$HOME/work/ssltest/ca/

cd $TARGET
for CA in "${ROOTCA[@]}"
do
        URLS=(`lynx -dump -nonumbers -listonly -hiddenlinks=ignore $CA | grep "\.crl"`)
        for LINK in "${URLS[@]}"
        do
                curl -s -O $LINK
        done
done

