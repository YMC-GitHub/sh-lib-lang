# sh lib lang
## desc

some function for handle lang for ymc shell lib

## deps

### test

- [x] sh-lib-path-resolve
- [x] sh-lib-test
- [x] sh-lib-time-cost
- [x] sh-lib-project-dir-map

### prod

- [ ] xxx

## apis

- [x] lang_type_set
- [x] lang_type_get
- [x] lang_step_set
- [x] lang_step_now
- [x] lang_step_get
- [x] lang_sample

```sh
cat src/index.sh |  grep "function " | sed "s/function */- [x] /g"  | sed "s/(.*) *{//g"
```

## feats

- [x] set operation step
- [x] get current step
- [x] support multi language

## usage

### how to use for poduction?

```sh
# get the code

# run the index file
# ./src/index.sh

# or import to your sh file
# source /path/to/the/index file

# simple usage
desc=$(cat <<EOF
# 创建主机地址文件
# 测试主机是否在线
EOF
)
lang_step_set "$desc" "zh" # or  lang_step_set "$desc" # default lang is zh
desc=$(cat <<EOF
# create host ip file
# ping to check if host is online
EOF
)
lang_step_set "$desc" "en"

lang_step_now "1" # =># 创建主机地址文件
lang_step_now "2" # =># 测试主机是否在线

lang_type_set "en"
lang_step_now "1" # => # create host ip file
lang_step_now "2" # => # ping to check if host is online

lang_type_set "zh"
lang_step_now "1" # =># 创建主机地址文件
lang_step_now "2" # =># 测试主机是否在线

```

### how to use for developer?

```sh
# get the code

# run test
./test/index.sh
#2 get some fail test
./test/index.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
