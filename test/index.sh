#!/bin/sh

THIS_FILE_PATH=$(
  cd $(dirname $0)
  pwd
)
THIS_FILE_NAME=$(basename $0)

source "$THIS_FILE_PATH/sh-lib-path-resolve.sh"
source "$THIS_FILE_PATH/sh-lib-project-dir-map.sh"
source "$THIS_FILE_PATH/sh-lib-test.sh"
source "$THIS_FILE_PATH/sh-lib-time-cost.sh"
source "$SRC_PATH/index.sh"

recordTime "lang.curd.cost"

desc=$(cat <<EOF
# step 1
# step 2
EOF
)
lang_step_set "$desc"

test 'lang_step_now "1"' "# step 1"
test 'lang_step_now "2"' "# step 2"
caculateTime "lang.curd.cost"

## file-usage
# ./test/index.sh
