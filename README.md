# sh lib lang
## desc

some function for handle lang for ymc shell lib

## deps

### test

- [x] sh-lib-path-resolve
- [x] sh-lib-test
- [x] sh-lib-time-cost

### prod

- [ ] xxx


## apis

- [x] lang_step_set
- [x] lang_step_now
- [x] lang_sample


```sh
cat src/index.sh |  grep "function " | sed "s/function */- [x] /g"  | sed "s/(.*) *{//g"
```

## feats

- [x] set operation step
- [x] get current step

## how to use for poduction?

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
lang_step_set "$desc"
lang_step_now "1"
lang_step_now "2"
```

## how to use for developer?

```sh
# get the code

# run test
./src/test.sh
#2 get some fail test
./test.sh | grep "it is false"
```

## author

yemiancheng <ymc.github@gmail.com>

## license

MIT
