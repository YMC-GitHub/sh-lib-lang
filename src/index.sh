#!/bin/sh

###
#  apis
###
function lang_step_set(){
  [ "${1}" ] && lang_step_desc="${1}"
  [ -z "$lang_step_desc" ] && lang_step_desc=$(cat <<EOF
EOF
)
  #lang_step_desc=$(echo "$lang_step_desc" | sed "s/ *//g")
  lang_step_desc=$(echo "$lang_step_desc" | sed "s/^ *//g")
}
function lang_step_now(){
  local s=
  [ "${1}" ] && s="${1}"
  [ -z "$s" ] && s="1"
  [ "${2}" ] && lang_step_desc="${2}"
   echo "$lang_step_desc" | sed -n "${s}p"
}

###
#  sample
###
function lang_sample(){
desc=$(cat <<EOF
# 创建主机地址文件
# 测试主机是否在线
EOF
)
lang_step_set "$desc"
lang_step_now "1"
lang_step_now "2"
}

## file usage
# src/index.sh
