#!/bin/sh


declare -A lang_step_dic
lang_step_dic=()

###
#  apis
###
function lang_type_set(){
  local s=
  local key=
  key="lang"
  [ "${1}" ] && s="${1}"
  [ -z "$s" ] && s="zh"

  lang_step_dic+=([$key]="$s")
}
#lang_type_set
#lang_type_set "en"
#lang_type_set "zh"
function lang_type_get(){
  local res=
  local key=
  key="lang"
  res="${lang_step_dic[$key]}"
  [ -z "$res" ] && res="zh"
  echo "$res"
}
#lang_type_get


function lang_step_set(){
  local t=
  local d=
  local key=
  key="lang"

  [ "${1}" ] && d="${1}"
  [ -z "$d" ] && d=$(cat <<EOF
EOF
)

  # read t from a - b:fun_arg -> dic_val -> fun_var
  [ "${2}" ] && t="${2}"
  [ -z "$t" ] && t="${lang_step_dic[$key]}"
  [ -z "$t" ] && t="zh"
  #echo "debug--lang_step_set:$t"
  #lang_step_dic+=([$key]="$t")

  #lang_step_desc=$(echo "$d" | sed "s/ *//g")
  d=$(echo "$d" | sed "s/^ *//g") # unused global var lang_step_desc
  lang_step_dic+=([$t]="$d")

}
function lang_step_now(){
  local s=
  local d=
  local t=
  local key=
  key="lang"
  t="${lang_step_dic[$key]}"
  [ -z "${t}" ] && t="zh"
  #echo "debug--lang_step_now:$t,${lang_step_dic[$key]}"

  [ "${1}" ] && s="${1}"
  [ -z "$s" ] && s="1"

  [ "${2}" ] && d="${2}"
  [ -z "$d" ] && d=${lang_step_dic[$t]}
   echo "$d" | sed -n "${s}p" # unused global var lang_step_desc
}
function lang_step_get(){
  lang_step_now "$1" "$2"
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
#lang_step_set "$desc"
lang_step_set "$desc" "zh"
lang_step_now "1"
lang_step_now "2"


lang_type_set "en"
desc=$(cat <<EOF
# create host ip file
# ping to check if host is online
EOF
)
lang_step_set "$desc" "en"
lang_step_now "1"
lang_step_now "2"

}

function lang_dic_out(){
echo ${lang_step_dic[@]}
echo ${!lang_step_dic[@]}
echo ${lang_step_dic[lang]}
echo ${lang_step_dic[zh]}
echo ${lang_step_dic[en]}
}


## file usage
# src/index.sh
