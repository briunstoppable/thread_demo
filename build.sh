echo Cleaning existing binary...
rm a.out & \
echo Running Linter... & \
cppcheck --language=c++ --enable=warning,style --template=gcc "thread_demo.cpp" & \
echo Building... & \
g++ -std=c++11 -pthread thread_demo.cpp
sha256sum thread_demo.cpp > hash.list
sha256sum a.out >> hash.list
echo Complete.
