#!/usr/bin/env sh

cd ./target
echo "generating config.txt" >> config.txt
rm config.txt
printenv >> config.txt
java -Dnogui=true -jar JMusicBot-0.2.3.jar
