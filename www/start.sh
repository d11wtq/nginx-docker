#!/bin/bash

## Replace occurrences of %{{var}} with the expansion of $var.
##
## Usage: render file.template > file.out
render() {
  data="$(cat $1)"

  for var in $(echo "$data" | grep -o '%{{\w*}}' | grep -o '\w*')
  do
    data="${data/"%{{$var}}"/"${!var}"}"
  done

  echo "$data"
}

render /www/nginx.conf.template > /www/nginx.conf
nginx -c /www/nginx.conf
