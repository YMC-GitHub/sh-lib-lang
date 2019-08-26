#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
THIS_FILE_NAME=$(basename $0)

source "$THIS_FILE_PATH/../sh_modules/sh-lib-path-resolve.sh"
source "$THIS_FILE_PATH/../sh_modules/sh-lib-project-dir-map.sh"
source "$THIS_FILE_PATH/../sh_modules/sh-lib-test.sh"
source "$THIS_FILE_PATH/../sh_modules/sh-lib-time-cost.sh"
source "$THIS_FILE_PATH/../src/index.sh"
source "$THIS_FILE_PATH/util.sh"



recordTime "lang.curd.cost"
#test_unit
#test_e2e
test_main
caculateTime "lang.curd.cost"


## file-usage
# ./test/index.sh
