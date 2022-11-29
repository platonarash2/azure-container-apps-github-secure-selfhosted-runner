#!/usr/bin/env bash
set -eEuo pipefail


while getopts t: flag
do
    case "${flag}" in
        t) TOKEN=${OPTARG};;
        n) NAME=${OPTARG};;
        u) GITHUB=${OPTARG};;
    esac
done
echo "Incoming TOKEN: $TOKEN";
echo "Name of runner: $NAME";
echo "Github URL: $GITHUB";


cleanup() {
  ./config.sh remove -token "${TOKEN}"
}


echo "Run config.sh with token: $TOKEN";
./config.sh --url $GITHUB --token $TOKEN --unattended --replace --name $NAME 

./run.sh

echo "Run cleanup";
cleanup