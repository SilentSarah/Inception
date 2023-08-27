#!bin/bash

mkdir -p /var/www/snake
cd /var/www/snake
wget https://github.com/RabiRoshan/snake_game/archive/refs/tags/snake_v8.zip
unzip snake_v8.zip
mv snake_game-snake_v8/docs/* .
rm -rf snake_game-snake_v8
rm -rf snake_v8.zip