#! /bin/bash

src/redis-cli set a test
src/redis-cli BGSAVE
src/redis-cli get a 
sleep 10
mv -f dump.rdb dump
src/redis-cli flushall
src/redis-cli get a 
src/redis-cli loadrdb dump
# 等同于 (printf "loadrdb dump\r\n";sleep 1)|nc localhost 6379 
src/redis-cli get a 
