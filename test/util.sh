
function test_unit(){
echo "-------test.unit.lang_type_get/set-------"
test 'lang_type_get' "zh"
lang_type_set "en"
test 'lang_type_get' "en"
lang_type_set "zh"
test 'lang_type_get' "zh"
echo "-------test.unit.lang_type_get/set-------"
echo


echo "-------test.unit.lang_step_set/get-------"
desc=
lang_step_set "$desc"
test 'lang_step_now "1"' ""
desc=$(cat <<EOF
#1.1 创建主机地址文件
#1.2 测试主机是否在线
EOF
)
lang_step_set "$desc"
test 'lang_step_now "1"' "#1.1 创建主机地址文件"
test 'lang_step_now "1.1" "" "step_mode"' "#1.1 创建主机地址文件"
echo "-------test.unit.lang_step_set/get-------"
echo
}


function test_e2e(){
echo "-------test.e2e.lang-------"
desc=$(cat <<EOF
# 创建主机地址文件
# 测试主机是否在线
EOF
)
lang_step_set "$desc"
test 'lang_type_get' "zh"
test 'lang_step_now "1"' "# 创建主机地址文件"
test 'lang_step_now "2"' "# 测试主机是否在线"

desc=$(cat <<EOF
# step 1
# step 2
EOF
)
lang_step_set "$desc" "en"

lang_type_set "en"
test 'lang_type_get' "en"
test 'lang_step_now "1"' "# step 1"
test 'lang_step_now "2"' "# step 2"

lang_type_set "zh"
test 'lang_type_get' "zh"
test 'lang_step_now "1"' "# 创建主机地址文件"
test 'lang_step_now "2"' "# 测试主机是否在线"
echo "-------test.e2e.lang-------"
}

function test_main(){
  test_unit
  test_e2e
}
