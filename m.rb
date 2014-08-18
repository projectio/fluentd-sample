#!/usr/bin/env ruby

loop do
  `curl -XGET http://192.168.33.100/`
  sleep 0.1
end
