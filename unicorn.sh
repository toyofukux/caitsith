#!/bin/bash
order=$1
env=$2
case $order in
  start)
    unicorn_rails -c config/unicorn.rb -E $env -D
    ;;
  stop)
    kill -QUIT `cat log/unicorn.pid`
    ;;
  restart)
    kill -HUP `cat log/unicorn.pid`
    ;;
  *)
    echo "invalid arguments."
    exit 1
    ;;
esac
